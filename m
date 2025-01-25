Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CF1A1C003
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 02:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0665410E140;
	Sat, 25 Jan 2025 01:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qdh5gJh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6491F10EA57
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 01:02:48 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401c52000fso2372251e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 17:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737766966; x=1738371766; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a6C+SgRrtiXf7vPRyprsO7OZUY7tpAxx9NBtUiIiTKk=;
 b=qdh5gJh32TnAVeJfkiKfNNQxF6M7hdxPSSENULyDRDuoRLPoM9kOrl8iGqRsiD8NtJ
 aKX9/wBABlQuFaR0beX+VZ/r/iIkuNBXO1s19HG0vmf7ykd7OiOWbEWVqPquiaYtAEzh
 5mM1nBoKGNDgwjpStEKmmBjQ5OdviqTh7Oy+HSur4UkKRxSs3zeJCY2vtIa9ueLP4s2J
 twImNCkRFhzqkJvjtVnKhmuXy92HtCd7tQYI95ds3ihQgokk5poH/hEO2NnkgtHoQHwo
 pXzQNptRfWn+ZF253u2XqFPOCimBhK5w6mj4VjAxzAM0SjtrZ4lGbuFSGZ+vwKDW2rdl
 W+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737766966; x=1738371766;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a6C+SgRrtiXf7vPRyprsO7OZUY7tpAxx9NBtUiIiTKk=;
 b=tNrU+WWyPyE/VkdlkbLPUjVHDgfcVEiUKdUr2eOvOXW/p/kc4feitMNRCbh2qP/DZN
 53NKoiiWkAHf+168fAvrompjGzLYHv2+cGmxai8QKYhyM3YpZASU24uAvsgfifHaEVlP
 ayo33Ejeib+SIibvODbPOI9WjRZkP73nbh57idZnQToxSig/YwSIksJI+nNXHtfveG2u
 5BJ9Fw4dPQp8d0uaYdhcAQMow5flbDWe+l/+bP0ketv5NxYYuwlbHd6YxfeEfzuhwqF/
 kkyVBqudEKKboFAiaXgNKOro5+mbF6WoBYGqFQ+wBQ9PGIjdFfjtj43v+s0zcrUwxCU2
 6yPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7+XcesvnV7h8EhNe8mlu3ZXRXJa8jmi7214q6N1XAA/h08P1E5v7pucw7h4kTpRv+78U9vEll6sw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgbwC/qV9Gl6nw5wFjT/2f/xColSeOdOAoMq+HfmORQbRh9kkL
 k3qNWCFjQpxrOZPVCk5521j4P/pQ78oFV3XbDuaYYf2oCdXiiUSgqMeKTAcr7LU=
X-Gm-Gg: ASbGnctUyc9HVJuTyqQeQ30m+yn+VaQf5GfnUJPLIqnE2eADbZx7t53Z+y3Ist1dZAg
 bfvF+6dZAZdOhKAeBkwk08wXHvDPlTb29qLCVmyKjvOQPFgrSXttNHYDkV2zXFM8KiOE0e1fLmd
 XBv3xWvmhybDaWAS4OY5x4Jp8p47JvDJqebUeLcF9wW8gWed74i6YOLyiM7+dSIYgEqH52NbYNu
 csgSt/Ph8Rslv0I+d452PJOWI6fBqiBjdUGL32HUcnUb1cCZlx25Yd3nOGOoQRjRTwTYEpHT2P8
 2uqg8oyXehpA/WL0hK6hT4WfzKiqEgaqDCg+l3Yb2d3Xou4r23wTzhWd7NDu
X-Google-Smtp-Source: AGHT+IEbZ6iG9+yKkLLJdzC1wezeMeBsLCnkr6N0mg2c/nWG6aYfQmHCK0uUZF5Kk168cXdcXA41dw==
X-Received: by 2002:a05:6512:3d0:b0:542:6d01:f548 with SMTP id
 2adb3069b0e04-5439c22d6bamr9856712e87.5.1737766966484; 
 Fri, 24 Jan 2025 17:02:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c822f965sm456326e87.91.2025.01.24.17.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 17:02:45 -0800 (PST)
