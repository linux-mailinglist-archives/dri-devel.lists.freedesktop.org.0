Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC963F7FBE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 03:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A78E6E45C;
	Thu, 26 Aug 2021 01:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5426E457
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 01:19:17 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 n1-20020a4ac7010000b0290262f3c22a63so394109ooq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 18:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pMEYeQ5q1Ljq7RCcgbyvAyGrNej+EFBY9zbAdIRIdF8=;
 b=NhrGT6GzQFV+9/cdB57tP92jyn9EG5QfIpEhiPDZ4mpxnF8I9IDZ/81f0dFiujSo7b
 JpjHlq3NazHVfSNNQMkKHmAyqxhdqgHYMxmX61QkXGCX8cM95uLVKqgXb4dNQy42IMAK
 pB1sI1ZaWXYCep+QHy0y8K7qTwWK20ggRmViM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pMEYeQ5q1Ljq7RCcgbyvAyGrNej+EFBY9zbAdIRIdF8=;
 b=kjcExFvtCQjvCm78JQkab8Kn1wd7RGTBWESNJ1lbwnZuRQJVUdJC+S/0kUfrhUEg90
 So1qMwpf5+xasI96u4L0r/Y0CGa5lUyi9kmO05uHtLgGnHSOgqgu/Q3gnpGN40mRzbGq
 2UIk6W/kiBvVy2CPvp9CVd38KA5MWQ3Gp5SHMcm0hZruzwBnrvx+ssalCYKD5xiiedPu
 tAgSIQobyeR0TfhiNA3KP5JphZRWhLJ0IXpf3TlSMIYsVuqxCBsThNH/aRAQymJHvy4L
 BAaEO54ZLWoNiRIOkz6Wk26/iY2fx4Eyfg846JwkpAzz8ZsjSsF1P0bIUy6ICB265cQ0
 iAuQ==
X-Gm-Message-State: AOAM531AAdiMmjHBgol5nO90T71nq5mDITbo7xlMPe0Rpy6fiI7LVOCC
 eELXEl49ScXJ3B1wt3Lu0HhBWhdCAcEgVw4LiK2c/g==
X-Google-Smtp-Source: ABdhPJxomUf9wQZ9jtRySIGLFv4shWsL8IPxBTC8ui4hVyxgpcgUn6qSY5GKjS1RD2eDnA8/l8osgey4KpfBW93K2J0=
X-Received: by 2002:a4a:a841:: with SMTP id p1mr987058oom.92.1629940756961;
 Wed, 25 Aug 2021 18:19:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 01:19:16 +0000
MIME-Version: 1.0
In-Reply-To: <20210825222557.1499104-4-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
 <20210825222557.1499104-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 01:19:16 +0000
Message-ID: <CAE-0n53ZVf7E0q_cMEmuQH7q+xytRd-pjerrNnoVHBwqGMr6ZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/msm/dp: Refactor ioremap wrapper
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Bjorn Andersson (2021-08-25 15:25:55)
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index c064ced78278..215065336268 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -19,40 +19,30 @@ static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
>         },
>  };
>
> -static int msm_dss_ioremap(struct platform_device *pdev,
> -                               struct dss_io_data *io_data)
> +static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
>  {
> -       struct resource *res = NULL;
> +       struct resource *res;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
>         if (!res) {
>                 DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
>                         __builtin_return_address(0), __func__);

This error can be removed too, right? At least I thought passing in NULL
as 'res' to devm_ioremap_resource() did that. It actually looks like we
can use devm_platform_get_and_ioremap_resource() and then pass in &res

	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
	if (!IS_ERR(base))
		*len = resource_size(res);

	return base;

> -               return -ENODEV;
> +               return ERR_PTR(-ENODEV);
>         }
>
> -       io_data->len = (u32)resource_size(res);
> -       io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
> -       if (!io_data->base) {
> -               DRM_ERROR("%pS->%s: ioremap failed\n",
> -                       __builtin_return_address(0), __func__);
> -               return -EIO;
> -       }
> -
> -       return 0;
> +       *len = resource_size(res);
> +       return devm_ioremap_resource(&pdev->dev, res);
>  }
>
>  static int dp_parser_ctrl_res(struct dp_parser *parser)
>  {
> -       int rc = 0;
>         struct platform_device *pdev = parser->pdev;
>         struct dp_io *io = &parser->io;
> +       struct dss_io_data *dss = &io->dp_controller;
>
> -       rc = msm_dss_ioremap(pdev, &io->dp_controller);
> -       if (rc) {
> -               DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
> -               return rc;
> -       }
> +       dss->base = dp_ioremap(pdev, 0, &dss->len);
> +       if (IS_ERR(dss->base))
> +               return PTR_ERR(dss->base);
>
>         io->phy = devm_phy_get(&pdev->dev, "dp");
>         if (IS_ERR(io->phy))
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 34b49628bbaf..dc62e70b1640 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -26,7 +26,7 @@ enum dp_pm_type {
>  };
>
>  struct dss_io_data {
> -       u32 len;
> +       size_t len;

len is a resource_size_t above, not sure if that really matters in
practice to indicate it here though.

>         void __iomem *base;
>  };
>
