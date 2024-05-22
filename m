Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F238CC793
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 22:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2A010F195;
	Wed, 22 May 2024 20:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iIOnIwc9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6614E10F190
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 20:01:36 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-df4d7e3dc94so1859483276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716408095; x=1717012895; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DRPkMdMiFXiHSXSHC1KGtPEPqoByQrBvux7SR1+/mUI=;
 b=iIOnIwc9AV0jO99m/jof8iLpHF4U75WyhjSjht30EPBcUNHwO3SRLaiLhtS+buW84q
 fKHrRFpGHIShKoYfntwF0oDlKKef1yZ1XpmnrYoQyKMaLzMMckTrpUrFDCO87FKuWNr2
 BjTYKN/li1OTRJ2s4OIPv+fuNuubezgHutJV2Kr7L9AA6rdYOamOZW/xXWMOBVkf2p/6
 JlxPR/xuEdVzi1SbafOxe1MwYTjFDpgTEustYwJPYYEjhsc39g0OlCkDQBkVeEq4LxLM
 smhki5CSb+5mglT2/JlS0KtjtuwuS0dEpcNvqDGzpf8sN4p3AJaUBGVHIdQma+KPozFH
 ATXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716408095; x=1717012895;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DRPkMdMiFXiHSXSHC1KGtPEPqoByQrBvux7SR1+/mUI=;
 b=rRipL50BzLC7HyOcXfAkAwQqQs14XOBCvrPFJbmO3kFteVxD7KchbSxZLs4wjCKSA9
 yxOeoGVn2ZgBhLuRCHl/JfVIkVhPYc57FxeJ2qWVVFLfmObRC12VJOLSyg5b1GQr33ZK
 xcswGxY4bNwFKHfIELB+VDQnueC/95C81VgEF8LbJQJEI3m6UkFPLiGKAErs6w9v92CJ
 RgL5Y87KH0xXbwl68/yacpB7IuXh8PpNeVb53EwDQLWxavMK9P5oyH0p2u6oqrMzRadX
 G2CM471B4+7SQi552S5jdLNzlhkFi2f/PrzVJtxVkLBSaZHWw9fmS6jh/+m6OQmQ+kww
 1cHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQoiszD3QKodMGErorQRtlKPyWGTBVzs3cDn7NA1oW5NJsffAzLegtlOxuA6eyQ3a4J3ZwGnNJFSRVvAtRtY1lbmSYY9XZ6xmD6hX4W4EB
X-Gm-Message-State: AOJu0Yy1DaP3/JPhCEFF33o7gd+M5mdtH/jfvVl97riLksDoVu0EbGRU
 T2AZIOGQn14nqVz/KBrk3PoY34pKEU04NhzY8RoFC42xInMN1ircfviaOgkpVqLggkjz1gGnWL9
 7BLcXU09bImSOWZ3PocLUt+8QU3vsL1nd+Y6RcA==
X-Google-Smtp-Source: AGHT+IGp6pTwvIYDaSqRLy9eyI5ICKE1WVJu990cWnLKFAuKaL+Hi52m5qOuALyhACM95iFGWGyXVZCh3VhYsES77d0=
X-Received: by 2002:a25:2c9:0:b0:dcf:bc57:cd61 with SMTP id
 3f1490d57ef6-df4e0df17bfmr3143774276.50.1716408095274; Wed, 22 May 2024
 13:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-2-f273b42a089c@linaro.org>
 <a349dda7-8af5-0996-0057-9da30f39dfb1@quicinc.com>
In-Reply-To: <a349dda7-8af5-0996-0057-9da30f39dfb1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 23:01:24 +0300
Message-ID: <CAA8EJpo7MdFqFUS0jcs3v4bSOoi6WWnbjahqn4r045CX8CTcOg@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/dpu: convert vsync source defines to the enum
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 22 May 2024 at 21:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> > Add enum dpu_vsync_source instead of a series of defines. Use this enum
> > to pass vsync information.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
> >   5 files changed, 18 insertions(+), 16 deletions(-)
> >

> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 66759623fc42..a2eff36a2224 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -54,18 +54,20 @@
> >   #define DPU_BLEND_BG_INV_MOD_ALPHA  (1 << 12)
> >   #define DPU_BLEND_BG_TRANSP_EN              (1 << 13)
> >
> > -#define DPU_VSYNC0_SOURCE_GPIO               0
> > -#define DPU_VSYNC1_SOURCE_GPIO               1
> > -#define DPU_VSYNC2_SOURCE_GPIO               2
> > -#define DPU_VSYNC_SOURCE_INTF_0              3
> > -#define DPU_VSYNC_SOURCE_INTF_1              4
> > -#define DPU_VSYNC_SOURCE_INTF_2              5
> > -#define DPU_VSYNC_SOURCE_INTF_3              6
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_4  11
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_3  12
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_2  13
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_1  14
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_0  15
> > +enum dpu_vsync_source {
> > +     DPU_VSYNC_SOURCE_GPIO_0,
> > +     DPU_VSYNC_SOURCE_GPIO_1,
> > +     DPU_VSYNC_SOURCE_GPIO_2,
> > +     DPU_VSYNC_SOURCE_INTF_0 = 3,
>
> Do we need this assignment to 3?

It is redundant, but it points out that if at some point another GPIO
is added, it should go to the end (or to some other place, having the
proper value).

>
> Rest LGTM,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
