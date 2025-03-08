Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D572A57B8D
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 16:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD4810E1F3;
	Sat,  8 Mar 2025 15:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pCh1E7se";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830E410E1D9
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 15:25:20 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30613802a6bso29997341fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Mar 2025 07:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741447519; x=1742052319; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HKBg6m2ZBD+SRolEbJmxTaEbWBs0aYZ+E9F5kWCXB5g=;
 b=pCh1E7seoI/UEWudAjFm8KTmwFx8PiQYAKUq/tOZeqeVprTjh5v2cYLeXBMMkujr9s
 WK6tmuZbNSHT7OocxgVNLiDUlkEDuyDkTlBSslS3sssB8NpQr8LHVMwQ62UnRyG2064h
 J1vhoxwRKsneVH8UdtkGF7oTBtGmr6hkvTmaAM6xcBIWhA5Twb6L5IkQ2AU+3G3K1sXh
 3+Pwkb/OM3N7obadM0yTSJwLiJmFbGIHP+pgf4AEHbRgR2R7Xepz6WCMLNehlVOsND3y
 QyT9nsui2n6tnZflJOa5HqkF3zQnz6IKz47lpWhsiPflAvTevfbjZngKs8yyMyBEXlXJ
 HZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741447519; x=1742052319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HKBg6m2ZBD+SRolEbJmxTaEbWBs0aYZ+E9F5kWCXB5g=;
 b=XDz1Fccm1kZeD1H611s/RRGBRAx1YFd3dFRFey3rjF6Mn+Lw8gpIPzs7npcgtFcWvV
 JTiE/r0b2ctt0V0Tii0226BPh7zU+yRKuK9qGLDL4s/S1Wwf4oRFgHOGDGXaAvFB+RTb
 /dH7k0GU7NdYziumBtKYwstto4RmD9mh+ta4XA+uT/ZNA+72zLDpSArPjacjUL+fh9ia
 9zATt9ENUIhgVbYwvCOy79GU891i8UfeRGQ0zDhSjQkne5c9RXbYVbM/vyQWQ+zfGoKs
 BV8/Os1c4FoQbcuWPWgUuL73iY1orMHCwgvDjsWJJ8gc99aU2WSp8G8QCbTE9fHhVynv
 PEyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6U5wSbqxhv4juiu+Zhe0Ypu7VMNbLXL+PEEq7BDK1IcWjNTEsiHhjUb+CZ4Ox/kbAfzw95TaCSKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh/jg7TS+8JP7iA4UgfKrqcHHYit0MozuqHbkTJnTvMT9ViiVK
 zfcBk238YG38F0DlqNuEKz9+ccV5YlXaolt2O0M2XPNAl8UxDtpUbNZFytCeGsU=
X-Gm-Gg: ASbGncuX3l/t7dK/i3qHG0kKcHUHGjlunXM5/8WtnWeVtJo6Vaesp4U8zmh1EANqI5S
 vkOjXXmnJE9zbpvIWkLT4t2aW22JzHmelem3N/P3wxnbK3Cqi+M/x1oMfWxK56Eo+C/wiqkNVVE
 iWYCWBXwvIwDokdSjZJISu12LKb5waObac12C+jamaoJ2wKZQ1gPXaZWv/5WKs/Cz6sE16LIemE
 yskIbQ3VHat+xsO3ooEVT7sadUYxRAiI7jkGQjdSKs3Y6ZvXZvhZDpLVv8f4vtwwE8UmcCFEsbH
 9e2VZBo6yPx8vxtoSwFS+hAT7nKSgFZv2cd/yMfUOQnPcqFXAZCWqqOK6Gv6RiRG6SGTf+2V3qm
 dOPrHIqfNCWsLebVN8QTznwFJ
X-Google-Smtp-Source: AGHT+IGa+Ul+zGmtbtHzOv+NiUo+h+jc38TvQkxrCnLVKsfBxUNjbh9YNgRAJWxI0GRtuRncaHMZ6w==
X-Received: by 2002:a05:651c:19a1:b0:30b:ec4d:e5df with SMTP id
 38308e7fff4ca-30bf466dbcfmr32754081fa.34.1741447518937; 
 Sat, 08 Mar 2025 07:25:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be99c85c0sm9452071fa.87.2025.03.08.07.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Mar 2025 07:25:17 -0800 (PST)
Date: Sat, 8 Mar 2025 17:25:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, 
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] drm/msm/dsi/phy: add configuration for SAR2130P
Message-ID: <qextyfjeniihulyilehcldd5x5pdpaxo3etstlcq4a43cka3a4@4n3mqkjjysqt>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-7-1d4c30f43822@linaro.org>
 <53c3d2c3-2bfb-43f9-ad25-0d1fdd96f19f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53c3d2c3-2bfb-43f9-ad25-0d1fdd96f19f@oss.qualcomm.com>
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

On Sat, Mar 08, 2025 at 03:17:23PM +0100, Konrad Dybcio wrote:
> On 8.03.2025 2:42 AM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Qualcomm SAR2130P requires slightly different setup for the DSI PHY. It
> > is a 5nm PHY (like SM8450), so supplies are the same, but the rest of
> > the configuration is the same as SM8550 DSI PHY.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
> >  3 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index c0bcc68289633fd7506ce4f1f963655d862e8f08..a58bafe9fe8635730cb82e8c82ec1ded394988cd 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -581,6 +581,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  	  .data = &dsi_phy_7nm_cfgs },
> >  	{ .compatible = "qcom,dsi-phy-7nm-8150",
> >  	  .data = &dsi_phy_7nm_8150_cfgs },
> > +	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
> > +	  .data = &dsi_phy_5nm_sar2130p_cfgs },
> >  	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
> >  	  .data = &dsi_phy_7nm_7280_cfgs },
> >  	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index 1925418d9999a24263d6621299cae78f1fb9455c..1ed08b56e056094bc0096d07d4470b89d9824060 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
> >  
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > index a92decbee5b5433853ed973747f7705d9079068d..cad55702746b8d35949d22090796cca60f03b9e1 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > @@ -1289,6 +1289,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
> >  	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
> >  };
> >  
> > +const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
> > +	.has_phy_lane = true,
> > +	.regulator_data = dsi_phy_7nm_97800uA_regulators,
> > +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
> > +	.ops = {
> > +		.enable = dsi_7nm_phy_enable,
> > +		.disable = dsi_7nm_phy_disable,
> > +		.pll_init = dsi_pll_7nm_init,
> > +		.save_pll_state = dsi_7nm_pll_save_state,
> > +		.restore_pll_state = dsi_7nm_pll_restore_state,
> > +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> > +	},
> > +	.min_pll_rate = 600000000UL,
> > +#ifdef CONFIG_64BIT
> > +	.max_pll_rate = 5000000000UL,
> > +#else
> > +	.max_pll_rate = ULONG_MAX,
> > +#endif
> > +	.io_start = { 0xae95000, 0xae97000 },
> > +	.num_dsi_phy = 2,
> > +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> > +};
> 
> I'm squinting very very hard and can't tell how this is different from
> dsi_phy_4nm_8550_cfgs

97800 uA vs 98400 uA is the only difference AFAIK.

-- 
With best wishes
Dmitry
