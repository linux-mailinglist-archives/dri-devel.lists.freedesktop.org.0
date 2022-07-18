Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB84578270
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 14:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8175110FD3E;
	Mon, 18 Jul 2022 12:36:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79B0113A90;
 Mon, 18 Jul 2022 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658147804; x=1689683804;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qbPzC+EavGgqmieS4D6eekLWN75TMxEQza/w9cEBwGU=;
 b=S1PbGfMSpQWNJQ1ed3920RI8YIqigOdsPm5TSeU2NTSJ2DHN7Ws96VoE
 PgLowmdAu8a3HCHSiATfB1xrrZ6ILd1LL/Yi4yYE6eKsUVZ2Ox3179JlJ
 9qZ5H9W97zCZ8IE7YE/Akeo6ZNhJfvLWto9mCjssq2OJ1eB89O2fp9ZT0
 l4UCTwhJO7aCMlLGMGqks+qeVi1eMQWQwh1b/V0i8W/zEITBubVRq71R5
 htOMfl5uqHsd671MGDwsEjpyTyZztuf9LqrQ4rqPBplRVXKnLU/2wDxUH
 bV9xYDjm36MB6QiPmC7cSa4B/nZuLWKz633ieJ/O+phA34RlkD42nZbWq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="286225656"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="286225656"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 05:36:43 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="723844427"
Received: from smyint-mobl1.amr.corp.intel.com (HELO [10.212.107.15])
 ([10.212.107.15])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 05:36:42 -0700
Message-ID: <76e0fe3e-4db5-78f6-304f-f67a4740d8a3@linux.intel.com>
Date: Mon, 18 Jul 2022 13:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 11/12] drm/i915/guc: Don't abort on CTB_UNUSED
 status
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-12-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220712233136.1044951-12-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When the KMD sends a CLIENT_RESET request to GuC (as part of the
> suspend sequence), GuC will mark the CTB buffer as 'UNUSED'. If the
> KMD then checked the CTB queue, it would see a non-zero status value
> and report the buffer as corrupted.
> 
> Technically, no G2H messages should be received once the CLIENT_RESET
> has been sent. However, if a context was outstanding on an engine then
> it would get reset and a reset notification would be sent. So, don't
> actually treat UNUSED as a catastrophic error. Just flag it up as
> unexpected and keep going.

Does it need a Fixes: tag?

Regards,

Tvrtko

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../i915/gt/uc/abi/guc_communication_ctb_abi.h |  8 +++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c      | 18 ++++++++++++++++--
>   2 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> index df83c1cc7c7a6..28b8387f97b77 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> @@ -37,6 +37,7 @@
>    *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too large)     |
>    *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated message)      |
>    *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail modified)      |
> + *  |   |       |   - _`GUC_CTB_STATUS_UNUSED` = 8 (CTB is not in use)         |
>    *  +---+-------+--------------------------------------------------------------+
>    *  |...|       | RESERVED = MBZ                                               |
>    *  +---+-------+--------------------------------------------------------------+
> @@ -49,9 +50,10 @@ struct guc_ct_buffer_desc {
>   	u32 tail;
>   	u32 status;
>   #define GUC_CTB_STATUS_NO_ERROR				0
> -#define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
> -#define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
> -#define GUC_CTB_STATUS_MISMATCH				(1 << 2)
> +#define GUC_CTB_STATUS_OVERFLOW				BIT(0)
> +#define GUC_CTB_STATUS_UNDERFLOW			BIT(1)
> +#define GUC_CTB_STATUS_MISMATCH				BIT(2)
> +#define GUC_CTB_STATUS_UNUSED				BIT(3)
>   	u32 reserved[13];
>   } __packed;
>   static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index f01325cd1b625..11b5d4ddb19ce 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -816,8 +816,22 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>   	if (unlikely(ctb->broken))
>   		return -EPIPE;
>   
> -	if (unlikely(desc->status))
> -		goto corrupted;
> +	if (unlikely(desc->status)) {
> +		u32 status = desc->status;
> +
> +		if (status & GUC_CTB_STATUS_UNUSED) {
> +			/*
> +			 * Potentially valid if a CLIENT_RESET request resulted in
> +			 * contexts/engines being reset. But should never happen as
> +			 * no contexts should be active when CLIENT_RESET is sent.
> +			 */
> +			CT_ERROR(ct, "Unexpected G2H after GuC has stopped!\n");
> +			status &= ~GUC_CTB_STATUS_UNUSED;
> +		}
> +
> +		if (status)
> +			goto corrupted;
> +	}
>   
>   	GEM_BUG_ON(head > size);
>   
