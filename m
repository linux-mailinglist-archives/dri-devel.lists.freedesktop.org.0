Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD62F2AF5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 10:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46406E182;
	Tue, 12 Jan 2021 09:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63D36E182
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 09:17:13 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t30so1689940wrb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 01:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BkFPPAMUp2t1YrBY41qrS/Q9HpIRZgTIhFUpfiEfe3I=;
 b=cnwEUlV2QnvwNPkrS3zUaCdwjmeHQOssIIjMjbPTgCx7ymC6qa2UuAHdpQUkF7hMSu
 KSdMe9AaLfIe2eAvAxK6jNSO+4SAAKFPYG+xFYpsQ5xPpcXVnRpWpp5VWcxXOb2V4+62
 Rde1SXCDtujP5MblELcIKnpJEUx6jUPagkjrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BkFPPAMUp2t1YrBY41qrS/Q9HpIRZgTIhFUpfiEfe3I=;
 b=T9mzucqmZxSiWA9r3N+OCGDe+El85jTTxfE9mgE07T6n7DMF1P8lSX9oreCzPxuf8/
 wlWRkCKEK07mvCXeOPOYd12W8ubjJs8k63nsU9EM4cMLcKOfDr+Pd6yMSKUXIsTJ81Rk
 7u/gmYk/GDxg9g1iqftW75KZ0iHA2+wSqgJBaJ2KhdR1y7c2RSAUdnzPaLHEYNiskZ9s
 M0fQAaa+3Kymr2yz1ej7JNzD+jGpdHRJqCXtwxph0HFPhaKbAkySLdRnf0uXUpdP9cND
 4ktaEpuVtz9/xOa3tXRv2K2FIqKD3mXQu6RbjCcPeBF24oHNonbuLSfmhpGGyeUaalQL
 jLzw==
X-Gm-Message-State: AOAM532srHAcydlwuUL8O1E13jJPM+VZwE8I4US+ikv1DGFjz2WjGI5d
 Tb3T2DJZtDUshDSpoHx3RDntGw==
X-Google-Smtp-Source: ABdhPJx/V56gELooyGmDglikPZdA+XTA2xRFVdYCGu7EQxYoL6V/sTE/BkKNN5kG9dRt4iF6SIVi8g==
X-Received: by 2002:a5d:558a:: with SMTP id i10mr3256036wrv.363.1610443032442; 
 Tue, 12 Jan 2021 01:17:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l5sm3810117wrv.44.2021.01.12.01.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:17:11 -0800 (PST)
Date: Tue, 12 Jan 2021 10:17:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 11/13] drm/vboxvideo: Use drm_gem_vram_vmap_local() in
 cursor update
Message-ID: <X/1pFaa9I7WFjtJW@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-12-tzimmermann@suse.de>
 <X/yFj9zIdW52UKk4@phenom.ffwll.local>
 <a42dbfad-4280-eeea-5915-71061f732a4a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a42dbfad-4280-eeea-5915-71061f732a4a@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 airlied@redhat.com, virtualization@lists.linux-foundation.org, sean@poorly.run,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 08:54:02AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 11.01.21 um 18:06 schrieb Daniel Vetter:
> > On Fri, Jan 08, 2021 at 10:43:38AM +0100, Thomas Zimmermann wrote:
> > > Cursor updates in vboxvideo require a short-term mapping of the
> > > source BO. Use drm_gem_vram_vmap_local() and avoid the pinning
> > > operations.
> > > =

> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > =

> > All these drivers patches break the dma_resv_lock vs
> > dma_fence_begin/end_signalling nesting rules, so this doesn't work.
> > =

> > Generally this is what the prepare/cleanup_fb hooks are for, that's whe=
re
> > mappings (including vmaps) are meant to be set up, permanently.
> > =

> > I'm kinda not clear on why we need all these changes, I thought the
> > locking problem is just in the fb helper paths, because it's outside of
> > the atomic path and could conflict with an atomic update at the same ti=
me?
> > So only that one should get the vmap_local treatment, everything else
> > should keep the normal vmap treatment.
> =

> Kind of responding to all your comment on the driver changes:
> =

> These drivers only require short-term mappings, so using vmap_local would=
 be
> the natural choice. For SHMEM helpers, it's mostly a cosmetic thing. For
> VRAM helpers, I was hoping to remove the vmap/vunmap helpers entirely. One
> cannot really map the BOs for the long-term, so not having the helpers at
> all would make sense.
> =

> But reading all your comments on the driver patches, I'd rather not update
> the drivers here but later convert them to use prepare_fb/cleanup_fb in t=
he
> correct way.

Ack from me on this plan. I think I got all the other patches with an r-b
or ack?
-Daniel

> =

> Best regards
> Thomas
> =

> > -Daniel
> > > ---
> > >   drivers/gpu/drm/vboxvideo/vbox_mode.c | 15 +++++++++------
> > >   1 file changed, 9 insertions(+), 6 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/=
vboxvideo/vbox_mode.c
> > > index dbc0dd53c69e..215b37c78c10 100644
> > > --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > @@ -381,7 +381,8 @@ static void vbox_cursor_atomic_update(struct drm_=
plane *plane,
> > >   		container_of(plane->dev, struct vbox_private, ddev);
> > >   	struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(plane->state->crtc);
> > >   	struct drm_framebuffer *fb =3D plane->state->fb;
> > > -	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> > > +	struct drm_gem_object *obj =3D fb->obj[0];
> > > +	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(obj);
> > >   	u32 width =3D plane->state->crtc_w;
> > >   	u32 height =3D plane->state->crtc_h;
> > >   	size_t data_size, mask_size;
> > > @@ -401,11 +402,12 @@ static void vbox_cursor_atomic_update(struct dr=
m_plane *plane,
> > >   	vbox_crtc->cursor_enabled =3D true;
> > > -	ret =3D drm_gem_vram_vmap(gbo, &map);
> > > +	ret =3D dma_resv_lock(obj->resv, NULL);
> > > +	if (ret)
> > > +		return;
> > > +	ret =3D drm_gem_vram_vmap_local(gbo, &map);
> > >   	if (ret) {
> > > -		/*
> > > -		 * BUG: we should have pinned the BO in prepare_fb().
> > > -		 */
> > > +		dma_resv_unlock(obj->resv);
> > >   		mutex_unlock(&vbox->hw_mutex);
> > >   		DRM_WARN("Could not map cursor bo, skipping update\n");
> > >   		return;
> > > @@ -421,7 +423,8 @@ static void vbox_cursor_atomic_update(struct drm_=
plane *plane,
> > >   	data_size =3D width * height * 4 + mask_size;
> > >   	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size=
);
> > > -	drm_gem_vram_vunmap(gbo, &map);
> > > +	drm_gem_vram_vunmap_local(gbo, &map);
> > > +	dma_resv_unlock(obj->resv);
> > >   	flags =3D VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
> > >   		VBOX_MOUSE_POINTER_ALPHA;
> > > -- =

> > > 2.29.2
> > > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
