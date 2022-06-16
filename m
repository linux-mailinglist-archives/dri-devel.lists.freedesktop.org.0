Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6270454D862
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 04:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6299010EE5E;
	Thu, 16 Jun 2022 02:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6DD10F304
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 02:34:49 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v143so324134oie.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 19:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ZXzBYl7c4qhw0nAJ+Zs1jCGG0+YRodCryRVN6/4gvzM=;
 b=ggJmfGCPsbsopNVADBV2HKnPKfr9VRAHXlBBfNm/8YCMgP+0xJLx+S6W+EAH9wimOg
 JFnqPOJl3Mq1Gw2hIVLkfT2XCSJhbwydzaQl+QIZp+hadAtTrTqNsEdqknQcmn/DwqIY
 3ackF/HDy9VPD3bRAWdTXALtsPHsdsC9xMxAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ZXzBYl7c4qhw0nAJ+Zs1jCGG0+YRodCryRVN6/4gvzM=;
 b=pC9HuuGBHGhBkAnronM7MlTIfqNmOy95pzmBt7sF1iUZnWjWAu8BX9rDLzesGPEA0B
 /MCMiwO5xVpAK35VQtNNAgyRonUVxvfBSs7Fxdq9t/tGOhro0oTOjx+fmdSQRlTN2+J8
 /ToEnxUoY6/yONM/iyCjer93tjB2cZrBDIO+cx4omNHvGMbtYOPGLuGauHDT+6JYGfxi
 OZFfYVFEwrOJzzR/1z/v33PaCOL09M7LNzGg/qwwse0R/GM4na8f7t/7tthjan25hiLN
 j1vCQI9f8YPN6xbywt8B6GL8q0tI62GEbFgCVSfd7f9t7Nnh/6sgZX1/h933+KdMNtT5
 ZJdA==
X-Gm-Message-State: AJIora9nro5ECPz4Kozr0z1zOOnWnnpQoVidKhK6xg6cMiXpaCr+I6wW
 WqvatOz22ALse2VfXYF5faTiMP83cdz/rBpxW6YN7g==
X-Google-Smtp-Source: AGRyM1sa6lplkMCFOipTd6Swl2l6u6vpT25FP3UquGCoDEY0DTPWPu6rIDvFT/FDYo/EvUHSAfEBD56GyD6Ms+JkhYQ=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr1497286oib.63.1655346888488; Wed, 15
 Jun 2022 19:34:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jun 2022 19:34:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220505001605.1268483-5-dmitry.baryshkov@linaro.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 15 Jun 2022 19:34:47 -0700
Message-ID: <CAE-0n53nQS=m1SsGaYavtyTgJbO_uFqp51srexY2H1rK-hz0=g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/msm: move KMS aspace init to the separate
 helper
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-05-04 17:16:04)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index a37a3bbc04d9..98ae0036ab57 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -262,6 +263,46 @@ static int msm_drm_uninit(struct device *dev)
>
>  #include <linux/of_address.h>
>
> +struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
> +{
[...]
> +       }
> +
> +       aspace = msm_gem_address_space_create(mmu, "mdp_kms",
> +               0x1000, 0x100000000 - 0x1000);
> +       if (IS_ERR(aspace)) {
> +               mmu->funcs->destroy(mmu);


> +               return aspace;
> +       }
> +
> +       return aspace;

This can be 'return aspace' one time instead of two.

> +}
> +
>  bool msm_use_mmu(struct drm_device *dev)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
