Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F007DDE5E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773FC10E66E;
	Wed,  1 Nov 2023 09:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1E710E051;
 Wed,  1 Nov 2023 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698830749; x=1730366749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kjut8bZElERulnHLOR/O2sVlhKmw5RUueM0v7NCTW4Y=;
 b=Io12jvw+MfjrAy7tFtvQEPxHxA8TCoq+9nX9DCWfJ4wOKUTQwLl80n6K
 HrN7kJBzZ2BqCUUql4+lGGiBmEv+LJfVdKlE7L8a/asRsQs2TM3suJG86
 t2bOiGjdyq3INOICz6a6NftRFhlVO8UFsjTolPUok4SWLebIAW4YMvg10
 FzbE+IhOxwoUHu2AR+aC1CvSjVFx4YIQzbkNyASY+5PQILAvygIwAgsHv
 zvMpuxcalbFKF7UXlNi/oW/5HDVt5LilKJ23tDXdviXZPvUuCVNeb/EAQ
 YVp3SdzL1SMvCQQmkSllLL1Ot+Li9vxUJFbo+ROXWwFfXrwTQpBn8dAl0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="452750902"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="452750902"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 02:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="754427828"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="754427828"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 01 Nov 2023 02:25:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 01 Nov 2023 11:25:43 +0200
Date: Wed, 1 Nov 2023 11:25:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 7/7] drm/i915: Implement fbdev emulation as in-kernel
 client
Message-ID: <ZUIZl0R4madz6W-7@intel.com>
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-8-tzimmermann@suse.de>
 <199bdb57b0f48e6f77f7effc90dcffcae8213285.camel@intel.com>
 <99033596-d875-4cfe-9105-730a57cf6013@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99033596-d875-4cfe-9105-730a57cf6013@suse.de>
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Hogander,
 Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 01, 2023 at 09:33:41AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.10.23 um 13:36 schrieb Hogander, Jouni:
> [...]
> >> +
> >> +       if (!drm_drv_uses_atomic_modeset(dev))
> >> +               drm_helper_disable_unused_functions(dev);
> > 
> > Can you please explain why this is needed here?
> 
> This disables some parts of the mode-setting pipeline and is required 
> for drivers with non-atomic commits.  AFAICT atomic mode setting is not 
> supported on some very old Intel chips. [1]  I'll leave a short comment 
> on the code.

We don't expose the atomic uapi because the watermark code is
kinda sketchy for the old chips, but internally i915 is 100% atomic.

