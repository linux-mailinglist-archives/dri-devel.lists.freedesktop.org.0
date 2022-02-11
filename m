Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E121C4B20CA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 09:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E6F10EA1F;
	Fri, 11 Feb 2022 08:56:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D1210EA1F;
 Fri, 11 Feb 2022 08:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644569788; x=1676105788;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8YYToFT+4qx3BqaIO8/V8ReZe6XZ3bG98IBedjtO2LQ=;
 b=ZlvNp4R1blkAVmFPpBmV1Att+FPSQQs1yMONb5u5nllTpB+xZz57wpYe
 VdO0FkfujfZCS+zon9C7LvnbyA+yUf2socY9RVCx8/mGrQ6AasHEdt7p3
 9jHf+gi7H2wyoAO++zf8EdansG3BCuk6C/p5b3PBy1nsWQkGlZ+kx3tLA
 WBmiHH5tOJKlc++EMn686VMjd4BtH7WIi0Ty5lw4SmZxaNBBpgmDVYBQp
 rqx3q/AMQbdAKBo2RsKq0yZY/6Us7pZG6PlkO/R/b1k6r8qj85K7GDTtv
 MJ2JYtVcuoeJiIDz/MD1DTa0WADndGcG6UhzO6RKTFTSirmkIlM8RyZz4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="247284776"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="247284776"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 00:56:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="483229157"
Received: from phughe1x-mobl2.ger.corp.intel.com (HELO [10.213.201.219])
 ([10.213.201.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 00:56:26 -0800
Message-ID: <5ab45355-15ed-74d9-3ef0-3982f41201f2@linux.intel.com>
Date: Fri, 11 Feb 2022 08:56:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Do not complain about stale
 reset notifications
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220210214708.2911301-1-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220210214708.2911301-1-John.C.Harrison@Intel.com>
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


On 10/02/2022 21:47, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> It is possible for reset notifications to arrive for a context that is
> in the process of being banned. So don't flag these as an error, just
> report it as informational (because it is still useful to know that
> resets are happening even if they are being ignored).

Is the "invalid" in the log message correct then or it should be 
something slightly different? Delayed? Ignored? "Ignoring .. for banned.." ?

Regards,

Tvrtko

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..3a4a87d1c89c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4022,10 +4022,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   		capture_error_state(guc, ce);
>   		guc_context_replay(ce);
>   	} else {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
> -			ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
> -			context_blocked(ce));
> +		drm_info(&guc_to_gt(guc)->i915->drm,
> +			 "Invalid GuC engine reset notification for 0x%04X on %s: banned = %d, blocked = %d",
> +			 ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
> +			 context_blocked(ce));
>   	}
>   }
>   
