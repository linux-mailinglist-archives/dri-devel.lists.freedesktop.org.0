Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C71AB7A73
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 02:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF2C10E06E;
	Thu, 15 May 2025 00:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RZhGiCOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872C010E05C;
 Thu, 15 May 2025 00:18:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ADACF43D2F;
 Thu, 15 May 2025 00:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD39C4CEED;
 Thu, 15 May 2025 00:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747268279;
 bh=ppDSPmOlcI1EuIFNI/saJdi1z4iWtdBVsF+tyMghoG8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RZhGiCOrdqbR8qAu7bNRM4kd3gnHsJDc10HaqGtlzktXawW7VpvKwYrXS3AyCn5LL
 +MeRVMYW2qmBqq7WzM5r8g8q2s1KfmB5K3SAyFVYqBXZZraqLm/VkJQBepoHY5YI3L
 sbgFBNNXNkjboNPZWWOQlzsa9fnGlU2KV8n58TlrJUj8nr/1grACy9X9cioyRNzUhp
 4MqT33rInfCmvzkQKxuCQZMY3HwcxjXmzl8eO32OMwxrpthaX4+5ResGIfFYTaWI6R
 fCnMKucvI6xbJCX8Yrw5ooqAgGF9hJaUgiRxL1+vFZ4+4Dq92xv5F9aU8FfwOpTJHl
 9+60FCifOc2Lg==
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-30c47918d84so386203a91.3; 
 Wed, 14 May 2025 17:17:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/GjVWaXOfBiSQmrAHqs+Jo6RvDQ0SbCkGwSG+GxTJYoAS5KphnkNB/+dq9i22qwz2CR4OEu5z+FM=@lists.freedesktop.org,
 AJvYcCUE6tqa/wsEnpxWXo9UNw9PO9r7ew/F74PDZMXKDNngt3nVq1489ddj/aoh57xneFDXmdYuZRi9NJgu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsP5LEVGfmGUMU2mKUynLWxEPmoK/q0ADJeQN6IOPPenaHUjEI
 Hf5MI8/+OWmte91VRlB7z/wyG0bm0u4ThrZQ+kB4VEyoDfEOSUA1SN+3bY2l+kjTc4vlAtWJiMK
 3kLYFkQVI8Zm2Dgd72MhMzpMejtA=
X-Google-Smtp-Source: AGHT+IGNsbGjJq8Dz2ZQCS8Wh8/6+oFoCFbOfcGLbDjKt3An0usGoL8I1l5+JBXpJFUekYaPxio/w2jC/odyt4ldbKs=
X-Received: by 2002:a17:90a:d64f:b0:30a:2196:e654 with SMTP id
 98e67ed59e1d1-30e517853e7mr1036498a91.15.1747268279075; Wed, 14 May 2025
 17:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Thu, 15 May 2025 03:17:48 +0300
X-Gmail-Original-Message-ID: <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
X-Gm-Features: AX0GCFuaEv9cpS42k1XF87YPo9WSvjg8iXOg6oOZGPtLNGJgkjMpQbVPpysTOVE
Message-ID: <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, 15 May 2025 at 02:52, Jessica Zhang
<jessica.zhang@oss.qualcomm.com> wrote:
>
> Since the max mixer width is not a strict hardware limit, use the actual

Is it? What is the actual max width that the mixer can support?

> hardware limit (the writeback maxlinewidth) to filter modes.
>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 8ff496082902..0a198896f656 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>         struct msm_drm_private *priv = dev->dev_private;
>         struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>
> -       /*
> -        * We should ideally be limiting the modes only to the maxlinewidth but
> -        * on some chipsets this will allow even 4k modes to be added which will
> -        * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
> -        * and source split support added lets limit the modes based on max_mixer_width
> -        * as 4K modes can then be supported.
> -        */
> -       return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
> +       return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
>                         dev->mode_config.max_height);
>  }
>
>
> --
> 2.49.0
>
