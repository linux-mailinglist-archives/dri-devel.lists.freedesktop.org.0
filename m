Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971DDA99BB0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6420010E2D2;
	Wed, 23 Apr 2025 22:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Tpg/+3CB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF3310E2D2;
 Wed, 23 Apr 2025 22:54:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NMPmvH022015;
 Wed, 23 Apr 2025 22:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zx7YRlSGD1wD9AFEKY5CsiKOPRvFjFjoxyPzbULqgSA=; b=Tpg/+3CBl5L/Bc6y
 Sjo8nbvlg2qNphSBuKWBy+UgDdiodu551WVsLQBO1der4Bo38vft/vh7XpFCSZ1u
 FaRJwuW7PJQSja2dwEkNqvSsuI3Bl8jKRygC5hxvSYccOnuMElcy/HMG1lxI6XlO
 3gNkk2BUeB3f/2VzTXtfxoLOf3tsRHCfpi5Sn/xZQleuEbtPkY48HFeCZa4kIK2h
 AHt7y8Z50+Rml6hiK35vFY/f3n/Gwp/K4Z2f1KScRInfta6yNvpO+5ivyQQYuxb3
 ppQzIjbamHb7HdK7iNVzQMUam/7wdYGYPDy//s4jqu2EG5YBYXd1RZ7wnELJhiHI
 xc2jkA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh13j1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 22:54:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NMsEiD003673
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 22:54:14 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 15:54:13 -0700
Message-ID: <029f3bfb-a031-4dfe-a2b4-bc41a0da7772@quicinc.com>
Date: Wed, 23 Apr 2025 15:54:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-3-c983788987ae@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-3-c983788987ae@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: C5POw0o9ZjBQ9Cq__clJJI3ULJz7kvDe
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68096f97 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=u7um27V6BFjZWMNL6CAA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: C5POw0o9ZjBQ9Cq__clJJI3ULJz7kvDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1MiBTYWx0ZWRfX6HUpk9BRH6Xi
 K9oo/uOmTz52DXpNd8UIIzOdfpD+epDDhEzMGBKHP03YYChf9vPZB1/E4EAHJKAErwv+4B43F3X
 rxDkgE8A54N9JzQsxlT7EwRtAyCF42ARJ5EBMi53AKj+Pc5KawaxpeRF7oXcn6oQKtCQEhX+7up
 1CWsGPkw16FTIfupmZq0K8dXpYkHUv0BmJLPU/Zt5/3Ug0mo5foWHGNlXjzblekHGRrlmgh37HU
 Q24phxjWbYc2wKSGQfWDmK/h/gOI5bvawQadvMJACOQ5XJC8O/eyJsl7mzu4UoZ8PFdWmqCqG5h
 mdP17q4R0QyH4M1zSYsWH+mq+uysK/ElUGWJvHZ5sDk5Wr/wxOwm7oHq+MRHIfJTtj6H5sixL4W
 P5/CTz6L6soP5z08bRtm+UqahjtuJA8MLHR1WZZu33dcBnj9iASdaXU+Dhwy9EG5grEWvPBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230152
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



On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> The LVDS/LCDC controller uses pixel clock coming from the multimedia
> controller (mmcc) rather than using the PLL directly. Stop using LVDS
> PLL directly and register it as a clock provider. Use lcdc_clk as a
> pixel clock for the LCDC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  8 +++++++-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 22 +++++++---------------
>   3 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> index 142ccb68b435263f91ba1ab27676e426d43e5d84..b8bdc3712c73b14f3547dce3439a895e3d10f193 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> @@ -207,6 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
>   }
>   #endif
>   
> -struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
> +int mpd4_lvds_pll_init(struct drm_device *dev);
>   
>   #endif /* __MDP4_KMS_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> index 8bbc7fb881d599e7d309cc61bda83697fecd253a..db93795916cdaa87ac8e61d3b44c2dadac10fd9e 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> @@ -381,7 +381,13 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
>   	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
>   
>   	/* TODO: do we need different pll in other cases? */
> -	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
> +	ret = mpd4_lvds_pll_init(dev);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	mdp4_lcdc_encoder->lcdc_clk = devm_clk_get(dev->dev, "lcdc_clk");
>   	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
>   		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
>   		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);

Change seems fine to me, one question on the order of changes, DT change 
has to be merged first otherwise it will fail here?

Will that be managed by co-ordinating with the DT maintainer?

> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> index ab8c0c187fb2cd05e26f5019244af15f1b2470c8..cbd154c72e44c848fa65fe01d848879b9f6735fb 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> @@ -133,29 +133,21 @@ static struct clk_init_data pll_init = {
>   	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
>   };
>   
> -struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
> +int mpd4_lvds_pll_init(struct drm_device *dev)
>   {
>   	struct mdp4_lvds_pll *lvds_pll;
> -	struct clk *clk;
>   	int ret;
>   
>   	lvds_pll = devm_kzalloc(dev->dev, sizeof(*lvds_pll), GFP_KERNEL);
> -	if (!lvds_pll) {
> -		ret = -ENOMEM;
> -		goto fail;
> -	}
> +	if (!lvds_pll)
> +		return -ENOMEM;
>   
>   	lvds_pll->dev = dev;
>   
>   	lvds_pll->pll_hw.init = &pll_init;
> -	clk = devm_clk_register(dev->dev, &lvds_pll->pll_hw);
> -	if (IS_ERR(clk)) {
> -		ret = PTR_ERR(clk);
> -		goto fail;
> -	}
> +	ret = devm_clk_hw_register(dev->dev, &lvds_pll->pll_hw);
> +	if (ret)
> +		return ret;
>   
> -	return clk;
> -
> -fail:
> -	return ERR_PTR(ret);
> +	return devm_of_clk_add_hw_provider(dev->dev, of_clk_hw_simple_get, &lvds_pll->pll_hw);
>   }
> 

