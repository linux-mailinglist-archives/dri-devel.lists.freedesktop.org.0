Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066919F3030
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABB410E5E8;
	Mon, 16 Dec 2024 12:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XeTKW15b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46C610E5E5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 12:11:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so4042971e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 04:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734351105; x=1734955905; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QYJ6bHIynmrdW1kW95N7YBXu67T1wjVBtmzNbXMkjmY=;
 b=XeTKW15bcNMi/ipMzG+AQV+aabI1vWgMCS6VMJZ0YYko9zznE2tDIVWiQVsG8v3oV9
 yyw+TlWKxmsYOy14AuwZJxnMhqsIFrITP5nkvFZ3ZsuGTatSeb3JMXct2a3gVjyFgHpE
 U0wt155XM3RXxHkklZ90HeFzF1HWdewiOAfBj7QNR3d7b49arL5B32KA52krVIpbPiN1
 FdZkBBcNuTo5N5wn87Obi8/wGJmg3ZF6wOBMaBPChYquJF1ubImNlZvmg1E0oH3zU8ip
 Hhp2I1KRvBYdpCFepgCq6rDZI1+3OLyF1bK3OynVJvAo4yIZOsDJcbMoo8++4OU02mmb
 K9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734351105; x=1734955905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QYJ6bHIynmrdW1kW95N7YBXu67T1wjVBtmzNbXMkjmY=;
 b=dojtPhViuGinuLJc8EY7KORRm6fR0CdArFw4tnqTNS2jLSv7sS3SvmY6WZxvIp+4Kj
 U5XVvh+kTdlaIoa1nNtvr5D6vSIEfgM91qs+wzvKUQdeX7/LBBzcUQX/BhJRDzUnblbw
 +uwv5JxhdIxwdm1yYZZIPtDuhYq9nOIRhcuMgnKg8zvTMYjNiHgIfJXHJ5ZqfInWn7SK
 b8JqBNBYxI+L8wDC8SfAeQuUiey3KN63wfoxUxy/oSr16rYGNzKPNoy+Rnv2p+wNnA8H
 n+4yAlz/y9eeh61bJjg3t+21tLcX/itKvvNX0ZTNFecCMQf1p0eYxLN6czEOdj0F2LPl
 D52w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu+juNCr9Y9YV1LMx+gCXzxTk7z+ZcsFbPwAkWtFMNDHQwho0yKWdn1JVuz/ffDzHdmjyNEAR2fVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1GOiFQbxIZ7r/Pd3bqJ/CbCj8hqtA/y2WoRTbru56F80Fos6V
 3E+D/HscqQzBy140VhWSzoyExJkogHHk6NHBh0p4HNRM9wY7+ky+H/c9XzqmI+dLI8GUn0K6a/v
 V
X-Gm-Gg: ASbGncva5e7qFvvgOe36YNNzqAvSW/b6kh1Rr0AbHHplF8rcBrbInf+J4BMaSfg7q8L
 EAxIvbD16Lp+vnq9q/pKWAptP2fypkVsU83ZQIlt4ZJxuCs42xXjq+TCHqujKj0GBFRZVLPikDP
 6MG3QW8KrguTJ+UGa/7QT5UIICWjW+JWiLs82zv+jiNEX+TFOOOI6Z/WFc86NZHMRze3Xplv/xD
 ZN0Pmlapv6ZbxiJCyno7uDGUysPPXPLyUYAU11ldpFzawmVimKzMdJhs8kJM0oo+oi+/npvzibQ
 SB1c0ErRnjBFQHA1wApV6T2lh31rHbm5PXQm
X-Google-Smtp-Source: AGHT+IHrwRS1QfWMBwy9QLkErfwsKJMw9vVs4tgqRJfw5TQSQERm2FXX9oalBSjWvdHKRYw73Gk+nw==
X-Received: by 2002:a05:6512:308e:b0:540:3550:b1dd with SMTP id
 2adb3069b0e04-5408b800785mr4235963e87.3.1734351105082; 
 Mon, 16 Dec 2024 04:11:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13eb8sm822646e87.218.2024.12.16.04.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 04:11:43 -0800 (PST)
Date: Mon, 16 Dec 2024 14:11:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] drm/nouveau: remove drm_encoder_slave interface
Message-ID: <fw7i3kusogrrsslb5sjdid27uqnwey5qa5yhyrfa677n4iqqhq@tfh5s6bmqgna>
References: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
 <Z2ASy3TQ4suupdvd@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2ASy3TQ4suupdvd@cassiopeiae>
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

On Mon, Dec 16, 2024 at 12:45:15PM +0100, Danilo Krummrich wrote:
> On Sun, Dec 15, 2024 at 12:19:22PM +0200, Dmitry Baryshkov wrote:
> > The nouveau driver is the only user of the drm_encoder_slave interface.
> > Demote it from KMS helpers module to the nouveau driver itself, moving
> > corresponding I2C encoders to be handled by nouveau driver too.
> 
> I understand nouveau is the only driver using this interface (and the
> corresponding i2c encoders).
> 
> However, I'm not quite seeing the advantage of folding the interface (including
> the two i2c drivers) into nouveau. I don't think this legacy interface does harm
> the subsystem in any way / does prevent the subsystem from moving forward.
> 
> Can't we just keep it as it is?

Well, drm_encoder_slave is a part of the DRM KMS helpers module, so it
take (a little bit) of space on every system. The nouveau situation
isn't unique, other drivers (i915, ast) also incorporate the code for
I2C backends. For the further discussion see the thread starting from
Laurent's email ([1]).

[1] https://lore.kernel.org/all/20241117205426.GE12409@pendragon.ideasonboard.com/

> 
> > 
> > Ideally those two drivers should be converted to the drm_bridge
> > interface, but it's unclear if it's worth spending time on that.
> 
> Probably not.
> 
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Renamed symbols in defconfig (Laurent)
> > - Added missing Kbuild file (Laurent, LKP)
> > - Renamed guarding defines in include files.
> > - Dropped mentions of two removed functions.
> > - Link to v1: https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org
> > 
> > ---
> > Dmitry Baryshkov (2):
> >       drm/nouveau: incorporate I2C TV encoder drivers
> >       drm/nouveau: vendor in drm_encoder_slave API
> > 
> >  arch/arm/configs/multi_v7_defconfig                |   4 +-
> >  arch/parisc/configs/generic-32bit_defconfig        |   4 +-
> >  arch/parisc/configs/generic-64bit_defconfig        |   4 +-
> >  drivers/gpu/drm/Makefile                           |   1 -
> >  drivers/gpu/drm/i2c/Kconfig                        |  18 ----
> >  drivers/gpu/drm/i2c/Makefile                       |   6 --
> >  drivers/gpu/drm/nouveau/Kconfig                    |  20 ++++
> >  drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
> >  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  12 +--
> >  drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
> >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 +++---
> >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
> >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 ++-
> >  .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 ++++---
> >  .../dispnv04/nouveau_i2c_encoder.c}                |  85 +++++-----------
> >  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  20 ++--
> >  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
> >  .../gpu/drm/nouveau/include}/i2c/ch7006.h          |   4 +-
> >  .../gpu/drm/nouveau/include/i2c/encoder_i2c.h      | 109 ++++++++-------------
> >  .../gpu/drm/nouveau/include}/i2c/sil164.h          |   4 +-
> >  drivers/gpu/drm/nouveau/nouveau_connector.c        |   6 +-
> >  drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
> >  22 files changed, 172 insertions(+), 232 deletions(-)
> > ---
> > base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
> > change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9
> > 
> > Best regards,
> > -- 
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 

-- 
With best wishes
Dmitry
