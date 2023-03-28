Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224E06CC5F5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ABF10E930;
	Tue, 28 Mar 2023 15:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FEF10E930;
 Tue, 28 Mar 2023 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680016845; x=1711552845;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kmD7fIGqMmIahmOFuJ0yY/5LAY9R/HvJf99XaGVuMiA=;
 b=T1l1shXyPSR54UsRAziZ2fzoLIT640kza99xKNOmP6O8KTKhw/3UU18C
 cVMCVfsPmk50UQPmLYEVWUQHaW3zC4vnlzqf3wI/h2R7nDiQKLHTaOkIq
 qbAmCmbmWXZB6tWHPQSonjyoaiuo8BoP72I3vR4xlOgYNcdmXAHrhd7Y3
 +1UtOF+1c5HBSUnGymCDHLE4n0BBeLp3lPwf0iYZz0GL+bHW1VFhuXfSx
 3eSfobd4dPsMjta5sLiZUF/Iv1kx8NFvJFG/X+E3ErMNzh4Ag6eJCT9R4
 lBZcS+0Ie25C9BrJbKo1YL4QOcd6+dPERncLErybKckNy7Yt0ktg1SUNb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320998633"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="320998633"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 08:20:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="716519907"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="716519907"
Received: from mmetzger-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 08:20:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com
Subject: Re: [PATCH 2/4] drm/i915: Initialize fbdev DRM client with callback
 functions
In-Reply-To: <20230328111422.23986-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230328111422.23986-1-tzimmermann@suse.de>
 <20230328111422.23986-3-tzimmermann@suse.de>
Date: Tue, 28 Mar 2023 18:20:27 +0300
Message-ID: <875yak6gxw.fsf@intel.com>
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
> Initialize i915's fbdev client by giving an instance of struct
> drm_client_funcsi to drm_client_init(). Also clean up with
> drm_client_release().
>
> Doing this in i915 prevents fbdev helpers from initializing and
> releasing the client internally (see drm_fb_helper_init()). No
> functional change yet; the client callbacks will be filled later.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 43 ++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 88de79279ce5..290da5e94bc5 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -364,6 +364,7 @@ static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
>  	if (ifbdev->fb)
>  		drm_framebuffer_remove(&ifbdev->fb->base);
>  
> +	drm_client_release(&ifbdev->helper.client);
>  	drm_fb_helper_unprepare(&ifbdev->helper);
>  	kfree(ifbdev);
>  }
> @@ -656,6 +657,30 @@ void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
>  		intel_fbdev_invalidate(ifbdev);
>  }
>  
> +/*
> + * Fbdev client and struct drm_client_funcs
> + */
> +
> +static void intel_fbdev_client_unregister(struct drm_client_dev *client)
> +{ }
> +
> +static int intel_fbdev_client_restore(struct drm_client_dev *client)
> +{
> +	return 0;
> +}
> +
> +static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
> +{
> +	return 0;
> +}
> +
> +static const struct drm_client_funcs intel_fbdev_client_funcs = {
> +	.owner		= THIS_MODULE,
> +	.unregister	= intel_fbdev_client_unregister,
> +	.restore	= intel_fbdev_client_restore,
> +	.hotplug	= intel_fbdev_client_hotplug,
> +};
> +
>  int intel_fbdev_init(struct drm_device *dev)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> @@ -677,16 +702,26 @@ int intel_fbdev_init(struct drm_device *dev)
>  	else
>  		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
>  
> +	ret = drm_client_init(dev, &ifbdev->helper.client, "i915-fbdev",
> +			      &intel_fbdev_client_funcs);
> +	if (ret)
> +		goto err_drm_fb_helper_unprepare;
> +
>  	ret = drm_fb_helper_init(dev, &ifbdev->helper);
> -	if (ret) {
> -		kfree(ifbdev);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_drm_client_release;
>  
>  	dev_priv->display.fbdev.fbdev = ifbdev;
>  	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
>  
>  	return 0;
> +
> +err_drm_client_release:
> +	drm_client_release(&ifbdev->helper.client);
> +err_drm_fb_helper_unprepare:
> +	drm_client_release(&ifbdev->helper.client);

I suppose this should be

drm_fb_helper_unprepare(&ifbdev->helper);

instead of the double drm_client_release(). And we're missing this
cleanup already.

BR,
Jani.


> +	kfree(ifbdev);
> +	return ret;
>  }
>  
>  static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)

-- 
Jani Nikula, Intel Open Source Graphics Center
