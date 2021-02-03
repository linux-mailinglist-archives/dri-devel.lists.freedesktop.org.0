Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0BD30D7DA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 11:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40216E3AA;
	Wed,  3 Feb 2021 10:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CED6E3AA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 10:44:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id f16so4965016wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 02:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TQbRCB/bIe/u9o4nItldBYJMxw9TA3/lqGBbFW/3W0k=;
 b=MGgtSkKNhFptVIEsWpRhg1scRzBsSaRcCj5X16NiNGpMcPG1d28TQrF1McSsxZ7mva
 zbrmbQSHdf2iKE6YSKWm9GPNA7txcmHYjTCA49pPKoAsZq1fW3WlZ1Fb3Ds25iLmgrVF
 VOsbLSkQjmqxmbj0PcYKXnpSuUVNw1HDHxadE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TQbRCB/bIe/u9o4nItldBYJMxw9TA3/lqGBbFW/3W0k=;
 b=tLjCv/EOx4NqXN3E2UuW649Psa6ci1W/giWm5qfCfHL+MtX8NVlmfdo8LOkhljxoxy
 h9tP+JhIW2XeTw0ng5I42VEOjYnqS3vgzzueujFoBpeEk7CRZxyUXaopQD9TDnH0AnL/
 vKV+wwbSE28QDF4pvUgv6HvdMP84+k52tDHF9bN+jwcqqD8RMCi/iDsPaUXuT0COTS9S
 1qGGnVIdV9vPbpunQ4TlzaDzUzfZtP6VeMeU2dz9ORlPIj2Im+nM6c9vlQjOPPlz2+Hx
 GvDC0G9xVg1JB0G21KZZJo9ohxoPC9PcWzmgEvttPB+ZssQDx7+gzMzMvqWbcSWfuNND
 e05A==
X-Gm-Message-State: AOAM5304HoSK94IR9oKxG1uhI4iuzsq8EQh6jBFzlu8eiFZSyNWaAm2q
 q5EVrl+LPZg8D3nbALfayTnlFQ==
X-Google-Smtp-Source: ABdhPJxVlb1eZdyRK8gq+JvWjJTiMVjmnL977fjLNaVmSkrnKMMEzJ8+RNFUW/ypCKpSKTtWCtbt9g==
X-Received: by 2002:a1c:9648:: with SMTP id y69mr2164692wmd.40.1612349074354; 
 Wed, 03 Feb 2021 02:44:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s4sm2382113wme.38.2021.02.03.02.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 02:44:33 -0800 (PST)
Date: Wed, 3 Feb 2021 11:44:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and
 cleanup_fb
Message-ID: <YBp+jxbjkdcpN1eo@phenom.ffwll.local>
References: <20210127140503.31772-1-tzimmermann@suse.de>
 <YBp7CzzBjECx5lAu@phenom.ffwll.local>
 <9997d4d0-4664-d38c-22ae-346aeccba896@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9997d4d0-4664-d38c-22ae-346aeccba896@suse.de>
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
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 11:34:21AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 03.02.21 um 11:29 schrieb Daniel Vetter:
> > On Wed, Jan 27, 2021 at 03:05:03PM +0100, Thomas Zimmermann wrote:
> > > Functions in the atomic commit tail are not allowed to acquire the
> > > dmabuf's reservation lock. So we cannot legally call the GEM object's
> > > vmap functionality in atomic_update.
> > > =

> > > Instead vmap the cursor BO in prepare_fb and vunmap it in cleanup_fb.
> > > The cursor plane state stores the mapping's address. The pinning of t=
he
> > > BO is implicitly done by vmap.
> > > =

> > > As an extra benefit, there's no source of runtime errors left in
> > > atomic_update.
> > > =

> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > =

> > Did you test this with my dma_fence_signalling annotations patches?
> =

> Not with vbox. I did test similar code in my recent ast patchset. But I
> think there's still a bug here, as there's no custom plane-reset function.

Do right, KASAN should complain when you load the driver because the first
state is a bit too small. But probably still within the kmalloc'ed block
by sheer luck. Worth confirming that KASAN can catch this.

