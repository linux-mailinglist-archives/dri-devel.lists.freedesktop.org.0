Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A183E553
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12FA10FF62;
	Fri, 26 Jan 2024 22:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6498710FF62;
 Fri, 26 Jan 2024 22:24:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QLWttj030325; Fri, 26 Jan 2024 22:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=qirWzooB2sq3o4pGyB/iHVjIu8FA/HRSxOTKGhZRnj0=; b=nS
 c9xqmyxA+bUgXNpYVSkrTwE/63dg9q49odywFzTbGUMyZkqKdTTUAUlAKBmKBIpY
 eWbPnUKPmEWYhvW5VinonSVVT/YTTYcRLNJDWfGHIy+UocaEUlwLXtJJAT1uZ1M0
 MrgUWPwA8pzZ5CVE9hG7FuFtFSDWxACj5709DtyQTFweAiupKmC5N+1ieCVE91pL
 twN8UEaHH7g1Zmwkvq26cJK5LQqFH+8dOqOFl3JU7QC/htyeXFGcZFoHEnBoHr8Q
 e+9eacu93cYCaa3p5/8/KiD0po05yKLN+jMV7H4MLH3Y9Wnz1si0kGDWKbrnfQqm
 sJcBAt9g8s6IpU3/Ddfw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvgp2gm4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:24:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMOcHw005891
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:24:38 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:24:37 -0800
Message-ID: <3dd11768-cfed-2230-1a8a-d28b77bc4025@quicinc.com>
Date: Fri, 26 Jan 2024 14:24:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 12/15] drm/msm/dp: move all IO handling to
 dp_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-12-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-12-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HRFrM3-cFSkpFltE5XJ_y92fgRGXFqAI
