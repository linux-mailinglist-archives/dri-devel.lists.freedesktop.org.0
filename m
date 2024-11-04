Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5819BB4A0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 13:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE53310E433;
	Mon,  4 Nov 2024 12:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T6J/KPKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9637810E436
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 12:24:49 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539f72c8fc1so3155732e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 04:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730723088; x=1731327888; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WamoS/BgPz7m8LVkuxxtzepst1v3gBVxNsdSxv3r2v8=;
 b=T6J/KPKvPJuimOVmrefiBPxyBiLY6ewDBpPFqG0uvRkP/RRFPFw+1sajrGtWXWFmJX
 jD+B4hJsoa5NY2cOKwV5m7iVDoLQP5fgkr/ovJS/rOI66HNLmYk5QFKanKixAxcTksvX
 p3lGwMxZUsDokpM7nAuc1If/9u1mTZTpSiZRKBFFFyK3SsdaGcXYSBruYKbWQowuz1C9
 od6lQrxYggOQp4/3vqM9D7oaiVPbtwB8AQr22CV82z2bqe9WjTX3rqqF7bnWkRspoWUk
 H3Be/ZcAO0uOXdc1mUuBT+xAX82RrTtTip2VReUm3E0WVZiQKIUiIZ6DitfCDD/VXieX
 KqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730723088; x=1731327888;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WamoS/BgPz7m8LVkuxxtzepst1v3gBVxNsdSxv3r2v8=;
 b=m89MaxuUV2zoMVvOBMq59iMOHg7yNJJnNOE/ikx55mByjM9rnsiVfdxJtRie3q8c5s
 kCeT76meoec6D5n6+kQ8NAO+Pts4nXiqkZMsafkkP2MprQlOlzTwgwDhCkiIHgY7CcA8
 JkOa40fTrt1A+6dqKtO5l5n4ExaKG4UwQnqwCI6+7WuXgKH5tk+CXJ7XG5EBYpVH1LKE
 AnN31Uzkv5WLLGmOI4QJbfqnYU4jEInEvgByMgDp72IU/8Z4KBvK3F16OKxBrUpFB3Hi
 qELdMeZeCre20/ZcnkAgIjI2JK+VTFkALGJj3OimeZeYCuIMWpAbnY5vYM7szZ9wLJIU
 N/uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0igCtbfyxdGbfEidc2FRHS4vVEcddIY5al7Si3DesB9e/g8DgcDxHCjr0W6fQRVDr2CLvns5u10M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxijJPRpmeUn1LYhfwW8oVeDGc+haGRQYEPgG4h6fk1zNizdWTY
 5lhS7pDJcTlx6wJUvoY3UtwcNfze7US2JT5kyoZ/6TXqJ92h+p5StIFrnwjrcG4=
X-Google-Smtp-Source: AGHT+IEtBPydnkTY9XAl3wpUMUwj+iBOUPGy5O30ju0acWB7SwvbYZVi+55EBXKr6UE4cG8VsD+3aw==
X-Received: by 2002:a05:6512:350e:b0:53c:74dc:2252 with SMTP id
 2adb3069b0e04-53c74dc2378mr6549281e87.49.1730723087398; 
 Mon, 04 Nov 2024 04:24:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc95a6csm1666091e87.4.2024.11.04.04.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 04:24:46 -0800 (PST)
Date: Mon, 4 Nov 2024 14:24:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Arnd Bergmann <arnd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Arnd Bergmann <arnd@arndb.de>, Lucas Stach <l.stach@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx/dcss: include drm/drm_bridge.h header
Message-ID: <ix34xln3tl6l2h3jt7t4bhrydxfmh2m53dkl5rugxj335p7hgb@kfauvwrusipr>
References: <20241028163527.2425783-1-arnd@kernel.org>
 <2byo7263izup45hcdyoxr57sh2dzdasnwotpfqnayqe6znvzjt@adou6qmyhq6y>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2byo7263izup45hcdyoxr57sh2dzdasnwotpfqnayqe6znvzjt@adou6qmyhq6y>
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

On Mon, Nov 04, 2024 at 02:10:54PM +0200, Laurentiu Palcu wrote:
> Hi Arnd,
> 
> On Mon, Oct 28, 2024 at 04:35:07PM +0000, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Compile-testing random configurations leads to failures in
> > dcss-kms.c from a missing declaration:
> > 
> > drivers/gpu/drm/imx/dcss/dcss-kms.c:95:8: error: use of undeclared identifier 'drm_bridge_attach'
> >    95 |         ret = drm_bridge_attach(encoder, bridge, NULL,
> >       |               ^
> > drivers/gpu/drm/imx/dcss/dcss-kms.c:96:5: error: use of undeclared identifier 'DRM_BRIDGE_ATTACH_NO_CONNECTOR'
> >    96 |                                 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >       |                                 ^
> > 
> > Include the header directly.
> > 
> > Fixes: 004555a18d57 ("drm/imx/dcss: Allow build with COMPILE_TEST=y")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> Unfortunately, it appears I lost drm-misc push rights. Maxime, Thomas or
> Ville, can you help push this?

I can pick it up.

However I think it is:

Fixes: e7033bdfd43b ("drm/imx/dcss: use drm_bridge_connector API")

With that

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Thanks,
> Laurentiu
> 
> > ---
> >  drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > index 3ec721afc30c..63a335c62296 100644
> > --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> >  #include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_client_setup.h>
> >  #include <drm/drm_drv.h>
> > -- 
> > 2.39.5
> > 

-- 
With best wishes
Dmitry
