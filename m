Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF9699783
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC10D10ED99;
	Thu, 16 Feb 2023 14:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4081010ED95
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:34:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso4335734wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 06:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xUs51vQwK1PgtzBh6hnKix9xbeDPBstesWIkpNyXKq4=;
 b=YEEvWgw2bsM/UMTWuj+pHd9kA2NsjoxTR6UbT4gwWWyPv0QPno7SkUc+8+gstW2JCK
 5GjXYH2DJ40pa2CCjZ3XQ3AX4GKPf9bj+luVb0LFv94ml+TM4adSX9uUd46wnSRP40O3
 EV3jC+TZ1bGyhdy3tmhpDpXYiZnwXb4u2jzkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xUs51vQwK1PgtzBh6hnKix9xbeDPBstesWIkpNyXKq4=;
 b=Pikjlm/RITnN2oUXhDgbS6cguoiek4uDaYea4iiID9xuCMve1Lrh6FxnYeKPEIAHJb
 JNcOs7pH7a3ecvtstgaG3xdejME8Cq1MfH/1CO7k6fR0a33iXRT/B9vopj7vrELrkcnK
 HSaiYTco68neNehkXho36WotTCwAdiG0PkuKkjsr5QYcCjHPEmiyoSxIVAHxVgJx8TtA
 ibFb5izGDtsB2SThlhLy6uu9IOM3kPY9CdI9LIrOpwHffXg0LzZXR8HRpcZSdk14XqDE
 9exOzLRG1Zmd4SZlnCcIJvOdxxFbu0M8QjkpweFDKXWQgaQQPoNP7e3sX3cA75i+9WXe
 e39g==
X-Gm-Message-State: AO0yUKXdM5fyr14ILGFtEyentfy4TQO9HYcPbowRyO8BJPRJkfv7WZ/A
 2yN+8KHbvmBbeYLrVXwAX0fdeQ==
X-Google-Smtp-Source: AK7set8qI8Ixer5/k62Dt4HhnoqNf2XD4Gfi1wiSvLwlEqZMFQH35mpz/CF21vZwsETXBZXB5NFwkA==
X-Received: by 2002:a1c:f418:0:b0:3e0:b1:c12d with SMTP id
 z24-20020a1cf418000000b003e000b1c12dmr6192144wma.1.1676558077728; 
 Thu, 16 Feb 2023 06:34:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003e209b45f6bsm2569896wmc.29.2023.02.16.06.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:34:37 -0800 (PST)
Date: Thu, 16 Feb 2023 15:34:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/client: fix circular reference counting issue
Message-ID: <Y+4++/jQaXuGdAYF@phenom.ffwll.local>
References: <20230126102814.8722-1-christian.koenig@amd.com>
 <0687b946-c542-6705-06c6-de3a8e9ff279@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0687b946-c542-6705-06c6-de3a8e9ff279@suse.de>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 03:30:31PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.01.23 um 11:28 schrieb Christian König:
> > We reference dump buffers both by their handle as well as their
> > object. The problem is now that when anybody iterates over the DRM
> > framebuffers and exports the underlying GEM objects through DMA-buf
> > we run into a circular reference count situation.
> > 
> > The result is that the fbdev handling holds the GEM handle preventing
> > the DMA-buf in the GEM object to be released. This DMA-buf in turn
> > holds a reference to the driver module which on unload would release
> > the fbdev.
> > 
> > Break that loop by releasing the handle as soon as the DRM
> > framebuffer object is created. The DRM framebuffer and the DRM client
> > buffer structure still hold a reference to the underlying GEM object
> > preventing its destruction.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Fixes: c76f0f7cb546 ("drm: Begin an API for in-kernel clients")
> > Cc: <stable@vger.kernel.org>
> 
> I tested with Weston and Gnome in X11 and Wayland mode under simpledrm,
> which I started stopped from the console. No obvious problems.
> 
> I heard that sway/wlroots has issues with drivers that don't support
> dma-buf. Maybe(!) that could be affected by this patch.

dma-buf export should still work. Also the loop is imo a red herring, I
think if you force unbind the driver then this should all get resolved
automatically.

What is true is that once we start refcounting everything correctly then
there will be elevated module refcounts, which means you cannot use module
unloading to provoke a driver unbind, which would kick out all the
leftover references. You instead need to manually unbind the driver first,
which should drop all remaining references to zero (might need to kill
also any userspace), and only then can you unload the driver.

