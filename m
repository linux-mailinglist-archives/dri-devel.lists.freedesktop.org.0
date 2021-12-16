Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8540F476749
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 02:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7602110E688;
	Thu, 16 Dec 2021 01:11:16 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331FD10F810;
 Thu, 16 Dec 2021 01:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639617075; x=1671153075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wSeEtP47i9pw3/sX21jnkP6nH3+x1LSp9vzfO1ILMNs=;
 b=aI1gSEAl+e49zjmqGNrF41b5xas5YSGXxr5oGy5A48Sh5QbspGtTZGx8
 HUqnA/hz6HGni/B/j4i/RzsMVkILsNua0bkNl0Yx74jLcwqgOBO1jDg3x
 I8WhYK2zWMBhkPebqhdtBS3UKcpPAV/rIbDTcQYO1qpR8fPxLzMg0azn+
 lQixjmnPQxlLmThaD14zaBe+3kd+dF6jvIGYUBSGn2wtL4QPYSY6hdF48
 n6p9tl3mTNht27r5vVbWRLZqOZhrQlljrNLPS27l3ODR2EBRCXjOd6Qnt
 bb5FsnHzaQXZnxUH3aDWRATwQejpSdgh8OmXBflNJuIO1pJsJixtEIz4w w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="263534704"
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; d="scan'208";a="263534704"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 17:11:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; d="scan'208";a="482629289"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 17:11:14 -0800
Date: Wed, 15 Dec 2021 17:05:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Check for wedged before doing
 stuff
Message-ID: <20211216010552.GA32317@jons-linux-dev-box>
References: <20211215224556.3382217-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215224556.3382217-1-John.C.Harrison@Intel.com>
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

On Wed, Dec 15, 2021 at 02:45:56PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> A fault injection probe test hit a BUG_ON in a GuC error path. It
> showed that the GuC code could potentially attempt to do many things
> when the device is actually wedged. So, add a check in to prevent that.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 97311119da6f..88f002c4d41b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1350,7 +1350,8 @@ submission_disabled(struct intel_guc *guc)
>  	struct i915_sched_engine * const sched_engine = guc->sched_engine;
>  
>  	return unlikely(!sched_engine ||
> -			!__tasklet_is_enabled(&sched_engine->tasklet));
> +			!__tasklet_is_enabled(&sched_engine->tasklet) ||
> +			test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags));
>  }
>  
>  static void disable_submission(struct intel_guc *guc)
> -- 
> 2.25.1
> 
