Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF829F348C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 16:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84C610E6DB;
	Mon, 16 Dec 2024 15:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CVVHdwKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B13810E6D4;
 Mon, 16 Dec 2024 15:32:07 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-7c3d415f85eso269633a12.0; 
 Mon, 16 Dec 2024 07:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734363127; x=1734967927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQGjErUtlCZJ7iTbPpf8bUnIM6UfUxr0a27J9i+kbd4=;
 b=CVVHdwKHRNHL6xuKFNDP4M5K85XdrbvYJEWFX5gW32Lm5dPHLlENT6aK8ofnFaHIxe
 /CNB2mBoctDvKyvuIn0I11GyoQYE+eTNqVY2Lyn45rQGCIWejpAKEG4fIz48TYoIF6BK
 /g21urYliUL2t0wwNPqGytWIjB/rwijnslOtIxjt/7r3d9IGiCmFas2n1hbfklRwjMin
 aKBDGdAHZlXR7/AmZ7Np7a0eilc6kpZJ6hMfcnxn8JcLgbY94QuQxHCP+x6h0MvqbfTm
 QXbOwnVShVgdwXCza6OqA6uvzrLEAWptP6mJPiEttKx/+wyMZp/t2sY4eia3cpDBOtiQ
 iFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734363127; x=1734967927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQGjErUtlCZJ7iTbPpf8bUnIM6UfUxr0a27J9i+kbd4=;
 b=r2V7Dl2FA9gDNw202fvZrEYb2CiVy3VvtK4OS4NVUzkBJZYs54ie826tYmx9hG6nmt
 h2gqKcGXAAfmuzqCL4uFUCoNnlc3ZvJE+tFobdHt/5emwSgnTmgLjaWxLFWaMD7plH8u
 kGEMwU6tlW6NAzzBr+1J5HVYJ+q50B+3GcCyVEtREbkyLxWmu6+L3OPaEjuSgE/K9RPH
 7AgeogP9BZtPtmSY7qWPt9IOusfqbpGMQXJ2SUx6dWAq22YI8/paoQ4N6x0OsfOcKmIb
 tE3ALoSPA+N3tLsryN2SbkRkVtzxc8Gaxu610s9K8eWsFCV7oObqX9w1y2JydhO58Cog
 Sasw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAaQyBd/J2zPjufrqjYqYN4OcrLNStlPkcNX++Jby006P92ZtlBXl06n0CXPl+Xn0COGPyh1cufUio@lists.freedesktop.org,
 AJvYcCVVDV2vpu2So6ThNMFaXUt30pQFhc1dIspi/zHU3awKdj5iSku2Q4QcB+kHF8RpFryh1G1ULWJaHj5A@lists.freedesktop.org,
 AJvYcCVWOGzFBpEDKVaGiq94AGFVeRxS8jNWzg+doZLCqtwEDTDta3qCyzNr0r29d1cN3+905Hcxjn0T7Pe9@lists.freedesktop.org,
 AJvYcCVqnT40MXGfCmZaMdDYvhd6+FEKQUpgHo0Hsn/1Q2ICJk0nTSMeKs8nDht25KBNa4oh6ShNrJ+v@lists.freedesktop.org,
 AJvYcCWcKp4DuUO3LYeSdT68wbq624PDv2Jalr3u5SOKG8YrH5LhYzPOd248TvEHUWm/lhSaUJ+Fz27HzUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWK7bhFe44zbGmdPiVwOBJ6/uC4R20jJj6tz/go5DPrzr00QsR
 5aqMUGrgHaBoA30/ssZHlyrwVsQy7QsQOBJVgBfBZHA/CeqXOCiV9E3EOTt5i4ryE9Uwl9R6L0r
 TOUjch5xT07fT9xvxBXJcPPp5VRE=
X-Gm-Gg: ASbGncsqn3g/GhSh1blS9rxEWm6daHxOYDyk9xWuhU/Ydu5RlSNMm6DfSvdueXCZA1E
 l89qxnjwqRLsjJ0RbokRatMi78MsTj6AByFeAkw==
X-Google-Smtp-Source: AGHT+IENFuEqCpmJ+fh0Mtq+tiJji0QPe43tbh0IyC96vkUIWO6e+Z85h0KDNnVCSDCt9fLi9Qb2WTPgncrCMq+hdNM=
X-Received: by 2002:a17:90b:5444:b0:2ef:93:154e with SMTP id
 98e67ed59e1d1-2f2901b2b70mr7145457a91.5.1734363126741; Mon, 16 Dec 2024
 07:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
 <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
 <fc8e80dd-bcea-4515-b446-158649719569@amd.com>
 <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
In-Reply-To: <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Dec 2024 10:31:55 -0500
Message-ID: <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Harry Wentland <harry.wentland@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Mon, Dec 16, 2024 at 10:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 16 Dec 2024 at 16:53, Harry Wentland <harry.wentland@amd.com> wro=
te:
> >
> >
> >
> > On 2024-12-10 16:20, Dmitry Baryshkov wrote:
> > > On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
> > >> Reading access to connector->eld can happen at the same time the
> > >> drm_edid_to_eld() updates the data. Take the newly added eld_mutex i=
n
> > >> order to protect connector->eld from concurrent access.
> > >>
> > >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >
> > > Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this on=
e
> > > and to the radeon patches? I'd like to be able to pick the series for
> > > drm-misc and these two are not reviewed by you.
> > >
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce9647=
f0606fb86fe57f347639 100644
> > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(=
struct device *kdev, int port,
> > >>                      continue;
> > >>
> > >>              *enabled =3D true;
> > >> +            mutex_lock(&connector->eld_mutex);
> > >>              ret =3D drm_eld_size(connector->eld);
> > >>              memcpy(buf, connector->eld, min(max_bytes, ret));
> > >> +            mutex_unlock(&connector->eld_mutex);
> >
> > All of this is wrapped by the adev->dm.audio_lock mutex. It might
> > be safer to modify the audio_lock mutex so it only guards the
> > aconnector->audio_inst access.
> >
> > But I don't see any way these mutexes would otherwise interact,
> > so this change should be good as-is.
> >
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Would you ack it to merge it through drm-misc? Or would you prefer to
> pick up those two patches after merging drm-misc-next once the rest of
> the series lands?

Merging through drm-misc is fine with me.

Thanks,

Alex

>
> >
> > Harry
> >
> > >>
> > >>              break;
> > >>      }
> > >>
> > >> --
> > >> 2.39.5
> > >>
> > >
> >
>
>
> --
> With best wishes
> Dmitry
