Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BE3A15D9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 15:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046276E2E1;
	Wed,  9 Jun 2021 13:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950386E2E1;
 Wed,  9 Jun 2021 13:42:47 +0000 (UTC)
IronPort-SDR: uLtGke1akuY/4/Fxp3RiH3ZQqWNMPYkaoeSMDihhVYb+HJP9Km30g42jY/ftSJQ7cElxXGcDEf
 +7YsUnCC8q7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="226443557"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="226443557"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 06:42:47 -0700
IronPort-SDR: yqJD6s2GqpnD7kjI1gd2vKk30P4M533hm+gKbRMN4PryaYevWGpNggO11eNONfdfUB4dXGL3CW
 ybWU/UHmEC2g==
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="482387071"
Received: from mjkelly-mobl1.ger.corp.intel.com (HELO [10.213.215.68])
 ([10.213.215.68])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 06:42:44 -0700
Subject: Re: [PATCH v2 8/9] drm/i915/gt: Pipelined clear
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
 <20210609063436.284332-9-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <074fd3b7-4cd2-5616-c3f3-9733680bbcdd@intel.com>
Date: Wed, 9 Jun 2021 14:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609063436.284332-9-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2021 07:34, Thomas Hellström wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Update the PTE and emit a clear within a single unpreemptible packet
> such that we can schedule and pipeline clears.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c    | 141 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_migrate.h    |  20 +++
>   drivers/gpu/drm/i915/gt/selftest_migrate.c | 163 +++++++++++++++++++++
>   3 files changed, 324 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 70776316863d..fda05ce3eb9c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -490,6 +490,112 @@ intel_context_migrate_copy(struct intel_context *ce,
>   	return err;
>   }
>   
> +static int emit_clear(struct i915_request *rq, int size, u32 value)
> +{
> +	const int gen = INTEL_GEN(rq->engine->i915);
> +	u32 *cs;
> +
> +	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
> +
> +	cs = intel_ring_begin(rq, gen >= 8 ? 8 : 6);
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	if (gen >= 8) {
> +		*cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (7 - 2);
> +		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
> +		*cs++ = 0;
> +		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
> +		*cs++ = 0; /* offset */
> +		*cs++ = 0;

Missing feeding the engine instance into the upper dword for the offset?

> +		*cs++ = value;
> +		*cs++ = MI_NOOP;
> +	} else {
> +		*cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (6 - 2);
> +		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
> +		*cs++ = 0;
> +		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
> +		*cs++ = 0;
> +		*cs++ = value;
> +	}
> +
> +	intel_ring_advance(rq, cs);
> +	return 0;
> +}
> +
