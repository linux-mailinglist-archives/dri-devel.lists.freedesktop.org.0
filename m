Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133DE91C558
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10CC10ECEC;
	Fri, 28 Jun 2024 18:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SZ4CpFrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349010ECEC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:04:06 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ec6796f5a0so1498271fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719597844; x=1720202644; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SKg0QJJB4lFM+ISnwkgByTsWC7pIoB/PGLnQuYIeu2c=;
 b=SZ4CpFrYZDa1+g0rpMtuzgqtBnLT8McrlWB+YT0WKQSu1upTW4ZJ9puyqeFlsX26lE
 CpE9RK11qOnNquUUUwE3ChPQqNvWWBmMddL6w4MeVO9JWHlBKUiLRd2ZCuzeaJUA18jy
 bc/sIBA6bz0jVQGVdtw7s9wmrlps0tpsiyDvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719597844; x=1720202644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKg0QJJB4lFM+ISnwkgByTsWC7pIoB/PGLnQuYIeu2c=;
 b=sQzF0ThHMpOJ9lZEtSlQt1+98QhYReIuSZlpxr3ewNn/jgu1dp3o6tt4gWNe9Pa8se
 vZiuUoKSWx1ImVdMnhewylgxlabkrga0vtX+z00tGRaYrq6ODJ9Ww/VU+sKajfU61TVy
 9ZmLcFfAxOyeDUkTXLXYD3Ix3ah6J2Oj4um3fGQR3arzBl29On06gzJTUdcEzl3EQX4n
 hupiK7QoWXilXSe9n+tDfnUB/b9GKIVxZ18iaMokVyQgnaDBsOwcLqv1SOFZrdevTtUK
 FbVeOiaZUVemI5mXqB/GqUfzPxr+5CR6s5SdJg1fSAvAG7WNhtPIZ+CkNnZ+lcmrYh5I
 /khg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCAcEXyYbd3rC9eK2Qa4+6MqkXJrmIZgoHKjQpZkCV8MDJtU7YRo/b6lD3aYQmMGKApOEx3Bles++OoBOb3osnE7YmwlQ84VrCQwuHV8oc
X-Gm-Message-State: AOJu0Yy1Y6oR76mHAZajZZB4Lyf6jr2vfRaPKLx+rwwmUYhYiRIMmF+0
 qSnpzTlxFyxqWPAmCH7JIFZpNsk10W8QiHU78u5SSKAFt5aPknQmrY4Q2gmfgxY=
X-Google-Smtp-Source: AGHT+IFAV5XQTb6PMUFLgUr3TWBMyB3sfP52tHx0/Iz7PEXqrN1cmNf01NQTC7plc0GdDe6hN0+Nhg==
X-Received: by 2002:a2e:780b:0:b0:2ec:4a95:5f05 with SMTP id
 38308e7fff4ca-2ec561c0b33mr90601081fa.3.1719597844277; 
 Fri, 28 Jun 2024 11:04:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09a94csm44885975e9.33.2024.06.28.11.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 11:04:03 -0700 (PDT)
Date: Fri, 28 Jun 2024 20:04:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
Message-ID: <Zn77Ed4zXLIWSHkQ@phenom.ffwll.local>
References: <20240625131815.14514-1-tzimmermann@suse.de>
 <n22c255ozkpnbvt45ugfgpqyjmebmgsjblduwurf6yr7ralffd@yvbrl4rsabea>
 <e4fe3aab-0b3f-42dd-916c-db15dd6b7646@suse.de>
 <ZnxXGKXbVHUyXB3u@phenom.ffwll.local>
 <22840e56-fcd5-4953-b16c-4c1a173eab69@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22840e56-fcd5-4953-b16c-4c1a173eab69@suse.de>
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

On Thu, Jun 27, 2024 at 09:18:15AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.06.24 um 19:59 schrieb Daniel Vetter:
> > On Wed, Jun 26, 2024 at 11:01:11AM +0200, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 26.06.24 um 06:34 schrieb Dmitry Baryshkov:
> > > > On Tue, Jun 25, 2024 at 03:18:09PM GMT, Thomas Zimmermann wrote:
> > > > > The function drm_simple_encoder_init() is a trivial helper and
> > > > > deprecated. Replace it with the regular call to drm_encoder_init().
> > > > > Resolves the dependency on drm_simple_kms_helper.h. No functional
> > > > > changes.
> > > > > 
> > > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > ---
> > > > >    drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
> > > > >    1 file changed, 40 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> > > > > index 6695af70768f..2fd9c78eab73 100644
> > > > > --- a/drivers/gpu/drm/ast/ast_mode.c
> > > > > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > > > > @@ -45,7 +45,6 @@
> > > > >    #include <drm/drm_managed.h>
> > > > >    #include <drm/drm_panic.h>
> > > > >    #include <drm/drm_probe_helper.h>
> > > > > -#include <drm/drm_simple_kms_helper.h>
> > > > >    #include "ast_ddc.h"
> > > > >    #include "ast_drv.h"
> > > > > @@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
> > > > >    	return 0;
> > > > >    }
> > > > > +/*
> > > > > + * VGA Encoder
> > > > > + */
> > > > > +
> > > > > +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
> > > > > +	.destroy = drm_encoder_cleanup,
> > > > > +};
> > > > > +
> > > > >    /*
> > > > >     * VGA Connector
> > > > >     */
> > > > > @@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
> > > > >    	struct drm_connector *connector = &ast->output.vga.connector;
> > > > >    	int ret;
> > > > > -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
> > > > > +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> > > > > +			       DRM_MODE_ENCODER_DAC, NULL);
> > > > What about using drmm_encoder_init() instead? It will call
> > > > drm_encoder_cleanup automatically.
> > > IIRC the original use case for the drmm_encoder_*() funcs was to solve
> > > problems with the clean-up order if the encoder was added dynamically. The
> > > hardware for ast is entirely static and ast uses drmm_mode_config_init() for
> > > auto-cleaning up the modesetting pipeline. Using drmm_encoder_init() seems
> > > like a bit of wasted resources for no gain.
> > The idea of drmm_ is that you use them all. That the managed version of
> > drm_mode_config_init also happens to still work with the unmanaged
> > encoder/connector/crtc/plane cleanup is just to facilitate gradual
> > conversions.
> 
> Sure, I welcome using drmm_ everywhere. I just don't like the fine-grained
> release if that's unnecessary. What most DRM drivers need is in
> drmm_mode_config_init().

Why do you think drmm_mode_config_init is better?

My take is that the point of drmm and devres is that you have really
fine-grained release hooks, so that you never have to write hand-rolled
error handling code anymore. The issue is that when you then try to
combine that with bigger hammer methods like the cleanup callbacks in
drm_mode_config_cleanup, it won't work, because it will interleave
wrongly. And then you're back to hand-rolling all the cleanup code again.
It's a bit an all-or-nothing approach unfortunately, at least for a given
area.

At least my idea was to have drmm_mode_config_init as a transational
helper only, not as the endpoint. At least for anything the driver
allocates/initializes itself, there's still a bunch of things that need to
be cleaned up separately.

Or the other counterpoint: If the global release really is best, then
drm_driver->release is all that's ever needed, and the entire drmm_
infrastructure is kinda pointless. Which yes, strictly speaking it is, at
the cost of typing a lot of error paths.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
