Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFAB6CC65F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD5510E907;
	Tue, 28 Mar 2023 15:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B8F10E8D7;
 Tue, 28 Mar 2023 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680017515; x=1711553515;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6XjQ/N4uthyVuFqDmwLfHJV+MFmg8QxXRo8hAwhAnic=;
 b=FBe3Xzu5tOxU9oGCMxBP8esfM1rsFQMRM87YEyW7POH9yxHIXb+HANCt
 6ChhTd+jTD9UT3YQg1xLRqRUpdbAUPWx7nhiEBM6RRSm19Z08M2L1NIWH
 wb0+CuQN1zgJB0FdeRchnNnexnv1Zb/lWk9IuX5SLQxT38GwacMHi0Ckf
 V7MzTJjYly/TcP89x0lGj1JZaQwU7UiYGBAwio5m9BvzHHC4pZr9GDtvw
 Y0sSek9FthrGx720HgdH+MYTwJWilp+z/5piC5j25trSZqQbOtw/zYls5
 RHfw58drcaTabwEyLD/O/1czpTix9c62L05k8zjws+X2TkZAuH2P/BNK+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405540944"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="405540944"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 08:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773183910"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="773183910"
Received: from mmetzger-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 08:31:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com
Subject: Re: [PATCH 4/4] drm/i915: Implement fbdev emulation as in-kernel
 client
In-Reply-To: <20230328111422.23986-5-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230328111422.23986-1-tzimmermann@suse.de>
 <20230328111422.23986-5-tzimmermann@suse.de>
Date: Tue, 28 Mar 2023 18:31:47 +0300
Message-ID: <87355o6gf0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Mar 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Replace all code that initializes or releases fbdev emulation
> throughout the driver. Instead initialize the fbdev client by a
> single call to i915_fbdev_setup() after i915 has registered its
> DRM device. Just like in most drivers, i915 fbdev emulation now
> acts like a regular DRM client.
>
> The fbdev client setup consists of the initial preparation and the
> hot-plugging of the display. The latter creates the fbdev device
> and sets up the fbdev framebuffer. The setup performs display
> hot-plugging once. If no display can be detected, DRM probe helpers
> re-run the detection on each hotplug event.
>
> A call to drm_dev_unregister() releases the client automatically.
> No further action is required within i915. If the fbdev framebuffer
> has been fully set up, struct fb_ops.fb_destroy implements the
> release. For partially initialized emulation, the fbdev client
> reverts the initial setup.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I like the direction in the series, but I'm afraid I don't have the time
for proper detailed review of this right now. Just a couple of nits I
stumbled on inline.