X-Proofpoint-ORIG-GUID: HRFrM3-cFSkpFltE5XJ_y92fgRGXFqAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260164
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> Rather than parsing the I/O addresses from dp_parser and then passing
> them via a struct pointer to dp_catalog, handle I/O region parsing in
> dp_catalog and drop it from dp_parser.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 125 ++++++++++++++++++++++++++++++------
>   drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
>   drivers/gpu/drm/msm/dp/dp_display.c |   6 +-
>   drivers/gpu/drm/msm/dp/dp_parser.c  |  73 +--------------------
>   drivers/gpu/drm/msm/dp/dp_parser.h  |  26 +-------
>   5 files changed, 114 insertions(+), 118 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 4c6207797c99..541aac2cb246 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/iopoll.h>
> +#include <linux/platform_device.h>
>   #include <linux/rational.h>
>   #include <drm/display/drm_dp_helper.h>
>   #include <drm/drm_print.h>
> @@ -53,10 +54,31 @@
>   	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
>   	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
>   
> +#define DP_DEFAULT_AHB_OFFSET	0x0000
> +#define DP_DEFAULT_AHB_SIZE	0x0200
> +#define DP_DEFAULT_AUX_OFFSET	0x0200
> +#define DP_DEFAULT_AUX_SIZE	0x0200
> +#define DP_DEFAULT_LINK_OFFSET	0x0400
> +#define DP_DEFAULT_LINK_SIZE	0x0C00
> +#define DP_DEFAULT_P0_OFFSET	0x1000
> +#define DP_DEFAULT_P0_SIZE	0x0400
> +
> +struct dss_io_region {
> +	size_t len;
> +	void __iomem *base;
> +};
> +
> +struct dss_io_data {
> +	struct dss_io_region ahb;
> +	struct dss_io_region aux;
> +	struct dss_io_region link;
> +	struct dss_io_region p0;
> +};
> +
>   struct dp_catalog_private {
>   	struct device *dev;
>   	struct drm_device *drm_dev;
> -	struct dp_io *io;
> +	struct dss_io_data io;
>   	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
>   	struct dp_catalog dp_catalog;
>   	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
> @@ -66,7 +88,7 @@ void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *d
>   {
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
>   			struct dp_catalog_private, dp_catalog);
> -	struct dss_io_data *dss = &catalog->io->dp_controller;
> +	struct dss_io_data *dss = &catalog->io;
>   
>   	msm_disp_snapshot_add_block(disp_state, dss->ahb.len, dss->ahb.base, "dp_ahb");
>   	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
> @@ -76,7 +98,7 @@ void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *d
>   
>   static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
>   {
> -	return readl_relaxed(catalog->io->dp_controller.aux.base + offset);
> +	return readl_relaxed(catalog->io.aux.base + offset);
>   }
>   
>   static inline void dp_write_aux(struct dp_catalog_private *catalog,
> @@ -86,12 +108,12 @@ static inline void dp_write_aux(struct dp_catalog_private *catalog,
>   	 * To make sure aux reg writes happens before any other operation,
>   	 * this function uses writel() instread of writel_relaxed()
>   	 */
> -	writel(data, catalog->io->dp_controller.aux.base + offset);
> +	writel(data, catalog->io.aux.base + offset);
>   }
>   
>   static inline u32 dp_read_ahb(const struct dp_catalog_private *catalog, u32 offset)
>   {
> -	return readl_relaxed(catalog->io->dp_controller.ahb.base + offset);
> +	return readl_relaxed(catalog->io.ahb.base + offset);
>   }
>   
>   static inline void dp_write_ahb(struct dp_catalog_private *catalog,
> @@ -101,7 +123,7 @@ static inline void dp_write_ahb(struct dp_catalog_private *catalog,
>   	 * To make sure phy reg writes happens before any other operation,
>   	 * this function uses writel() instread of writel_relaxed()
>   	 */
> -	writel(data, catalog->io->dp_controller.ahb.base + offset);
> +	writel(data, catalog->io.ahb.base + offset);
>   }
>   
>   static inline void dp_write_p0(struct dp_catalog_private *catalog,
> @@ -111,7 +133,7 @@ static inline void dp_write_p0(struct dp_catalog_private *catalog,
>   	 * To make sure interface reg writes happens before any other operation,
>   	 * this function uses writel() instread of writel_relaxed()
>   	 */
> -	writel(data, catalog->io->dp_controller.p0.base + offset);
> +	writel(data, catalog->io.p0.base + offset);
>   }
>   
>   static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
> @@ -121,12 +143,12 @@ static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
>   	 * To make sure interface reg writes happens before any other operation,
>   	 * this function uses writel() instread of writel_relaxed()
>   	 */
> -	return readl_relaxed(catalog->io->dp_controller.p0.base + offset);
> +	return readl_relaxed(catalog->io.p0.base + offset);
>   }
>   
>   static inline u32 dp_read_link(struct dp_catalog_private *catalog, u32 offset)
>   {
> -	return readl_relaxed(catalog->io->dp_controller.link.base + offset);
> +	return readl_relaxed(catalog->io.link.base + offset);
>   }
>   
>   static inline void dp_write_link(struct dp_catalog_private *catalog,
> @@ -136,7 +158,7 @@ static inline void dp_write_link(struct dp_catalog_private *catalog,
>   	 * To make sure link reg writes happens before any other operation,
>   	 * this function uses writel() instread of writel_relaxed()
>   	 */
> -	writel(data, catalog->io->dp_controller.link.base + offset);
> +	writel(data, catalog->io.link.base + offset);
>   }
>   
>   /* aux related catalog functions */
> @@ -248,7 +270,7 @@ int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
>   				struct dp_catalog_private, dp_catalog);
>   
>   	/* poll for hpd connected status every 2ms and timeout after 500ms */
> -	return readl_poll_timeout(catalog->io->dp_controller.aux.base +
> +	return readl_poll_timeout(catalog->io.aux.base +
>   				REG_DP_DP_HPD_INT_STATUS,
>   				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
>   				2000, 500000);
> @@ -276,7 +298,7 @@ void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
>   {
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
>   		struct dp_catalog_private, dp_catalog);
> -	struct dss_io_data *io = &catalog->io->dp_controller;
> +	struct dss_io_data *io = &catalog->io;
>   
>   	pr_info("AHB regs\n");
>   	dump_regs(io->ahb.base, io->ahb.len);
> @@ -500,7 +522,7 @@ int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
>   	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
>   
>   	/* Poll for mainlink ready status */
> -	ret = readx_poll_timeout(readl, catalog->io->dp_controller.link.base +
> +	ret = readx_poll_timeout(readl, catalog->io.link.base +
>   					REG_DP_MAINLINK_READY,
>   					data, data & bit,
>   					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
> @@ -563,7 +585,7 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog)
>   				struct dp_catalog_private, dp_catalog);
>   
>   	/* Poll for mainlink ready status */
> -	ret = readl_poll_timeout(catalog->io->dp_controller.link.base +
> +	ret = readl_poll_timeout(catalog->io.link.base +
>   				REG_DP_MAINLINK_READY,
>   				data, data & DP_MAINLINK_READY_FOR_VIDEO,
>   				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
> @@ -945,21 +967,84 @@ void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog)
>   	dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
>   }
>   
> -struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io)
> +static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
>   {
> -	struct dp_catalog_private *catalog;
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
> +	if (!IS_ERR(base))
> +		*len = resource_size(res);
> +
> +	return base;
> +}
> +
> +static int dp_catalog_get_io(struct dp_catalog_private *catalog)
> +{
> +	struct platform_device *pdev = to_platform_device(catalog->dev);
> +	struct dss_io_data *dss = &catalog->io;
> +
> +	dss->ahb.base = dp_ioremap(pdev, 0, &dss->ahb.len);
> +	if (IS_ERR(dss->ahb.base))
> +		return PTR_ERR(dss->ahb.base);
>   
> -	if (!io) {
> -		DRM_ERROR("invalid input\n");
> -		return ERR_PTR(-EINVAL);
> +	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
> +	if (IS_ERR(dss->aux.base)) {
> +		/*
> +		 * The initial binding had a single reg, but in order to
> +		 * support variation in the sub-region sizes this was split.
> +		 * dp_ioremap() will fail with -EINVAL here if only a single
> +		 * reg is specified, so fill in the sub-region offsets and
> +		 * lengths based on this single region.
> +		 */
> +		if (PTR_ERR(dss->aux.base) == -EINVAL) {
> +			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
> +				DRM_ERROR("legacy memory region not large enough\n");
> +				return -EINVAL;
> +			}
> +
> +			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
> +			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
> +			dss->aux.len = DP_DEFAULT_AUX_SIZE;
> +			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
> +			dss->link.len = DP_DEFAULT_LINK_SIZE;
> +			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
> +			dss->p0.len = DP_DEFAULT_P0_SIZE;
> +		} else {
> +			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
> +			return PTR_ERR(dss->aux.base);
> +		}
> +	} else {
> +		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
> +		if (IS_ERR(dss->link.base)) {
> +			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
> +			return PTR_ERR(dss->link.base);
> +		}
> +
> +		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
> +		if (IS_ERR(dss->p0.base)) {
> +			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
> +			return PTR_ERR(dss->p0.base);
> +		}
>   	}
>   
> +	return 0;
> +}
> +
> +struct dp_catalog *dp_catalog_get(struct device *dev)
> +{
> +	struct dp_catalog_private *catalog;
> +	int ret;
> +
>   	catalog  = devm_kzalloc(dev, sizeof(*catalog), GFP_KERNEL);
>   	if (!catalog)
>   		return ERR_PTR(-ENOMEM);
>   
>   	catalog->dev = dev;
> -	catalog->io = io;
> +
> +	ret = dp_catalog_get_io(catalog);
> +	if (ret)
> +		return ERR_PTR(ret);
>   
>   	return &catalog->dp_catalog;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 1f3f58d4b8de..989e4c4fd6fa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -126,7 +126,7 @@ void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>   				struct drm_display_mode *drm_mode);
>   void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog);
>   
> -struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io);
> +struct dp_catalog *dp_catalog_get(struct device *dev);
>   
>   /* DP Audio APIs */
>   void dp_catalog_audio_get_header(struct dp_catalog *catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index b8388e04bd0f..5ad96989c5f2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -721,7 +721,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   		goto error;
>   	}
>   
> -	dp->catalog = dp_catalog_get(dev, &dp->parser->io);
> +	dp->catalog = dp_catalog_get(dev);
>   	if (IS_ERR(dp->catalog)) {
>   		rc = PTR_ERR(dp->catalog);
>   		DRM_ERROR("failed to initialize catalog, rc = %d\n", rc);
> @@ -730,7 +730,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   	}
>   
>   	dp->aux = dp_aux_get(dev, dp->catalog,
> -			     dp->parser->io.phy,
> +			     dp->parser->phy,
>   			     dp->dp_display.is_edp);
>   	if (IS_ERR(dp->aux)) {
>   		rc = PTR_ERR(dp->aux);
> @@ -761,7 +761,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   
>   	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
>   			       dp->catalog,
> -			       dp->parser->io.phy);
> +			       dp->parser->phy);
>   	if (IS_ERR(dp->ctrl)) {
>   		rc = PTR_ERR(dp->ctrl);
>   		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index de7cfc340f0c..2d0dd4353cdf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -13,80 +13,13 @@
>   #include "dp_parser.h"
>   #include "dp_reg.h"
>   
> -#define DP_DEFAULT_AHB_OFFSET	0x0000
> -#define DP_DEFAULT_AHB_SIZE	0x0200
> -#define DP_DEFAULT_AUX_OFFSET	0x0200
> -#define DP_DEFAULT_AUX_SIZE	0x0200
> -#define DP_DEFAULT_LINK_OFFSET	0x0400
> -#define DP_DEFAULT_LINK_SIZE	0x0C00
> -#define DP_DEFAULT_P0_OFFSET	0x1000
> -#define DP_DEFAULT_P0_SIZE	0x0400
> -
> -static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
> -{
> -	struct resource *res;
> -	void __iomem *base;
> -
> -	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
> -	if (!IS_ERR(base))
> -		*len = resource_size(res);
> -
> -	return base;
> -}
> -
>   static int dp_parser_ctrl_res(struct dp_parser *parser)
>   {
>   	struct platform_device *pdev = parser->pdev;
> -	struct dp_io *io = &parser->io;
> -	struct dss_io_data *dss = &io->dp_controller;
> -
> -	dss->ahb.base = dp_ioremap(pdev, 0, &dss->ahb.len);
> -	if (IS_ERR(dss->ahb.base))
> -		return PTR_ERR(dss->ahb.base);
> -
> -	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
> -	if (IS_ERR(dss->aux.base)) {
> -		/*
> -		 * The initial binding had a single reg, but in order to
> -		 * support variation in the sub-region sizes this was split.
> -		 * dp_ioremap() will fail with -EINVAL here if only a single
> -		 * reg is specified, so fill in the sub-region offsets and
> -		 * lengths based on this single region.
> -		 */
> -		if (PTR_ERR(dss->aux.base) == -EINVAL) {
> -			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
> -				DRM_ERROR("legacy memory region not large enough\n");
> -				return -EINVAL;
> -			}
> -
> -			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
> -			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
> -			dss->aux.len = DP_DEFAULT_AUX_SIZE;
> -			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
> -			dss->link.len = DP_DEFAULT_LINK_SIZE;
> -			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
> -			dss->p0.len = DP_DEFAULT_P0_SIZE;
> -		} else {
> -			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
> -			return PTR_ERR(dss->aux.base);
> -		}
> -	} else {
> -		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
> -		if (IS_ERR(dss->link.base)) {
> -			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
> -			return PTR_ERR(dss->link.base);
> -		}
> -
> -		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
> -		if (IS_ERR(dss->p0.base)) {
> -			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
> -			return PTR_ERR(dss->p0.base);
> -		}
> -	}
>   
> -	io->phy = devm_phy_get(&pdev->dev, "dp");
> -	if (IS_ERR(io->phy))
> -		return PTR_ERR(io->phy);
> +	parser->phy = devm_phy_get(&pdev->dev, "dp");
> +	if (IS_ERR(parser->phy))
> +		return PTR_ERR(parser->phy);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index b28052e87101..7306768547a6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -14,37 +14,15 @@
>   #define DP_MAX_NUM_DP_LANES	4
>   #define DP_LINK_RATE_HBR2	540000 /* kbytes */
>   
> -struct dss_io_region {
> -	size_t len;
> -	void __iomem *base;
> -};
> -
> -struct dss_io_data {
> -	struct dss_io_region ahb;
> -	struct dss_io_region aux;
> -	struct dss_io_region link;
> -	struct dss_io_region p0;
> -};
> -
> -/**
> - * struct dp_ctrl_resource - controller's IO related data
> - *
> - * @dp_controller: Display Port controller mapped memory address
> - * @phy_io: phy's mapped memory address
> - */
> -struct dp_io {
> -	struct dss_io_data dp_controller;
> -	struct phy *phy;
> -};
> -
>   /**
>    * struct dp_parser - DP parser's data exposed to clients
>    *
>    * @pdev: platform data of the client
> + * @phy: PHY handle
>    */
>   struct dp_parser {
>   	struct platform_device *pdev;
> -	struct dp_io io;
> +	struct phy *phy;
>   	u32 max_dp_lanes;
>   	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
>
