Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E74B47E766
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 19:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AE410E39A;
	Thu, 23 Dec 2021 18:04:14 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B8B10E32E;
 Thu, 23 Dec 2021 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640282652; x=1671818652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V5RvjUqp/J9IzjfzhOKjT3/q44kho05hFB+33zCBf4s=;
 b=Effd3Njza2B5Ou++a/cYnOXNx0zPo4W+Dz0PSynoe0ToAvDRLdSFlTdG
 2RBQHHi64P/n+OfV2p93M1vTliIObgCTBuov1xzau+iYTZZ9+w5nekPwk
 PZSugoSMJ9rjIjee+ujtJIt2sIy/qkf5Q2b9SvTy7NsJGmZ2M7N3SLboL
 A3cmwdrm/SvojZBN0lpyRhFAfxAMs1vj8cv+ae6vgN8EikCAn0M1A2gi4
 DtRwCcPaOxGnqtVGQn0nx8oVKWGv2BNqnT1oBnj9tWG40NuXR9X2TppME
 IHV3Ph3YfqNCY6RxbZzQtReciQ9e/6V/qXPksN4T9o+YeePoJm+SI8OJV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="240666132"
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="240666132"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 10:04:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; d="scan'208";a="467061511"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 10:04:11 -0800
Date: Thu, 23 Dec 2021 09:58:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Report error on invalid reset
 notification
Message-ID: <20211223175820.GA3396@jons-linux-dev-box>
References: <20211223013128.1739792-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223013128.1739792-1-John.C.Harrison@Intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 22, 2021 at 05:31:28PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Don't silently drop reset notifications from the GuC. It might not be
> safe to do an error capture but we still want some kind of report that
> the reset happened.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e7517206af82..0fbf24b8d5e1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3979,6 +3979,11 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>  		   !context_blocked(ce))) {
>  		capture_error_state(guc, ce);
>  		guc_context_replay(ce);
> +	} else {
> +		drm_err(&guc_to_gt(guc)->i915->drm,
> +			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
> +			ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
> +			context_blocked(ce));

As discussed off the list, I'll a take an AR to see if we can not
supress the capture here. But until that gets resolved:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  	}
>  }
>  
> -- 
> 2.25.1
> 