> 
> [1] 
> https://elixir.bootlin.com/linux/v6.6/source/drivers/gpu/drm/i915/intel_device_info.c#L399
> 
> Best regard
> Thomas
> 
> > 
> >> +
> >> +       ret = drm_fb_helper_initial_config(fb_helper);
> >> +       if (ret)
> >> +               goto err_drm_fb_helper_fini;
> >> +
> >> +       vga_switcheroo_client_fb_set(pdev, fb_helper->info);
> >>   
> >>          return 0;
> >> +
> >> +err_drm_fb_helper_fini:
> >> +       drm_fb_helper_fini(fb_helper);
> >> +err_drm_err:
> >> +       drm_err(dev, "Failed to setup i915 fbdev emulation
> >> (ret=%d)\n", ret);
> >> +       return ret;
> >>   }
> >>   
> >>   static const struct drm_client_funcs intel_fbdev_client_funcs = {
> >> @@ -703,22 +729,23 @@ static const struct drm_client_funcs
> >> intel_fbdev_client_funcs = {
> >>          .hotplug        = intel_fbdev_client_hotplug,
> >>   };
> >>   
> >> -int intel_fbdev_init(struct drm_device *dev)
> >> +void intel_fbdev_setup(struct drm_i915_private *dev_priv)
> > 
> > Use i915 rather than dev_priv.
> > 
> > BR,
> > 
> > Jouni Högander
> > 
> >>   {
> >> -       struct drm_i915_private *dev_priv = to_i915(dev);
> >> +       struct drm_device *dev = &dev_priv->drm;
> >>          struct intel_fbdev *ifbdev;
> >>          int ret;
> >>   
> >> -       if (drm_WARN_ON(dev, !HAS_DISPLAY(dev_priv)))
> >> -               return -ENODEV;
> >> +       if (!HAS_DISPLAY(dev_priv))
> >> +               return;
> >>   
> >>          ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
> >>          if (!ifbdev)
> >> -               return -ENOMEM;
> >> -
> >> -       mutex_init(&ifbdev->hpd_lock);
> >> +               return;
> >>          drm_fb_helper_prepare(dev, &ifbdev->helper, 32,
> >> &intel_fb_helper_funcs);
> >>   
> >> +       dev_priv->display.fbdev.fbdev = ifbdev;
> >> +       INIT_WORK(&dev_priv->display.fbdev.suspend_work,
> >> intel_fbdev_suspend_worker);
> >> +       mutex_init(&ifbdev->hpd_lock);
> >>          if (intel_fbdev_init_bios(dev, ifbdev))
> >>                  ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
> >>          else
> >> @@ -726,68 +753,19 @@ int intel_fbdev_init(struct drm_device *dev)
> >>   
> >>          ret = drm_client_init(dev, &ifbdev->helper.client, "i915-
> >> fbdev",
> >>                                &intel_fbdev_client_funcs);
> >> -       if (ret)
> >> +       if (ret) {
> >> +               drm_err(dev, "Failed to register client: %d\n", ret);
> >>                  goto err_drm_fb_helper_unprepare;
> >> +       }
> >>   
> >> -       ret = drm_fb_helper_init(dev, &ifbdev->helper);
> >> -       if (ret)
> >> -               goto err_drm_client_release;
> >> -
> >> -       dev_priv->display.fbdev.fbdev = ifbdev;
> >> -       INIT_WORK(&dev_priv->display.fbdev.suspend_work,
> >> intel_fbdev_suspend_worker);
> >> +       drm_client_register(&ifbdev->helper.client);
> >>   
> >> -       return 0;
> >> +       return;
> >>   
> >> -err_drm_client_release:
> >> -       drm_client_release(&ifbdev->helper.client);
> >>   err_drm_fb_helper_unprepare:
> >>          drm_fb_helper_unprepare(&ifbdev->helper);
> >> +       mutex_destroy(&ifbdev->hpd_lock);
> >>          kfree(ifbdev);
> >> -       return ret;
> >> -}
> >> -
> >> -static void intel_fbdev_initial_config(void *data, async_cookie_t
> >> cookie)
> >> -{
> >> -       struct intel_fbdev *ifbdev = data;
> >> -
> >> -       /* Due to peculiar init order wrt to hpd handling this is
> >> separate. */
> >> -       if (drm_fb_helper_initial_config(&ifbdev->helper))
> >> -               intel_fbdev_unregister(to_i915(ifbdev->helper.dev));
> >> -}
> >> -
> >> -void intel_fbdev_initial_config_async(struct drm_i915_private
> >> *dev_priv)
> >> -{
> >> -       struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
> >> -
> >> -       if (!ifbdev)
> >> -               return;
> >> -
> >> -       ifbdev->cookie = async_schedule(intel_fbdev_initial_config,
> >> ifbdev);
> >> -}
> >> -
> >> -void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
> >> -{
> >> -       struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
> >> -
> >> -       if (!ifbdev)
> >> -               return;
> >> -
> >> -       intel_fbdev_set_suspend(&dev_priv->drm,
> >> FBINFO_STATE_SUSPENDED, true);
> >> -
> >> -       if (!current_is_async())
> >> -               intel_fbdev_sync(ifbdev);
> >> -
> >> -       drm_fb_helper_unregister_info(&ifbdev->helper);
> >> -}
> >> -
> >> -void intel_fbdev_fini(struct drm_i915_private *dev_priv)
> >> -{
> >> -       struct intel_fbdev *ifbdev = fetch_and_zero(&dev_priv-
> >>> display.fbdev.fbdev);
> >> -
> >> -       if (!ifbdev)
> >> -               return;
> >> -
> >> -       intel_fbdev_destroy(ifbdev);
> >>   }
> >>   
> >>   struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev
> >> *fbdev)
> >> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h
> >> b/drivers/gpu/drm/i915/display/intel_fbdev.h
> >> index 8c953f102ba22..08de2d5b34338 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_fbdev.h
> >> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
> >> @@ -14,27 +14,11 @@ struct intel_fbdev;
> >>   struct intel_framebuffer;
> >>   
> >>   #ifdef CONFIG_DRM_FBDEV_EMULATION
> >> -int intel_fbdev_init(struct drm_device *dev);
> >> -void intel_fbdev_initial_config_async(struct drm_i915_private
> >> *dev_priv);
> >> -void intel_fbdev_unregister(struct drm_i915_private *dev_priv);
> >> -void intel_fbdev_fini(struct drm_i915_private *dev_priv);
> >> +void intel_fbdev_setup(struct drm_i915_private *dev_priv);
> >>   void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool
> >> synchronous);
> >>   struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev
> >> *fbdev);
> >>   #else
> >> -static inline int intel_fbdev_init(struct drm_device *dev)
> >> -{
> >> -       return 0;
> >> -}
> >> -
> >> -static inline void intel_fbdev_initial_config_async(struct
> >> drm_i915_private *dev_priv)
> >> -{
> >> -}
> >> -
> >> -static inline void intel_fbdev_unregister(struct drm_i915_private
> >> *dev_priv)
> >> -{
> >> -}
> >> -
> >> -static inline void intel_fbdev_fini(struct drm_i915_private
> >> *dev_priv)
> >> +static inline void intel_fbdev_setup(struct drm_i915_private
> >> *dev_priv)
> >>   {
> >>   }
> >>   
> >> diff --git a/drivers/gpu/drm/i915/i915_driver.c
> >> b/drivers/gpu/drm/i915/i915_driver.c
> >> index 86460cd8167d1..53663c0cc3be4 100644
> >> --- a/drivers/gpu/drm/i915/i915_driver.c
> >> +++ b/drivers/gpu/drm/i915/i915_driver.c
> >> @@ -817,6 +817,8 @@ int i915_driver_probe(struct pci_dev *pdev, const
> >> struct pci_device_id *ent)
> >>   
> >>          i915->do_release = true;
> >>   
> >> +       intel_fbdev_setup(i915);
> >> +
> >>          return 0;
> >>   
> >>   out_cleanup_gem:
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)




-- 
Ville Syrjälä
Intel
