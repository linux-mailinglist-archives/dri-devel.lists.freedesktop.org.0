Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF59F3105
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D1710E1C7;
	Mon, 16 Dec 2024 12:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qns1yF1Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BBB10E1C7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 12:59:05 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so4468921e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 04:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734353943; x=1734958743; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TVuB3oapyzQ+WabPFqKkBmsN+XaTc6foo/uBq/7dt04=;
 b=Qns1yF1QRV1qSlHrrhU3DNZPOmwAPd4uOvq7QRO1gV41xW8Gq4xJT7tjhQKkBagJph
 2NsdJ8vuPYiG1gJmMfp3mpzFKU6hFoCJrjVtt8HeVd9KJgutJB3waUjKkjU14jBI7pPL
 VoFBK9tTEuomNl3lY4c8fm6SmkrivthMw+fiwuFjA0qkowX9h0II6GZVPQU5gsO+O9Pg
 eb7yY/mL4RrsCog4EuGRkRmREK7hpEzv8Q2CQGmt+ioddTGkWIq8pnTgCpjacjDm729s
 tgBRrSAJNwTEm90Ej5Z7vCSEgiE8vt2Nq+bXQjjtd7ayZkYy9xUpcYlKUUGFihfRzpFm
 /WHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734353943; x=1734958743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TVuB3oapyzQ+WabPFqKkBmsN+XaTc6foo/uBq/7dt04=;
 b=YG9nboK4jSCPyhkdzA3Py5a5ZNRt7NbdS117POV/+t+ND0RsI0azQEctYaW6D+XbIy
 SceJf8ELKbtadiGNuCEr80gXNOpJ7jPQP5NE/b2g5djuWfDPZzR41EAOtIwKrx7cOf38
 afpGIZ1HqlwXAH9Ixw4cPYP8qVCFI4jX7N/zyMTSw8AsUaEvXTHtBXXm6vwmvSmBHbU4
 /ac/EIMe4QmI1a+9MkT8LzCc8x/FwvzgN5V6LV2vvn+9lQbeZ7TkaOMSxBMoIRKAua3P
 mPWNbkBWG1SzmHDiArIl15+fygX/Ds5A7Odgj3EIfJne5dOIuPi8g6xj+HLTaPkZdJ9J
 AeHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgK2ed32s33ycIo0QiEdtgLwOyXwCc4wlvd6AohYkTfBPZSPySfAwoQ+rosTFA216Qb0yTV2eDVN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEKw2rOW82s0QF3/rr7qtbsHBeDsxwlxEXMyAwjebOgPXrUpAE
 e/9XMipIGd0opIttoV4WayN3iDCSh1hoTBAGo6HVNZZb6ZW7gdWFaeIAYpxBrZg=
X-Gm-Gg: ASbGnctenmkWC1vyVLlqAEbUei+WcHATPOfy07LiLIY+ayPYS0CRZwlmygJ0DyN8QbR
 PRaQsROl2K6bGMjDeQWAN9BgVj0K2D9XsRi83MVm9iHTGnmJpNBYcINbXyjrY9f75eJJlW/YEgn
 fNsn2QKvN3M+3XOPvoCWuAFWeDAsmwmALueoNr1zPVscuF+TBwhGRtC7BOBfnTYU7VFNdFHpgu9
 1U5zzL6nxHONBTOto3ewJYddMBEJ1kNdQMCL8uQqBSdYa1SRArBIbXAS/gWSCohkm3YDICZzdl5
 9MhB0H3coAdOTIMskzLubt1Kxc9Zd/K0LIFE
X-Google-Smtp-Source: AGHT+IG3chtNkwEjewlJ7p/muv4mfFjLOsomSWhSVXAb0PK0zkdUgPizAruVdCjqh080agAIFaBnNQ==
X-Received: by 2002:a05:6512:1191:b0:540:2533:436e with SMTP id
 2adb3069b0e04-540905aacb4mr4442478e87.37.1734353943338; 
 Mon, 16 Dec 2024 04:59:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303440452a8sm9240921fa.40.2024.12.16.04.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 04:59:02 -0800 (PST)
Date: Mon, 16 Dec 2024 14:58:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm/nouveau: remove drm_encoder_slave interface
Message-ID: <2p2rx6zmuph4bdwjork5aqp5n3xkho7cohapvgfijka64vbpop@nse4i55pkyy7>
References: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
 <Z2ASy3TQ4suupdvd@cassiopeiae>
 <fw7i3kusogrrsslb5sjdid27uqnwey5qa5yhyrfa677n4iqqhq@tfh5s6bmqgna>
 <20241216121651.GP32204@pendragon.ideasonboard.com>
 <Z2AgFHV2BaaZYGTx@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2AgFHV2BaaZYGTx@cassiopeiae>
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

