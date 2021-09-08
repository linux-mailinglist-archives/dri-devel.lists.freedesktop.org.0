Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA021403786
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 12:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686316E174;
	Wed,  8 Sep 2021 10:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3266C6E098;
 Wed,  8 Sep 2021 10:07:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="200643568"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="200643568"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 03:07:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="465462712"
Received: from eoinwals-mobl.ger.corp.intel.com (HELO [10.213.233.175])
 ([10.213.233.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 03:07:09 -0700
Subject: Re: [PATCH 2/8] drm/i915/xehp: CCS shares the render reset domain
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
 <20210907171916.2548047-3-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4ce6bdc9-82c6-e281-400d-ce658d6ba80b@linux.intel.com>
Date: Wed, 8 Sep 2021 11:07:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907171916.2548047-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/09/2021 18:19, Matt Roper wrote:
> The reset domain is shared between render and all compute engines,
> so resetting one will affect the others.
> 
> Note:  Before performing a reset on an RCS or CCS engine, the GuC will
> attempt to preempt-to-idle the other non-hung RCS/CCS engines to avoid
> impacting other clients (since some shared modules will be reset).  If
> other engines are executing non-preemptable workloads, the impact is
> unavoidable and some work may be lost.

Since here it talks about engine reset, should this patch add warning if 
  same is attempted by i915 on a GuC platform - to document it is not 
implemented/supported? Or perhaps later in the series, or future series 
works better.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> Bspec: 52549
> Original-patch-by: Michel Thierry
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_reset.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 91200c43951f..30598c1d070c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -507,6 +507,10 @@ static int gen11_reset_engines(struct intel_gt *gt,
>   		[VECS1] = GEN11_GRDOM_VECS2,
>   		[VECS2] = GEN11_GRDOM_VECS3,
>   		[VECS3] = GEN11_GRDOM_VECS4,
> +		[CCS0] = GEN11_GRDOM_RENDER,
> +		[CCS1] = GEN11_GRDOM_RENDER,
> +		[CCS2] = GEN11_GRDOM_RENDER,
> +		[CCS3] = GEN11_GRDOM_RENDER,
>   	};
>   	struct intel_engine_cs *engine;
>   	intel_engine_mask_t tmp;
> 
