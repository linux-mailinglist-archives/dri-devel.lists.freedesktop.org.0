Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0DE958521
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E143D10E733;
	Tue, 20 Aug 2024 10:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lK7/qpDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAA110E730;
 Tue, 20 Aug 2024 10:48:46 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2d3c9a67eaeso3452096a91.2; 
 Tue, 20 Aug 2024 03:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724150926; x=1724755726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHozHS2Z5KlQ/nEnJ4FIOFQCi2BYEVkICQui/aYg9Y4=;
 b=lK7/qpDi3OIVhsQyxm8DyughJrzWNZ0F9Mgp3Rmooalhb58Gr2Dt4FT5sEH6Dtqlm8
 /dtR/NHcxKYJuVYvseh1z5DaMwhwmUmDpq8k/5VScJC/yi57w1wl7BN3+yZQ7N+Omm1j
 O6wbF+9E/DgU235hk5qvdZob/HBrC0UKzHe0Pan6Zvdp753WLBs6T2fMwCEFl99QfOmq
 vPKT/uO7Q5hMK1B7lVSqlG1aM5u3OVc1LHmXTrOTRDSl+WKGv3kV/xFmxn0qhjQLuvat
 oUXrSs44i++CWkGS10mJEIjMDUN/4Y09ph4h3b1Yt2KdMk8ViSILeoI8Rl5ORSn/nVqM
 qldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724150926; x=1724755726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cHozHS2Z5KlQ/nEnJ4FIOFQCi2BYEVkICQui/aYg9Y4=;
 b=urrPd4j+IXylD82wnl1zcmcUBuhosFfRx+E+/w+HZlGT8r1k680yvq5HVJ5TLRXELX
 dheaxWefb7fMtqbtnVWabgkH2zCQeJTz6YHjk6X+b34yrBOMldX3T/ww7Yrkhvc8DSui
 2vaRKOTFjFi9Yw2DVDh3kYhEPrJXdu1F5a5nbzQA6+7EKXIQqmbaragLFasft31zcOaR
 VCQt7tAPYq/YU1PuD9Yf9joJhU2aKNk86Sgr0aj8e2GPnQnUZFau8d9rsjXi0QI8x1Q1
 TB65hivbTbPWtT8lezqgpPPR9qm2a+HqZwhIX6JNFG0v6jHVVkMETj+LfdjeSk653eqN
 HjJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCbJF05tOHZLma/HeTX+ZW4GL3PF5HEupQ0rDsccsDYTWoK0RN4n6C56JTjwLuXD+K41OTq+0bhbjN@lists.freedesktop.org,
 AJvYcCXMnbxJrZU/NhqQHZljews9aF6MEUCpPegxgkL9Wl0nlH54aouY7V+9OWn4xVCtoNsXTSIDpAEPeOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKNePymPHfr3k2pN4VhlzyZrrOPyZ3/qVDaw443p4sIA7vJQp/
 vkn0NAcOiWeOPQ+SRDo5dzzQssg/PhKRbTwZSVks4nZYJ9KiVTa0wv8u+sbTZWLaIJopkq3R/Sx
 tmxBjI0r0+kmE0Zd2Y+K8ur/R9AU=
X-Google-Smtp-Source: AGHT+IEisKinF3iVS7neNg7As2gXSCSo9FnUNLT+WaDRg+VngACC0dp8/ePn2UZ3VfV5sHWMAIpYdwMu7ABuow2QTg4=
X-Received: by 2002:a17:90a:34cc:b0:2c9:6278:27c9 with SMTP id
 98e67ed59e1d1-2d3e0409761mr12762164a91.38.1724150926144; Tue, 20 Aug 2024
 03:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
 <20240819203128.hit2csdpbbsybkoq@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240819203128.hit2csdpbbsybkoq@hu-akhilpo-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 Aug 2024 11:48:33 +0100
Message-ID: <CACu1E7GnwjS3Hv140emJ_-yJKDd+FB75upF9z3pDTj7Ey7zWRA@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Aug 19, 2024 at 9:31=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Thu, Aug 15, 2024 at 08:26:16PM +0200, Antonino Maniscalco wrote:
> > Some userspace changes are necessary so add a flag for userspace to
> > advertise support for preemption.
>
> So the intention is to fallback to level 0 preemption until user moves
> to Mesa libs with level 1 support for each new GPU? Please elaborate a bi=
t.
>
> -Akhil.

Yes, that's right. My Mesa series fixes L1 preemption and
skipsaverestore by changing some of the CP_SET_MARKER calls and
register programming and introducing CP_SET_AMBLE calls and then
enables the flag on a7xx.

Connor

>
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
> >  include/uapi/drm/msm_drm.h            |  5 ++++-
> >  2 files changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 1a90db5759b8..86357016db8d 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -453,8 +453,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struc=
t msm_gem_submit *submit)
> >       OUT_PKT7(ring, CP_SET_MARKER, 1);
> >       OUT_RING(ring, 0x101); /* IFPC disable */
> >
> > -     OUT_PKT7(ring, CP_SET_MARKER, 1);
> > -     OUT_RING(ring, 0x00d); /* IB1LIST start */
> > +     if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> > +             OUT_PKT7(ring, CP_SET_MARKER, 1);
> > +             OUT_RING(ring, 0x00d); /* IB1LIST start */
> > +     }
> >
> >       /* Submit the commands */
> >       for (i =3D 0; i < submit->nr_cmds; i++) {
> > @@ -485,8 +487,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struc=
t msm_gem_submit *submit)
> >                       update_shadow_rptr(gpu, ring);
> >       }
> >
> > -     OUT_PKT7(ring, CP_SET_MARKER, 1);
> > -     OUT_RING(ring, 0x00e); /* IB1LIST end */
> > +     if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> > +             OUT_PKT7(ring, CP_SET_MARKER, 1);
> > +             OUT_RING(ring, 0x00e); /* IB1LIST end */
> > +     }
> >
> >       get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> >               rbmemptr_stats(ring, index, cpcycles_end));
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 3fca72f73861..f37858db34e6 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
> >   * backwards compatibility as a "default" submitqueue
> >   */
> >
> > -#define MSM_SUBMITQUEUE_FLAGS (0)
> > +#define MSM_SUBMITQUEUE_ALLOW_PREEMPT        0x00000001
> > +#define MSM_SUBMITQUEUE_FLAGS                    ( \
> > +             MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
> > +             0)
> >
> >  /*
> >   * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITI=
ES-1,
> >
> > --
> > 2.46.0
> >
> >
