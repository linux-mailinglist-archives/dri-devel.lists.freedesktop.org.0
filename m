Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20198C0079
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 16:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EE51123CB;
	Wed,  8 May 2024 14:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h4tjao93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964FD10FD87;
 Wed,  8 May 2024 14:53:13 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1eca195a7c8so36359825ad.2; 
 Wed, 08 May 2024 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715179993; x=1715784793; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vhaN0DvnzEE7UFS6Z8+WhLp7dcxsndKh+qCCeMmpD4=;
 b=h4tjao93Qhzo6buZYvvuc1hA7PDZ7Nwhou8kWJaaqPeQ0rQ+wTyO4P8TN3t56/aK6a
 gFYz5IEUs9AlkoUoEw6ZC3TFlloKZaG9tK93EgSch0gVOeQ9czAppDhOemYsYX5C7Zrb
 1ib46eIQGSESb/cJr1FemkSNqqE8kczk+m1A6Gw+zFgcZ+FdAcmKQpFPmjntCkxT1rTO
 3MTbTodb8Ukv6Cf4gXrmq4L7HE3JyCEN65k9IwRslMXO9Tp/r05nx7OLnaI2qwqzM1sK
 HJRqFgKXJPjGVU/1BneEUyBvOZSlxsVRIv2TLXxVOk5fd7UsCUSndmPgXJ7qNFubQjLN
 Qbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715179993; x=1715784793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vhaN0DvnzEE7UFS6Z8+WhLp7dcxsndKh+qCCeMmpD4=;
 b=saRj3gld+dNz///hJ5ueE1EAGdZtRhCKR6StOkGO6YC69QTa2QzhrTfjxfCuC8DQJC
 nGwe+EY5WCbQnte/k3wzgQJ+MTl9gGaZ1yjvjoPkH/HWKdPUBaGroQ1Qin6c7UGLfxqL
 F3sfbgNhK6JNxc0G3SiMVNNABwKCQeAhXjxPjEQk44DEQcdwDhi60259vpaezHFtcu3z
 vo/XVoOCcEJYPbmPFpKmJ3cjz94sccLWAJ6YSzAKA93yIK3gqvHap7z7WkP8zz0su0nA
 EUo5+OESXWOY36n/ZFO0SBA+KQJuhKEm2F3JbqBzmC/rp6kHW4W9OKi86o+z348FAxR+
 Zx0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKzxpWuf98NmvX3M4j+mpSbUov/YgfOAyGCV30Ni2hoO16dnjnAKbenbnkaHdikYR7h/EngKGCoLzeMDn3lR4lCasMM1YcMosOqwwuO1p7bikTxUwOzQUraZI4xeZIFDfOVklM64QqzWZsQIp55aFVeVTNuLDklY490DLfTk3F7c9iXXTXGSolqHJWHLwFChl+ipeNiXI5DnBbiWwErINKIATtFOp2mrXAf+oBvmtVyFqOCrte/Uz6/SOSix765Nvu7d5WypQHUgOZ5ZKqTw==
X-Gm-Message-State: AOJu0Yw4qICUgGmy7HG4y1xMVJvWQbeM1OSwXW5MzpI8z18+PQNxud2Y
 G+2Le8b4ehKcj8zNx0/WOHonJTDYMMqcjt6paLyqqL1xtFgw9wd9TJUUBDjQ3PplWbFZPaKIik3
 4A602np8l7B+RTuNPnZeQ73q0Al0w+Q==
X-Google-Smtp-Source: AGHT+IGL3PYhnDLj6ks3jqYaCF3oC5CbXYK5TPhVcB57zpPxv4lXUjO9ZJm3pfZo093/G3vsqtu6vNgRmORCuwy8WGQ=
X-Received: by 2002:a17:902:ec89:b0:1e2:a61d:905 with SMTP id
 d9443c01a7336-1eeb078ef79mr30093575ad.63.1715179992582; Wed, 08 May 2024
 07:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-2-eahariha@linux.microsoft.com>
 <0a6d4fa9-169f-425b-93d6-04314c617090@linux.microsoft.com>
