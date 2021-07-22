Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6F3D2D75
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A772C6EB28;
	Thu, 22 Jul 2021 20:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AAA6EA6D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:13:47 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 b18-20020a0568303112b02904cf73f54f4bso3487730ots.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 13:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qKsLbl4ftBxDVGL+8Xv3wy3RrHHwlm4ZdwpMuB2e6Zc=;
 b=cy6RGI0upWuDzcIDJDjrUbeixGYdyNHqcCew2PK2EHben9nudlwMPCXkjfSN2o79c3
 ZYmprGRdOn2pLrnxHwntcjZiK4dSTHQWBTPSC0vHgpu0EtmrIFBG2Tj/GPb7QQtAidJ+
 Ud1oETARJqm2UB9Q0wyijdKSyTZkyTI7sbu2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qKsLbl4ftBxDVGL+8Xv3wy3RrHHwlm4ZdwpMuB2e6Zc=;
 b=R6jG3/V29rSVRZO22cB+5fTBqUuI2K75fUMzm5WMjn9RBd2Mevad6oHWtVk4UrY7VD
 7VdapO08sBJD6/dVCPqYcF8iZ8v+qpYRK44s0Y9ngpIaEaI5zb2opK4uA0ggl9ucsv9l
 C0M82JziQuBWoycR461jJxrDsydrcpMAuRdKO1fPiRH72Xdjm2bvi84jJ0sJvHGbzaNN
 KWcgIucahxn83t8aoip0yS/Dq+UciDaFW98TGxtWjZttsWTR5oFlnVcGD8j5gqdlRILD
 K6uJzVTIOiADApKwL1OyBJoA7J+NUKZNyjOkuJrQCnpLbfMA/QVLrJsQYAqSF6KGAkEA
 1UYg==
X-Gm-Message-State: AOAM531l21+gn/Bx/ZPRsEAqzRtk3My7zLAk3Hobuv1VKbR8RcKUuyOH
 GCKdSa62EIasHMK9555+weNx7Q2jrNcBRtWfOJHDkw==
X-Google-Smtp-Source: ABdhPJwIl16lQ2mmX4iprXcdHpT0Zqsdlm8fGu+ct18LB1YcWieMT7VWuxhGrTSnANkJ6R8Bx+l5kozaI+tRboNiEPA=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr979364otl.233.1626984827240; 
 Thu, 22 Jul 2021 13:13:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:13:46 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-5-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-5-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:13:46 +0000
Message-ID: <CAE-0n50Lbt0fnhRCnrcaZrM5+sn6giM9meJBEJOZdCS1z98Jzg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dp: Store each subblock in the io region
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-21 19:42:26)
> Not all platforms has DP_P0 at offset 0x1000 from the beginning of the
> DP block. So dss_io_data into representing each of the sub-regions, to

"So dss_io_data into" doesn't make sense to me. Is some word or words
missing?

> make it possible in the next patch to specify each of the sub-regions
> individually.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 64 +++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 30 ++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_parser.h  | 10 ++++-
>  3 files changed, 54 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index e68dacef547c..1a10901ae574 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -11,6 +11,15 @@
>  #include "dp_parser.h"
>  #include "dp_reg.h"
>
> +#define DP_DEFAULT_AHB_OFFSET  0x0000
> +#define DP_DEFAULT_AHB_SIZE    0x0200
> +#define DP_DEFAULT_AUX_OFFSET  0x0200
> +#define DP_DEFAULT_AUX_SIZE    0x0200
> +#define DP_DEFAULT_LINK_OFFSET 0x0400
> +#define DP_DEFAULT_LINK_SIZE   0x0C00
> +#define DP_DEFAULT_P0_OFFSET   0x1000
> +#define DP_DEFAULT_P0_SIZE     0x0400
> +
>  static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
>         .num = 2,
>         .regs = {
> @@ -48,12 +57,25 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>         struct dp_io *io = &parser->io;
>         struct dss_io_data *dss = &io->dp_controller;
>
> -       dss->base = dp_ioremap(pdev, 0, &dss->len);
> -       if (IS_ERR(dss->base)) {
> -               DRM_ERROR("unable to remap dp io region: %pe\n", dss->base);
> -               return PTR_ERR(dss->base);
> +       dss->ahb = dp_ioremap(pdev, 0, &dss->ahb_len);

So many layers of gunky goo!

> +       if (IS_ERR(dss->ahb)) {
> +               DRM_ERROR("unable to remap ahb region: %pe\n", dss->ahb);
> +               return PTR_ERR(dss->ahb);
>         }
>
> +       if (dss->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
> +               DRM_ERROR("legacy memory region not large enough\n");
> +               return -EINVAL;
> +       }
> +
> +       dss->ahb_len = DP_DEFAULT_AHB_SIZE;
> +       dss->aux = dss->ahb + DP_DEFAULT_AUX_OFFSET;
> +       dss->aux_len = DP_DEFAULT_AUX_SIZE;
> +       dss->link = dss->ahb + DP_DEFAULT_LINK_OFFSET;
> +       dss->link_len = DP_DEFAULT_LINK_SIZE;
> +       dss->p0 = dss->ahb + DP_DEFAULT_P0_OFFSET;
> +       dss->p0_len = DP_DEFAULT_P0_SIZE;
> +
>         io->phy = devm_phy_get(&pdev->dev, "dp");
>         if (IS_ERR(io->phy))
>                 return PTR_ERR(io->phy);
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index dc62e70b1640..3266b529c090 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -26,8 +26,14 @@ enum dp_pm_type {
>  };
>
>  struct dss_io_data {
> -       size_t len;
> -       void __iomem *base;
> +       void __iomem *ahb;
> +       size_t ahb_len;

Maybe make another struct and have a few of them here

	struct dss_io_region {
		void __iomem *base;
		size_t len;
	};

then the code reads as aux.base and aux.len and we know they're closely
related.

> +       void __iomem *aux;
> +       size_t aux_len;
> +       void __iomem *link;
> +       size_t link_len;
> +       void __iomem *p0;
> +       size_t p0_len;