But this confusion is extremely common, a lot of people think that just
holding a module reference is enough, we really should also hold a
drm_device reference for dma-buf ...
-Daniel

> 
> Anyway, take my r-b, t-b tags.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thank you for fixing this bug.
> 
> Best regards
> Thomas
> 
> > ---
> >   drivers/gpu/drm/drm_client.c | 33 ++++++++++++++++++++-------------
> >   include/drm/drm_client.h     |  5 -----
> >   2 files changed, 20 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> > index 009e7b10455c..f6292ba0e6fc 100644
> > --- a/drivers/gpu/drm/drm_client.c
> > +++ b/drivers/gpu/drm/drm_client.c
> > @@ -243,21 +243,17 @@ void drm_client_dev_restore(struct drm_device *dev)
> >   static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
> >   {
> > -	struct drm_device *dev = buffer->client->dev;
> > -
> >   	if (buffer->gem) {
> >   		drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
> >   		drm_gem_object_put(buffer->gem);
> >   	}
> > -	if (buffer->handle)
> > -		drm_mode_destroy_dumb(dev, buffer->handle, buffer->client->file);
> > -
> >   	kfree(buffer);
> >   }
> >   static struct drm_client_buffer *
> > -drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
> > +drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
> > +			 u32 format, u32 *handle)
> >   {
> >   	const struct drm_format_info *info = drm_format_info(format);
> >   	struct drm_mode_create_dumb dumb_args = { };
> > @@ -279,16 +275,15 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
> >   	if (ret)
> >   		goto err_delete;
> > -	buffer->handle = dumb_args.handle;
> > -	buffer->pitch = dumb_args.pitch;
> > -
> >   	obj = drm_gem_object_lookup(client->file, dumb_args.handle);
> >   	if (!obj)  {
> >   		ret = -ENOENT;
> >   		goto err_delete;
> >   	}
> > +	buffer->pitch = dumb_args.pitch;
> >   	buffer->gem = obj;
> > +	*handle = dumb_args.handle;
> >   	return buffer;
> > @@ -375,7 +370,8 @@ static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
> >   }
> >   static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
> > -				   u32 width, u32 height, u32 format)
> > +				   u32 width, u32 height, u32 format,
> > +				   u32 handle)
> >   {
> >   	struct drm_client_dev *client = buffer->client;
> >   	struct drm_mode_fb_cmd fb_req = { };
> > @@ -387,7 +383,7 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
> >   	fb_req.depth = info->depth;
> >   	fb_req.width = width;
> >   	fb_req.height = height;
> > -	fb_req.handle = buffer->handle;
> > +	fb_req.handle = handle;
> >   	fb_req.pitch = buffer->pitch;
> >   	ret = drm_mode_addfb(client->dev, &fb_req, client->file);
> > @@ -424,13 +420,24 @@ struct drm_client_buffer *
> >   drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
> >   {
> >   	struct drm_client_buffer *buffer;
> > +	u32 handle;
> >   	int ret;
> > -	buffer = drm_client_buffer_create(client, width, height, format);
> > +	buffer = drm_client_buffer_create(client, width, height, format,
> > +					  &handle);
> >   	if (IS_ERR(buffer))
> >   		return buffer;
> > -	ret = drm_client_buffer_addfb(buffer, width, height, format);
> > +	ret = drm_client_buffer_addfb(buffer, width, height, format, handle);
> > +
> > +	/*
> > +	 * The handle is only needed for creating the framebuffer, destroy it
> > +	 * again to solve a circular dependency should anybody export the GEM
> > +	 * object as DMA-buf. The framebuffer and our buffer structure are still
> > +	 * holding references to the GEM object to prevent its destruction.
> > +	 */
> > +	drm_mode_destroy_dumb(client->dev, handle, client->file);
> > +
> >   	if (ret) {
> >   		drm_client_buffer_delete(buffer);
> >   		return ERR_PTR(ret);
> > diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> > index 39482527a775..b5acdab73766 100644
> > --- a/include/drm/drm_client.h
> > +++ b/include/drm/drm_client.h
> > @@ -134,11 +134,6 @@ struct drm_client_buffer {
> >   	 */
> >   	struct drm_client_dev *client;
> > -	/**
> > -	 * @handle: Buffer handle
> > -	 */
> > -	u32 handle;
> > -
> >   	/**
> >   	 * @pitch: Buffer pitch
> >   	 */
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