Date: Sat, 25 Jan 2025 03:02:42 +0200
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
Message-ID: <3v7t7al43nol6ogrttzrqhpwazw4v2ocooqbeuqsgpnlzmaf5w@i2ijk5pwir6j>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
 <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
 <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
 <esyb2hdp3rutcoiblqnxshta3x47ymdyotphasliprmkp643ic@eyopzwlihcpk>
 <7dc1f356-b1e0-4bca-bfb9-8de3717407bc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7dc1f356-b1e0-4bca-bfb9-8de3717407bc@quicinc.com>
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

On Fri, Jan 24, 2025 at 04:08:17PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/23/2025 9:19 PM, Dmitry Baryshkov wrote:
> > On Thu, Jan 23, 2025 at 01:41:14PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/23/2025 1:32 PM, Abhinav Kumar wrote:
> > > > 
> > > > 
> > > > On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > > > > Continue migration to the MDSS-revision based checks and replace
> > > > > DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
> > > > > 
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
> > > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
> > > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
> > > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10
> > > > > ++--------
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
> > > > >    7 files changed, 5 insertions(+), 20 deletions(-)
> > > > > 
> > > > 
> > > > <snip>
> > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > > > index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > > > @@ -319,7 +319,7 @@ struct dpu_hw_pingpong
> > > > > *dpu_hw_pingpong_init(struct drm_device *dev,
> > > > >            c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> > > > >        }
> > > > > -    if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> > > > > +    if (mdss_rev->core_major_ver < 7) {
> > > > >            c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> > > > >            c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> > > > >            c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> > > > > 
> > > > 
> > > > So far in this series, we replaced the feature bits with >= checks of
> > > > core_revisions. That kind of works as usually feature bits get added
> > > > after a specific version.
> > > > 
> > > > With this patch and later, whenever we use < checks it gets a bit tricky
> > > > as we might also need an upper bound. Feature bits gave individual
> > > > control of chipsets but generalizing that all chipsets < 7 have PP DSC
> > > > is also not correct. I have to really cross-check but there could be
> > > > some old chipsets which do not have DSC at all.
> > > 
> > > This raises another question as well.
> > > 
> > > what if some register was introduced >= X version but was then dropped in a
> > > newer chipset.
> > > 
> > > Is it not difficult for the user to go back to the files of each of the
> > > sub-blocks and alter these checks rather than just fixing up the catalog.
> > 
> > Well, the obvious example we are going to have is the CTL_LAYER_EXT4,
> > but if I understand correctly the whole block is going to be dropped, so
> > maybe it's not that relevant.
> > 
> > Another example might be CWB, where we are going to have 5.x-7.x and
> > 8.x+ DPU ranges.
> > 
> > Basically, yes, when adding support for a new platform we have to audit
> > HW blocks. But this applied even beforehand, where new platforms could
> > be drooping existing regs (8.x+ dropping a part of the TOP region).
> > 
> 
> Right, I am wondering what is the trade-off here.
> 
> 1) Feature bits allow selective control for every chipset. IOW, the specific
> version is already checked for. I do admit that I have seen errors about
> using the correct feature mask sometimes but even with this change, evey
> developer will need to go and check every sub-block file which they might
> not even know about.
> 
> 2) core_revision certainly can generalize but we might still need absolute
> versions for some of the bits anyway. So the checks may not always be >= or
> < but it could also end up with something like
> 
> if (major_rev == xxx && minor_rev == yyy)
> 	ops = ops_a;
> else if (major_rev == aaa &&& minor_rev == bbb)
> 	ops = ops_b
> 
> So the revision check will most likely end up being more complicated than
> simple range checks. With each catalog feature bit atleast we are guaranteed
> that its applied only to that revision.

Yes... However I'd prefer uniformity. In other words, if we started
using core revisions, let's use just it. Having core revision in some
places and feature bits in some other places sounds like an easy way to
confuse developers.

> 
> I do see in the cover letter, about incorrect feature bits sometimes used
> but I am trying to assess the trade-offs even with this approach.

Sure :-)

-- 
With best wishes
Dmitry
