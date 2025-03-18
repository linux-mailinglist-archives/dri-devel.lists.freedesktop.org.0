Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C0A66F98
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 10:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECDA10E209;
	Tue, 18 Mar 2025 09:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DZeo/pra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F78C10E209
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 09:23:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B48B3A48EEE;
 Tue, 18 Mar 2025 09:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3004CC4CEDD;
 Tue, 18 Mar 2025 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742289825;
 bh=THt3n65begFC7mRXcpqMKfETD/zI0kv3aBId5rq7qak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DZeo/prakOw98jlFIa2Pxf/0bOf1zrAYLKo1eg0mtl9XMHyiJ1Qc8TeY+xaFBSTX9
 5jSqxto0NqweY9eyBIA1olF+mxoWRvUmfA2S/v7b3F8C/cwa05PoCYB67BLpZfca/5
 cHvCDsnWQsJ47QV0H4f8JjZTa7pF3z0dGdrnhaaq2bYJtkquTJKR+S/UEkWhgEbVc2
 PmiSufz54Kk4n1ystYPs41iVWD1xlWLuBZ5TmGIQgCJByrsdxPhb1+uwRO+fZrww/5
 jZB1579CEQ4SQaMR0QrCTZaQox4fUM7+RMq+mLyZuNUADxOhDrnFC9oASucyN1xWrR
 6WHGy9x7+QYdw==
Date: Tue, 18 Mar 2025 09:23:40 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <Z9k7nAXNGDaQMnMO@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-7-tzimmermann@suse.de>
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

On Thu, Mar 06, 2025 at 03:05:48PM +0100, Thomas Zimmermann wrote:
> Remove support for fb events from backlight subsystem. Provide the
> helper backlight_notify_blank_all() instead. Also export the existing
> helper backlight_notify_blank() to update a single backlight device.
>
> In fbdev, call either helper to inform the backlight subsystem of
> changes to a display's blank state. If the framebuffer device has a
> specific backlight, only update this one; otherwise update all.
>
> v3:
> - declare empty fb_bl_notify_blank() as static inline (kernel test robot)

Looks like there are still configs where we get build failure.


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Other than the build issues, generally this looks great. Just a couple
of small issues below.


> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 1c43f579396f..9dc93c5e480b 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -78,11 +77,8 @@ static const char *const backlight_scale_types[] = {
>  	[BACKLIGHT_SCALE_NON_LINEAR]	= "non-linear",
>  };
>
> -#if defined(CONFIG_FB_CORE) || (defined(CONFIG_FB_CORE_MODULE) && \
> -				defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
> -static void backlight_notify_blank(struct backlight_device *bd,
> -				   struct device *display_dev,
> -				   bool fb_on, bool prev_fb_on)
> +void backlight_notify_blank(struct backlight_device *bd, struct device *display_dev,
> +			    bool fb_on, bool prev_fb_on)
>  {
>  	guard(mutex)(&bd->ops_lock);
>
> @@ -103,68 +99,18 @@ static void backlight_notify_blank(struct backlight_device *bd,
>  		}
>  	}
>  }
> +EXPORT_SYMBOL(backlight_notify_blank);

Should this be EXPORT_SYMBOL_GPL()?


>
> -/*
> - * fb_notifier_callback
> - *
> - * This callback gets called when something important happens inside a
> - * framebuffer driver. The backlight core only cares about FB_BLANK_UNBLANK
> - * which is reported to the driver using backlight_update_status()
> - * as a state change.
> - *
> - * There may be several fbdev's connected to the backlight device,
> - * in which case they are kept track of. A state change is only reported
> - * if there is a change in backlight for the specified fbdev.
> - */
> -static int fb_notifier_callback(struct notifier_block *self,
> -				unsigned long event, void *data)
> +void backlight_notify_blank_all(struct device *display_dev, bool fb_on, bool prev_fb_on)
>  {
>  	struct backlight_device *bd;
> -	struct fb_event *evdata = data;
> -	struct fb_info *info = evdata->info;
> -	const int *fb_blank = evdata->data;
> -	struct backlight_device *fb_bd = fb_bl_device(info);
> -	bool fb_on, prev_fb_on;
> -
> -	/* If we aren't interested in this event, skip it immediately ... */
> -	if (event != FB_EVENT_BLANK)
> -		return 0;
> -
> -	bd = container_of(self, struct backlight_device, fb_notif);
> -
> -	if (fb_bd && fb_bd != bd)
> -		return 0;
> -
> -	fb_on = fb_blank[0] == FB_BLANK_UNBLANK;
> -	prev_fb_on = fb_blank[1] == FB_BLANK_UNBLANK;
> -
> -	backlight_notify_blank(bd, info->device, fb_on, prev_fb_on);
> -
> -	return 0;
> -}
> -
> -static int backlight_register_fb(struct backlight_device *bd)
> -{
> -	memset(&bd->fb_notif, 0, sizeof(bd->fb_notif));
> -	bd->fb_notif.notifier_call = fb_notifier_callback;
>
> -	return fb_register_client(&bd->fb_notif);
> -}
> +	guard(mutex)(&backlight_dev_list_mutex);
>
> -static void backlight_unregister_fb(struct backlight_device *bd)
> -{
> -	fb_unregister_client(&bd->fb_notif);
> -}
> -#else
> -static inline int backlight_register_fb(struct backlight_device *bd)
> -{
> -	return 0;
> +	list_for_each_entry(bd, &backlight_dev_list, entry)
> +		backlight_notify_blank(bd, display_dev, fb_on, prev_fb_on);
>  }
> -
> -static inline void backlight_unregister_fb(struct backlight_device *bd)
> -{
> -}
> -#endif /* CONFIG_FB_CORE */
> +EXPORT_SYMBOL(backlight_notify_blank_all);

Same here.


Daniel.
