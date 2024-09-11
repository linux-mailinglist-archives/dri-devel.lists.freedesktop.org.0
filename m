Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D526C974FC0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 12:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3510E7BE;
	Wed, 11 Sep 2024 10:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XI+5VaaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1816F10E7BE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 10:35:06 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6db4b602e38so45797327b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726050905; x=1726655705; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pguXKho2iGtNY7bbPN64vthkTwD/qntrSgD7BpHG+7Y=;
 b=XI+5VaaTB/6yDieaELjHPKEEmoi0dHaqCxLvJNWeQ07oUwE3dJ2IeSKY5WfpkfXCOD
 cVsU+Bf4WzIC+NZiDj+SRo4524H8GBpzXCmq2K8s+A6nw0U8odgHCrHm8Ahlg99zNL+X
 40yu3ddxMrB0H0VKWfX12qaKJ9Xpz8lkh6/bxHKRjouy7vuiuO8Tp2MifAqvKs8Ti9pm
 Hpg5eHtN8yRzoUR96dtRw6E7QcJ1cYJvcSga5XSGlX/0JJEne9ZZHdxaqsPkeGrLepFs
 aPuVhIm0oaX6ZTkMLT7ZUFPYifnb0cpP+XMsz5+IG4FDdL0xWM0Qbgh3sUYnOVqXenUN
 TNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726050905; x=1726655705;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pguXKho2iGtNY7bbPN64vthkTwD/qntrSgD7BpHG+7Y=;
 b=J9ln5i+JoeIWxFNG8URecgwlyNBabN2MpeOM7s+y6cI3juVUgTPygfxsOOBl1HDVVo
 HZd3dZgwPm5a10GwF5Gx9yZ3wx1I2Q61W0acPhmL+34gSpxxc1JoMj4c73/LEqn9aVbF
 b5ZpSpLgFAyqOYCbHh33EaTMgMJuYrubxdwjic/OEvMrHiSJZJusp4ulC5U7oU/0Ka6u
 YmjBesY50NrRk3vUVF403VbLRRdNRi3t8J9iJT6DdhiBZalhqtYWvzV1T7oC2xRSgGOl
 6tISHRrc549d+8588y3DBiFY6ADgy5c1MOKv4a5rInOgRIoFTr18Ov6r/AXHBNXR0pTP
 CAfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa33KjdqeiQOuDjnkwhdEwNg1NfrliQWcLfbbTqrBUn2yKH9RuEHktNuhRLw5116bNLCLoWj2f5eA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMmc6EovZEsYv18g+9ZCI7SC8Oo2jQIdXIgYt/7bGVcRYK0kxS
 iRcVu6/TmfIecjTIws+q3950IP7iI09TIy8dVCpXn/udCz2X64GXsh8S62qmiwCbSjH36R7NLYx
 DRckc648eIYdDdWqT9b5i04dLp/oSU2hfhkhsuw==
X-Google-Smtp-Source: AGHT+IEXGUo8iYr83kd7B9iECVwc8bdMpc/xy3+lDcZrAKDkVX5G5H8kLtfBabKLQx3cToAQvvvkY6Dr2nHmCs148Lw=
X-Received: by 2002:a05:690c:2889:b0:65f:8209:3ede with SMTP id
 00721157ae682-6db452740b1mr148903587b3.44.1726050904691; Wed, 11 Sep 2024
 03:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
 <20240911100813.338-3-quic_mukhopad@quicinc.com>
In-Reply-To: <20240911100813.338-3-quic_mukhopad@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Sep 2024 13:34:53 +0300
Message-ID: <CAA8EJppLFWpf0QSmzAo5nqu=iMALyKzxEvy7sD5R0LDYSbA_7w@mail.gmail.com>
Subject: Re: [PATCH 2/5] phy: qcom: edp: Introduce aux_cfg array for version
 specific aux settings
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
 quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
 quic_vproddut@quicinc.com
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

On Wed, 11 Sept 2024 at 13:08, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
> In order to support different HW versions, introduce aux_cfg array
> to move v4 specific aux configuration settings.
>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 34 +++++++++++++++++------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index da2b32fb5b45..0f860a807d1b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -90,6 +90,7 @@ struct phy_ver_ops {
>
>  struct qcom_edp_phy_cfg {
>         bool is_edp;
> +       u8 *aux_cfg;
>         const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>         const struct phy_ver_ops *ver_ops;
>  };
> @@ -186,11 +187,14 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>         .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>  };
>
> +static u8 edp_phy_aux_cfg_v4[10] = {

static const u8, please.


> +       0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
> +};
> +
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> -       u8 cfg8;
>
>         ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
> @@ -222,22 +226,20 @@ static int qcom_edp_phy_init(struct phy *phy)
>          * even needed.
>          */
>         if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
> -               cfg8 = 0xb7;
> -       else
> -               cfg8 = 0x37;
> +               edp->cfg->aux_cfg[8] = 0xb7;
>
>         writel(0xfc, edp->edp + DP_PHY_MODE);
>
> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
> -       writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
> -       writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
> -       writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
> -       writel(cfg8, edp->edp + DP_PHY_AUX_CFG8);
> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
> +       writel(edp->cfg->aux_cfg[0], edp->edp + DP_PHY_AUX_CFG0);
> +       writel(edp->cfg->aux_cfg[1], edp->edp + DP_PHY_AUX_CFG1);
> +       writel(edp->cfg->aux_cfg[2], edp->edp + DP_PHY_AUX_CFG2);
> +       writel(edp->cfg->aux_cfg[3], edp->edp + DP_PHY_AUX_CFG3);
> +       writel(edp->cfg->aux_cfg[4], edp->edp + DP_PHY_AUX_CFG4);
> +       writel(edp->cfg->aux_cfg[5], edp->edp + DP_PHY_AUX_CFG5);
> +       writel(edp->cfg->aux_cfg[6], edp->edp + DP_PHY_AUX_CFG6);
> +       writel(edp->cfg->aux_cfg[7], edp->edp + DP_PHY_AUX_CFG7);
> +       writel(edp->cfg->aux_cfg[8], edp->edp + DP_PHY_AUX_CFG8);
> +       writel(edp->cfg->aux_cfg[9], edp->edp + DP_PHY_AUX_CFG9);
>
>         writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
>                PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
> @@ -519,16 +521,19 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>  };
>
>  static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
> +       .aux_cfg = edp_phy_aux_cfg_v4,
>         .ver_ops = &qcom_edp_phy_ops_v4,
>  };
>
>  static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
> +       .aux_cfg = edp_phy_aux_cfg_v4,
>         .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>         .ver_ops = &qcom_edp_phy_ops_v4,
>  };
>
>  static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>         .is_edp = true,
> +       .aux_cfg = edp_phy_aux_cfg_v4,
>         .swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>         .ver_ops = &qcom_edp_phy_ops_v4,
>  };
> @@ -707,6 +712,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>  };
>
>  static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
> +       .aux_cfg = edp_phy_aux_cfg_v4,

Is this correct? Judging by ver_ops, X Elite uses v6 of the PHY, so
maybe it should also use v5 AUX tables?

>         .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>         .ver_ops = &qcom_edp_phy_ops_v6,
>  };
> --
> 2.17.1
>


--
With best wishes
Dmitry