> > =

> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> I'll certainly send out an updated patch.

I wonder whether it's worth to have a runtime check that when you
overwrite one, you have to overwrite all of them or it's clearly buggy?
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > > ---
> > >   drivers/gpu/drm/vboxvideo/vbox_mode.c | 102 +++++++++++++++++++++--=
---
> > >   1 file changed, 82 insertions(+), 20 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/=
vboxvideo/vbox_mode.c
> > > index dbc0dd53c69e..b5625a7d6cef 100644
> > > --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > @@ -324,6 +324,19 @@ static void vbox_primary_atomic_disable(struct d=
rm_plane *plane,
> > >   				    old_state->src_y >> 16);
> > >   }
> > > +struct vbox_cursor_plane_state {
> > > +	struct drm_plane_state base;
> > > +
> > > +	/* Transitional state - do not export or duplicate */
> > > +
> > > +	struct dma_buf_map map;
> > > +};
> > > +
> > > +static struct vbox_cursor_plane_state *to_vbox_cursor_plane_state(st=
ruct drm_plane_state *state)
> > > +{
> > > +	return container_of(state, struct vbox_cursor_plane_state, base);
> > > +}
> > > +
> > >   static int vbox_cursor_atomic_check(struct drm_plane *plane,
> > >   				    struct drm_plane_state *new_state)
> > >   {
> > > @@ -381,14 +394,13 @@ static void vbox_cursor_atomic_update(struct dr=
m_plane *plane,
> > >   		container_of(plane->dev, struct vbox_private, ddev);
> > >   	struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(plane->state->crtc);
> > >   	struct drm_framebuffer *fb =3D plane->state->fb;
> > > -	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> > >   	u32 width =3D plane->state->crtc_w;
> > >   	u32 height =3D plane->state->crtc_h;
> > > +	struct vbox_cursor_plane_state *vbox_state =3D to_vbox_cursor_plane=
_state(plane->state);
> > > +	struct dma_buf_map map =3D vbox_state->map;
> > > +	u8 *src =3D map.vaddr; /* TODO: Use mapping abstraction properly */
> > >   	size_t data_size, mask_size;
> > >   	u32 flags;
> > > -	struct dma_buf_map map;
> > > -	int ret;
> > > -	u8 *src;
> > >   	/*
> > >   	 * VirtualBox uses the host windowing system to draw the cursor so
> > > @@ -401,17 +413,6 @@ static void vbox_cursor_atomic_update(struct drm=
_plane *plane,
> > >   	vbox_crtc->cursor_enabled =3D true;
> > > -	ret =3D drm_gem_vram_vmap(gbo, &map);
> > > -	if (ret) {
> > > -		/*
> > > -		 * BUG: we should have pinned the BO in prepare_fb().
> > > -		 */
> > > -		mutex_unlock(&vbox->hw_mutex);
> > > -		DRM_WARN("Could not map cursor bo, skipping update\n");
> > > -		return;
> > > -	}
> > > -	src =3D map.vaddr; /* TODO: Use mapping abstraction properly */
> > > -
> > >   	/*
> > >   	 * The mask must be calculated based on the alpha
> > >   	 * channel, one bit per ARGB word, and must be 32-bit
> > > @@ -421,7 +422,6 @@ static void vbox_cursor_atomic_update(struct drm_=
plane *plane,
> > >   	data_size =3D width * height * 4 + mask_size;
> > >   	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size=
);
> > > -	drm_gem_vram_vunmap(gbo, &map);
> > >   	flags =3D VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
> > >   		VBOX_MOUSE_POINTER_ALPHA;
> > > @@ -458,6 +458,43 @@ static void vbox_cursor_atomic_disable(struct dr=
m_plane *plane,
> > >   	mutex_unlock(&vbox->hw_mutex);
> > >   }
> > > +static int vbox_cursor_prepare_fb(struct drm_plane *plane, struct dr=
m_plane_state *new_state)
> > > +{
> > > +	struct vbox_cursor_plane_state *new_vbox_state =3D to_vbox_cursor_p=
lane_state(new_state);
> > > +	struct drm_framebuffer *fb =3D new_state->fb;
> > > +	struct drm_gem_vram_object *gbo;
> > > +	struct dma_buf_map map;
> > > +	int ret;
> > > +
> > > +	if (!fb)
> > > +		return 0;
> > > +
> > > +	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> > > +
> > > +	ret =3D drm_gem_vram_vmap(gbo, &map);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	new_vbox_state->map =3D map;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void vbox_cursor_cleanup_fb(struct drm_plane *plane, struct d=
rm_plane_state *old_state)
> > > +{
> > > +	struct vbox_cursor_plane_state *old_vbox_state =3D to_vbox_cursor_p=
lane_state(old_state);
> > > +	struct drm_framebuffer *fb =3D old_state->fb;
> > > +	struct dma_buf_map map =3D old_vbox_state->map;
> > > +	struct drm_gem_vram_object *gbo;
> > > +
> > > +	if (!fb)
> > > +		return;
> > > +
> > > +	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> > > +
> > > +	drm_gem_vram_vunmap(gbo, &map);
> > > +}
> > > +
> > >   static const u32 vbox_cursor_plane_formats[] =3D {
> > >   	DRM_FORMAT_ARGB8888,
> > >   };
> > > @@ -466,17 +503,42 @@ static const struct drm_plane_helper_funcs vbox=
_cursor_helper_funcs =3D {
> > >   	.atomic_check	=3D vbox_cursor_atomic_check,
> > >   	.atomic_update	=3D vbox_cursor_atomic_update,
> > >   	.atomic_disable	=3D vbox_cursor_atomic_disable,
> > > -	.prepare_fb	=3D drm_gem_vram_plane_helper_prepare_fb,
> > > -	.cleanup_fb	=3D drm_gem_vram_plane_helper_cleanup_fb,
> > > +	.prepare_fb	=3D vbox_cursor_prepare_fb,
> > > +	.cleanup_fb	=3D vbox_cursor_cleanup_fb,
> > >   };
> > > +static struct drm_plane_state *vbox_cursor_atomic_duplicate_state(st=
ruct drm_plane *plane)
> > > +{
> > > +	struct vbox_cursor_plane_state *new_vbox_state;
> > > +	struct drm_device *dev =3D plane->dev;
> > > +
> > > +	if (drm_WARN_ON(dev, !plane->state))
> > > +		return NULL;
> > > +
> > > +	new_vbox_state =3D kzalloc(sizeof(*new_vbox_state), GFP_KERNEL);
> > > +	if (!new_vbox_state)
> > > +		return NULL;
> > > +	__drm_atomic_helper_plane_duplicate_state(plane, &new_vbox_state->b=
ase);
> > > +
> > > +	return &new_vbox_state->base;
> > > +}
> > > +
> > > +static void vbox_cursor_atomic_destroy_state(struct drm_plane *plane,
> > > +					     struct drm_plane_state *state)
> > > +{
> > > +	struct vbox_cursor_plane_state *vbox_state =3D to_vbox_cursor_plane=
_state(state);
> > > +
> > > +	__drm_atomic_helper_plane_destroy_state(&vbox_state->base);
> > > +	kfree(vbox_state);
> > > +}
> > > +
> > >   static const struct drm_plane_funcs vbox_cursor_plane_funcs =3D {
> > >   	.update_plane	=3D drm_atomic_helper_update_plane,
> > >   	.disable_plane	=3D drm_atomic_helper_disable_plane,
> > >   	.destroy	=3D drm_primary_helper_destroy,
> > >   	.reset		=3D drm_atomic_helper_plane_reset,
> > > -	.atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_state,
> > > -	.atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
> > > +	.atomic_duplicate_state =3D vbox_cursor_atomic_duplicate_state,
> > > +	.atomic_destroy_state =3D vbox_cursor_atomic_destroy_state,
> > >   };
> > >   static const u32 vbox_primary_plane_formats[] =3D {
> > > =

> > > base-commit: 3836b7fdfad40e2bac5dc882332f42bed6942cf4
> > > prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> > > -- =

> > > 2.30.0
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
