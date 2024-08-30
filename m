Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1B966C28
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6467F10E070;
	Fri, 30 Aug 2024 22:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RKe37FyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942F10E070
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 22:16:29 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e05f25fb96eso2268456276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725056188; x=1725660988; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kg0OcxRkiJ9mILCxT4CPJe/4xi2OQv9TcXwbD36UhOo=;
 b=RKe37FyJg0Icb4rAsmVSuIt43d0/FKA9FewpM0j7cyXuHqYOT4VvgoiQzQLyRuPZj7
 bgF8iY7Y30djT0Y+C4TtOyR29owhz5TjUrkvq10BjFVQPAg+UIRMq9NREzy00sePxV/x
 T3tsjNGkuyuOW6Xsd6sa2UWoYv5WVxKHgmHQBLyydBvjIhrlzmXipfSdLvyxg5SFT+B4
 9HJrtpedTSTfmnmuR9sQNmyVCoBW2xv9RUzYtd6MOEbqx80iFA/TQW6PE7MUfAJUeguu
 h1saGw2A5UNkQhQPfdGe9uinTNNxaEkjsOakSg3zs2+CR4GvcbW2rmvqvLnA0h62idfL
 fbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725056188; x=1725660988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kg0OcxRkiJ9mILCxT4CPJe/4xi2OQv9TcXwbD36UhOo=;
 b=tywxkhli+XDaJyNm1g7E+gRoUrKhIqGyidaQN9kahhlYs+ofwgDOYNLouZ0snsS5+e
 bqhTWQlaqDkuFtPT/xVY7WmTSlgXFdx0mnPsa4C3g0XcQsM9D/YBMHjlLHUdA+meZiUv
 qFOkII+YFln8W+zqAXwzj5riP3LlwXZHiKenrUBV24RwTV4ztVROIkyApkLja9qrPQNF
 TQnYCxBXRFyikYBTAjLRBVAWSSWqd2avsvmyjhi5eKeMH2Op1VuQBOBXMXO4Dp2sKgSq
 GaIgPx8eXE0I8cyYx8bP2FJ2CqoKb3A1JRr9521sKwMwMkgS8uFt42VVXVAzwxCf0z+I
 053g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC4IifAUjegbO0D1HmeyC9dIXpNf8XMC3K71xWgubKz14iaWtqxxlcRkG066xSxBN0jBTCyuU2eMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhyQVMCJlxKdHIeG+Ja+DTdkOo4jh6ofw+bqPHdytQ8szgIuCq
 7OwKO1h6SXFMKsebEkwBHIRFgNn2eeTDopoRUqhoD60xutsulptVYo0A65TDyLhIf1YEoNQtf+2
 QA+O/pWYDdaHB8ON2w/LRl6xI3r+vmlI8zjrXxQ==
X-Google-Smtp-Source: AGHT+IHgOBmdwt0xUdZkJgCOZZM6PHszQRsO5mml5cm8WKpLa4tuyNCeZ9ZjuBiXceqbfQLAyAgRg28VJm8LcQEYicM=
X-Received: by 2002:a05:690c:6711:b0:6d3:be51:6d03 with SMTP id
 00721157ae682-6d40f82a5dcmr47478337b3.23.1725056188103; Fri, 30 Aug 2024
 15:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-11-502b16ae2ebb@quicinc.com>
 <pf6xgu7yjanzjigfpupons4ud6jbcmbr5icnd7yur6qhh3n5sf@plj4bi3beguw>
 <665da6e9-d9f3-4a28-a53b-0f467967fc78@quicinc.com>
In-Reply-To: <665da6e9-d9f3-4a28-a53b-0f467967fc78@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 31 Aug 2024 01:16:16 +0300
Message-ID: <CAA8EJpo0X7yRaqYV-tTco9+9WyexiPN_ey8hKivFrE3jTojUpg@mail.gmail.com>
Subject: Re: [PATCH 11/21] drm/msm/dpu: Add RM support for allocating CWB
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>
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

