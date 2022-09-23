Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516105E7FAA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 18:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E2D10E5A2;
	Fri, 23 Sep 2022 16:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3FB10E5A1;
 Fri, 23 Sep 2022 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663950310; x=1695486310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RjhLpUM8Tp5IjmYY65d6a3tO2K/Bz5UWtVf3iwws6Y4=;
 b=khoRrF4966j+G109U4Y6J8hiy9gAQC9Rw/tP32l5HS+ajqYUwL6qf0yD
 rd+zTvvy1qPJfjD7mvoZ4Bjy8UJb7EOD5y1Q6NYnt/EmTIKNZwiUmU8Lp
 JkhbdG51YGvKAkAek53XIM6b0x2+rAn/CvhYoUb5ZUnaIo4pb3HNpmIGj
 1Tu8OHkqjG1Q21ihxqLov/ZxX7wShBv2qxn+01pHJ8bBc57xuf/mHTCVv
 +QdLR6vmfnKK9F1t0Vv5KS3jk4UKoDgIVkX6mtu3XCVvk6LEAcWLsHN/x
 To7+aK42AcGUU4J+ph/psfmLqlxMUbGgxYgnxKt7fUQuVexG5mzBL3Gkg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="364648950"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="364648950"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 09:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="762663623"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 23 Sep 2022 09:16:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Sep 2022 19:16:11 +0300
Date: Fri, 23 Sep 2022 19:16:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Stop using flush_scheduled_work on driver remove
Message-ID: <Yy3byxFrfAfQL9xK@intel.com>
References: <20220923142934.29528-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220923142934.29528-1-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 03:29:34PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Kernel is trying to eliminate callers of flush_scheduled_work so lets
> try to accommodate.
> 
> We currently call it from intel_modeset_driver_remove_noirq on the driver
> remove path but the comment next to it does not tell me what exact work it
> wants to flush.
> 
> I can spot three (or four) works using the system_wq:
> 
>   ..hotplug.reenable_work
>   ..hotplug.hotplug_work

Looks like we at least try to shoot those down via
intel_irq_uninstall()
 ->intel_hpd_cancel_work()
  ->cancel_delayed_work_sync()

But I'm not sure how broken the hpd disable path is here.
I know hpd cancel vs. irq disable has some known ordering
issues during suspend at least, some of which I think may
have gotten fixed recently. But hpd cancel is still a bit
of a mess in general.

Here we at least do cancel all the hpd works after irqs
have been disabled, so I don't think any further flushing
should help with whatever races we have left in there.

>   ..psr.dc3co_work

I think the whole dc3co thing should be disabled atm,
so nothing should ever schedule this. We should
probably garbage collect the whole thing...

>   ..crtc->drrs.work

That one should have been killed in
intel_display_driver_unregister()
 ->drm_atomic_helper_shutdown()
  ->...
   ->intel_drrs_deactivate()
    ->cancel_delayed_work_sync()

> So if I replace it with intel_hpd_cancel_work() that appears would handle
> the first two. What about the other two?

Other stuff that comes to mind is the pps vdd_off work.
But looks like that should get taken down in the
encoder->destroy() hook at the latest (via
intel_mode_config_cleanup()).

psr.work at least has a cancel_work_sync() in intel_psr_disable(),
so should hopefully get killed the same way as drrs.

opregion.asle_work seems to get cancelled from the unregister path.

The ones that look broken to me are dmc.work and fbc underrun_work.

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> I am clueless about the display paths and only send this because Jani
> convinced me to send a patch to kick off the discussion. No expectations
> whatsoever this is correct or complete.
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 2d0018ae34b1..0eb72530a003 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8980,7 +8980,7 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
>  	intel_unregister_dsm_handler();
>  
>  	/* flush any delayed tasks or pending work */
> -	flush_scheduled_work();
> +	intel_hpd_cancel_work(i915);
>  
>  	intel_hdcp_component_fini(i915);
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
