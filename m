Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3689390DA9A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 19:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A76710E74B;
	Tue, 18 Jun 2024 17:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jegBqyEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685C410E73C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 17:26:59 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52c525257feso7344104e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 10:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718731617; x=1719336417; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W2XgDBRe+uXR1JhTiAW0H+F2QdLuA6dIQSH0HmfL2qI=;
 b=jegBqyEwWhBROpoqiEsg+UZV0V+oajjO1DCLBQz8Fzun4Ar/r9EoCHm+ICI66ilGHR
 ae5LeYCuUVnCR+s9R6mz255GCFqIQLF90TqOCUMJJlR0ulmB6I09FqTkw8oRwYC3ontM
 5jKdmAcEpAn9fvANVfDPH+mW1kNfyaqvYhl/vMzC0SEqQImA8aL4RSecCQZOOr7iq7RQ
 xBFVzQ/JiuFn6iUqrm63J1H0kdL+8UOFYr4kPvgWCHXMCOdjovBzLvKB0aYRPyw+bkkD
 GBGtt0ENJPhbMleK2KsvTI3dZ6+FvfS8C6hC4vLRLxhTku+YoB/95ngcM0Ot4P3E8H6U
 udtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718731617; x=1719336417;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W2XgDBRe+uXR1JhTiAW0H+F2QdLuA6dIQSH0HmfL2qI=;
 b=vATlUW/G1tTblU61LZsY6gTTOfw7KG0Qn5BK8hZ/+olRs5h9cYgBzLyg0znPbEb2H5
 PQm12Ztgld5CpIH/5jBZkvhsNpgqHJUYM2tzfhB95SOMqSXD0WwnYGo+5eBCi0Hv0BAI
 BN/IeAY5cyR6jG1kqwlUwZlSDLNJ3u1cQ4C0snmt8e7P9YPz0buRGGpatYwQ9Uk8NQWU
 6NjXMObafE2Aj0zXlhSzWU2k5tuqnS1zEqU2U4oXiQQt3sNt36MkYyj3hgHA7hZsEvMU
 DQ4BfT6KPzJLe4pyED3gGJ4we5Vd8ZjDczVGmj6ZfPbMmhcfmcHiDN/QRmC0Gk6IfVmQ
 t4ig==
X-Gm-Message-State: AOJu0YxUWahMSH2PUPwsNhOx073xdRKMXVK1IEI0mRRwyZnqYbhebA2t
 wAnZF+D2FtzI/VtOQh+txfwu/rG+XpVm//CiBEBYTxDgdy3qqclVOMnZIXChUQk=
X-Google-Smtp-Source: AGHT+IHnlPq6SIHBVQIVyvhtZzEM4VjHJZd+R56nsfAoWok8bl5Nz8Rpo3Ive6lWbA3CpuueiYxIMA==
X-Received: by 2002:a05:6512:49a:b0:52b:c1d4:7df3 with SMTP id
 2adb3069b0e04-52ccaa36980mr190988e87.35.1718731617392; 
 Tue, 18 Jun 2024 10:26:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2889052sm1555203e87.299.2024.06.18.10.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 10:26:57 -0700 (PDT)
Date: Tue, 18 Jun 2024 20:26:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] drm/msm/adreno: Move hwcg table into a6xx
 specific info
Message-ID: <x64uencmmiqlozqhjnp2jclizjzhhhekkhvxqmm6dlilr7huyd@wmaikimb63jx>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-5-robdclark@gmail.com>
 <wnnjjljjyl5s3fkwiapux3f76243ngp2ppk2cm7kkhdp5dc4sz@v4wypnga3izv>
 <CAF6AEGvjeGxP+A2umyQHo49G1rAdZkY0bHuemvFP4jgNkspu3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvjeGxP+A2umyQHo49G1rAdZkY0bHuemvFP4jgNkspu3Q@mail.gmail.com>
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

On Tue, Jun 18, 2024 at 09:33:48AM GMT, Rob Clark wrote:
> On Tue, Jun 18, 2024 at 1:30 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, Jun 17, 2024 at 03:51:14PM GMT, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Introduce a6xx_info where we can stash gen specific stuff without
> > > polluting the toplevel adreno_info struct.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 65 +++++++++++++++++------
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +--
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
> > >  4 files changed, 67 insertions(+), 19 deletions(-)
> > >
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
> > > @@ -98,7 +100,9 @@ struct adreno_info {
> > >       struct msm_gpu *(*init)(struct drm_device *dev);
> > >       const char *zapfw;
> > >       u32 inactive_period;
> > > -     const struct adreno_reglist *hwcg;
> > > +     union {
> > > +             const struct a6xx_info *a6xx;
> > > +     };
> > >       u64 address_space_size;
> > >       /**
> > >        * @speedbins: Optional table of fuse to speedbin mappings
> >
> > My preference would be towards wrapping the adreno_gpu, but that would
> > require more significant rework of the driver. Let's see if we can get
> > to that later.
> >
> 
> yeah, it was going to be more re-work, and I'm neck deep in
> gpuvm/vm_bind.. I just wanted to land this since it is a pita (and
> error prone) to rebase as more gpu's get added ;-)

Yes, I'm fine with that. My note was more like a 'later todo' item.

> 
> It isn't entirely unlike how we handle gpu gen specific options in
> mesa, where we have a somewhat bigger set of options, so I wouldn't
> say that this approach was worse than extending adreno_info.. just
> different..


-- 
With best wishes
Dmitry
