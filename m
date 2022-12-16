Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74C64F2AA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 21:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596A610E62B;
	Fri, 16 Dec 2022 20:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF74610E154;
 Fri, 16 Dec 2022 20:52:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGKoIlQ019840; Fri, 16 Dec 2022 20:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lwTgPVE7s93yWALKfWps/+fuj40rX6BhC0pqamOZAbU=;
 b=L5EqbfALn8vWO8JCLVeKFgHs4JVtxqibBz+67m+SY9ewxL/L59CbssZVwtQFCAXVn3KV
 6hOXEck9vrNLcY5oWqIZHfye8gBGVuKmOrDL3hoWHJ6cCjr8+KtDXonpiynZoTXfNbPH
 ginX9HqC60/VWb/CpiakXEtG12RaX8T6YxSZEXWM6lvDIaURtrZO9kCjFyCfTWBbyr5g
 1NXEAr5Crzbwp+l7mz8A2NaD5CB3g8YMebhr5u5B2pTcTdQS7zvpnn3E+BRXUoBiaLLX
 kl31JeoR+z632uI/0FlqixyTasMV0d4vZEF3RD4I5+PJHXMQAoWmitxzhZi1neEFZU9d Zw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mgvecrna7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 20:51:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BGKptXo031823
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 20:51:55 GMT
Received: from [10.110.127.101] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 16 Dec
 2022 12:51:53 -0800
Message-ID: <1bb4e2c3-3f6f-c161-ba7b-8e96f100f926@quicinc.com>
Date: Fri, 16 Dec 2022 12:51:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 1/6] drm/msm/dpu1: Implement DSC binding to PP block
 for CTL V1
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-2-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221213232207.113607-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: D7Eu62rNXFe6hpvmgDi6ZlchPJQEZzqA
X-Proofpoint-ORIG-GUID: D7Eu62rNXFe6hpvmgDi6ZlchPJQEZzqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_14,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160185
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Vinod
 Polimera <quic_vpolimer@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Haowen Bai <baihaowen@meizu.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen
 Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/13/2022 3:22 PM, Marijn Suijten wrote:
> All V1 CTL blocks (active CTLs) explicitly bind the pixel output from a
> DSC block to a PINGPONG block by setting the PINGPONG idx in a DSC
> hardware register.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 +++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  9 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 27 +++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  4 +++
>   4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b5a194..c17ac85eb447 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1830,6 +1830,9 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>   	if (hw_pp->ops.setup_dsc)
>   		hw_pp->ops.setup_dsc(hw_pp);
>   
> +	if (hw_dsc->ops.dsc_bind_pingpong_blk)
> +		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, true, hw_pp->idx);
> +
>   	if (hw_pp->ops.enable_dsc)
>   		hw_pp->ops.enable_dsc(hw_pp);
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c160dae95a69..96f849907aa2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -268,6 +268,15 @@ enum {
>   	DPU_VBIF_MAX
>   };
>   
> +/**
> + * DSC features
> + * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
> + *                            the pixel output from this DSC.
> + */
> +enum {
> +	DPU_DSC_OUTPUT_CTRL = 0x1,
> +};
> +
>   /**
>    * MACRO DPU_HW_BLK_INFO - information of HW blocks inside DPU
>    * @name:              string name for debug purposes
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 3662df698dae..619926da1441 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -29,6 +29,8 @@
>   #define DSC_RANGE_MAX_QP                0x0B0
>   #define DSC_RANGE_BPG_OFFSET            0x0EC
>   
> +#define DSC_CTL(m) (0x1800 - 0x3FC * (m - DSC_0))
> +
>   static void dpu_hw_dsc_disable(struct dpu_hw_dsc *dsc)
>   {
>   	struct dpu_hw_blk_reg_map *c = &dsc->hw;
> @@ -150,6 +152,29 @@ static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
>   	}
>   }
>   
> +static void dpu_hw_dsc_bind_pingpong_blk(
> +		struct dpu_hw_dsc *hw_dsc,
> +		bool enable,
> +		const enum dpu_pingpong pp)
> +{
> +	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> +	int mux_cfg = 0xF;
> +	u32 dsc_ctl_offset;
> +
> +	dsc_ctl_offset = DSC_CTL(hw_dsc->idx);
> +
> +	if (enable)
> +		mux_cfg = (pp - PINGPONG_0) & 0x7;
> +
> +	DRM_DEBUG_KMS("%s dsc:%d %s pp:%d\n",
> +			enable ? "Binding" : "Unbinding",
> +			hw_dsc->idx - DSC_0,
> +			enable ? "to" : "from",
> +			pp - PINGPONG_0);
> +
> +	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
> +}
> +
>   static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
>   				       const struct dpu_mdss_cfg *m,
>   				       void __iomem *addr,
> @@ -174,6 +199,8 @@ static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
>   	ops->dsc_disable = dpu_hw_dsc_disable;
>   	ops->dsc_config = dpu_hw_dsc_config;
>   	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
> +	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
> +		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
>   };
>   
>   struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index c0b77fe1a696..ae9b5db53d7f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -42,6 +42,10 @@ struct dpu_hw_dsc_ops {
>   	 */
>   	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
>   				  struct drm_dsc_config *dsc);
> +
> +	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
> +				  bool enable,
> +				  enum dpu_pingpong pp);
>   };
>   
>   struct dpu_hw_dsc {
