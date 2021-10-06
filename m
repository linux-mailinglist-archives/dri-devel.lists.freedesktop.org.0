Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC942353F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 02:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17C06E492;
	Wed,  6 Oct 2021 00:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3E6E492
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 00:43:11 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id n64so1724040oih.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 17:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=wKt6Nae01mSLjqjYH36TB6q2xyVedx1Ybson8Q1DwNo=;
 b=iFAJ9/IgDbQ7Sy4xqhyBxFt3v9D8bevCQfBgMV5P6XDy12y+C8h/tYzAwW05HvLVoq
 GKGeSuk+uuQYFr/xhhCWujoSKaXnwZ6F0I3iIo3xYZyyhO5TtALLjhLHeoq7cZU88mD+
 b+wsFarnUhcTgAiki9DVDpNtzwpTkktWrQwPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=wKt6Nae01mSLjqjYH36TB6q2xyVedx1Ybson8Q1DwNo=;
 b=PQxc2INCDQzkX23y3kwF1IAoQG08+WG0F4SZQA0hQcuXp97eRDoLdpeoNOV2DCah0V
 IZUsTx+nj1bIOir4O9UEz4HwYCLTnsfLpjzKo3ncP5Yb+QY8F8XcdRmTBRJMrgOTo07h
 GmU8rOlhoOqodC8GP15JJwIL0KqaxEEyWjF0wsDvTEBAQQUCw6LDNYxGqyjxIIgivfDE
 Sf++rgakRP2C145m01DEI+jRqkQnq7QSWv34zfUpjtv3RfrT/TISI610G0A0Emot4X+n
 8HJRqBODLt/3Z8Yu0/8C2oHh045GS+Tx5v9U1DpFX5LgF6X60SB2NZE3VUogaMncoM3Q
 Okfw==
X-Gm-Message-State: AOAM533Kt9KvxTcz1g3DXUs0SvsB/3yCmIP5qjc0KMfiP2fpIEzPfZWP
 UaBbYgVFYwFvOnVQp4oXfGc/n3MoHij3DouQrnmuGA==
X-Google-Smtp-Source: ABdhPJya2fZABu/CNUYa983sa9i2c4DPhWV3wKcrOj61v8RSJ6oV5qsUFBtRizZg3Lv11yJZ04jeeHU1MRPlii5J3mY=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr5038548oia.32.1633480990745; 
 Tue, 05 Oct 2021 17:43:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:43:10 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-6-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-6-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 17:43:10 -0700
Message-ID: <CAE-0n52gOCC8bUfMFnNHRKFoq2=q4Ho8a-UYH5JKgumguhUD2A@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/msm/dp: Support up to 3 DP controllers
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
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

Quoting Bjorn Andersson (2021-10-05 16:13:21)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bdaf227f05dc..674cddfee5b0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -79,6 +79,8 @@ struct dp_display_private {
>         char *name;
>         int irq;
>
> +       unsigned int id;
> +
>         /* state variables */
>         bool core_initialized;
>         bool hpd_irq_on;
> @@ -229,7 +231,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
>
>         dp->dp_display.drm_dev = drm;
>         priv = drm->dev_private;
> -       priv->dp = &(dp->dp_display);
> +       priv->dp[dp->id] = &(dp->dp_display);

Can we drop the extra parenthesis?

>
>         rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
>         if (rc) {
> @@ -269,7 +271,7 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
> -       priv->dp = NULL;
> +       priv->dp[dp->id] = NULL;
>  }
>
>  static const struct component_ops dp_display_comp_ops = {
> @@ -1233,7 +1239,7 @@ static int dp_display_probe(struct platform_device *pdev)
>         if (!dp)
>                 return -ENOMEM;
>
> -       desc = dp_display_get_desc(pdev);
> +       desc = dp_display_get_desc(pdev, &dp->id);

I'm sad that dp->id has to match the number in the SoC specific
dpu_intf_cfg array in drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
still. Is there any way we can avoid that? Also, notice how those arrays
already have INTF_DP macros, which makes me think that it may be better
to connect this to those arrays instead of making an msm_dp_desc
structure and then make sure the 'type' member matches a connector
type number. Otherwise this code is super fragile.

>         if (!desc)
>                 return -EINVAL;
>
