Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36719446674
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 16:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F6C6EB1B;
	Fri,  5 Nov 2021 15:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 785A26EB1B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 15:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 757B3202067;
 Fri,  5 Nov 2021 16:50:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id hRYPuPcCTkt8; Fri,  5 Nov 2021 16:50:14 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 30F60202060;
 Fri,  5 Nov 2021 16:50:14 +0100 (CET)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1mj1Tp-000ClJ-Fs;
 Fri, 05 Nov 2021 16:50:13 +0100
Message-ID: <bbb313b2-6eab-33d2-b355-bdcba59231c9@daenzer.net>
Date: Fri, 5 Nov 2021 16:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-CA
To: Jocelyn Falempe <jfalempe@redhat.com>
References: <20211104163245.11070-1-jfalempe@redhat.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/fb-helper: Fix restore_fbdev when there are pending
 delayed hotplug
In-Reply-To: <20211104163245.11070-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
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

On 2021-11-04 17:32, Jocelyn Falempe wrote:
> When using Xorg/Logind and an external monitor connected with an MST dock.
> After disconnecting the external monitor, switching to VT may not work,
> the (internal) monitor sill display Xorg, and you can't see what you are
> typing in the VT.
> 
> This is related to commit e2809c7db818df6bbd0edf843e1beb2fbc9d8541 which
> introduced delayed hotplug for MST, and commit
> dc5bdb68b5b369d5bc7d1de96fa64cc1737a6320 which introduced a workaround for
> Xorg and logind, and add a force parameter to
> __drm_fb_helper_restore_fbdev_mode_unlocked() in this case.
> 
> When switching to VT, with Xorg and logind, if there
> are pending hotplug event (like MST unplugged), the hotplug path
> may not be fulfilled, because logind may drop the master a bit later.
> It leads to the console not showing up on the monitor.
> 
> So in this case, forward the "force" parameter to the hotplug event,
> and ignore if there is a drm master in this case.

I'm worried that this leaves a race condition which allows the still-master (which causes drm_fb_helper_hotplug_event to bail without this patch) to modify the state set by __drm_fb_helper_hotplug_event, which could still result in similar symptoms.

I wonder if something like calling drm_fb_helper_hotplug_event when master is dropped and fb_helper->delayed_hotplug == true could work instead.


> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 8e7a124d6c5a..c07080f661b1 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -82,6 +82,8 @@ MODULE_PARM_DESC(drm_leak_fbdev_smem,
>  static LIST_HEAD(kernel_fb_helper_list);
>  static DEFINE_MUTEX(kernel_fb_helper_lock);
>  
> +static int __drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper, bool force);
> +
>  /**
>   * DOC: fbdev helpers
>   *
> @@ -258,7 +260,7 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
>  	mutex_unlock(&fb_helper->lock);
>  
>  	if (do_delayed)
> -		drm_fb_helper_hotplug_event(fb_helper);
> +		__drm_fb_helper_hotplug_event(fb_helper, force);
>  
>  	return ret;
>  }
> @@ -1930,6 +1932,38 @@ int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper, int bpp_sel)
>  }
>  EXPORT_SYMBOL(drm_fb_helper_initial_config);
>  
> +static int __drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper, bool force)
> +{
> +	int err = 0;
> +
> +	if (!drm_fbdev_emulation || !fb_helper)
> +		return 0;
> +
> +	mutex_lock(&fb_helper->lock);
> +	if (fb_helper->deferred_setup) {
> +		err = __drm_fb_helper_initial_config_and_unlock(fb_helper,
> +				fb_helper->preferred_bpp);
> +		return err;
> +	}
> +	if (!force) {
> +		if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
> +			fb_helper->delayed_hotplug = true;
> +			mutex_unlock(&fb_helper->lock);
> +			return err;
> +		}
> +		drm_master_internal_release(fb_helper->dev);
> +	}
> +	drm_dbg_kms(fb_helper->dev, "\n");
> +
> +	drm_client_modeset_probe(&fb_helper->client, fb_helper->fb->width, fb_helper->fb->height);
> +	drm_setup_crtcs_fb(fb_helper);
> +	mutex_unlock(&fb_helper->lock);
> +
> +	drm_fb_helper_set_par(fb_helper->fbdev);
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_fb_helper_hotplug_event - respond to a hotplug notification by
>   *                               probing all the outputs attached to the fb
> @@ -1953,35 +1987,7 @@ EXPORT_SYMBOL(drm_fb_helper_initial_config);
>   */
>  int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>  {
> -	int err = 0;
> -
> -	if (!drm_fbdev_emulation || !fb_helper)
> -		return 0;
> -
> -	mutex_lock(&fb_helper->lock);
> -	if (fb_helper->deferred_setup) {
> -		err = __drm_fb_helper_initial_config_and_unlock(fb_helper,
> -				fb_helper->preferred_bpp);
> -		return err;
> -	}
> -
> -	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
> -		fb_helper->delayed_hotplug = true;
> -		mutex_unlock(&fb_helper->lock);
> -		return err;
> -	}
> -
> -	drm_master_internal_release(fb_helper->dev);
> -
> -	drm_dbg_kms(fb_helper->dev, "\n");
> -
> -	drm_client_modeset_probe(&fb_helper->client, fb_helper->fb->width, fb_helper->fb->height);
> -	drm_setup_crtcs_fb(fb_helper);
> -	mutex_unlock(&fb_helper->lock);
> -
> -	drm_fb_helper_set_par(fb_helper->fbdev);
> -
> -	return 0;
> +	return __drm_fb_helper_hotplug_event(fb_helper, false);
>  }
>  EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
>  
> 


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
