Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C861A99E9B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 04:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D355A10E3A1;
	Thu, 24 Apr 2025 02:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JTk4LHfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBE910E137;
 Thu, 24 Apr 2025 02:04:26 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F95I031020;
 Thu, 24 Apr 2025 02:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OmdFnkI+KYknQIpsY7fmp59A39xGyJfScTZfISfvPD8=; b=JTk4LHfxtisuuPL3
 Uus4A8yo+Yqla084tcgRFHz/R5If+2KQdYLkT04DHJ9r+qEZk+hJoQ+sj5FYqO0V
 cubXzn2HTrf1fAul73e8UgHhjQVosgxcZZsW6Bt2G1ORAL1G4QxIhtv0lDgpnn2I
 ftcTn7+E0BRZY6CniW4AzeCKvhmFm2gLsvw4GdRv80MU5B22xOuDjTjGZ++VAhVU
 Ym6HjCY+lLO8uuPi8dYks4V3Yym0VA8Fc0mgN0rC/L9cMwyFR1OUofugjEmtTKzk
 XvEbU7wL0DB2vxtpy7MR4RKejBwWG7TeMrfSYWo4KNuRkegkW3hvM8MOZkuod7RM
 5kuEAQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5bwe5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 02:04:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O24HB9002129
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 02:04:17 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 19:04:17 -0700
Message-ID: <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
Date: Wed, 23 Apr 2025 19:04:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAxMCBTYWx0ZWRfXw27yqXELL9ax
 97+PtW0vRpFkNpEHEB1AKB6/VT/9TC6UvexB5WDYsmLbES7z2x5/0MunUYGkcpTDSH2FbO8JU08
 vWxbwd887W3OKVfpW8g6lS0XP10xZnZQ3WJaRGHov00a/7xuXSZmV7v1hO2RkLBPCbI81auoSon
 K0UOyqgwXCSaPFVZ+4GuDmozrjyMdPWi26miCCtMBbRHsTQFZEsBGOMmlECNUUEEhz550ZeJTu0
 drl43QKsVadZzl4JjRddX8Hj2yXBeY5EIMMlmcRXHEuThMZqesQiY5iAztz+PAgoMcCBsLKvO3+
 bWCJlQfOblawQB+7Les/mEWaCss4y90yWb9O8SA/8nO3CyYFgFG3uSrgXxhditzyOsXSZtq9DiR
 XXYKOHzcp2wta5AvHRD/FAiDNia1tBk8f7HMCjn6jywJcULv8Bk+k9GW3mG/IX08vB8C9ovy
X-Proofpoint-GUID: QNjkBK0bFuFE4f19JGGgxItYhw7neibc
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=68099c23 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=7oS1v-cyAAAA:8
 a=dd0EAvHu3vwreEp4BEUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=PcM2qe9_4d1tJnOwuzRa:22
