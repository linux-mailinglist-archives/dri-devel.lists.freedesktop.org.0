Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618F069B2B8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 19:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DE810E3F1;
	Fri, 17 Feb 2023 18:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7567E10F0C0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 18:56:36 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d28so2776124lfv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 10:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o94YrLYtePEBIEe2HUwowL8m3WqxRUsPcsQ4xNOJauo=;
 b=JkJ7U6CHGlVEkxGogpDyr2Vc6liayPJuQ9frdw9+ZCSastVXe5cZi1dHq4fv4s2+xB
 5a3t2FYgz6n9mN9Kazj7I6tHzWudCqotUxVqw2O0Yt37P2FBcR81Srerer5RAY5llz3i
 FuBrAuK5QRr9/y/VNj6wpoxy4CnQaWBVzXINY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o94YrLYtePEBIEe2HUwowL8m3WqxRUsPcsQ4xNOJauo=;
 b=x7t2xyrBsWjzX0+OUU0ACKGRMX2J+NUXn5QSR0gKzgs+Ckgbd3DQLcBcKdPjUG0sc/
 Qv24yo75LXpw0TE3Pw6RChK4hIOUUTLqqrAi9S1Rw1xzp6NfhUdeGgEY0dIMEbOhT7k0
 9rjlg9X9xPElSNiK0yXkFr4GfkyrxN921VubwGSSIqa11MSGsCJRopQd3zwcCfbgcgcA
 N+NKM1c27S5AOsBC7NmFc7qjq0sG5+oxEwudoDsrKwMLgd4nCoImS3X4EqQ2bE66qzJX
 VNVFDs/HDQNqm/O3N4TJtuScs79iKemxUWqUj1F/HUjeXqWhFDoUQBCAdPdPVi5/iPbd
 1ncw==
X-Gm-Message-State: AO0yUKW9/Mz39h/P5s6XV0lyRyT0fP7grlyRONUd5lgnhbCMb1cx00d4
 MelVjSFu/c2G0xg1MxY6j63zgDMb1K6LPFm40IvTww==
X-Google-Smtp-Source: AK7set995XVAMvaqypmTj++YjqaBpRgBWSKlOZ5hjVQvtLR9sAw2eBIGLAa4rkVsgNOGurMv81r/m5IqX/LYxB8ZI2I=
X-Received: by 2002:ac2:5a0e:0:b0:4d5:ca42:e43b with SMTP id
 q14-20020ac25a0e000000b004d5ca42e43bmr759586lfn.4.1676660194667; Fri, 17 Feb
 2023 10:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20230126102814.8722-1-christian.koenig@amd.com>
 <0687b946-c542-6705-06c6-de3a8e9ff279@suse.de>
 <Y+4++/jQaXuGdAYF@phenom.ffwll.local>
 <5438a01c-a8d5-a0c4-ba39-2bf80a7af8ce@gmail.com>
In-Reply-To: <5438a01c-a8d5-a0c4-ba39-2bf80a7af8ce@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 17 Feb 2023 19:56:21 +0100
Message-ID: <CAKMK7uEk6r6AJ1Y_QrhiwKgZNn7iXt0wHZwxgiahYTqqm03_bQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/client: fix circular reference counting issue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Feb 2023 at 13:06, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 16.02.23 um 15:34 schrieb Daniel Vetter:
> > On Thu, Jan 26, 2023 at 03:30:31PM +0100, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 26.01.23 um 11:28 schrieb Christian K=C3=B6nig:
> >>> We reference dump buffers both by their handle as well as their
> >>> object. The problem is now that when anybody iterates over the DRM
> >>> framebuffers and exports the underlying GEM objects through DMA-buf
> >>> we run into a circular reference count situation.
> >>>
> >>> The result is that the fbdev handling holds the GEM handle preventing
> >>> the DMA-buf in the GEM object to be released. This DMA-buf in turn
> >>> holds a reference to the driver module which on unload would release
> >>> the fbdev.
> >>>
> >>> Break that loop by releasing the handle as soon as the DRM
> >>> framebuffer object is created. The DRM framebuffer and the DRM client
> >>> buffer structure still hold a reference to the underlying GEM object
> >>> preventing its destruction.
> >>>
> >>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Fixes: c76f0f7cb546 ("drm: Begin an API for in-kernel clients")
> >>> Cc: <stable@vger.kernel.org>
> >> I tested with Weston and Gnome in X11 and Wayland mode under simpledrm=
,
> >> which I started stopped from the console. No obvious problems.
> >>
> >> I heard that sway/wlroots has issues with drivers that don't support
> >> dma-buf. Maybe(!) that could be affected by this patch.
> > dma-buf export should still work. Also the loop is imo a red herring, I
> > think if you force unbind the driver then this should all get resolved
> > automatically.
> >
> > What is true is that once we start refcounting everything correctly the=
n
> > there will be elevated module refcounts, which means you cannot use mod=
ule
> > unloading to provoke a driver unbind, which would kick out all the
> > leftover references. You instead need to manually unbind the driver fir=
st,
> > which should drop all remaining references to zero (might need to kill
> > also any userspace), and only then can you unload the driver.
> >
> > But this confusion is extremely common, a lot of people think that just
> > holding a module reference is enough, we really should also hold a
> > drm_device reference for dma-buf ...
>
> Yeah, hot plug removal of amdgpu revealed a couple of those as well.
>
> Essentially what DMA-buf does with grabbing a module reference on the
> owner of a DMA-buf is a bad idea.
>
> Instead we should reference the device or component which is exporting
> the buffer, but since we don't have a common structure here it's more
> work to generalize that approach.

