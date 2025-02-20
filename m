Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00514A3DD8C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BBC10E0D6;
	Thu, 20 Feb 2025 15:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jhwuq73G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC41A10E0D6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:00:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E5FD614CF;
 Thu, 20 Feb 2025 15:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE99CC4CEDD;
 Thu, 20 Feb 2025 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740063620;
 bh=4bckTq02vaYkp80bkNFN6Mdl+bCKGs+xiMduy7+da4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jhwuq73GiLIkP8rLFDZ5sCdKaip/pnIr9jbsMzBNwAs+ue9U8dPoCj2Q5KHnqqEA+
 BNrRsPfS5NuNTMIuhQ82f9lgYHb1B/fJ2HCE99s5nkqFkHch3VnlINwJGlusQ4W93O
 sKLKUUB1XZzYTpD7tf5CQUK8Q1+JPlQNhinQFi1sF8trYC/7QkO8gaW4sVsANDz/KX
 rQYFuw55EW9GIZxmjxzvdBh8VYX5DtfoLQ+8BaWgO5uKFKF/9aK1fitTO0Uh5t2IJd
 qIUE5J87X/5KIXUUzE4/KzugfK8YRYmvzZYEbsJBR+E6ozfJJQ5luh9gDAdRLFgGlG
 yQ0ZkagfPiy7w==
Date: Thu, 20 Feb 2025 15:00:16 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 12/13] leds: backlight trigger: Replace fb events with a
 dedicated function call
Message-ID: <20250220150016.GC778229@google.com>
References: <20250206154033.697495-1-tzimmermann@suse.de>
 <20250206154033.697495-13-tzimmermann@suse.de>
 <20250211135752.GT1868108@google.com>
 <f4652dbd-7544-4a6d-98d0-f4b64d60a435@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4652dbd-7544-4a6d-98d0-f4b64d60a435@suse.de>
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

On Thu, 13 Feb 2025, Thomas Zimmermann wrote:

> Hi
> 
> Am 11.02.25 um 14:57 schrieb Lee Jones:
> > On Thu, 06 Feb 2025, Thomas Zimmermann wrote:
> > 
> > > Remove support for fb events from the led backlight trigger. Provide the
> > > helper ledtrig_backlight_blank() instead. Call it from fbdev to inform
> > > the trigger of changes to a display's blank state.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/leds/trigger/ledtrig-backlight.c | 31 +++++-------------------
> > >   drivers/video/fbdev/core/fbmem.c         | 21 +++++++++-------
> > >   include/linux/leds.h                     |  6 +++++
> > >   3 files changed, 24 insertions(+), 34 deletions(-)
> > > 
> > > diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
> > > index f9317f93483b..e3ae4adc29e3 100644
> > > --- a/drivers/leds/trigger/ledtrig-backlight.c
> > > +++ b/drivers/leds/trigger/ledtrig-backlight.c
> > > @@ -10,7 +10,6 @@
> > >   #include <linux/kernel.h>
> > >   #include <linux/slab.h>
> > >   #include <linux/init.h>
> > > -#include <linux/fb.h>
> > >   #include <linux/leds.h>
> > >   #include "../leds.h"
> > > @@ -21,7 +20,6 @@ struct bl_trig_notifier {
> > >   	struct led_classdev *led;
> > >   	int brightness;
> > >   	int old_status;
> > > -	struct notifier_block notifier;
> > >   	unsigned invert;
> > >   	struct list_head entry;
> > > @@ -30,7 +28,7 @@ struct bl_trig_notifier {
> > >   static struct list_head ledtrig_backlight_list;
> > >   static struct mutex ledtrig_backlight_list_mutex;
> > > -static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
> > > +static void __ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
> > I'm confused.  Didn't you just introduce this?
> 
> It's being renamed here; probably something to avoid.
> 
> 
> > 
> > >   {
> > >   	struct led_classdev *led = n->led;
> > >   	int new_status = !on ? BLANK : UNBLANK;
> > > @@ -48,23 +46,14 @@ static void ledtrig_backlight_blank(struct bl_trig_notifier *n, bool on)
> > >   	n->old_status = new_status;
> > >   }
> > > -static int fb_notifier_callback(struct notifier_block *p,
> > > -				unsigned long event, void *data)
> > > +void ledtrig_backlight_blank(bool on)
> > >   {
> > > -	struct bl_trig_notifier *n = container_of(p,
> > > -					struct bl_trig_notifier, notifier);
> > > -	struct fb_event *fb_event = data;
> > > -	int *blank;
> > > -
> > > -	/* If we aren't interested in this event, skip it immediately ... */
> > > -	if (event != FB_EVENT_BLANK)
> > > -		return 0;
> > > -
> > > -	blank = fb_event->data;
> > > +	struct bl_trig_notifier *n;
> > > -	ledtrig_backlight_blank(n, !blank[0]);
> > > +	guard(mutex)(&ledtrig_backlight_list_mutex);
> > > -	return 0;
> > > +	list_for_each_entry(n, &ledtrig_backlight_list, entry)
> > > +		__ledtrig_backlight_blank(n, on);
> > >   }
> > >   static ssize_t bl_trig_invert_show(struct device *dev,
> > > @@ -110,8 +99,6 @@ ATTRIBUTE_GROUPS(bl_trig);
> > >   static int bl_trig_activate(struct led_classdev *led)
> > >   {
> > > -	int ret;
> > > -
> > >   	struct bl_trig_notifier *n;
> > >   	n = kzalloc(sizeof(struct bl_trig_notifier), GFP_KERNEL);
> > > @@ -122,11 +109,6 @@ static int bl_trig_activate(struct led_classdev *led)
> > >   	n->led = led;
> > >   	n->brightness = led->brightness;
> > >   	n->old_status = UNBLANK;
> > > -	n->notifier.notifier_call = fb_notifier_callback;
> > > -
> > > -	ret = fb_register_client(&n->notifier);
> > > -	if (ret)
> > > -		dev_err(led->dev, "unable to register backlight trigger\n");
> > >   	mutex_lock(&ledtrig_backlight_list_mutex);
> > >   	list_add(&n->entry, &ledtrig_backlight_list);
> > > @@ -143,7 +125,6 @@ static void bl_trig_deactivate(struct led_classdev *led)
> > >   	list_del(&n->entry);
> > >   	mutex_unlock(&ledtrig_backlight_list_mutex);
> > > -	fb_unregister_client(&n->notifier);
> > >   	kfree(n);
> > >   }
> > > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > > index fb7ca143a996..92c3fe2a7aff 100644
> > > --- a/drivers/video/fbdev/core/fbmem.c
> > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > @@ -16,6 +16,7 @@
> > >   #include <linux/fb.h>
> > >   #include <linux/fbcon.h>
> > >   #include <linux/lcd.h>
> > > +#include <linux/leds.h>
> > >   #include <video/nomodeset.h>
> > > @@ -373,11 +374,19 @@ static void fb_lcd_notify_blank(struct fb_info *info)
> > >   #endif
> > >   }
> > > +static void fb_ledtrig_backlight_notify_blank(struct fb_info *info)
> > > +{
> > > +#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_BACKLIGHT)
> > #iferry is generally discouraged in C files.
> > 
> > Does is_defined() work for you?
> 
> I don't think so. This ifdef covers the case that fbdev is built in, but led
> is a module (i.e., fbdev=y && led=m).
> 
> > /
> > > +	if (info->blank == FB_BLANK_UNBLANK)
> > > +		ledtrig_backlight_blank(true);
> > If !CONFIG_LEDS_TRIGGER_BACKLIGHT(), then ledtrig_backlight_blank() is a
> > noop anyway, right?  So why encompass it in the #if at all?
> 
> Because of (fbdev=y && led=m) again. ledtrig_backlight_blank() would be
> defined then, but not linkable from fbdev. Preferably, I'd rather leave out
> the ifdef in the led header file.

#ifdefs are not generally welcome in C-files.  Please rework it.

-- 
Lee Jones [李琼斯]