On Mon, Dec 16, 2024 at 01:41:56PM +0100, Danilo Krummrich wrote:
> On Mon, Dec 16, 2024 at 02:16:51PM +0200, Laurent Pinchart wrote:
> > On Mon, Dec 16, 2024 at 02:11:41PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Dec 16, 2024 at 12:45:15PM +0100, Danilo Krummrich wrote:
> > > > On Sun, Dec 15, 2024 at 12:19:22PM +0200, Dmitry Baryshkov wrote:
> > > > > The nouveau driver is the only user of the drm_encoder_slave interface.
> > > > > Demote it from KMS helpers module to the nouveau driver itself, moving
> > > > > corresponding I2C encoders to be handled by nouveau driver too.
> > > > 
> > > > I understand nouveau is the only driver using this interface (and the
> > > > corresponding i2c encoders).
> > > > 
> > > > However, I'm not quite seeing the advantage of folding the interface (including
> > > > the two i2c drivers) into nouveau. I don't think this legacy interface does harm
> > > > the subsystem in any way / does prevent the subsystem from moving forward.
> > > > 
> > > > Can't we just keep it as it is?
> > > 
> > > Well, drm_encoder_slave is a part of the DRM KMS helpers module, so it
> > > take (a little bit) of space on every system. The nouveau situation
> > > isn't unique, other drivers (i915, ast) also incorporate the code for
> > > I2C backends. For the further discussion see the thread starting from
> > > Laurent's email ([1]).
> > > 
> > > [1] https://lore.kernel.org/all/20241117205426.GE12409@pendragon.ideasonboard.com/
> 
> The drm_encoder_slave code it's rather small, but I guess this can be used as
> argument for both, keeping it where it is and moving it.
> 
> If you want to move it to nouveau, I'm not going to object. But please fold the
> helper code, such that we aren't left with unused functions and unnecessary
> function pointer indirections through struct drm_encoder_slave_funcs.

This is more or less what I've done. Or would you prefer to keep the
wrapping functions that just execute the callback? I can change the
patchset accordingly.

> 
> > 
> > It's also a question of whether maintenance of this code based used by
> > the nouveau driver only should be the responsibility of the drm-misc
> > community or the nouveau driver maintainers.
> 
> Good question. It's common infrastructure; do we expect / require the last user
> of such infrastructure to take ownership?

Unfortunately it's more like 'the only one' :-( In other words, if we
were expecting other users, there would not be such a move. But
hopefully all new drivers will use bridges infrastructure.

> 
> > 
> > > > > Ideally those two drivers should be converted to the drm_bridge
> > > > > interface, but it's unclear if it's worth spending time on that.
> > > > 
> > > > Probably not.
> > > > 
> > > > > 
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Renamed symbols in defconfig (Laurent)
> > > > > - Added missing Kbuild file (Laurent, LKP)
> > > > > - Renamed guarding defines in include files.
> > > > > - Dropped mentions of two removed functions.
> > > > > - Link to v1: https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org
> > > > > 
> > > > > ---
> > > > > Dmitry Baryshkov (2):
> > > > >       drm/nouveau: incorporate I2C TV encoder drivers
> > > > >       drm/nouveau: vendor in drm_encoder_slave API
> > > > > 
> > > > >  arch/arm/configs/multi_v7_defconfig                |   4 +-
> > > > >  arch/parisc/configs/generic-32bit_defconfig        |   4 +-
> > > > >  arch/parisc/configs/generic-64bit_defconfig        |   4 +-
> > > > >  drivers/gpu/drm/Makefile                           |   1 -
> > > > >  drivers/gpu/drm/i2c/Kconfig                        |  18 ----
> > > > >  drivers/gpu/drm/i2c/Makefile                       |   6 --
> > > > >  drivers/gpu/drm/nouveau/Kconfig                    |  20 ++++
> > > > >  drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
> > > > >  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  12 +--
> > > > >  drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
> > > > >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 +++---
> > > > >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
> > > > >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 ++-
> > > > >  .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 ++++---
> > > > >  .../dispnv04/nouveau_i2c_encoder.c}                |  85 +++++-----------
> > > > >  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  20 ++--
> > > > >  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
> > > > >  .../gpu/drm/nouveau/include}/i2c/ch7006.h          |   4 +-
> > > > >  .../gpu/drm/nouveau/include/i2c/encoder_i2c.h      | 109 ++++++++-------------
> > > > >  .../gpu/drm/nouveau/include}/i2c/sil164.h          |   4 +-
> > > > >  drivers/gpu/drm/nouveau/nouveau_connector.c        |   6 +-
> > > > >  drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
> > > > >  22 files changed, 172 insertions(+), 232 deletions(-)
> > > > > ---
> > > > > base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
> > > > > change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart

-- 
With best wishes
Dmitry