On Fri, 30 Aug 2024 at 22:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 8/30/2024 10:18 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 29, 2024 at 01:48:32PM GMT, Jessica Zhang wrote:
> >> Add support for allocating the concurrent writeback mux as part of the
> >> WB allocation
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 ++++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 30 +++++++++++++++++++++++++++--
> >>   2 files changed, 32 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index c17d2d356f7a..c43cb55fe1d2 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -1,5 +1,7 @@
> >>   /* SPDX-License-Identifier: GPL-2.0-only */
> >> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >> +/*
> >> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >>    */
> >>
> >>   #ifndef _DPU_HW_MDSS_H
> >> @@ -352,6 +354,7 @@ struct dpu_mdss_color {
> >>   #define DPU_DBG_MASK_DSPP     (1 << 10)
> >>   #define DPU_DBG_MASK_DSC      (1 << 11)
> >>   #define DPU_DBG_MASK_CDM      (1 << 12)
> >> +#define DPU_DBG_MASK_CWB      (1 << 13)
> >>
> >>   /**
> >>    * struct dpu_hw_tear_check - Struct contains parameters to configure
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index bc99b04eae3a..738e9a081b10 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -1,9 +1,10 @@
> >>   // SPDX-License-Identifier: GPL-2.0-only
> >>   /*
> >>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >> +#include <drm/drm_managed.h>
> >>   #include "msm_drv.h"
> >>   #define pr_fmt(fmt)        "[drm:%s] " fmt, __func__
> >>   #include "dpu_kms.h"
> >> @@ -34,6 +35,7 @@ int dpu_rm_init(struct drm_device *dev,
> >>              void __iomem *mmio)
> >>   {
> >>      int rc, i;
> >> +    struct dpu_hw_blk_reg_map *cwb_reg_map;
> >>
> >>      if (!rm || !cat || !mmio) {
> >>              DPU_ERROR("invalid kms\n");
> >> @@ -100,11 +102,35 @@ int dpu_rm_init(struct drm_device *dev,
> >>              rm->hw_intf[intf->id - INTF_0] = hw;
> >>      }
> >>
> >> +    if (cat->cwb_count > 0) {
> >> +            cwb_reg_map = drmm_kzalloc(dev,
> >> +                            sizeof(*cwb_reg_map) * cat->cwb_count,
> >> +                            GFP_KERNEL);
> >
> > Please move CWB block pointers to dpu_rm. There is no need to allocate a
> > separate array.
>
> Hi Dmitry,
>
> Sorry, I'm not sure what you mean here. Can you clarify your comment?
>
> This is just allocating an array of the CWB register addresses so that
> the hw_wb block can use it to configure the CWB mux registers.

Excuse me. I asked to make the cwb_reg_map array a part of the
existing dpu_rm structure. This way other subblocks can access it
through dpu_rm API.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >> +
> >> +            if (!cwb_reg_map) {
> >> +                    DPU_ERROR("failed cwb object creation\n");
> >> +                    return -ENOMEM;
> >> +            }
> >> +    }
> >> +
> >> +
> >> +    for (i = 0; i < cat->cwb_count; i++) {
> >> +            struct dpu_hw_blk_reg_map *cwb = &cwb_reg_map[i];
> >> +
> >> +            cwb->blk_addr = mmio + cat->cwb[i].base;
> >> +            cwb->log_mask = DPU_DBG_MASK_CWB;
> >> +    }
> >> +
> >>      for (i = 0; i < cat->wb_count; i++) {
> >>              struct dpu_hw_wb *hw;
> >>              const struct dpu_wb_cfg *wb = &cat->wb[i];
> >>
> >> -            hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> >> +            if (cat->cwb)
> >> +                    hw = dpu_hw_wb_init_with_cwb(dev, wb, mmio,
> >> +                                    cat->mdss_ver, cwb_reg_map);
> >> +            else
> >> +                    hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> >> +
> >>              if (IS_ERR(hw)) {
> >>                      rc = PTR_ERR(hw);
> >>                      DPU_ERROR("failed wb object creation: err %d\n", rc);
> >>
> >> --
> >> 2.34.1
> >>
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
