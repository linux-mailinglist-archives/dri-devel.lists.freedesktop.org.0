Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C6A218A6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 09:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74B010E2BA;
	Wed, 29 Jan 2025 08:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ebq8u23T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E50E10E2BA;
 Wed, 29 Jan 2025 08:09:25 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2ee51f8c47dso9129353a91.1; 
 Wed, 29 Jan 2025 00:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738138165; x=1738742965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ye4JntaIkIF7a+w6DTbO0kIk9MLJPFfMjPP4/iHk7/A=;
 b=ebq8u23TuRkn8CC6IhZNDLrV58lsc1q+MetDloLDjsmHUezseSQC7k76j08PvP4/6k
 HLq3uZG4KheMDwm0ru7tQDM+WOZyTQSUlhBPHO2gtrFfM64fxcfZ4jbwdvcKs3cttxUw
 dg7Uh6YbmK0ecJPhzNw3fBPapwtP2kE7O7RgemB93CCxr+Cfba736KOC/1WIwbVWtTng
 8HxygpDqHw1KjRCG0hxEq3CQdYvOk5uF8dVzY9UvO2+YsCj33WS1QJONJ61D6JTGQWXe
 ppfTncsHH9jW4m1JMjXCsbtWtBns6MUvk8bM65jJLZ40WdvsTPnljIa8Qpuwuu5PbM/w
 +m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738138165; x=1738742965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ye4JntaIkIF7a+w6DTbO0kIk9MLJPFfMjPP4/iHk7/A=;
 b=QPqlf4E7KN5zsGJcjNjgVdlxeK/tsuIH1217F9mH9skW6NH0CdMY+bKD8RnNvtF/aB
 qMYNErz35MiawQ11Hqo+j4b0jFIrb8O1Nlzf7Czb/VjZUJIu17Xcak+ZXu4/nE7hXFM1
 pCFF1AqM2nFoZ/3KYoqXV1qjyfGJxS1St+seTnqv0qwBu1EflSYfPymbRkq8YY2G4i2B
 sM4kk1GdhFkskU+1CMTyBYhGnEFkpSRDnXd1jLGEchEdJxO4AcuQ0Jg+PBiLzHcB2Qlq
 rYvxKGHe3zbKOO4eD2HRtZzsa8TNaGmuOFnESo9rNT4pr4fp3laMQkhwyqSF1ljNPs6K
 m7XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2lTvc4KujnjwuknReOVr96i1YdP/YihbcfT5MYFSgwL262GUinil/rBgfTbL66vaZC0okbU6J/pF2@lists.freedesktop.org,
 AJvYcCUI7UiMIGjOjGAstU5ctaIg1CbbKTpVecS1aHx0006hRoyG4eIeqZ2J1onIf8uDEeC4rLXIitCUSg==@lists.freedesktop.org,
 AJvYcCUjQ+0KxP7O/qvapaNotZgbXcCCHhJVrle6w/3YFOaCEXnbp/AiQd00J+BNcO9cHYf1wy9SiyZr3QU=@lists.freedesktop.org,
 AJvYcCVdEwTnA4hp1bdBfdBASLes3BnIcJsiZljp4VGbEyieGMkS67F1cvd9S2Dg45x1VlBgf/goOg==@lists.freedesktop.org,
 AJvYcCVeR2Okr1zThxSGF4hw0o+atgBf6T7UP7C3u4khCi1E9X43eysQ7fAPA2Ooy3dodbqRX6TcI2npcGkm@lists.freedesktop.org,
 AJvYcCXCj2m0TaxdK+Sm20gX5w3Za9fai63COrEn3n6dJdn2E1elNnleRDujCBrzxSATofvCDsxVlXgx@lists.freedesktop.org,
 AJvYcCXV21nCc16JefuhhkcodwNi6204d/JbEwMqvDFYWw7cP+pl5nUYn0zbbORIy9RgLl5NoChHV89wOQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziNfHVOPWzBJ/tOAJvzc2gUo5oda9KOtoKOHKaaQCMfKgwFgzQ
 58OAe4JuVirEe6oWD9tkcDsrykPG3oqv6AHuN+TLm/qvCGC/jarmsMFYyYamdDDDO1iZJX/PPYt
 bUueWczw6C6zd7VJRitZSm6AvrdU=
X-Gm-Gg: ASbGnct6zFfDgA5VfVDCWKevonTnwC2DJj1lAeO7tAyhP2yKDw5TWZEASWdHE28PeHx
 /T32c8GBbEwuhFopG8nXLZnhQug6+z+pU5FjmbjbwIisvFf22aCA+folYlt2+bZiXyrvLXkk=
X-Google-Smtp-Source: AGHT+IFL/+Ix8PJzhRPGezz0BS/aPmM+Mu6yVPfAQpJZPpemGpHRcd0USeaMTeXX7cwj2kNE9lfyVb+Qeot2NIY7ikQ=
X-Received: by 2002:a62:f20c:0:b0:72f:d7ce:5003 with SMTP id
 d2e1a72fcca58-72fd7ce50abmr734741b3a.22.1738138164688; Wed, 29 Jan 2025
 00:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20250128142927.103290-2-phasta@kernel.org>
In-Reply-To: <20250128142927.103290-2-phasta@kernel.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 29 Jan 2025 09:09:12 +0100
X-Gm-Features: AWEUYZk3uXItrn_mY6Y0468bmDyISJSZEOiGbSbsZd4jSdwj-_i30tdpr-sVXDQ
Message-ID: <CAH9NwWcokvvJSRQ_kbV+jiH+ag-SA+Y87n6Bw34s8GP3vop4og@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
To: Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
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

>
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming in:
>
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched=
_init()").
>
> Introduce a new struct for the scheduler init parameters and port all
> users.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Point out that the hang-limit is deprecated. (Christian)
>   - Initialize the structs to 0 at declaration. (Planet Earth)
>   - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
>   - Make the structs const where possible. (Boris)
>   - v3d: Use just 1, universal, function for sched-init. (Ma=C3=ADra)
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    | 20 +++----
>  drivers/gpu/drm/imagination/pvr_queue.c    | 18 ++++--
>  drivers/gpu/drm/lima/lima_sched.c          | 16 +++--
>  drivers/gpu/drm/msm/msm_ringbuffer.c       | 17 +++---
>  drivers/gpu/drm/nouveau/nouveau_sched.c    | 15 +++--
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 20 ++++---
>  drivers/gpu/drm/panthor/panthor_mmu.c      | 16 +++--
>  drivers/gpu/drm/panthor/panthor_sched.c    | 29 +++++----
>  drivers/gpu/drm/scheduler/sched_main.c     | 50 ++++++----------
>  drivers/gpu/drm/v3d/v3d_sched.c            | 68 +++++++++-------------
>  drivers/gpu/drm/xe/xe_execlist.c           | 16 +++--
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c      | 17 +++++-
>  include/drm/gpu_scheduler.h                | 37 ++++++++++--
>  14 files changed, 206 insertions(+), 151 deletions(-)
>

etnaviv changes are

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
