Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0A3584624
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 21:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC25112A47;
	Thu, 28 Jul 2022 19:06:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22273112B61;
 Thu, 28 Jul 2022 19:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659035166; x=1690571166;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BQ/an3w8/YgYdfP3De13nJ2foeseq4FJMyOLibe28P0=;
 b=hffF0+Ddjpgjxd8C5a/9/bzls4Ct4ao+mQOv8zGJ1j2ZLlWWSYiNGPLq
 k0OQUcPvmWeALky1lQcVUOPuXbYyQqnn5eF2KAI/hWol9VQeLqOC24vUh
 xoSjyDuxOTtJzF8goJzfRb2Gt0y4gMij9gsGJQuKHgwt8n5yRoPdNCcI2
 IWO/9Xv+vrkcLj4kugliGGi8GyqnAu2qmc2OfQHHehfcgvbFUh0L0m8GZ
 k4LvabcIBD9FvzOzocdMuznL4xLRjIBMDlFBRINlN/EOGIcIfWlZOVzGT
 jg61uzB7xT0V0mMzyLuzx1unTVby5q+qk8fMp9UEJFraky79O6I6aYMgh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="352595672"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="352595672"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 12:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="743252176"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2022 12:06:04 -0700
Received: from [10.249.153.134] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.153.134])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 26SJ63i6019829; Thu, 28 Jul 2022 20:06:03 +0100
Message-ID: <d1f3646b-ff37-0120-4284-7861b23e30b3@intel.com>
Date: Thu, 28 Jul 2022 21:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/guc: Don't abort on CTB_UNUSED
 status
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
 <20220728024225.2363663-7-John.C.Harrison@Intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220728024225.2363663-7-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 28.07.2022 04:42, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When the KMD sends a CLIENT_RESET request to GuC (as part of the
> suspend sequence), GuC will mark the CTB buffer as 'UNUSED'. If the

hmm, GuC shouldn't do that on CLIENT_RESET, GuC shall only mark CTB as
UNUSED when we explicitly disable CTB using CONTROL_CTB as only then CTB
descriptors are known to be valid

> KMD then checked the CTB queue, it would see a non-zero status value
> and report the buffer as corrupted.
> 
> Technically, no G2H messages should be received once the CLIENT_RESET
> has been sent. However, if a context was outstanding on an engine then
> it would get reset and a reset notification would be sent. So, don't
> actually treat UNUSED as a catastrophic error. Just flag it up as
> unexpected and keep going.

we should have already marked locally that CTB is disabled, either as
part of the explicit disabling of CTB with CONTROL_CTB, or implicit due
to issued CLIENT_RESET, but in both cases we shouldn't try to read CTB
any more, even it there are any outstanding messages ...

is this due to a race with ct->enabled ?

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  .../i915/gt/uc/abi/guc_communication_ctb_abi.h |  8 +++++---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c      | 18 ++++++++++++++++--
>  2 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> index df83c1cc7c7a6..28b8387f97b77 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> @@ -37,6 +37,7 @@
>   *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too large)     |
>   *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated message)      |
>   *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail modified)      |
> + *  |   |       |   - _`GUC_CTB_STATUS_UNUSED` = 8 (CTB is not in use)         |
>   *  +---+-------+--------------------------------------------------------------+
>   *  |...|       | RESERVED = MBZ                                               |
>   *  +---+-------+--------------------------------------------------------------+
> @@ -49,9 +50,10 @@ struct guc_ct_buffer_desc {
>  	u32 tail;
>  	u32 status;
>  #define GUC_CTB_STATUS_NO_ERROR				0
> -#define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
> -#define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
> -#define GUC_CTB_STATUS_MISMATCH				(1 << 2)
> +#define GUC_CTB_STATUS_OVERFLOW				BIT(0)
> +#define GUC_CTB_STATUS_UNDERFLOW			BIT(1)
> +#define GUC_CTB_STATUS_MISMATCH				BIT(2)
> +#define GUC_CTB_STATUS_UNUSED				BIT(3)

nit: our goal was to use plain C definitions in ABI headers as much as
possible without introducing any dependency on external macros

>  	u32 reserved[13];
>  } __packed;
>  static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index f01325cd1b625..11b5d4ddb19ce 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -816,8 +816,22 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  	if (unlikely(ctb->broken))
>  		return -EPIPE;
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

do you really want to continue read messages from already disabled CTB ?
maybe instead of clearing GUC_CTB_STATUS_UNUSED bit we should just return?

Michal

> +		}
> +
> +		if (status)
> +			goto corrupted;
> +	}
>  
>  	GEM_BUG_ON(head > size);
>  
