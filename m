Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A6C7677C7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 23:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D632710E6BB;
	Fri, 28 Jul 2023 21:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5942310E479;
 Fri, 28 Jul 2023 21:36:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36SKYdi3013472; Fri, 28 Jul 2023 21:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/j/dHavYVm9+bXcSoAZKWZ8+QAslvWlViz6zx/zYz04=;
 b=pDceqbS/1++r9rLo75EBLF9a//IzpQSGsyJHCdikXqCLNuzuNwh1osHnfVBQ0ZpWp/te
 rbQV8ES3qLepRT3E+4fXl4q1iaqCIYoFzwpZuMDjQVBsddEtS96dd4u/LEIvv88jKmxg
 8u/MZJUwAXnG8xbKZLBSKyROJVEmZGxyGVyZXJzhnK6WGNhBofjs03OASJ2VEpgVM0Qn
 y4RfkVvSALbbVpnLV5Ts8dO5uRbHXu4uBh7X4CzMFKx4LYbdpU/w+CBAz7tqxiq1ShnE
 jXqlQDISHTTsVuCR5mNWpsug6Rhknasw7PdJYe8Wst8LQtL4aQcCJYTXMEE+n8meDCu1 iA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s447kj7bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 21:36:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SLaGew031611
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 21:36:16 GMT
Received: from [10.110.77.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 28 Jul
 2023 14:36:15 -0700
Message-ID: <27ae3603-4527-8c3a-23e6-5d4934de9d69@quicinc.com>
Date: Fri, 28 Jul 2023 14:36:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 5/7] drm/msm/dpu: use MDSS data for programming SSPP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
 <20230728213320.97309-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230728213320.97309-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: wR4t8tAxC50OGzFgzGuxHvMw1KP3U-7E