In-Reply-To: <0a6d4fa9-169f-425b-93d6-04314c617090@linux.microsoft.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 May 2024 10:53:00 -0400
Message-ID: <CADnq5_NpxPM-FTcCchdBMRng=6xdM03s93XEX2_8fx44MRVYag@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] drm/amdgpu, drm/radeon: Make I2C terminology
 more inclusive
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>, 
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Evan Quan <evan.quan@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Candice Li <candice.li@amd.com>, 
 Ran Sun <sunran001@208suo.com>, Alexander Richards <electrodeyt@gmail.com>, 
 Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, 
 Ruan Jinjie <ruanjinjie@huawei.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Wayne Lin <wayne.lin@amd.com>, Samson Tam <samson.tam@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, 
 Sohaib Nadeem <sohaib.nadeem@amd.com>, Charlene Liu <charlene.liu@amd.com>, 
 Tom Chung <chiahsuan.chung@amd.com>, Alan Liu <haoping.liu@amd.com>, 
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, 
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 George Shen <george.shen@amd.com>, 
 Aric Cyr <aric.cyr@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Dillon Varone <dillon.varone@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Asad kamal <asad.kamal@amd.com>, 
 Kenneth Feng <kenneth.feng@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Darren Powell <darren.powell@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Le Ma <Le.Ma@amd.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, May 7, 2024 at 2:32=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> On 5/3/2024 11:13 AM, Easwar Hariharan wrote:
> > I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/s=
lave"
> > with more appropriate terms. Inspired by and following on to Wolfram's
> > series to fix drivers/i2c/[1], fix the terminology for users of
> > I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> > in the specification.
> >
> > Compile tested, no functionality changes intended
> >
> > [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang=
-engineering.com/
> >
> > Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > ---
> >  .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 +++---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 10 +++----
> >  drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 +++---
> >  drivers/gpu/drm/amd/amdgpu/atombios_i2c.h     |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 20 ++++++-------
> >  .../gpu/drm/amd/display/dc/bios/bios_parser.c |  2 +-
> >  .../drm/amd/display/dc/bios/bios_parser2.c    |  2 +-
> >  .../drm/amd/display/dc/core/dc_link_exports.c |  4 +--
> >  drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c  |  4 +--
> >  .../display/include/grph_object_ctrl_defs.h   |  2 +-
> >  drivers/gpu/drm/amd/include/atombios.h        |  2 +-
> >  drivers/gpu/drm/amd/include/atomfirmware.h    | 26 ++++++++---------
> >  .../powerplay/hwmgr/vega20_processpptables.c  |  4 +--
> >  .../amd/pm/powerplay/inc/smu11_driver_if.h    |  2 +-
> >  .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
> >  .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
> >  .../pmfw_if/smu11_driver_if_sienna_cichlid.h  |  2 +-
> >  .../inc/pmfw_if/smu13_driver_if_aldebaran.h   |  2 +-
> >  .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  2 +-
> >  .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  2 +-
> >  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  4 +--
> >  .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  8 +++---
> >  drivers/gpu/drm/radeon/atombios.h             | 16 +++++------
> >  drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
> >  drivers/gpu/drm/radeon/radeon_combios.c       | 28 +++++++++----------
> >  drivers/gpu/drm/radeon/radeon_i2c.c           | 10 +++----
> >  drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
> >  28 files changed, 93 insertions(+), 93 deletions(-)
> >
>
> <snip>
>
> Hello Christian, Daniel, David, others,
>
> Could you re-review v2 since the feedback provided in v0 [1] has now been=
 addressed? I can send v3 with
> all other feedback and signoffs from the other maintainers incorporated w=
hen I have something for amdgpu
> and radeon.

This seems like a lot of churn.  Additionally, a bunch of these
headers are shared with other OSes, so it's possible some of the
changes may end up getting reverted accidently when we sync up or we
may add new headers in new code with the old nomenclature and then
we'd need to make sure to adjust it to make sure everything was
aligned again.  I would just as soon leave things as is, but I'm open
to acking them if there is a strong desire to update things.

Alex
