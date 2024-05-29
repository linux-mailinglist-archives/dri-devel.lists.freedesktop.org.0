Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E398D3798
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 15:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB74C10ED61;
	Wed, 29 May 2024 13:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="daRBYpcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9161125DF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 13:28:49 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-529b4011070so2517060e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716989326; x=1717594126; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yDdiOo4TTHc8+02UhzIfTg8BY6rDz9ZcFTfXoUUsFkk=;
 b=daRBYpcZjjXgkOPIt4bm3e83dqqYd6PPXnN6GwrXcCcCPbL31p+0MxKnGUUfxki+N1
 W/qKsc2Rf9BRgX13tZ8DJ2QD7Ihzvi6nfWIS4Eh6wCAqMv5In2VVY48tlrLblbTsEwIB
 3nsXP++X0x484i5FPrAEpOfmwifWw0n0y7aN2ax+66S7QkLCOdtVNQCjpAXsPqqnak3c
 47LF/TfVKf3GMSNpuHx3eQU6XKrlLrYF+uvdumOq+rCgMWpOJBz5lWeif/BzoyXK0mUm
 erzR3VF6JU1r54mzqKuqjyD1bYnV7PPY6hWRQOaZ0MPI9dMOrb1Bqp/zG/dOb9D0s4zW
 +SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716989326; x=1717594126;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDdiOo4TTHc8+02UhzIfTg8BY6rDz9ZcFTfXoUUsFkk=;
 b=eFL8YtOFXfJ/0bhDjMZqVUgkbs1T9toVEg9Da7vrqbonUGzQygrtH1Q7Kq5ja3LATf
 FVzKQq1C6MXtQsyK1KSTcoykEagZVSrEzijU847MX6wYWSvZdlTzmd6PY4dC0p0U85wU
 SGAhSJe+VpZbVETar+61POhMDRc5UMHSoh1FtZWiZd/5AhswfoH8gG3qaNV/RlYcgeww
 rrmG7Om3ezrWjrfBzMsKTUaOSuf7PC0z8Jw1OkteORtWmerynngxb4e8f7L8Wdb6qYaQ
 y2sZXzxcVXntQKcVs++8AL9uP+tfiK8E48cTEKxSe0mHDxHMdUjceXE/Rojr8gW0RkYi
 pRcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrOTcddozInMY5itWYzye0jckF1rLHslIFfvVrqZMwAXYWzvUljr1MU3LtxleJpEaaF29LbIgygXHP/+OcVuyF3x+/dcMgBgK+u2fOvnNH
X-Gm-Message-State: AOJu0YyWUMtTAVgDn7Fu3gjpvZQByaNStd2UnYGixEW9Ke0bnAZD2hyC
 JGC6ZY2Gg7bWH6ssH6pYfc1m6wvh6zJPZI3d+s+D5k7it/QD6mR2IP+gGIOtfUo=
X-Google-Smtp-Source: AGHT+IFLMPmqAKOfphdtUmT6l702+ojk5IE/OhS7b48vue/u0Efwud+kumR1kaibNS2I9HIJTyjG0Q==
X-Received: by 2002:a05:6512:1309:b0:523:90df:a9c6 with SMTP id
 2adb3069b0e04-529661f2e0emr10272791e87.50.1716989326496; 
 Wed, 29 May 2024 06:28:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296e88781fsm1259436e87.4.2024.05.29.06.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 06:28:46 -0700 (PDT)
Date: Wed, 29 May 2024 16:28:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-ID: <ikryifdxh5hfbjl6c4yinyy52f2pr4pm4g4564jq4cob7ics2p@wa37stxn3sqm>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
 <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
 <20240529095506.GC19014@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529095506.GC19014@pendragon.ideasonboard.com>
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

On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
> On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
> > On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> > > Hi Dmitry,
> > > 
> > > On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> > > > > On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > > > > > Add support for the drm_panic module, which displays a message on
> > > > > > the screen when a kernel panic occurs.
> > > > > > 
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > Tested on Armadillo-800-EVA.
> > > > > > ---
> > > > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> > > > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > > > > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> > > > > >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > > >  };
> > > > > >  
> > > > > > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > > > > > +	.atomic_check = shmob_drm_plane_atomic_check,
> > > > > > +	.atomic_update = shmob_drm_plane_atomic_update,
> > > > > > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > > > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > > > > > +};
> > > > > > +
> > > > > >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> > > > > >  	.update_plane = drm_atomic_helper_update_plane,
> > > > > >  	.disable_plane = drm_atomic_helper_disable_plane,
> > > > > > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> > > > > >  
> > > > > >  	splane->index = index;
> > > > > >  
> > > > > > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > > > > > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > > > > > +		drm_plane_helper_add(&splane->base,
> > > > > > +				     &shmob_drm_primary_plane_helper_funcs);
> > > > > > +	else
> > > > > > +		drm_plane_helper_add(&splane->base,
> > > > > > +				     &shmob_drm_plane_helper_funcs);
> > > > > 
> > > > > It's not very nice to have to provide different operations for the
> > > > > primary and overlay planes. The documentation of
> > > > > drm_fb_dma_get_scanout_buffer() states
> > > > > 
> > > > >  * @plane: DRM primary plane
> > > > > 
> > > > > If the intent is that only primary planes will be used to display the
> > > > > panic message, shouldn't drm_panic_register() skip overlay planes ? It
> > > > > would simplify drivers.
> > > > 
> > > > What about the drivers where all the planes are actually universal?
> > > > In such a case the planes registered as primary can easily get replaced
> > > > by 'overlay' planes.
> > > 
> > > Good point.
> > > 
> > > Another option, if we wanted to avoid duplicating the drm_plane_funcs,
> > > would be to add a field to drm_plane to indicate whether the plane is
> > > suitable for drm_panic.
> > 
> > ... or maybe let the driver decide. For the fully-universal-plane
> > devices we probably want to select the planes which cover the largest
> > part of the CRTC.
> 
> Are there devices where certain planes can only cover a subset of the
> CRTC (apart from planes meant for cursors) ?

On contemporary MSM devices any plane can cover any part of the screen,
including not having a plane that covers the full screen at all.

> I think that what would matter the most in the end is selecting the
> plane that is on top of the stack, and that doesn't seem to be addressed
> by the drm_panic infrastructure. This is getting out of scope for this
> patch though :-)
> 
> > > I don't think this patch should be blocked just for this reason, but I'm
> > > a bit bothered by duplicating the ops structure to indicate drm_panic
> > > support.
> > > 
> > > > > >  
> > > > > >  	return &splane->base;
> > > > > >  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry
