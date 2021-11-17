Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 677744545AE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 12:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C026E550;
	Wed, 17 Nov 2021 11:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73E06E44E;
 Wed, 17 Nov 2021 11:30:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="233875575"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="233875575"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 03:29:58 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="735778513"
Received: from rstock-mobl.ger.corp.intel.com (HELO [10.249.254.164])
 ([10.249.254.164])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 03:29:57 -0800
Message-ID: <c3c6efb111206e6b6384c85e09557e84c73253d4.camel@linux.intel.com>
Subject: Re: [PATCH 1/6] drm/i915: move the pre_pin earlier
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 17 Nov 2021 12:29:54 +0100
In-Reply-To: <20211112153216.630452-1-matthew.auld@intel.com>
References: <20211112153216.630452-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-11-12 at 15:32 +0000, Matthew Auld wrote:
> In intel_context_do_pin_ww, when calling into the pre_pin hook(which
> is
> passed the ww context) it could in theory return -EDEADLK(which is
> very
> likely with debug kernels), once we start adding more ww locking in
> there,
> like in the next patch. If so then we need to be mindful of having to
> restart the do_pin at this point.
> 
> If this is the kernel_context, or some other early in-kernel context
> where we have yet to setup the default_state, then we always inhibit
> the
> context restore, and instead rely on the delayed active_release to
> set
> the CONTEXT_VALID_BIT for us(if we even care), which should indicate
> that we have context switched away, and that our newly saved context
> state should now be valid. However, since we currently grab the
> active
> reference before the potential ww dance, we can end up setting the
> CONTEXT_VALID_BIT much too early, if we need to backoff, and then
> upon
> re-trying the do_pin, we could potentially cause the hardware to
> incorrectly load some garbage context state when later context
> switching
> to that context, but at the very least this will trigger the
> GEM_BUG_ON() in __engine_unpark. For now let's just move any ww dance
> stuff prior to arming the active reference.
> 
> For normal user contexts this shouldn't be a concern, since we should
> already have the default_state ready when initialising the lrc state,
> and so there should be no concern with active_release somehow
> prematurely setting the CONTEXT_VALID_BIT.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_context.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c
> b/drivers/gpu/drm/i915/gt/intel_context.c
> index 5634d14052bc..ad44860faaf3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -228,17 +228,17 @@ int __intel_context_do_pin_ww(struct
> intel_context *ce,
>         if (err)
>                 return err;
>  
> -       err = i915_active_acquire(&ce->active);
> +       err = ce->ops->pre_pin(ce, ww, &vaddr);
>         if (err)
>                 goto err_ctx_unpin;
>  
> -       err = ce->ops->pre_pin(ce, ww, &vaddr);
> +       err = i915_active_acquire(&ce->active);
>         if (err)
> -               goto err_release;
> +               goto err_post_unpin;

Hmm, If i915_active_acquire() fails, wouldn't we end up calling
i915_active_release() here?

Thanks,
Thomas


