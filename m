Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4BF91A0C0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 09:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5E910EA56;
	Thu, 27 Jun 2024 07:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fidU3Dyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B937510EA56
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 07:47:08 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-424a4bc95f3so2820585e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 00:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719474427; x=1720079227; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=STjCg27igSBRRBhJxgT1qYXATxADzHDAs8ogX3FjP0Q=;
 b=fidU3Dyu2NU29TtSoJvBj7AhVLCJl8mzJLi03ZKtfugcW+WafJdzOyOSA9KfNASCpb
 IM7IDnjDLrsjPgpwXCUuKRVrwHNduuEHhgnEEiCueeKBwhSyKE0/gNP1YLY0kJmPmJFV
 pkr+sp/14q8Jgb5AIbTcRxRxkFOmfAcNhcgOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474427; x=1720079227;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STjCg27igSBRRBhJxgT1qYXATxADzHDAs8ogX3FjP0Q=;
 b=DLSLVE9BccVa2ck+lIEJFEs1hiVyypDFQ+FT9kF5WwounM4aaXeuYpMtXq1cruEOOs
 1Z1x9jhCEi482Gthd6rBHrb6hRcGXdxgLVGPyLxNah8y89ssIrpL53CcnBshzvkZ9sxf
 7FBl3HfQyllsWn8InE59sVDodmA5E1sTHwwgdx65uof39q0AkNa1EYcCUsNV3cjCXjYm
 qKG/ZH+9FxFKklyaO4YLRquhqQNPB6ElvgSMxu5v84RhFAwUAjPsp85X5KDJ+/VzT7lx
 pufoEW+noUBUCE/CLKXonLrEHAdCTtSkbTkSHA4cwtadU3QIIEIkYSAJdkXbdTNkKRPy
 pe2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSxaI9fWavj2b1IikZXxfMLXe+QohWSuwVXKUjMb9WBJoBhLeIGhFzsQ40TSWm8XASBVX3IzVm3aXj6Pwqo1/fa911xY2F+ad7Ucsg6Duv
X-Gm-Message-State: AOJu0YyNSq8u88ldKuqXP1JpXhrW7PIzfiO8jRwdwP2u0VrA7tgVdz5G
 ts244QCprBal1AHZijRdz74RQGwoovn5v9O3mSZ5czPK2/Ipol3xl/V+jxVBspA=
X-Google-Smtp-Source: AGHT+IHGvv5nGROs5JHiK3LeX9bsmqIa0oP9yGOtj4WQj3eSTVy8nhy8iCIPSpg5Zra19bRJVod3nQ==
X-Received: by 2002:a05:600c:4aa9:b0:425:5ed5:b416 with SMTP id
 5b1f17b1804b1-4255ed5b5edmr28490935e9.1.1719474426737; 
 Thu, 27 Jun 2024 00:47:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bb6d4asm13604025e9.36.2024.06.27.00.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:47:06 -0700 (PDT)
Date: Thu, 27 Jun 2024 09:47:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
Message-ID: <Zn0Y-L8i_8V-F92H@phenom.ffwll.local>
References: <20240625131815.14514-1-tzimmermann@suse.de>
 <n22c255ozkpnbvt45ugfgpqyjmebmgsjblduwurf6yr7ralffd@yvbrl4rsabea>
 <e4fe3aab-0b3f-42dd-916c-db15dd6b7646@suse.de>
 <ZnxXGKXbVHUyXB3u@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnxXGKXbVHUyXB3u@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, Jun 26, 2024 at 07:59:52PM +0200, Daniel Vetter wrote:
> On Wed, Jun 26, 2024 at 11:01:11AM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 26.06.24 um 06:34 schrieb Dmitry Baryshkov:
> > > On Tue, Jun 25, 2024 at 03:18:09PM GMT, Thomas Zimmermann wrote:
> > > > The function drm_simple_encoder_init() is a trivial helper and
> > > > deprecated. Replace it with the regular call to drm_encoder_init().
> > > > Resolves the dependency on drm_simple_kms_helper.h. No functional
> > > > changes.
> > > > 
> > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > ---
> > > >   drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
> > > >   1 file changed, 40 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> > > > index 6695af70768f..2fd9c78eab73 100644
> > > > --- a/drivers/gpu/drm/ast/ast_mode.c
> > > > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > > > @@ -45,7 +45,6 @@
> > > >   #include <drm/drm_managed.h>
> > > >   #include <drm/drm_panic.h>
> > > >   #include <drm/drm_probe_helper.h>
> > > > -#include <drm/drm_simple_kms_helper.h>
> > > >   #include "ast_ddc.h"
> > > >   #include "ast_drv.h"
> > > > @@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
> > > >   	return 0;
> > > >   }
> > > > +/*
> > > > + * VGA Encoder
> > > > + */
> > > > +
> > > > +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
> > > > +	.destroy = drm_encoder_cleanup,
> > > > +};
> > > > +
> > > >   /*
> > > >    * VGA Connector
> > > >    */
> > > > @@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
> > > >   	struct drm_connector *connector = &ast->output.vga.connector;
> > > >   	int ret;
> > > > -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
> > > > +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> > > > +			       DRM_MODE_ENCODER_DAC, NULL);
> > > What about using drmm_encoder_init() instead? It will call
> > > drm_encoder_cleanup automatically.
> > 
> > IIRC the original use case for the drmm_encoder_*() funcs was to solve
> > problems with the clean-up order if the encoder was added dynamically. The
> > hardware for ast is entirely static and ast uses drmm_mode_config_init() for
> > auto-cleaning up the modesetting pipeline. Using drmm_encoder_init() seems
> > like a bit of wasted resources for no gain.
> 
> The idea of drmm_ is that you use them all. That the managed version of
> drm_mode_config_init also happens to still work with the unmanaged
> encoder/connector/crtc/plane cleanup is just to facilitate gradual
> conversions.
> 
> And see my other reply, for drmm_encoder_init supporting the NULL funcs
> case actually makes full sense.
> 
> Also, any driver can be hotunbound through sysfs, no hotunplug of the hw
> needed at all.

I pondered this some more, I think we could embed the drmm tracking
structure into struct drm_encoder (and anywhere else we need one), which

- would mean a lot of the drmm_ versions again get a void return value,
  like their non-managed counterparts.

- we could truly roll out drmm_ versions everywhere and deprecate the
  unmanaged ones in a lot more cases, since drivers like ast could then
  also use it.

I'm not sure this is a bright idea at scale, since devm_ doesn't do it
afaik. But maybe we should just try.

Thoughts?

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
