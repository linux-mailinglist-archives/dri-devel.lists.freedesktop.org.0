Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E462B652
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EBA10E450;
	Wed, 16 Nov 2022 09:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF9B10E455
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:21:11 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x2so25665608edd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 01:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=59ZEQLzns9bFN6k0X3dzkU/GY50n/Ains7/g4SNusjg=;
 b=DPvyNMc1mjWwrAcesTCxO6mPNOC33vU3UFlk0yfD5nuBMsro65esQfnWxB3aCZfqge
 TLWxdzJqvgPt/agMTse/xsckU3nxhmYOCVVRnGJ1xYho0EdOu0Od6FK+8tzMoD2Q9jrz
 kCSGqycj57YZEA1YIpCuFaY3C36dRuCHoUnHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=59ZEQLzns9bFN6k0X3dzkU/GY50n/Ains7/g4SNusjg=;
 b=SHVDiSWHn3jVzi3nhWJFCWrIhY8F7uLwD2G8ppyLtRi6ukAhOOUhvHBRXwpUYcCdqV
 QiI/am9rO/p3Uu77Vn81Mdq4TehgH0ueIcR83rje/i2az9gg/D37KzyS+PGaTP9gyovQ
 CuFld2+4o82F0vOQIypRHXakJ7vmrSGJUMNbpnCEQUgY4pvG8k6VUTXJkBaWZRoRCew0
 uaLP4XMedIvVdW5l77hn0nwYQLCFTKxma969I5AwbMSrMNBdHUDA2T/XDCdoC0A/QNI8
 4SDdy/K0sTM8jC3CmkBd+dFjIUrmESimVEbKOFobWsTU04PgB9f5vC/f1qXl4qzKrK4r
 7CLA==
X-Gm-Message-State: ANoB5pmBafgtpaosSzVPPYhKjehzuMCrTjwTTRw0QLTOkhDPBUcDfifh
 HZ2DS7yHQHqRFqJjFa2cB3ERNA==
X-Google-Smtp-Source: AA0mqf7k0TdeCFNtT6r6J/IA4wX+A5ATan/M98KG8IY3XqliuGgXx1uxLfS/NLRSxQSuDiqM4iBg9Q==
X-Received: by 2002:a05:6402:1c85:b0:458:c339:4229 with SMTP id
 cy5-20020a0564021c8500b00458c3394229mr18156900edb.393.1668590469900; 
 Wed, 16 Nov 2022 01:21:09 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 vu6-20020a170907a64600b007ae10525550sm6514520ejc.47.2022.11.16.01.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 01:21:09 -0800 (PST)
Date: Wed, 16 Nov 2022 10:21:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Message-ID: <Y3Srg5LwAgeamNNb@phenom.ffwll.local>
References: <20221110135519.30029-1-tzimmermann@suse.de>
 <20221110135519.30029-5-tzimmermann@suse.de>
 <Y24VzDRKrZBo5D31@phenom.ffwll.local>
 <30af7238-2f89-74cf-1534-9938e0f6c75e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30af7238-2f89-74cf-1534-9938e0f6c75e@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 11:05:02AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.11.22 um 10:28 schrieb Daniel Vetter:
> > On Thu, Nov 10, 2022 at 02:55:18PM +0100, Thomas Zimmermann wrote:
> > > Schedule the deferred-I/O worker instead of the damage worker after
> > > writing to the fbdev framebuffer. The deferred-I/O worker then performs
> > > the dirty-fb update. The fbdev emulation will initialize deferred I/O
> > > for all drivers that require damage updates. It is therefore a valid
> > > assumption that the deferred-I/O worker is present.
> > > 
> > > It would be possible to perform the damage handling directly from within
> > > the write operation. But doing this could increase the overhead of the
> > > write or interfere with a concurrently scheduled deferred-I/O worker.
> > > Instead, scheduling the deferred-I/O worker with its regular delay of
> > > 50 ms removes load off the write operation and allows the deferred-I/O
> > > worker to handle multiple write operations that arrived during the delay
> > > time window.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/drm_fb_helper.c     | 81 ++++++++++++++++++++---------
> > >   drivers/video/fbdev/core/fb_defio.c | 16 ++++++
> > >   include/linux/fb.h                  |  1 +
> > >   3 files changed, 72 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > index ebc44ed1bf4a2..8cb644e4ecf90 100644
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -596,14 +596,6 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
> > >   	spin_unlock_irqrestore(&helper->damage_lock, flags);
> > >   }
> > > -static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
> > > -				 u32 width, u32 height)
> > > -{
> > > -	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
> > > -
> > > -	schedule_work(&helper->damage_work);
> > 
> > I'm kinda not seeing the point in removing this, and ending up with 2
> > functions calls for every callsite. Replace the schedule_work with the
> > inlined drm_fb_helper_flush instead? That also avoids the naming bikeshed
> > in this case at least :-)
> > 
> > 
> > > -}
> > > -
> > >   /*
> > >    * Convert memory region into area of scanlines and pixels per
> > >    * scanline. The parameters off and len must not reach beyond
> > > @@ -683,6 +675,23 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_helper_deferred_io);
> > > +static void drm_fb_helper_flush(struct drm_fb_helper *helper)
> > > +{
> > > +	struct drm_device *dev = helper->dev;
> > > +	struct fb_info *info = helper->info;
> > > +
> > > +	/*
> > > +	 * For now, we assume that deferred I/O has been enabled as damage
> > > +	 * updates require deferred I/O for a working mmap. The current
> > > +	 * fbdev emulation does not flush buffers if no damage update is
> > > +	 * necessary. So it's safe to assume fbdefio to be set.
> > > +	 */
> > > +	if (drm_WARN_ON_ONCE(dev, !info->fbdefio))
> > > +		return;
> > > +
> > > +	fb_deferred_io_flush(info);
> > > +}
> > > +
> > >   typedef ssize_t (*drm_fb_helper_read_screen)(struct fb_info *info, char __user *buf,
> > >   					     size_t count, loff_t pos);
> > > @@ -824,9 +833,10 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
> > >   	if (helper->funcs->fb_dirty) {
> > >   		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
> > > -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> > > -				     drm_rect_width(&damage_area),
> > > -				     drm_rect_height(&damage_area));
> > > +		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
> > > +					      drm_rect_width(&damage_area),
> > > +					      drm_rect_height(&damage_area));
> > > +		drm_fb_helper_flush(helper);
> > >   	}
> > >   	return ret;
> > > @@ -847,8 +857,11 @@ void drm_fb_helper_sys_fillrect(struct fb_info *info,
> > >   	sys_fillrect(info, rect);
> > > -	if (helper->funcs->fb_dirty)
> > > -		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> > > +	if (helper->funcs->fb_dirty) {
> > > +		drm_fb_helper_add_damage_clip(helper, rect->dx, rect->dy,
> > > +					      rect->width, rect->height);
> > > +		drm_fb_helper_flush(helper);
> > > +	}
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
> > > @@ -866,8 +879,11 @@ void drm_fb_helper_sys_copyarea(struct fb_info *info,
> > >   	sys_copyarea(info, area);
> > > -	if (helper->funcs->fb_dirty)
> > > -		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> > > +	if (helper->funcs->fb_dirty) {
> > > +		drm_fb_helper_add_damage_clip(helper, area->dx, area->dy,
> > > +					      area->width, area->height);
> > > +		drm_fb_helper_flush(helper);
> > > +	}
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
> > > @@ -885,8 +901,11 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
> > >   	sys_imageblit(info, image);
> > > -	if (helper->funcs->fb_dirty)
> > > -		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> > > +	if (helper->funcs->fb_dirty) {
> > > +		drm_fb_helper_add_damage_clip(helper, image->dx, image->dy,
> > > +					      image->width, image->height);
> > > +		drm_fb_helper_flush(helper);
> > > +	}
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
> > > @@ -997,9 +1016,10 @@ ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> > >   	if (helper->funcs->fb_dirty) {
> > >   		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
> > > -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> > > -				     drm_rect_width(&damage_area),
> > > -				     drm_rect_height(&damage_area));
> > > +		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
> > > +					      drm_rect_width(&damage_area),
> > > +					      drm_rect_height(&damage_area));
> > > +		drm_fb_helper_flush(helper);
> > >   	}
> > >   	return ret;
> > > @@ -1020,8 +1040,11 @@ void drm_fb_helper_cfb_fillrect(struct fb_info *info,
> > >   	cfb_fillrect(info, rect);
> > > -	if (helper->funcs->fb_dirty)
> > > -		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> > > +	if (helper->funcs->fb_dirty) {
> > > +		drm_fb_helper_add_damage_clip(helper, rect->dx, rect->dy,
> > > +					      rect->width, rect->height);
> > > +		drm_fb_helper_flush(helper);
> > > +	}
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
> > > @@ -1039,8 +1062,11 @@ void drm_fb_helper_cfb_copyarea(struct fb_info *info,
> > >   	cfb_copyarea(info, area);
> > > -	if (helper->funcs->fb_dirty)
> > > -		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> > > +	if (helper->funcs->fb_dirty) {
> > > +		drm_fb_helper_add_damage_clip(helper, area->dx, area->dy,
> > > +					      area->width, area->height);
> > > +		drm_fb_helper_flush(helper);
> > > +	}
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
> > > @@ -1058,8 +1084,11 @@ void drm_fb_helper_cfb_imageblit(struct fb_info *info,
> > >   	cfb_imageblit(info, image);
> > > -	if (helper->funcs->fb_dirty)
> > > -		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> > > +	if (helper->funcs->fb_dirty) {
> > > +		drm_fb_helper_add_damage_clip(helper, image->dx, image->dy,
> > > +					      image->width, image->height);
> > > +		drm_fb_helper_flush(helper);
> > > +	}
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
> > > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> > > index c730253ab85ce..325d12c3a4d61 100644
> > > --- a/drivers/video/fbdev/core/fb_defio.c
> > > +++ b/drivers/video/fbdev/core/fb_defio.c
> > > @@ -332,3 +332,19 @@ void fb_deferred_io_cleanup(struct fb_info *info)
> > >   	mutex_destroy(&fbdefio->lock);
> > >   }
> > >   EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> > > +
> > > +void fb_deferred_io_flush(struct fb_info *info)
> > > +{
> > > +	struct fb_deferred_io *fbdefio = info->fbdefio;
> > > +
> > > +	if (WARN_ON_ONCE(!fbdefio))
> > > +		return; /* bug in driver logic */
> > > +
> > > +	/*
> > > +	 * There's no requirement to perform the flush immediately. So
> > > +	 * schedule the worker with a delay and let a few more writes
> > > +	 * pile up.
> > > +	 */
> > 
> > So this part is wrong, because the drm callers do rely on this not
> > flushing anything immediately, but instead on scheduling the worker. Or at
> > least that's the reason why we have the damage worker in the first place.
> 
> That is badly worded. The comment means that the worker does not have to be
> scheduled immediately. I'll change that.
> 
> > 
> > So this comment here needs to go, and the functions need to make it clear
> > in their names that that they queue/schedule the flush.
> 
> fb_deferred_io_schedule_flush() seems like the most expressive name.
> 
> The current name came from glFlush() and glFinish(), where the former only
> schedules a flushand the letter really waits before returning.

Just an aside, but this actually meant the same thing 30 years ago, when
GL was done on the cpu. glFlush actually flushed out and finished all the
rendering, because gl was an immediate mode api back then.

But now we have bazillions of layers in between to keep up the old gl
illusions while actually trying to use the power of modern gpus, and so
you have stuff like dma-buf implicit sync to be able to keep up the
illusion that everything is synchronous, while in reality it is absolutely
not.

vk has this all much better, where the equivalent of glflush is a queue
command and you get a dma_fence (in some wrapper, usually syncobj) back
explicitly.

History aside, I like your choice of naming.
-Daniel

> 
> Best regards
> Thomas
> 
> > 
> > Also not sure whether you want to split out the fbdev part or not, imo
> > overkill.
> > 
> > With comments addressed:
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > 
> > > +	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
> > > +}
> > > +EXPORT_SYMBOL_GPL(fb_deferred_io_flush);
> > > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > > index bcb8658f5b64d..54b3b3e13522f 100644
> > > --- a/include/linux/fb.h
> > > +++ b/include/linux/fb.h
> > > @@ -663,6 +663,7 @@ extern void fb_deferred_io_open(struct fb_info *info,
> > >   				struct inode *inode,
> > >   				struct file *file);
> > >   extern void fb_deferred_io_cleanup(struct fb_info *info);
> > > +extern void fb_deferred_io_flush(struct fb_info *info);
> > >   extern int fb_deferred_io_fsync(struct file *file, loff_t start,
> > >   				loff_t end, int datasync);
> > > -- 
> > > 2.38.0
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
