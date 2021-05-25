Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E34A38FDBC
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69786E9D6;
	Tue, 25 May 2021 09:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2179C6E9FD;
 Tue, 25 May 2021 09:24:13 +0000 (UTC)
IronPort-SDR: 3PwSI/amClB02DzHADBdcPQwQrJWN55YbSgCPaFrzoJQVObWaBHbTJwmvLuN35NHhTM6R1lKhI
 +RR0WqHEbO9A==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="263354612"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="263354612"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:24:12 -0700
IronPort-SDR: 03/GloIDi3GAJB/apyd74V9+Bn5MmqsZXxAJ3Cdb9DZdAzJGFyueZggH31+hrleMmWr6BDMGaf
 +dtYKXt8/pWg==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="442461648"
Received: from tomeara-mobl.ger.corp.intel.com (HELO [10.213.211.66])
 ([10.213.211.66])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:24:11 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 39/97] drm/i915/guc: Increase size of CTB
 buffers
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-40-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c3c50a1e-c871-a424-8598-2da7eaffba05@linux.intel.com>
Date: Tue, 25 May 2021 10:24:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-40-matthew.brost@intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/05/2021 20:13, Matthew Brost wrote:
> With the introduction of non-blocking CTBs more than one CTB can be in
> flight at a time. Increasing the size of the CTBs should reduce how
> often software hits the case where no space is available in the CTB
> buffer.

I'd move this before the patch which adds the non-blocking send since 
that one claims congestion should be rare with properly sized buffers. 
So it makes sense to have them sized properly back before that one.

Regards,

Tvrtko

> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 77dfbc94dcc3..d6895d29ed2d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -63,11 +63,16 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
>    *      +--------+-----------------------------------------------+------+
>    *
>    * Size of each `CT Buffer`_ must be multiple of 4K.
> - * As we don't expect too many messages, for now use minimum sizes.
> + * We don't expect too many messages in flight at any time, unless we are
> + * using the GuC submission. In that case each request requires a minimum
> + * 16 bytes which gives us a maximum 256 queue'd requests. Hopefully this
> + * enough space to avoid backpressure on the driver. We increase the size
> + * of the receive buffer (relative to the send) to ensure a G2H response
> + * CTB has a landing spot.
>    */
>   #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>   #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> -#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
> +#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>   
>   #define MAX_US_STALL_CTB	1000000
>   
> @@ -753,7 +758,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>   	/* beware of buffer wrap case */
>   	if (unlikely(available < 0))
>   		available += size;
> -	CT_DEBUG(ct, "available %d (%u:%u)\n", available, head, tail);
> +	CT_DEBUG(ct, "available %d (%u:%u:%u)\n", available, head, tail, size);
>   	GEM_BUG_ON(available < 0);
>   
>   	header = cmds[head];
> 
