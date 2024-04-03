Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD289788E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 20:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A85D10E2F8;
	Wed,  3 Apr 2024 18:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EnB0BvCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A15A10E2F8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 18:49:00 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51588f70d2dso222789e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712170138; x=1712774938; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T4UlKp0+98qrBZkCwolOL0UjNpShY+5uDH6xj75f1ck=;
 b=EnB0BvCnbkWcgeYAdWaPtYDlThqTSAxSEth/+H7LbIyLH4WPlxbrxG+iMCrk8Q8Zo3
 yzZ9nCSmI7htHN+bJjiZb4Ijwg9/trb5ODrJVZvVYS88IdabLl+T32suEYKJPDdEeDPk
 CyevFHQ20ivNK/d08BW4j6SKvYNOb4sCvNWC/BAktM3moriz2YGCSw+1m0F2tJFxUMAT
 KQlUiBTwJImKyoR5fH3mC/7yaUYmNOMvi8/5o3TmPb3tExbwGKzN6AvtmSGEYsRYrm6B
 kOpn3nVbYF+4IdnRcAO7bAas3zJ0KR2v6syKhZGbdwHGmu0WHkcciGR8zyJWkf94w4VP
 JYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712170138; x=1712774938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4UlKp0+98qrBZkCwolOL0UjNpShY+5uDH6xj75f1ck=;
 b=fdxxjmf8oWVwBlkuqmWhIPpXUiSu+cRHzohc22IL8elERjYWinu/xJUnoS08wP/0Og
 GvzhWmAh6L6Fqjl/TfYHHwkGE64zqs3t/Evh4cLP15ynERQaO7BdgMk7PwCG75u2e/rQ
 Z3rd4+UU/2/Mg7/NWHcCLBPFrSdY/2u+psic1iTLHj33G4cEhXMOGgm/sGbQLsWHULoi
 1urnFaecF9fhRC/sv10P2KFTeHZB9SdqXymgtYbpkefVrHg8C752Y84CrIEeqr3TgjKw
 zScB9MruV1ZgID5By1WxoECLqh434w5YgLab31RFD6HX1/ti+cVlrHOpDJM0yoO0TuTt
 zxeA==
X-Gm-Message-State: AOJu0Ywx1h4RI1w4dNWe23zlB2Bsvdpx9tZGHg+SSElHvB+1Y9MIi4uz
 1GgAqjOnC9E6tB/wDFHOcFlOxckxB0W6G5z5PexXl7+V7Tmr2UDOaaqZCyvffPI=
X-Google-Smtp-Source: AGHT+IGZxvocFB/k0J1XWTW3eUyufirz8K/RKSIbDf1a05LsDIVRxq4ve4g34j9XhmrysecJIF9Tkg==
X-Received: by 2002:a05:6512:34ce:b0:516:a2fc:9099 with SMTP id
 w14-20020a05651234ce00b00516a2fc9099mr198845lfr.60.1712170138090; 
 Wed, 03 Apr 2024 11:48:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a19f515000000b00513cb11cd66sm2069424lfb.219.2024.04.03.11.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 11:48:57 -0700 (PDT)
Date: Wed, 3 Apr 2024 21:48:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
 airlied@gmail.com, agross@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, 
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
Message-ID: <oqqpypb7qkcjrztjpqkkqlg6m55fm6hjhts7plytr27hrdmvcp@og7gwdajvsje>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
 <23f591d7-a5d6-c5d1-9ba1-1584e32e5164@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23f591d7-a5d6-c5d1-9ba1-1584e32e5164@quicinc.com>
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

On Wed, Apr 03, 2024 at 10:22:37AM -0700, Kuogee Hsieh wrote:
> Dmitry,
> 
> Any more comments?
> 
> On 3/29/2024 12:50 PM, Kuogee Hsieh wrote:
> > Currently qmp_combo_dp_power_on() always return 0 in regardless of
> > return value of cfg->configure_dp_phy(). This patch propagate
> > return value of cfg->configure_dp_phy() all the way back to caller.
> > 
> > Changes in V3:
> > -- add v2 changes log
> > 
> > Changes in V2:
> > -- add Fixes tag
> > -- add dev_err() to qmp_v3_configure_dp_phy()
> > -- add dev_err() to qmp_v4_configure_dp_phy()
> > 
> > Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy")
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > index 36632fa..513d99d 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > @@ -2343,8 +2343,10 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
> >   	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
> >   	ret = qmp_combo_configure_dp_clocks(qmp);
> > -	if (ret)
> > +	if (ret) {
> > +		dev_err(qmp->dev, "dp phy configure failed, err=%d\n", ret);
> >   		return ret;
> > +	}

dev_err() calls are not related to the fix itself. Please split them to
a separate patch.

> >   	writel(0x04, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> >   	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> > @@ -2519,8 +2521,10 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
> >   	int ret;
> >   	ret = qmp_v456_configure_dp_phy(qmp);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		dev_err(qmp->dev, "dp phy configure failed, err=%d\n", ret);
> >   		return ret;
> > +	}
> >   	/*
> >   	 * At least for 7nm DP PHY this has to be done after enabling link
> > @@ -2754,6 +2758,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >   	const struct qmp_phy_cfg *cfg = qmp->cfg;
> >   	void __iomem *tx = qmp->dp_tx;
> >   	void __iomem *tx2 = qmp->dp_tx2;
> > +	int ret;
> >   	mutex_lock(&qmp->phy_mutex);
> > @@ -2766,11 +2771,11 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >   	cfg->configure_dp_tx(qmp);
> >   	/* Configure link rate, swing, etc. */
> > -	cfg->configure_dp_phy(qmp);
> > +	ret = cfg->configure_dp_phy(qmp);
> >   	mutex_unlock(&qmp->phy_mutex);
> > -	return 0;
> > +	return ret;
> >   }
> >   static int qmp_combo_dp_power_off(struct phy *phy)

-- 
With best wishes
Dmitry
