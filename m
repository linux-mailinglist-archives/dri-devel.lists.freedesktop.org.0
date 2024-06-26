Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830D918DB3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 20:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BCE10E98A;
	Wed, 26 Jun 2024 17:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YXv4mA6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A89B10E98A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 17:59:57 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ec4e9075e0so5613481fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719424795; x=1720029595; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l1gR9k87cpjprKUd6S1b4h8CdiA2ZPeoW8a6vndP2xg=;
 b=YXv4mA6h6jg4jBdmgnsPOi02uwrg7T/3uhGus3oCvK3XvM+wXdEDDqy2veVeJVbdZv
 rgnb0PN5a0uEZhLnmv+Ue6nQUBFHzzpY6BdBuKINzYRhNtaKT+mnPuKtX5KcOnHMJRHR
 lLx46q7CzwkOE7G10oLaSHgBbrnCRR9rgcek4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719424795; x=1720029595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1gR9k87cpjprKUd6S1b4h8CdiA2ZPeoW8a6vndP2xg=;
 b=LyPXNiLWjzLvs3aLhx5Qeq/ylzPPX/GsIXez0OZw04BzpslP8kWTHwEbTKERuERiGz
 b9Z1qZENu5kr44MkT0xrdSghF1pydHis0vt4Ykj90SDUm12HHXqE/449Cp0p0Sl4TamO
 KtDk+UNoVmQ/C/DsEZ8hai7AP7uBTNCncddLJ2f5g38XROsI4OZW0xhWHpxY+czrUUa/
 x9aXPqhscyCqymaWaz8rMF5S8O8LjlbZlkgzJuSJvD6/SlEfe2f9aSEKELmAV9IsasBQ
 d3KBlwbwaFUxEBUeJjSPTF+4cYynsnycb1EJffXCto3SFal5Fos7u7eSN0LJDye7eQSy
 czPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhkuYduicDDiDiB5r4JrtGS0YjlX5d//TjOuq0mWi3MR8Xxh/ymtk5piGgC+WkvAhfVspT9L3uQ5ShgyHwbOgwHK+hpaReSIu52AVqMlBK
X-Gm-Message-State: AOJu0YzdOorOpq/9rLe7SD4J49EDrv+n4gKmC/ceS7l4dvg5g+MwfIu+
 H8j/LbbuQ+OHj+sLgXaY2pz/uHVyJimg4ehhT/zr2rqdEwlkVTncg3zPTlbI1AFw+PCAFzIAatG
 9NM4=
X-Google-Smtp-Source: AGHT+IFCArjHAro6TT8r4NRHepiKXhu63M9wehq5ZaXVnRg6uKCf4zjbayJRCgy7ddeplsnYLPvJWw==
X-Received: by 2002:a05:651c:b0a:b0:2ec:5258:e89b with SMTP id
 38308e7fff4ca-2ec561af089mr102605911fa.3.1719424795025; 
 Wed, 26 Jun 2024 10:59:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424a2ad794fsm39909285e9.1.2024.06.26.10.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 10:59:54 -0700 (PDT)
Date: Wed, 26 Jun 2024 19:59:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
Message-ID: <ZnxXGKXbVHUyXB3u@phenom.ffwll.local>
References: <20240625131815.14514-1-tzimmermann@suse.de>
 <n22c255ozkpnbvt45ugfgpqyjmebmgsjblduwurf6yr7ralffd@yvbrl4rsabea>
 <e4fe3aab-0b3f-42dd-916c-db15dd6b7646@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4fe3aab-0b3f-42dd-916c-db15dd6b7646@suse.de>
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

On Wed, Jun 26, 2024 at 11:01:11AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.06.24 um 06:34 schrieb Dmitry Baryshkov:
> > On Tue, Jun 25, 2024 at 03:18:09PM GMT, Thomas Zimmermann wrote:
> > > The function drm_simple_encoder_init() is a trivial helper and
> > > deprecated. Replace it with the regular call to drm_encoder_init().
> > > Resolves the dependency on drm_simple_kms_helper.h. No functional
> > > changes.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
> > >   1 file changed, 40 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> > > index 6695af70768f..2fd9c78eab73 100644
> > > --- a/drivers/gpu/drm/ast/ast_mode.c
> > > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > > @@ -45,7 +45,6 @@
> > >   #include <drm/drm_managed.h>
> > >   #include <drm/drm_panic.h>
> > >   #include <drm/drm_probe_helper.h>
> > > -#include <drm/drm_simple_kms_helper.h>
> > >   #include "ast_ddc.h"
> > >   #include "ast_drv.h"
> > > @@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
> > >   	return 0;
> > >   }
> > > +/*
> > > + * VGA Encoder
> > > + */
> > > +
> > > +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
> > > +	.destroy = drm_encoder_cleanup,
> > > +};
> > > +
> > >   /*
> > >    * VGA Connector
> > >    */
> > > @@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
> > >   	struct drm_connector *connector = &ast->output.vga.connector;
> > >   	int ret;
> > > -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
> > > +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> > > +			       DRM_MODE_ENCODER_DAC, NULL);
> > What about using drmm_encoder_init() instead? It will call
> > drm_encoder_cleanup automatically.
> 
> IIRC the original use case for the drmm_encoder_*() funcs was to solve
> problems with the clean-up order if the encoder was added dynamically. The
> hardware for ast is entirely static and ast uses drmm_mode_config_init() for
> auto-cleaning up the modesetting pipeline. Using drmm_encoder_init() seems
> like a bit of wasted resources for no gain.

The idea of drmm_ is that you use them all. That the managed version of
drm_mode_config_init also happens to still work with the unmanaged
encoder/connector/crtc/plane cleanup is just to facilitate gradual
conversions.

And see my other reply, for drmm_encoder_init supporting the NULL funcs
case actually makes full sense.

Also, any driver can be hotunbound through sysfs, no hotunplug of the hw
needed at all.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
