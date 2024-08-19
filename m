Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4367B95660D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CEE10E216;
	Mon, 19 Aug 2024 08:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ZPVaB43m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF8510E216
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:52:53 +0000 (UTC)
Message-ID: <86a55d3c-930d-4b30-9f05-82dd2966df85@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1724057571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8cqVxm0O/kIa74pYimJWPMZdvULp9y/6vbk3iD9gek=;
 b=ZPVaB43mQJJ/5PRSWOTR4YnXbL01tmuqXlM9fgC6Kj6nZpIFy+De2qRfCuHR1/wYRxzxNb
 dkFTHUVEt7O5A00cld+p6mz5MOHWznzIUvepKNQZnuksbpqSN2aiV4oYNNrAIcLzl2eJcy
 wv/aVi5x+HZnypCdcb2d/alZ5huYfaE=
Date: Mon, 19 Aug 2024 16:52:39 +0800
MIME-Version: 1.0
Subject: Re: [82/86] drm/i915: Move custom hotplug code into separate callback
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240816125408.310253-83-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240816125408.310253-83-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thomas


I love your patch, yet ...


On 2024/8/16 20:23, Thomas Zimmermann wrote:
> i915's fbdev contains additional code for hotplugging a display that
> cannot be ported to the common fbdev client. Introduce the callback
> struct drm_fb_helper.fb_hotplug and implement it for i915. The fbdev
> helpers invoke the callback before handing the hotplug event.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_fb_helper.c            |  6 +++
>   drivers/gpu/drm/i915/display/intel_fbdev.c | 43 ++++++++++++----------
>   include/drm/drm_fb_helper.h                | 13 +++++++
>   3 files changed, 42 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index d9e539b0fd1a..92926cb02dfb 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1938,6 +1938,12 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>   	if (!drm_fbdev_emulation || !fb_helper)
>   		return 0;
>   
> +	if (fb_helper->funcs->fb_hotplug) {

We seems need to check the existence on the 'fb_helper->funcs' here,

For example:


if (fb_helper->funcs && fb_helper->funcs->fb_hotplug) {

Otherwise, it will de-reference NULL pointer.
Can be observed on a trivial driver though,
with no monitor(display) connected.


> +		err = fb_helper->funcs->fb_hotplug(fb_helper);
> +		if (err)
> +			return err;
> +	}
> +
>   	mutex_lock(&fb_helper->lock);
>   	if (fb_helper->deferred_setup) {
>   		err = __drm_fb_helper_initial_config_and_unlock(fb_helper);
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index c03fb00002a4..abe77ef0bd84 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -305,10 +305,32 @@ static void intelfb_restore(struct drm_fb_helper *fb_helper)
>   	intel_fbdev_invalidate(ifbdev);
>   }
>   
> +static int intelfb_hotplug(struct drm_fb_helper *fb_helper)
> +{
> +	struct drm_device *dev = fb_helper->client.dev;
> +	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
> +	bool send_hpd;
> +
> +	if (!ifbdev)
> +		return -EINVAL;
> +
> +	mutex_lock(&ifbdev->hpd_lock);
> +	send_hpd = !ifbdev->hpd_suspended;
> +	ifbdev->hpd_waiting = true;
> +	mutex_unlock(&ifbdev->hpd_lock);
> +
> +	if (!send_hpd || !(ifbdev->vma || dev->fb_helper->deferred_setup))
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
>   static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
>   	.fb_probe = intelfb_create,
>   	.fb_dirty = intelfb_dirty,
>   	.fb_restore = intelfb_restore,
> +	.fb_hotplug = intelfb_hotplug,
>   };
>   
>   /*
> @@ -557,25 +579,6 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
>   	intel_fbdev_hpd_set_suspend(dev_priv, state);
>   }
>   
> -static int intel_fbdev_output_poll_changed(struct drm_device *dev)
> -{
> -	struct intel_fbdev *ifbdev = to_i915(dev)->display.fbdev.fbdev;
> -	bool send_hpd;
> -
> -	if (!ifbdev)
> -		return -EINVAL;
> -
> -	mutex_lock(&ifbdev->hpd_lock);
> -	send_hpd = !ifbdev->hpd_suspended;
> -	ifbdev->hpd_waiting = true;
> -	mutex_unlock(&ifbdev->hpd_lock);
> -
> -	if (send_hpd && (ifbdev->vma || dev->fb_helper->deferred_setup))
> -		drm_fb_helper_hotplug_event(dev->fb_helper);
> -
> -	return 0;
> -}
> -
>   static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
>   {
>   	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
> @@ -637,7 +640,7 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
>   	int ret;
>   
>   	if (dev->fb_helper)
> -		return intel_fbdev_output_poll_changed(dev);
> +		return drm_fb_helper_hotplug_event(fb_helper);
>   
>   	ret = drm_fb_helper_init(dev, fb_helper);
>   	if (ret)
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 34eb77c18a13..3dcb9a60e408 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -112,6 +112,19 @@ struct drm_fb_helper_funcs {
>   	 * TODO: Fix i915 to not require this callback.
>   	 */
>   	void (*fb_restore)(struct drm_fb_helper *helper);
> +
> +	/**
> +	 * @fb_hotplug:
> +	 *
> +	 * Driver callback to prepare hotplug event. If set, fbdev
> +	 * emulation will invoke this callback before sending a hotplug
> +	 * event.
> +	 *
> +	 * Only for i915. Do not use in new code.
> +	 *
> +	 * TODO: Fix i915 to not require this callback.
> +	 */
> +	int (*fb_hotplug)(struct drm_fb_helper *helper);
>   };
>   
>   /**

-- 
Best regards,
Sui

