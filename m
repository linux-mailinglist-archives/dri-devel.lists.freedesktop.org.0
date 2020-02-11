Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB581158B5C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 09:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4FA6EE00;
	Tue, 11 Feb 2020 08:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001D56EE03
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 08:40:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y11so11144146wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 00:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Kj7xciG/TTqM/ZE2qXR/wKz4HZY6+8KwrA5Al7SDgrA=;
 b=SKx0PtZvxlM7Ny2VuDUjGTMeJEDJUjAzlgU4l4S6g4oUS8UwOD/yEw3+7r2ufCzXT2
 7KbLa4toh71ZcUWaGR+t6bCc8MwGZGwtsPgyDxo8b0Z67Yt5sAwIC7J/dDYRhT1iqR6u
 7iplSLuCngUVkgGbMnvJINJw00JZ8wVxFZe9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Kj7xciG/TTqM/ZE2qXR/wKz4HZY6+8KwrA5Al7SDgrA=;
 b=hE8UZIruttkZKXFA+wox+H0i//4g3KVV0E8hWfY06T6tAKaVCXCkjT3Ko/ReXyiUQV
 WQEZeI3eJN55Ha47YjZBE2Zj2xq3JXgXaHlcSkD0RMBgN+R+/0VIQNi5r4sFLprMqk2P
 9FR8Oke1WaI7gsdjKy6uiLyari1hEqMc6qFWdyxTjuvbjASDMg3PeeuQp7norZ2J2dtK
 yzOTSyxhx5lFCPHEcStZ8AuwzxrIwIWO+YMDn9xO5FRW3NUixvB6Va+X/n7CbB3HuI0Y
 a+jVj0zKQMftLpw+/ri1e8nn8muyQtH3/6nxLxbs+Pytm3E9AYCxdFXcOlAmyZI78DiG
 KSxA==
X-Gm-Message-State: APjAAAVqO7sz2xnfQGNF8kAu3Sshwpvg/vrKeAQDa8HmYrpO4Y7Ub5/1
 u3ZnG3qzs2PHkDExYcfs9cr8Y7Gf35k=
X-Google-Smtp-Source: APXvYqwWYjRXIXW0f2riBsOhu1LJgABv6043dIRK6dkWp7XbxX5UdgOG78YscJSXz71DAbuOfiD9Rg==
X-Received: by 2002:adf:f886:: with SMTP id u6mr7292938wrp.409.1581410436664; 
 Tue, 11 Feb 2020 00:40:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x14sm2670484wmj.42.2020.02.11.00.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 00:40:35 -0800 (PST)
Date: Tue, 11 Feb 2020 09:40:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix NULL ptr access in
 nv50_wndw_prepare_fb()
Message-ID: <20200211084034.GW43062@phenom.ffwll.local>
References: <20200210230943.2874-1-jajones@nvidia.com>
 <d40e1738-f313-e84d-8d4c-af5efd60aa93@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d40e1738-f313-e84d-8d4c-af5efd60aa93@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 06:28:47AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> I'm surprised that prepare_fb is called with fb =3D=3D NULL. But, OK

Yeah we don't filter that ... maybe an oversight? I'm not sure whether
there's any driver that needs to do something special for when the plane
is disabled here (since "plane off" iff "plane_state-fb =3D=3D NULL").

In general I think we have an awful lot of bugs in most drivers for the
case when the plane state is in the atomic commit, but not enabled.
-Daniel

> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> Thanks for the fix.
> =

> Am 11.02.20 um 00:09 schrieb James Jones:
> > This fixes a kernel oops when loading the nouveau
> > module with fb console enabled after the change:
> > =

> >   drm/nouveau: Remove field nvbo from struct nouveau_framebuffer
> > =

> > state->fb may be NULL in nv50_wndw_prepare_fb(),
> > so defer initializing nvbo from its obj[] array
> > until after the NULL check.
> > =

> > Signed-off-by: James Jones <jajones@nvidia.com>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/=
nouveau/dispnv50/wndw.c
> > index 4a67a656e007..68c0dc2dc2d3 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > @@ -490,7 +490,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struc=
t drm_plane_state *state)
> >  	struct nouveau_drm *drm =3D nouveau_drm(plane->dev);
> >  	struct nv50_wndw *wndw =3D nv50_wndw(plane);
> >  	struct nv50_wndw_atom *asyw =3D nv50_wndw_atom(state);
> > -	struct nouveau_bo *nvbo =3D nouveau_gem_object(fb->obj[0]);
> > +	struct nouveau_bo *nvbo;
> >  	struct nv50_head_atom *asyh;
> >  	struct nv50_wndw_ctxdma *ctxdma;
> >  	int ret;
> > @@ -499,6 +499,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struc=
t drm_plane_state *state)
> >  	if (!asyw->state.fb)
> >  		return 0;
> >  =

> > +	nvbo =3D nouveau_gem_object(fb->obj[0]);
> >  	ret =3D nouveau_bo_pin(nvbo, TTM_PL_FLAG_VRAM, true);
> >  	if (ret)
> >  		return ret;
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





> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