Anyone else have a chance to get this reviewed?

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  30 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c   | 184 +++++++++----------
>  drivers/gpu/drm/i915/display/intel_fbdev.h   |  20 +-
>  drivers/gpu/drm/i915/i915_driver.c           |   2 +
>  4 files changed, 87 insertions(+), 149 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 430a1016e013..1bbeb7a061e3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -85,7 +85,6 @@
>  #include "intel_dvo.h"
>  #include "intel_fb.h"
>  #include "intel_fbc.h"
> -#include "intel_fbdev.h"
>  #include "intel_fdi.h"
>  #include "intel_fifo_underrun.h"
>  #include "intel_frontbuffer.h"
> @@ -8588,11 +8587,6 @@ int intel_modeset_init(struct drm_i915_private *i915)
>  
>  	intel_overlay_setup(i915);
>  
> -	ret = intel_fbdev_init(&i915->drm);
> -	if (ret)
> -		return ret;
> -
> -	/* Only enable hotplug handling once the fbdev is fully set up. */
>  	intel_hpd_init(i915);
>  	intel_hpd_poll_disable(i915);
>  
> @@ -8796,9 +8790,6 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
>  	 */
>  	intel_hpd_poll_fini(i915);
>  
> -	/* poll work can call into fbdev, hence clean that up afterwards */
> -	intel_fbdev_fini(i915);
> -
>  	intel_unregister_dsm_handler();
>  
>  	/* flush any delayed tasks or pending work */
> @@ -8864,21 +8855,6 @@ void intel_display_driver_register(struct drm_i915_private *i915)
>  
>  	intel_display_debugfs_register(i915);
>  
> -	/*
> -	 * Some ports require correctly set-up hpd registers for
> -	 * detection to work properly (leading to ghost connected
> -	 * connector status), e.g. VGA on gm45.  Hence we can only set
> -	 * up the initial fbdev config after hpd irqs are fully
> -	 * enabled. We do it last so that the async config cannot run
> -	 * before the connectors are registered.
> -	 */
> -	intel_fbdev_initial_config_async(i915);
> -
> -	/*
> -	 * We need to coordinate the hotplugs with the asynchronous
> -	 * fbdev configuration, for which we use the
> -	 * fbdev->async_cookie.
> -	 */
>  	drm_kms_helper_poll_init(&i915->drm);
>  }
>  
> @@ -8887,14 +8863,8 @@ void intel_display_driver_unregister(struct drm_i915_private *i915)
>  	if (!HAS_DISPLAY(i915))
>  		return;
>  
> -	intel_fbdev_unregister(i915);
>  	intel_audio_deinit(i915);
>  
> -	/*
> -	 * After flushing the fbdev (incl. a late async config which
> -	 * will have delayed queuing of a hotplug event), then flush
> -	 * the hotplug events.
> -	 */
>  	drm_kms_helper_poll_fini(&i915->drm);
>  	drm_atomic_helper_shutdown(&i915->drm);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index bdb9e6f43602..8b618db30ee5 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -24,7 +24,6 @@
>   *     David Airlie
>   */
>  
> -#include <linux/async.h>
>  #include <linux/console.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
> @@ -38,6 +37,7 @@
>  #include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  
> @@ -55,7 +55,6 @@ struct intel_fbdev {
>  	struct intel_framebuffer *fb;
>  	struct i915_vma *vma;
>  	unsigned long vma_flags;
> -	async_cookie_t cookie;
>  	int preferred_bpp;
>  
>  	/* Whether or not fbdev hpd processing is temporarily suspended */
> @@ -120,6 +119,26 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
>  	return ret;
>  }
>  
> +static void intel_fbdev_fb_destroy(struct fb_info *info)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct intel_fbdev *ifbdev = container_of(fb_helper, struct intel_fbdev, helper);
> +
> +	drm_fb_helper_fini(&ifbdev->helper);
> +
> +	/*
> +	 * We rely on the object-free to release the VMA pinning for
> +	 * the info->screen_base mmaping. Leaking the VMA is simpler than
> +	 * trying to rectify all the possible error paths leading here.
> +	 */
> +	intel_unpin_fb_vma(ifbdev->vma, ifbdev->vma_flags);
> +	drm_framebuffer_remove(&ifbdev->fb->base);
> +
> +	drm_client_release(&fb_helper->client);
> +	drm_fb_helper_unprepare(&ifbdev->helper);
> +	kfree(ifbdev);
> +}
> +
>  static const struct fb_ops intelfb_ops = {
>  	.owner = THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> @@ -131,6 +150,7 @@ static const struct fb_ops intelfb_ops = {
>  	.fb_imageblit = drm_fb_helper_cfb_imageblit,
>  	.fb_pan_display = intel_fbdev_pan_display,
>  	.fb_blank = intel_fbdev_blank,
> +	.fb_destroy = intel_fbdev_fb_destroy,
>  };
>  
>  static int intelfb_alloc(struct drm_fb_helper *helper,
> @@ -198,7 +218,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	struct intel_framebuffer *intel_fb = ifbdev->fb;
>  	struct drm_device *dev = helper->dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> -	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
>  	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
>  	const struct i915_gtt_view view = {
>  		.type = I915_GTT_VIEW_NORMAL,
> @@ -323,7 +342,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	ifbdev->vma_flags = flags;
>  
>  	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
> -	vga_switcheroo_client_fb_set(pdev, info);
> +
>  	return 0;
>  
>  out_unpin:
> @@ -349,26 +368,6 @@ static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
>  	.fb_dirty = intelfb_dirty,
>  };
>  
> -static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
> -{
> -	/* We rely on the object-free to release the VMA pinning for
> -	 * the info->screen_base mmaping. Leaking the VMA is simpler than
> -	 * trying to rectify all the possible error paths leading here.
> -	 */
> -
> -	drm_fb_helper_fini(&ifbdev->helper);
> -
> -	if (ifbdev->vma)
> -		intel_unpin_fb_vma(ifbdev->vma, ifbdev->vma_flags);
> -
> -	if (ifbdev->fb)
> -		drm_framebuffer_remove(&ifbdev->fb->base);
> -
> -	drm_client_release(&ifbdev->helper.client);
> -	drm_fb_helper_unprepare(&ifbdev->helper);
> -	kfree(ifbdev);
> -}
> -
>  /*
>   * Build an intel_fbdev struct using a BIOS allocated framebuffer, if possible.
>   * The core display code will have read out the current plane configuration,
> @@ -532,16 +531,6 @@ static void intel_fbdev_suspend_worker(struct work_struct *work)
>  				true);
>  }
>  
> -static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
> -{
> -	if (!ifbdev->cookie)
> -		return;
> -
> -	/* Only serialises with all preceding async calls, hence +1 */
> -	async_synchronize_cookie(ifbdev->cookie + 1);
> -	ifbdev->cookie = 0;
> -}
> -
>  /* Suspends/resumes fbdev processing of incoming HPD events. When resuming HPD
>   * processing, fbdev will perform a full connector reprobe if a hotplug event
>   * was received while HPD was suspended.
> @@ -631,8 +620,6 @@ static void intel_fbdev_output_poll_changed(struct drm_device *dev)
>  	if (!ifbdev)
>  		return;
>  
> -	intel_fbdev_sync(ifbdev);
> -
>  	mutex_lock(&ifbdev->hpd_lock);
>  	send_hpd = !ifbdev->hpd_suspended;
>  	ifbdev->hpd_waiting = true;
> @@ -649,7 +636,6 @@ static void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
>  	if (!ifbdev)
>  		return;
>  
> -	intel_fbdev_sync(ifbdev);
>  	if (!ifbdev->vma)
>  		return;
>  
> @@ -662,7 +648,20 @@ static void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
>   */
>  
>  static void intel_fbdev_client_unregister(struct drm_client_dev *client)
> -{ }
> +{
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +	struct drm_device *dev = fb_helper->dev;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +
> +	if (fb_helper->info) {
> +		vga_switcheroo_client_fb_set(pdev, NULL);
> +		drm_fb_helper_unregister_info(fb_helper);
> +	} else {
> +		drm_fb_helper_unprepare(fb_helper);
> +		drm_client_release(&fb_helper->client);
> +		kfree(fb_helper);
> +	}
> +}
>  
>  static int intel_fbdev_client_restore(struct drm_client_dev *client)
>  {
> @@ -676,9 +675,36 @@ static int intel_fbdev_client_restore(struct drm_client_dev *client)
>  
>  static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
>  {
> -	intel_fbdev_output_poll_changed(client->dev);
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +	struct drm_device *dev = client->dev;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +	int ret;
> +
> +	if (dev->fb_helper) {
> +		intel_fbdev_output_poll_changed(dev);
> +		return 0;
> +	}
> +
> +	ret = drm_fb_helper_init(dev, fb_helper);
> +	if (ret)
> +		goto err_drm_err;
> +
> +	if (!drm_drv_uses_atomic_modeset(dev))
> +		drm_helper_disable_unused_functions(dev);
> +
> +	ret = drm_fb_helper_initial_config(fb_helper);
> +	if (ret)
> +		goto err_drm_fb_helper_fini;
> +
> +	vga_switcheroo_client_fb_set(pdev, fb_helper->info);
>  
>  	return 0;
> +
> +err_drm_fb_helper_fini:
> +	drm_fb_helper_fini(fb_helper);
> +err_drm_err:
> +	drm_err(dev, "Failed to setup radeon fbdev emulation (ret=%d)\n", ret);
                                      ^^^^^^

Hrrmmh. ;)

> +	return ret;
>  }
>  
>  static const struct drm_client_funcs intel_fbdev_client_funcs = {
> @@ -688,22 +714,23 @@ static const struct drm_client_funcs intel_fbdev_client_funcs = {
>  	.hotplug	= intel_fbdev_client_hotplug,
>  };
>  
> -int intel_fbdev_init(struct drm_device *dev)
> +void intel_fbdev_setup(struct drm_i915_private *dev_priv)
>  {
> -	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct drm_device *dev = &dev_priv->drm;
>  	struct intel_fbdev *ifbdev;
>  	int ret;
>  
>  	if (drm_WARN_ON(dev, !HAS_DISPLAY(dev_priv)))
> -		return -ENODEV;
> -
> -	ifbdev = kzalloc(sizeof(struct intel_fbdev), GFP_KERNEL);
> -	if (ifbdev == NULL)
> -		return -ENOMEM;
> +		return;
>  
> -	mutex_init(&ifbdev->hpd_lock);
> +	ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
> +	if (!ifbdev)
> +		return;
>  	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
>  
> +	dev_priv->display.fbdev.fbdev = ifbdev;
> +	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
> +	mutex_init(&ifbdev->hpd_lock);
>  	if (intel_fbdev_init_bios(dev, ifbdev))
>  		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
>  	else
> @@ -711,68 +738,23 @@ int intel_fbdev_init(struct drm_device *dev)
>  
>  	ret = drm_client_init(dev, &ifbdev->helper.client, "i915-fbdev",
>  			      &intel_fbdev_client_funcs);
> -	if (ret)
> +	if (ret) {
> +		drm_err(dev, "Failed to register client: %d\n", ret);
>  		goto err_drm_fb_helper_unprepare;
> +	}
>  
> -	ret = drm_fb_helper_init(dev, &ifbdev->helper);
> +	ret = intel_fbdev_client_hotplug(&ifbdev->helper.client);
>  	if (ret)
> -		goto err_drm_client_release;
> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>  
> -	dev_priv->display.fbdev.fbdev = ifbdev;
> -	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
> +	drm_client_register(&ifbdev->helper.client);
>  
> -	return 0;
> +	return;
>  
> -err_drm_client_release:
> -	drm_client_release(&ifbdev->helper.client);
>  err_drm_fb_helper_unprepare:
> -	drm_client_release(&ifbdev->helper.client);
> +	drm_fb_helper_unprepare(&ifbdev->helper);
> +	mutex_destroy(&ifbdev->hpd_lock);
>  	kfree(ifbdev);
> -	return ret;
> -}
> -
> -static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)
> -{
> -	struct intel_fbdev *ifbdev = data;
> -
> -	/* Due to peculiar init order wrt to hpd handling this is separate. */
> -	if (drm_fb_helper_initial_config(&ifbdev->helper))
> -		intel_fbdev_unregister(to_i915(ifbdev->helper.dev));
> -}
> -
> -void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv)
> -{
> -	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
> -
> -	if (!ifbdev)
> -		return;
> -
> -	ifbdev->cookie = async_schedule(intel_fbdev_initial_config, ifbdev);
> -}
> -
> -void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
> -{
> -	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
> -
> -	if (!ifbdev)
> -		return;
> -
> -	intel_fbdev_set_suspend(&dev_priv->drm, FBINFO_STATE_SUSPENDED, true);
> -
> -	if (!current_is_async())
> -		intel_fbdev_sync(ifbdev);
> -
> -	drm_fb_helper_unregister_info(&ifbdev->helper);
> -}
> -
> -void intel_fbdev_fini(struct drm_i915_private *dev_priv)
> -{
> -	struct intel_fbdev *ifbdev = fetch_and_zero(&dev_priv->display.fbdev.fbdev);
> -
> -	if (!ifbdev)
> -		return;
> -
> -	intel_fbdev_destroy(ifbdev);
>  }
>  
>  struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
> index 8c953f102ba2..8123c813caaf 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.h
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
> @@ -14,27 +14,11 @@ struct intel_fbdev;
>  struct intel_framebuffer;
>  
>  #ifdef CONFIG_DRM_FBDEV_EMULATION
> -int intel_fbdev_init(struct drm_device *dev);
> -void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv);
> -void intel_fbdev_unregister(struct drm_i915_private *dev_priv);
> -void intel_fbdev_fini(struct drm_i915_private *dev_priv);
> +void intel_fbdev_setup(struct drm_i915_private *dev_priv);
>  void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous);
>  struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev);
>  #else
> -static inline int intel_fbdev_init(struct drm_device *dev)
> -{
> -	return 0;
> -}
> -
> -static inline void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv)
> -{
> -}
> -
> -static inline void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
> -{
> -}
> -
> -static inline void intel_fbdev_fini(struct drm_i915_private *dev_priv)
> +void intel_fbdev_setup(struct drm_i915_private *dev_priv);
>  {
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index be804fd4f79f..0b6722bcfbb2 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -820,6 +820,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	i915->do_release = true;
>  
> +	intel_fbdev_setup(i915);
> +

Maybe we could call this from intel_display_driver_register()?

We're trying to separate display related stuff from the rest, and call
as few display functions from top level driver code as
possible. (Clearly, we're nowhere near this goal yet.)


>  	return 0;
>  
>  out_cleanup_gem:

-- 
Jani Nikula, Intel Open Source Graphics Center