X-Proofpoint-GUID: wR4t8tAxC50OGzFgzGuxHvMw1KP3U-7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280197
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/28/2023 2:33 PM, Dmitry Baryshkov wrote:
> Switch to using data from MDSS driver to program the SSPP fetch and UBWC
> configuration. As a side-effect, this also swithes the DPU driver from
> DPU_HW_UBWC_VER_xx values to the UBWC_x_y enum, which reflects
> the hardware register values.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 ++++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
>   6 files changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index b364cf75bb3f..f2192de93713 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -8,6 +8,8 @@
>   #include "dpu_hw_sspp.h"
>   #include "dpu_kms.h"
>   
> +#include "msm_mdss.h"
> +
>   #include <drm/drm_file.h>
>   
>   #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
> @@ -270,26 +272,26 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>   		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>   			DPU_FETCH_CONFIG_RESET_VALUE |
>   			ctx->ubwc->highest_bank_bit << 18);
> -		switch (ctx->ubwc->ubwc_version) {
> -		case DPU_HW_UBWC_VER_10:
> +		switch (ctx->ubwc->ubwc_enc_version) {

Didnt we agree to protect this with if (ctx->ubwc) ?

> +		case UBWC_1_0:
>   			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
>   			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>   					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
>   					BIT(8) |
>   					(ctx->ubwc->highest_bank_bit << 4));
>   			break;
> -		case DPU_HW_UBWC_VER_20:
> +		case UBWC_2_0:
>   			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
>   			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>   					fast_clear | (ctx->ubwc->ubwc_swizzle) |
>   					(ctx->ubwc->highest_bank_bit << 4));
>   			break;
> -		case DPU_HW_UBWC_VER_30:
> +		case UBWC_3_0:
>   			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>   					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
>   					(ctx->ubwc->highest_bank_bit << 4));
>   			break;
> -		case DPU_HW_UBWC_VER_40:
> +		case UBWC_4_0:
>   			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>   					DPU_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
>   			break;
> @@ -670,11 +672,11 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>   #endif
>   
>   struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
> -		void __iomem *addr, const struct dpu_ubwc_cfg *ubwc)
> +		void __iomem *addr, const struct msm_mdss_data *mdss_data)
>   {
>   	struct dpu_hw_sspp *hw_pipe;
>   
> -	if (!addr || !ubwc)
> +	if (!addr)
>   		return ERR_PTR(-EINVAL);
>   
>   	hw_pipe = kzalloc(sizeof(*hw_pipe), GFP_KERNEL);
> @@ -685,7 +687,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
>   	hw_pipe->hw.log_mask = DPU_DBG_MASK_SSPP;
>   
>   	/* Assign ops */
> -	hw_pipe->ubwc = ubwc;
> +	hw_pipe->ubwc = mdss_data;
>   	hw_pipe->idx = cfg->id;
>   	hw_pipe->cap = cfg;
>   	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 085f34bc6b88..cbf4f95ff0fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -317,7 +317,7 @@ struct dpu_hw_sspp_ops {
>   struct dpu_hw_sspp {
>   	struct dpu_hw_blk base;
>   	struct dpu_hw_blk_reg_map hw;
> -	const struct dpu_ubwc_cfg *ubwc;
> +	const struct msm_mdss_data *ubwc;
>   
>   	/* Pipe */
>   	enum dpu_sspp idx;
> @@ -333,10 +333,10 @@ struct dpu_kms;
>    * Should be called once before accessing every pipe.
>    * @cfg:  Pipe catalog entry for which driver object is required
>    * @addr: Mapped register io address of MDP
> - * @ubwc: UBWC configuration data
> + * @mdss_data: UBWC / MDSS configuration data
>    */
>   struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
> -		void __iomem *addr, const struct dpu_ubwc_cfg *ubwc);
> +		void __iomem *addr, const struct msm_mdss_data *mdss_data);
>   
>   /**
>    * dpu_hw_sspp_destroy(): Destroys SSPP driver context
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index c1d06e19b237..2da9eef687af 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -22,6 +22,7 @@
>   
>   #include "msm_drv.h"
>   #include "msm_mmu.h"
> +#include "msm_mdss.h"
>   #include "msm_gem.h"
>   #include "disp/msm_disp_snapshot.h"
>   
> @@ -1124,7 +1125,20 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		goto power_error;
>   	}
>   
> -	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
> +	dpu_kms->mdss = msm_mdss_get_mdss_data(dpu_kms->pdev->dev.parent);
> +	if (IS_ERR(dpu_kms->mdss)) {
> +		rc = PTR_ERR(dpu_kms->mdss);
> +		DPU_ERROR("failed to get MDSS data: %d\n", rc);
> +		goto power_error;
> +	}
> +
> +	if (!dpu_kms->mdss) {
> +		rc = -EINVAL;
> +		DPU_ERROR("NULL MDSS data\n");
> +		goto power_error;
> +	}
> +
> +	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
>   	if (rc) {
>   		DPU_ERROR("rm init failed: %d\n", rc);
>   		goto power_error;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index f3bdd4f11108..b6f53ca6e962 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -67,6 +67,7 @@ struct dpu_kms {
>   	struct msm_kms base;
>   	struct drm_device *dev;
>   	const struct dpu_mdss_cfg *catalog;
> +	const struct msm_mdss_data *mdss;
>   
>   	/* io/register spaces: */
>   	void __iomem *mmio, *vbif[VBIF_MAX];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 4a53e2c931d6..f9215643c71a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -101,6 +101,7 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>   
>   int dpu_rm_init(struct dpu_rm *rm,
>   		const struct dpu_mdss_cfg *cat,
> +		const struct msm_mdss_data *mdss_data,
>   		void __iomem *mmio)
>   {
>   	int rc, i;
> @@ -230,7 +231,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   		struct dpu_hw_sspp *hw;
>   		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
>   
> -		hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
> +		hw = dpu_hw_sspp_init(sspp, mmio, mdss_data);
>   		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed sspp object creation: err %d\n", rc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index d62c2edb2460..2b551566cbf4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -40,11 +40,13 @@ struct dpu_rm {
>    *	for all HW blocks.
>    * @rm: DPU Resource Manager handle
>    * @cat: Pointer to hardware catalog
> + * @mdss_data: Pointer to MDSS / UBWC configuration
>    * @mmio: mapped register io address of MDP
>    * @Return: 0 on Success otherwise -ERROR
>    */
>   int dpu_rm_init(struct dpu_rm *rm,
>   		const struct dpu_mdss_cfg *cat,
> +		const struct msm_mdss_data *mdss_data,
>   		void __iomem *mmio);
>   
>   /**
