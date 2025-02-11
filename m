Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C5DA30D75
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 14:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A2110E1BA;
	Tue, 11 Feb 2025 13:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uCe2nhBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C2910E1BA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 13:57:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3BABEA4045D;
 Tue, 11 Feb 2025 13:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87794C4CEE5;
 Tue, 11 Feb 2025 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739282277;
 bh=HZ09yS0PIUlRsPml50FYmrdXyBewi0V5GzgjWRwc0Bw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uCe2nhBx42RfMkyM6nuhDpR8TKBO5W1B0keIG1XnsvjmG4rgREhN/y2ULPTj2w5Pa
 vJV+UDOyxXWyDbgqmVreZpT5I9ZRVSUmq2DDQ6+r1yvwFeK1kx0wwC04jgk7BjKaac
 xx7qpRIU9j1eqm0Vlv3WAz27dYaGwxxQ84sllV0ZwtFBedAV45meH7LhJBpvtCx96e
 FagrYJMSOCVDt7u2gKOqwroo2FI//3zsCG+j3K+3ioeXE+9M0wBqrubr4EetWoQOYj
 sz7+6Auoyl0TohRZvxLHPMA6oz3MKkgTK5CrIu0heZXuVGRVxpwGHO54s0oruMEpQo
 o2YbXc5TrfRWQ==
Date: Tue, 11 Feb 2025 13:57:52 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 12/13] leds: backlight trigger: Replace fb events with a
 dedicated function call
Message-ID: <20250211135752.GT1868108@google.com>
References: <20250206154033.697495-1-tzimmermann@suse.de>
 <20250206154033.697495-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206154033.697495-13-tzimmermann@suse.de>
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

On Thu, 06 Feb 2025, Thomas Zimmermann wrote:

> Remove support for fb events from the led backlight trigger. Provide the
> helper ledtrig_backlight_blank() instead. Call it from fbdev to inform
> the trigger of changes to a display's blank state.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/leds/trigger/ledtrig-backlight.c | 31 +++++-------------------
>  drivers/video/fbdev/core/fbmem.c         | 21 +++++++++-------
>  include/linux/leds.h                     |  6 +++++
>  3 files changed, 24 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
> index f9317f93483b..e3ae4adc29e3 100644
> --- a/drivers/leds/trigger/ledtrig-backlight.c
> +++ b/drivers/leds/trigger/ledtrig-backlight.c
> @@ -10,7 +10,6 @@
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/init.h>
> -#include <linux/fb.h>
>  #include <linux/leds.h>
>  #include "../leds.h"
>  
> @@ -21,7 +20,6 @@ struct bl_trig_notifier {
>  	struct led_classdev *led;
>  	int brightness;
>  	int old_status;
> -	struct notifier_block notifier;
>  	unsigned invert;
>  
>  	struct list_head entry;
> @@ -30,7 +28,7 @@ struct bl_trig_notifier {
>  static struct list_head ledtrig_backlight_list;
>  static struct mutex ledtrig_backlight_list_mutex;
>  
> -static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
> +static void __ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)

I'm confused.  Didn't you just introduce this?

>  {
>  	struct led_classdev *led = n->led;
>  	int new_status = !on ? BLANK : UNBLANK;
> @@ -48,23 +46,14 @@ static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
>  	n->old_status = new_status;
>  }
>  
> -static int fb_notifier_callback(struct notifier_block *p,
> -				unsigned long event, void *data)
> +void ledtrig_backlight_blank(bool on)
>  {
> -	struct bl_trig_notifier *n = container_of(p,
> -					struct bl_trig_notifier, notifier);
> -	struct fb_event *fb_event = data;
> -	int *blank;
> -
> -	/* If we aren't interested in this event, skip it immediately ... */
> -	if (event != FB_EVENT_BLANK)
> -		return 0;
> -
> -	blank = fb_event->data;
> +	struct bl_trig_notifier *n;
>  
> -	ledtrig_backlight_blank(n, !blank[0]);
> +	guard(mutex)(&ledtrig_backlight_list_mutex);
>  
> -	return 0;
> +	list_for_each_entry(n, &ledtrig_backlight_list, entry)
> +		__ledtrig_backlight_blank(n, on);
>  }
>  
>  static ssize_t bl_trig_invert_show(struct device *dev,
> @@ -110,8 +99,6 @@ ATTRIBUTE_GROUPS(bl_trig);
>  
>  static int bl_trig_activate(struct led_classdev *led)
>  {
> -	int ret;
> -
>  	struct bl_trig_notifier *n;
>  
>  	n = kzalloc(sizeof(struct bl_trig_notifier), GFP_KERNEL);
> @@ -122,11 +109,6 @@ static int bl_trig_activate(struct led_classdev *led)
>  	n->led = led;
>  	n->brightness = led->brightness;
>  	n->old_status = UNBLANK;
> -	n->notifier.notifier_call = fb_notifier_callback;
> -
> -	ret = fb_register_client(&n->notifier);
> -	if (ret)
> -		dev_err(led->dev, "unable to register backlight trigger\n");
>  
>  	mutex_lock(&ledtrig_backlight_list_mutex);
>  	list_add(&n->entry, &ledtrig_backlight_list);
> @@ -143,7 +125,6 @@ static void bl_trig_deactivate(struct led_classdev *led)
>  	list_del(&n->entry);
>  	mutex_unlock(&ledtrig_backlight_list_mutex);
>  
> -	fb_unregister_client(&n->notifier);
>  	kfree(n);
>  }
>  
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index fb7ca143a996..92c3fe2a7aff 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -16,6 +16,7 @@
>  #include <linux/fb.h>
>  #include <linux/fbcon.h>
>  #include <linux/lcd.h>
> +#include <linux/leds.h>
>  
>  #include <video/nomodeset.h>
>  
> @@ -373,11 +374,19 @@ static void fb_lcd_notify_blank(struct fb_info *info)
>  #endif
>  }
>  
> +static void fb_ledtrig_backlight_notify_blank(struct fb_info *info)
> +{
> +#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_BACKLIGHT)

#iferry is generally discouraged in C files.

Does is_defined() work for you?
/
> +	if (info->blank == FB_BLANK_UNBLANK)
> +		ledtrig_backlight_blank(true);

If !CONFIG_LEDS_TRIGGER_BACKLIGHT(), then ledtrig_backlight_blank() is a
noop anyway, right?  So why encompass it in the #if at all?

> +	else
> +		ledtrig_backlight_blank(false);
> +#endif
> +}
> +
>  int fb_blank(struct fb_info *info, int blank)
>  {
>  	int old_blank = info->blank;
> -	struct fb_event event;
> -	int data[2];
>  	int ret;
>  
>  	if (!info->fbops->fb_blank)
> @@ -386,11 +395,6 @@ int fb_blank(struct fb_info *info, int blank)
>  	if (blank > FB_BLANK_POWERDOWN)
>  		blank = FB_BLANK_POWERDOWN;
>  
> -	data[0] = blank;
> -	data[1] = old_blank;
> -	event.info = info;
> -	event.data = data;
> -
>  	info->blank = blank;
>  
>  	ret = info->fbops->fb_blank(blank, info);
> @@ -399,8 +403,7 @@ int fb_blank(struct fb_info *info, int blank)
>  
>  	fb_bl_notify_blank(info, old_blank);
>  	fb_lcd_notify_blank(info);
> -
> -	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
> +	fb_ledtrig_backlight_notify_blank(info);
>  
>  	return 0;
>  
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 98f9719c924c..8c7c41888f7d 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -640,6 +640,12 @@ static inline void ledtrig_flash_ctrl(bool on) {}
>  static inline void ledtrig_torch_ctrl(bool on) {}
>  #endif
>  
> +#if IS_ENABLED(CONFIG_LEDS_TRIGGER_BACKLIGHT)
> +void ledtrig_backlight_blank(bool on);
> +#else
> +static inline void ledtrig_backlight_blank(bool on) {}
> +#endif
> +
>  /*
>   * Generic LED platform data for describing LED names and default triggers.
>   */
> -- 
> 2.48.1
> 

-- 
/fb_ledtrig_backlight_notify_blankLee Jones [李琼斯]