X-Proofpoint-ORIG-GUID: QNjkBK0bFuFE4f19JGGgxItYhw7neibc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240010
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
> LVDS support in MDP4 driver makes use of drm_connector directly. However
> LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> them to use drm_panel_bridge/drm_bridge_connector. This allows using
> standard interface for the drm_panel and also inserting additional
> bridges between encoder and panel.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/Makefile                       |   1 -
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
>   .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
>   5 files changed, 28 insertions(+), 133 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 5df20cbeafb8bf07c825a1fd72719d5a56c38613..7a2ada6e2d74a902879e4f12a78ed475e5209ec2 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -48,7 +48,6 @@ msm-display-$(CONFIG_DRM_MSM_MDP4) += \
>   	disp/mdp4/mdp4_dsi_encoder.o \
>   	disp/mdp4/mdp4_dtv_encoder.o \
>   	disp/mdp4/mdp4_lcdc_encoder.o \
> -	disp/mdp4/mdp4_lvds_connector.o \
>   	disp/mdp4/mdp4_lvds_pll.o \
>   	disp/mdp4/mdp4_irq.o \
>   	disp/mdp4/mdp4_kms.o \
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 689e210660a5218ed1e2d116073723215af5a187..93c9411eb422bc67b7fedb5ffce4c330310b520f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -6,6 +6,8 @@
>   
>   #include <linux/delay.h>
>   
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>   #include <drm/drm_vblank.h>
>   
>   #include "msm_drv.h"
> @@ -189,7 +191,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct drm_encoder *encoder;
>   	struct drm_connector *connector;
> -	struct device_node *panel_node;
> +	struct drm_bridge *next_bridge;
>   	int dsi_id;
>   	int ret;
>   
> @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>   		 * bail out early if there is no panel node (no need to
>   		 * initialize LCDC encoder and LVDS connector)
>   		 */
> -		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> -		if (!panel_node)
> -			return 0;
> +		next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> +		if (IS_ERR(next_bridge)) {
> +			ret = PTR_ERR(next_bridge);
> +			if (ret == -ENODEV)
> +				return 0;
> +			return ret;
> +		}
>   
> -		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> +		encoder = mdp4_lcdc_encoder_init(dev);
>   		if (IS_ERR(encoder)) {
>   			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> -			of_node_put(panel_node);
>   			return PTR_ERR(encoder);
>   		}
>   
>   		/* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
>   		encoder->possible_crtcs = 1 << DMA_P;
>   
> -		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> +		ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +		if (ret) {
> +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> +
> +			return ret;
> +		}

Can you pls point me to the lvds bridge used with this apq8064 board? I 
was unable to find it. Just wanted to compare that against this while 
reviewing.

> +
> +		connector = drm_bridge_connector_init(dev, encoder);
>   		if (IS_ERR(connector)) {
>   			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> -			of_node_put(panel_node);
>   			return PTR_ERR(connector);
>   		}
>   
> +		ret = drm_connector_attach_encoder(connector, encoder);
> +		if (ret) {
> +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> +
> +			return ret;
> +		}
> +
>   		break;
>   	case DRM_MODE_ENCODER_TMDS:
>   		encoder = mdp4_dtv_encoder_init(dev);
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> index e0380d3b7e0cee99c4c376bf6369887106f44ede..306f5ca8f810aaeecea56e74065933bbffcb67ec 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> @@ -191,11 +191,7 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
>   long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
>   struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
>   
> -struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
> -		struct device_node *panel_node);
> -
> -struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
> -		struct device_node *panel_node, struct drm_encoder *encoder);
> +struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev);
>   
>   #ifdef CONFIG_DRM_MSM_DSI
>   struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> index cfcedd8a635cf0297365e845ef415a8f0d553183..a4f3edabefbd06286bfb8fbcd7f8c0a4281e5ef1 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> @@ -14,7 +14,6 @@
>   
>   struct mdp4_lcdc_encoder {
>   	struct drm_encoder base;
> -	struct device_node *panel_node;
>   	struct drm_panel *panel;
>   	struct clk *lcdc_clk;
>   	unsigned long int pixclock;
> @@ -262,19 +261,12 @@ static void mdp4_lcdc_encoder_disable(struct drm_encoder *encoder)
>   	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
>   			to_mdp4_lcdc_encoder(encoder);
>   	struct mdp4_kms *mdp4_kms = get_kms(encoder);
> -	struct drm_panel *panel;
>   
>   	if (WARN_ON(!mdp4_lcdc_encoder->enabled))
>   		return;
>   
>   	mdp4_write(mdp4_kms, REG_MDP4_LCDC_ENABLE, 0);
>   
> -	panel = of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
> -	if (!IS_ERR(panel)) {
> -		drm_panel_disable(panel);
> -		drm_panel_unprepare(panel);
> -	}
> -
>   	/*
>   	 * Wait for a vsync so we know the ENABLE=0 latched before
>   	 * the (connector) source of the vsync's gets disabled,
> @@ -300,7 +292,6 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
>   			to_mdp4_lcdc_encoder(encoder);
>   	unsigned long pc = mdp4_lcdc_encoder->pixclock;
>   	struct mdp4_kms *mdp4_kms = get_kms(encoder);
> -	struct drm_panel *panel;
>   	uint32_t config;
>   	int ret;
>   
> @@ -335,12 +326,6 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
>   	if (ret)
>   		DRM_DEV_ERROR(dev->dev, "failed to enable lcdc_clk: %d\n", ret);
>   
> -	panel = of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
> -	if (!IS_ERR(panel)) {
> -		drm_panel_prepare(panel);
> -		drm_panel_enable(panel);
> -	}
> -
>   	setup_phy(encoder);
>   
>   	mdp4_write(mdp4_kms, REG_MDP4_LCDC_ENABLE, 1);
> @@ -375,8 +360,7 @@ static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
>   };
>   
>   /* initialize encoder */
> -struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
> -		struct device_node *panel_node)
> +struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev)
>   {
>   	struct drm_encoder *encoder;
>   	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder;
> @@ -387,8 +371,6 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
>   	if (IS_ERR(mdp4_lcdc_encoder))
>   		return ERR_CAST(mdp4_lcdc_encoder);
>   
> -	mdp4_lcdc_encoder->panel_node = panel_node;
> -
>   	encoder = &mdp4_lcdc_encoder->base;
>   
>   	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> deleted file mode 100644
> index 4755eb13ef79f313d2be088145c8cd2e615226fe..0000000000000000000000000000000000000000
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (C) 2014 Red Hat
> - * Author: Rob Clark <robdclark@gmail.com>
> - * Author: Vinay Simha <vinaysimha@inforcecomputing.com>
> - */
> -
> -#include "mdp4_kms.h"
> -
> -struct mdp4_lvds_connector {
> -	struct drm_connector base;
> -	struct drm_encoder *encoder;
> -	struct device_node *panel_node;
> -	struct drm_panel *panel;
> -};
> -#define to_mdp4_lvds_connector(x) container_of(x, struct mdp4_lvds_connector, base)
> -
> -static enum drm_connector_status mdp4_lvds_connector_detect(
> -		struct drm_connector *connector, bool force)
> -{
> -	struct mdp4_lvds_connector *mdp4_lvds_connector =
> -			to_mdp4_lvds_connector(connector);
> -
> -	if (!mdp4_lvds_connector->panel) {
> -		mdp4_lvds_connector->panel =
> -			of_drm_find_panel(mdp4_lvds_connector->panel_node);
> -		if (IS_ERR(mdp4_lvds_connector->panel))
> -			mdp4_lvds_connector->panel = NULL;
> -	}
> -
> -	return mdp4_lvds_connector->panel ?
> -			connector_status_connected :
> -			connector_status_disconnected;
> -}
> -
> -static void mdp4_lvds_connector_destroy(struct drm_connector *connector)
> -{
> -	struct mdp4_lvds_connector *mdp4_lvds_connector =
> -			to_mdp4_lvds_connector(connector);
> -
> -	drm_connector_cleanup(connector);
> -
> -	kfree(mdp4_lvds_connector);
> -}
> -
> -static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
> -{
> -	struct mdp4_lvds_connector *mdp4_lvds_connector =
> -			to_mdp4_lvds_connector(connector);
> -	struct drm_panel *panel = mdp4_lvds_connector->panel;
> -	int ret = 0;
> -
> -	if (panel)
> -		ret = drm_panel_get_modes(panel, connector);
> -
> -	return ret;
> -}
> -
> -static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
> -	.detect = mdp4_lvds_connector_detect,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = mdp4_lvds_connector_destroy,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
> -	.get_modes = mdp4_lvds_connector_get_modes,
> -};
> -
> -/* initialize connector */
> -struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
> -		struct device_node *panel_node, struct drm_encoder *encoder)
> -{
> -	struct drm_connector *connector = NULL;
> -	struct mdp4_lvds_connector *mdp4_lvds_connector;
> -
> -	mdp4_lvds_connector = kzalloc(sizeof(*mdp4_lvds_connector), GFP_KERNEL);
> -	if (!mdp4_lvds_connector)
> -		return ERR_PTR(-ENOMEM);
> -
> -	mdp4_lvds_connector->encoder = encoder;
> -	mdp4_lvds_connector->panel_node = panel_node;
> -
> -	connector = &mdp4_lvds_connector->base;
> -
> -	drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
> -			DRM_MODE_CONNECTOR_LVDS);
> -	drm_connector_helper_add(connector, &mdp4_lvds_connector_helper_funcs);
> -
> -	connector->polled = 0;
> -
> -	connector->interlace_allowed = 0;
> -	connector->doublescan_allowed = 0;
> -
> -	drm_connector_attach_encoder(connector, encoder);
> -
> -	return connector;
> -}
> 

