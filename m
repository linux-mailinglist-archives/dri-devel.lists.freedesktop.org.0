Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB486A1AFCF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F9110E0B6;
	Fri, 24 Jan 2025 05:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r2CPAlYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD8510E0B6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 05:19:53 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-540215984f0so1803216e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 21:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737695991; x=1738300791; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3o8gTZu6BR29eomWLMiFERLH4W2XG5CknLwAkj4XFWs=;
 b=r2CPAlYsIZasqmSlEfoUQd3s5elhvIaCtVuH1BGNVYG2dlbMW8/ttS8HTVK/rU2BZX
 fgKKVO78/h+M6j8GgOA5znvdaV+BO3nz/LmNmVBzxRKkg8z1Hs5Qbvwa89yqea6evx9B
 e/znayMvrQ+3jeCBRQqjrLMF3qOs1zIkMtTzSRNnHkmieZBLcOKDsNCU1HnxNe83/Ci9
 gi5eCszkLMEI0l96ZpjGH417DUnGBEd4XtpaDJlWr5UWTWknST/EHmfwdQlCwGepytKG
 1jAoUA8BuRju4PFHCgsMyDIp/gmCbdRk78zdZqYe9TvOV9pwTbTMEFSc3Y1z2MsK6hEo
 WGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737695991; x=1738300791;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3o8gTZu6BR29eomWLMiFERLH4W2XG5CknLwAkj4XFWs=;
 b=Zl+kTUMqwlUenDgtt0RyrVGSKldLYckCJL0jFbnR16MJ8dYkdbcmKo7vyNwk7SFZMD
 7lr/p9aLNoMICocrh6dO2hKBi6qzmtTN/xoqXdJ0zDuaniIf5MrohIevBSFot1OOsGuJ
 PnF9wnErmIXI9szTLIYNNolGJ378aUHtDvmGVf4DWAmxidhOCNTCb/bctyUW7fh1JTJN
 K0s1+SOa4xS9/BbW1kQOwqFvpcOkmMXf2L5V5d3qNVeww/ON0mLpQcfaV7i/Vt6khk+i
 FeC75kUw178JY2wPOKY/u8lO+zfXja2TGL9YcGIV8a6hCd2YTu1Hzr4SZp74y5sLvxpp
 Z7tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/l/hTpaX5ckhtKUKE5iMObU2fhD8gpNJ+zIEXX39dppxRSG1PAa4DYGv7SBthxSoemgCrP3xo+vY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5fDBNOWM/p6FW2fpPBG4kupVO1DvJWQLTJ5C8D56wYixyQnX/
 fEWy7urq+EwfWLN7b6Rf76rrO0Bl1BYS6VqIiiy4SVHHkOaJpIazhCPZqjvCCXg=
X-Gm-Gg: ASbGncsnkGgQAIaXlzc0EyZEPZlfuDm4PqwRYnEw7fYlwa28Q4am3bJ3K1vqrGJRCki
 Nq83pX4QdLcmZ4rJe6faP6DiT9O7jChd8umEsKD9YgbWjSzZ5Zvbwj+ut7K2toOYGtizq8fGKng
 RYG6OLL0MKNQFrgR3IzlrD6T1h7rbmLf42NkPLfFZByMZE4AsIJTxJ5REIgiN+XzcfZnH/85GEY
 BfVuDEl99MTvNIdPfscqokf9fC2qcf3n/v8DkgDjQ4J7WVmeNemP3ml5wp/Wv4+S5dV+NNFMCZL
 MBwo0NaEG+dHHTAoz77W3WgULdH3AFEqopKy9y/xGn4c9wJ5YaUBxbtGbOez
X-Google-Smtp-Source: AGHT+IEwnJ9j1k553+NJYN6NU1urekTvAiaOkFEFC2RQFT0hhnn33FzgCNI1K9Ys6RSk3s/xp4ZF6A==
X-Received: by 2002:ac2:550a:0:b0:53e:38fd:7518 with SMTP id
 2adb3069b0e04-5439c22d6e5mr9306949e87.3.1737695991441; 
 Thu, 23 Jan 2025 21:19:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8379953sm166799e87.187.2025.01.23.21.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 21:19:50 -0800 (PST)
Date: Fri, 24 Jan 2025 07:19:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/35] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
Message-ID: <esyb2hdp3rutcoiblqnxshta3x47ymdyotphasliprmkp643ic@eyopzwlihcpk>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
 <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
 <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
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

On Thu, Jan 23, 2025 at 01:41:14PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/23/2025 1:32 PM, Abhinav Kumar wrote:
> > 
> > 
> > On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > > Continue migration to the MDSS-revision based checks and replace
> > > DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10
> > > ++--------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
> > >   7 files changed, 5 insertions(+), 20 deletions(-)
> > > 
> > 
> > <snip>
> > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0
> > > 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > @@ -319,7 +319,7 @@ struct dpu_hw_pingpong
> > > *dpu_hw_pingpong_init(struct drm_device *dev,
> > >           c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> > >       }
> > > -    if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> > > +    if (mdss_rev->core_major_ver < 7) {
> > >           c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> > >           c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> > >           c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> > > 
> > 
> > So far in this series, we replaced the feature bits with >= checks of
> > core_revisions. That kind of works as usually feature bits get added
> > after a specific version.
> > 
> > With this patch and later, whenever we use < checks it gets a bit tricky
> > as we might also need an upper bound. Feature bits gave individual
> > control of chipsets but generalizing that all chipsets < 7 have PP DSC
> > is also not correct. I have to really cross-check but there could be
> > some old chipsets which do not have DSC at all.
> 
> This raises another question as well.
> 
> what if some register was introduced >= X version but was then dropped in a
> newer chipset.
> 
> Is it not difficult for the user to go back to the files of each of the
> sub-blocks and alter these checks rather than just fixing up the catalog.

Well, the obvious example we are going to have is the CTL_LAYER_EXT4,
but if I understand correctly the whole block is going to be dropped, so
maybe it's not that relevant.

Another example might be CWB, where we are going to have 5.x-7.x and
8.x+ DPU ranges.

Basically, yes, when adding support for a new platform we have to audit
HW blocks. But this applied even beforehand, where new platforms could
be drooping existing regs (8.x+ dropping a part of the TOP region).

-- 
With best wishes
Dmitry
