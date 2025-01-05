Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0BA01C57
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 00:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8F510E53C;
	Sun,  5 Jan 2025 23:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kht5QGRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AF010E53C
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 23:00:27 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aaf8f0ea963so637317766b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 15:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736117966; x=1736722766; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tD+nEPvvIEaGbn22NVIlVcjMG0Dcwr6jNhSFSjfdD9Y=;
 b=kht5QGRDJb/BF7e0rnc6CzYxx/MG3brG7H07Oz7sr1ls/7ee2eccrBrOxD2qrhkgtX
 j/8U4CNKWGeqKrEE+LeJIBQt4899ykoHKx9TXxrMMECxxdXQ9E1obNI6el0ih2ukF8Yi
 Pw4RfvJRhv8K903S+/HpAnllRxOj504mDU/xdUmg4676vQYbtGvE0C4FWlq+Kfm5C6fS
 /x2Y9zlcTEXRyZScN6QASEJfVOlRBtLKyg+WvbB4r5L2fwhC7hYow0/IkyKzL7D8BVAm
 EFGp0Xtcqt7D3JAY34DC0soKYa2CEWLio5R165pfYHVV34g4ljgKlty0hA1ryzRLbkMl
 XceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736117966; x=1736722766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tD+nEPvvIEaGbn22NVIlVcjMG0Dcwr6jNhSFSjfdD9Y=;
 b=i0aqmVz/jwgwFvAzaJYTtdgaNmSMfjDxs2BL/GwnkXJ+rcadSUfvb5Nvj7b2MDiGxq
 zIKYGXvhAAnhNLtBS6iMyZssyZs6beRbbMTo2w4yXY3u6+nwdBGBRrMar5c3gvvhE+w8
 c61qtqideQUDFyD0JJ7oetFUwLJixryAHZ+NKecfcRIi8eU78vbR273YN4w2EMl7zfSh
 KDJfa1phXeYJRyZ2PB+Zs+hxGIZrOPRwop2XNL/ubv0W6fjH0MyNKpxYxne+5FWhHDL3
 bXYE1DFux4yN38jEmHJLBvrOdgayLciaHpNB789oFrMbdbzYsVfzrve0MTUF4gV3k9vf
 fEiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTNmqvPZuHXDlcFtKLKjEssfVdQ0UKhHhLQ7yk3Rpua2IG4nBJy1fANnqgAV1Vh6BO9XLDZ8ecmr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybyQ5eN2WoN3Sxg9XO0+jzWB9MGE14bwaKPGvYy9nwy5uA8Z6I
 lk7IllLTObaWNex4tAt67gsTNXlgNIlz3hBWyUgTiXUSfFP1vHyf8mX9MpALRedN3pX+7Wmo9rE
 ixcI=
X-Gm-Gg: ASbGncu6RyOJhWTGk902hYA31bHPwqW18sztlPW4WH4RKxP6cLt/pwL+tcw3A48+OiE
 TafBxm+AqIy1gKuyTXsucuKXORYp1zUuhh6JFNSvGz25p5IiZXqAMo2LMz27TVQ/s3uQ3PmRMgZ
 4mwsIzgr4akMiNaM2wxsWR+zzMIuU3Q27V7oRqmfy/vBtAqd4p5vMai1TrINsXDyqeetDLz+ErU
 MOtayHYUCu3YxkNdtPFhkSgJlCmNjEXbE1acQy3vneqZLyHW8UUSxBjPQ+wzCmSfa40Yprq8zG3
 mh4HiPPX1u01GKLr5M+v+l8nI68fXhCD4P9h
X-Google-Smtp-Source: AGHT+IGhkunZgVbzgl9NpO29d/w/Fiaxi8BroUeDse0dwcZ4w/3/o9P7iDaakVGQZz+uFOhWwW3VPg==
X-Received: by 2002:ac2:5691:0:b0:542:6fcd:50ed with SMTP id
 2adb3069b0e04-5426fcd530dmr2411524e87.51.1736117579298; 
 Sun, 05 Jan 2025 14:52:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832073sm4834686e87.260.2025.01.05.14.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 14:52:57 -0800 (PST)
Date: Mon, 6 Jan 2025 00:52:55 +0200
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
Message-ID: <7wbji44qivubkwrbvrdck7fxsl5oaljugzy4td6xywr2p5ug7p@snrr6en5cuh7>
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

A possibly better option is to move tsa9950.c to drivers/media/cec/i2c/
next to ch7332 CEC driver. WDYT?

If I don't get any response from Russell within the next few days, I
think I'll post v2 performing these two moves: tda9950 to
drivers/media/cec/i2c and tda998x to drivers/gpu/drm/bridge without the
tda/ subdir.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

-- 
With best wishes
Dmitry