Well the device/component still needs to eventually hold a reference
on the module, or bad things can happen. But yeah dma-buf also holding
one but not a device/component reference is definitely bad.
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >> Anyway, take my r-b, t-b tags.
> >>
> >> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>
> >> Thank you for fixing this bug.
> >>
> >> Best regards
> >> Thomas
> >>
> >>> ---
> >>>    drivers/gpu/drm/drm_client.c | 33 ++++++++++++++++++++------------=
-
> >>>    include/drm/drm_client.h     |  5 -----
> >>>    2 files changed, 20 insertions(+), 18 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_clien=
t.c
> >>> index 009e7b10455c..f6292ba0e6fc 100644
> >>> --- a/drivers/gpu/drm/drm_client.c
> >>> +++ b/drivers/gpu/drm/drm_client.c
> >>> @@ -243,21 +243,17 @@ void drm_client_dev_restore(struct drm_device *=
dev)
> >>>    static void drm_client_buffer_delete(struct drm_client_buffer *buf=
fer)
> >>>    {
> >>> -   struct drm_device *dev =3D buffer->client->dev;
> >>> -
> >>>     if (buffer->gem) {
> >>>             drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
> >>>             drm_gem_object_put(buffer->gem);
> >>>     }
> >>> -   if (buffer->handle)
> >>> -           drm_mode_destroy_dumb(dev, buffer->handle, buffer->client=
->file);
> >>> -
> >>>     kfree(buffer);
> >>>    }
> >>>    static struct drm_client_buffer *
> >>> -drm_client_buffer_create(struct drm_client_dev *client, u32 width, u=
32 height, u32 format)
> >>> +drm_client_buffer_create(struct drm_client_dev *client, u32 width, u=
32 height,
> >>> +                    u32 format, u32 *handle)
> >>>    {
> >>>     const struct drm_format_info *info =3D drm_format_info(format);
> >>>     struct drm_mode_create_dumb dumb_args =3D { };
> >>> @@ -279,16 +275,15 @@ drm_client_buffer_create(struct drm_client_dev =
*client, u32 width, u32 height, u
> >>>     if (ret)
> >>>             goto err_delete;
> >>> -   buffer->handle =3D dumb_args.handle;
> >>> -   buffer->pitch =3D dumb_args.pitch;
> >>> -
> >>>     obj =3D drm_gem_object_lookup(client->file, dumb_args.handle);
> >>>     if (!obj)  {
> >>>             ret =3D -ENOENT;
> >>>             goto err_delete;
> >>>     }
> >>> +   buffer->pitch =3D dumb_args.pitch;
> >>>     buffer->gem =3D obj;
> >>> +   *handle =3D dumb_args.handle;
> >>>     return buffer;
> >>> @@ -375,7 +370,8 @@ static void drm_client_buffer_rmfb(struct drm_cli=
ent_buffer *buffer)
> >>>    }
> >>>    static int drm_client_buffer_addfb(struct drm_client_buffer *buffe=
r,
> >>> -                              u32 width, u32 height, u32 format)
> >>> +                              u32 width, u32 height, u32 format,
> >>> +                              u32 handle)
> >>>    {
> >>>     struct drm_client_dev *client =3D buffer->client;
> >>>     struct drm_mode_fb_cmd fb_req =3D { };
> >>> @@ -387,7 +383,7 @@ static int drm_client_buffer_addfb(struct drm_cli=
ent_buffer *buffer,
> >>>     fb_req.depth =3D info->depth;
> >>>     fb_req.width =3D width;
> >>>     fb_req.height =3D height;
> >>> -   fb_req.handle =3D buffer->handle;
> >>> +   fb_req.handle =3D handle;
> >>>     fb_req.pitch =3D buffer->pitch;
> >>>     ret =3D drm_mode_addfb(client->dev, &fb_req, client->file);
> >>> @@ -424,13 +420,24 @@ struct drm_client_buffer *
> >>>    drm_client_framebuffer_create(struct drm_client_dev *client, u32 w=
idth, u32 height, u32 format)
> >>>    {
> >>>     struct drm_client_buffer *buffer;
> >>> +   u32 handle;
> >>>     int ret;
> >>> -   buffer =3D drm_client_buffer_create(client, width, height, format=
);
> >>> +   buffer =3D drm_client_buffer_create(client, width, height, format=
,
> >>> +                                     &handle);
> >>>     if (IS_ERR(buffer))
> >>>             return buffer;
> >>> -   ret =3D drm_client_buffer_addfb(buffer, width, height, format);
> >>> +   ret =3D drm_client_buffer_addfb(buffer, width, height, format, ha=
ndle);
> >>> +
> >>> +   /*
> >>> +    * The handle is only needed for creating the framebuffer, destro=
y it
> >>> +    * again to solve a circular dependency should anybody export the=
 GEM
> >>> +    * object as DMA-buf. The framebuffer and our buffer structure ar=
e still
> >>> +    * holding references to the GEM object to prevent its destructio=
n.
> >>> +    */
> >>> +   drm_mode_destroy_dumb(client->dev, handle, client->file);
> >>> +
> >>>     if (ret) {
> >>>             drm_client_buffer_delete(buffer);
> >>>             return ERR_PTR(ret);
> >>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> >>> index 39482527a775..b5acdab73766 100644
> >>> --- a/include/drm/drm_client.h
> >>> +++ b/include/drm/drm_client.h
> >>> @@ -134,11 +134,6 @@ struct drm_client_buffer {
> >>>      */
> >>>     struct drm_client_dev *client;
> >>> -   /**
> >>> -    * @handle: Buffer handle
> >>> -    */
> >>> -   u32 handle;
> >>> -
> >>>     /**
> >>>      * @pitch: Buffer pitch
> >>>      */
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >> (HRB 36809, AG N=C3=BCrnberg)
> >> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >
> >
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
