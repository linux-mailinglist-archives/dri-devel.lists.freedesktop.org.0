Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BD730F50
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 08:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B5410E10A;
	Thu, 15 Jun 2023 06:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6CD10E10A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 06:28:34 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-bc492cb6475so1410661276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 23:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686810513; x=1689402513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sl1LNkel2Jey/Q+VPNL7my6PAtZgOtyvxavcL0DTR4Y=;
 b=EygD5j0QlxcIGYupF35Vj1wtDKts5LDzLPDn5WDh9l6m+UlHM6cmB6bRcxjiCKro51
 RjdJaQiEUB+EdJjCtnhRvEVxyI7ClH6pEzI9YOxrfaAsNLDwj16sdqYxsUnDV99H4aaU
 ZJyZ6sFGAfNt0y1ekhXQNFZjigYPyD8mL0hZxZzxBkD2NBmAA1d1gm3As1xZKv42fxbv
 XnsOea/gFF7t+hy0RLiIbG9bwvuxHAgANu9ORtUe4jly0fsQQAIDc6IQQjgwvGBrKVVH
 qwaRPT35uNgdZN3aoMBr9Ys7C+0FBm3hV3MnQunimazRPsRle2qTonvW1gcNdzlNRJtC
 XouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686810513; x=1689402513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sl1LNkel2Jey/Q+VPNL7my6PAtZgOtyvxavcL0DTR4Y=;
 b=gNmesl1EvEQvbFyEceuwJjHxvJd1fcmInOKBOM9a/cnsj9pj2DpNKVHDDwMwCvBnqN
 FAPC+Uo74+4FGlwWjy2zy1cTJwIkVGiXdSGNFhqZOZuU/+wyMZWwNGiKz5R5ZD6RX/uF
 +WtkxzQq3FyWK+Xcq+jZnl7uoTu8Nkqe9/yCXR9Bxc658wDSZRgig7h62w4/4jhDrJM8
 lEoRkZKCzORUZEZp7KAGGFbSQQ5h0FnOZKwE7ImOBBKVXShMjFrnVMlW6zbaFav1phAx
 UDZcqzVd4qIoi2DZH1+xbBkuOAp2TgLh9VXi31SClBHSRlXbLvaw5rEQBtWu7zXTblAj
 eh5w==
X-Gm-Message-State: AC+VfDzgnhPTEDsZDLyJQnlstcLP4tKCgmK234SkCLlq+pzuCqheAkHZ
 HgSR86KNQVmtPrSETeL5cZSsURq5tk/gN+mu+SDSmw==
X-Google-Smtp-Source: ACHHUZ5QQ7NM8OdLRY2rhKKn0eJJKrToeLatwb0wJspABwcTXVGkWpuDYwEgYMm7GhA+ErIn3CcSdu5DqMV6YDMP9G8=
X-Received: by 2002:a25:2601:0:b0:b9e:712f:4a17 with SMTP id
 m1-20020a252601000000b00b9e712f4a17mr3583179ybm.6.1686810513685; Wed, 14 Jun
 2023 23:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Thu, 15 Jun 2023 14:28:22 +0800
Message-ID: <CAMSo37UVzFyigaTvKjxV-4Gvit8H4n8DtwC=2PYWGTr6L555Rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: do not enable color-management if DSPPs
 are not available
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 at 02:25, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> We can not support color management without DSPP blocks being provided
> in the HW catalog. Do not enable color management for CRTCs if num_dspps
> is 0.
>
> Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
> Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Thanks for this fix!
With it applied to the ACK android-mainline branch,
the "dpu error" problem reported here:
    https://lore.kernel.org/lkml/CAMSo37VmhB1-PUp1qu8gaxOXtu98eEYmWd71FOai+cwLb-JvSg@mail.gmail.com/
is not reproduced.

Tested-by: Yongqin Liu <yongqin.liu@linaro.org>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6e684a7b49a1..1edf2b6b0a26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1463,6 +1463,8 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>                                 struct drm_plane *cursor)
>  {
> +       struct msm_drm_private *priv = dev->dev_private;
> +       struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>         struct drm_crtc *crtc = NULL;
>         struct dpu_crtc *dpu_crtc = NULL;
>         int i, ret;
> @@ -1494,7 +1496,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>
>         drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>
> -       drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +       if (dpu_kms->catalog->dspp_count)
> +               drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>
>         /* save user friendly CRTC name for later */
>         snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> --
> 2.39.2
>

-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
