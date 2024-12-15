Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F19F2424
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 14:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B6710E0D5;
	Sun, 15 Dec 2024 13:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HjRy0Yfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22FC10E0D5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 13:12:56 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so3310091e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 05:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268375; x=1734873175; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=buehLmGwnFS3OEkRMAySuSf7R4pwRpR3p0736Fbhkb4=;
 b=HjRy0YfyOVd8XpG7i67OrJ3w0Wm1hsqsi7mwkcIb3wJCdjbfcholq1lmYvkaVA3FRD
 PmvB7Y0nC24SikC1hGWXrgYCfQXuiXX0ALi4s11tqc/86q0D6PwFoUzU2PCKrIcau4BN
 i87S57tN6pPWXo50qgZtpkxq7/7Qf5pwVIbuFQMsDaKlUYk2fmiNjXv/bkO/HXHVE1q6
 kWAsvGfE9rnQjxVOma1CIsFCQ3nVQsBH2Vr/Faogalp7o2aRsZT3A9v3BluDtWlr33Yf
 X2ZvV82uNgM9d0Nf8i73CkewdxW06NgOcOPg+NwZPzxoYimMmH26lXeDU5Q03nm5jGZ8
 tMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268375; x=1734873175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buehLmGwnFS3OEkRMAySuSf7R4pwRpR3p0736Fbhkb4=;
 b=o8OSj5v8f8rnd5pCgG7k4Jrr3MASko7OwPdfSVmgjqrIQW5PUQ8BUMegNyD0qtqR0p
 bEhuVN/mt9tGv0mBOloE6OxmTDuJBykurtcPb0k93IUp12xMUiZC4l3breJSNZ/fMpXQ
 zJgqpoTY2aSRYWrZySZZDZLw/QHozajO9LOp3bPWhdnWLCQ3bSf2kcXkHGdhiEfwKF9z
 SdSo1XjPAwvxjvBjgfHH+2ZDxayR1+FmfEhgMwcO6LCrlYd/6LH1wHos5lYVzKAAC+zG
 ut2iFDdenb8MgrsyCZIvzNB2cTf1VI1s8PmPSvVK2thdkqT/RkuyZrMKv1hNvAHOYHmD
 qHVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSMAExnNbq1KftUM6mAdW1B9OJFQJOv19HJ9RBSsIT21b0he4gXfTxU/wOBgHGxM5+/uyINoz+Kx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2Pu4nvz7fc26NK54yVOlQl3fKKeQCQIMQp2uV/IkLgL0rgBqz
 BV2HgToO3rtCPBLf6pokT1E6zqQGcgTtZhXTX0UYcImITE1NLpGl2o7fKEYGMfY=
X-Gm-Gg: ASbGncvUMWI4hcXPS5/byIdL78i77SlZFP8FEO6DDQXqqycBYLVoVvE4e0M4wqh7DFt
 ERmjFC7KF03GXAUMaYDsOMQIYRS+wr9VKLuGHOev0vEuaR44ELBSfg2PKnH2ijh8KNwFBsBlXO+
 lm52kI1iPHscvYLBVl6FIJ9NUa//bBsrVmNtVOWvUuQktczp9l9qKywCqgS+a8FOfNyDj552JQu
 K23Lf/v+msIH1d6W1PZRdnqE7SjnoQ7eQY5ISklJYROTZlEEJwbhQTF0k9nUlfmy1ev+E5z1sxT
 dtgLuUESW7gBXxXjmo4cxTG+k6GuZz5hsVV8
X-Google-Smtp-Source: AGHT+IE5nPGTX/q1n9o9XkE8kqPf6xHzAi85QGGVhuxA9aSG4CES2IXluTi/4Tyi13PULwO/mLcgrQ==
X-Received: by 2002:a05:6512:3dac:b0:540:1d58:da75 with SMTP id
 2adb3069b0e04-54090553c90mr2447568e87.14.1734268374981; 
 Sun, 15 Dec 2024 05:12:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13d69sm497511e87.217.2024.12.15.05.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:12:53 -0800 (PST)
Date: Sun, 15 Dec 2024 15:12:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i2c: move TDA drivers under drivers/gpu/drm/bridge
Message-ID: <opsai3edlx4cyt3vi3h2pjakh6yqozca7xl6ytseczkrgwbbxh@vyhz7i4yec6d>
References: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
 <20241215-drm-move-tda998x-v1-2-7817122b1d73@linaro.org>
 <20241215123805.GB25852@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215123805.GB25852@pendragon.ideasonboard.com>
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

On Sun, Dec 15, 2024 at 02:38:05PM +0200, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> Thank you for the patch.
> 
> On Sun, Dec 15, 2024 at 01:09:08PM +0200, Dmitry Baryshkov wrote:
> > TDA998x is the HDMI bridge driver, incorporating drm_connector and
> > optional drm_encoder (created via the component bind API by the TICLDC
> > and HDLCD drivers). Thus it should be residing together with the other
> > DRM bridge drivers under drivers/gpu/drm/bridge/.
> > 
> > TDA9950 is an I2C-CEC translator, being present on-die on the TDA9989
> > and TDA19989 chips, so it is being instantiated by the TDA998x driver.
> > Move it together with the TDA998x under bridge drivers subdir.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  MAINTAINERS                                       |  2 +-
> >  drivers/gpu/drm/arm/Kconfig                       |  1 +
> >  drivers/gpu/drm/bridge/Kconfig                    |  2 ++
> >  drivers/gpu/drm/bridge/Makefile                   |  1 +
> >  drivers/gpu/drm/bridge/tda/Kconfig                | 13 +++++++++++++
> >  drivers/gpu/drm/bridge/tda/Makefile               |  4 ++++
> >  drivers/gpu/drm/{i2c => bridge/tda}/tda9950.c     |  0
> >  drivers/gpu/drm/{i2c => bridge/tda}/tda998x_drv.c |  0
> 
> I probably wouldn't have created a tda/ subdirectory in bridge/, but I
> don't mind much either way.

I created it mostly because tda9950 isn't a bridge. It's a CEC driver
that works in pair with the tda998x driver.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
With best wishes
Dmitry
