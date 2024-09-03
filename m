Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1F196AC1F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 00:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A060510E604;
	Tue,  3 Sep 2024 22:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="biYG7Ee5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FC910E604;
 Tue,  3 Sep 2024 22:22:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483CvEaV014384;
 Tue, 3 Sep 2024 22:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /ySobt06d03p2Xm2eVh5jE8nc1WdYv3H6QiumBVNUAg=; b=biYG7Ee5qWPRAU5n
 MD47HzOIJ1T8pgAS7i9AoDFfBMlPAR+zBfsK/hHgN12EGRj2JlcZCpMfRWyybQR9
 Hc41gyfdm/mH7InnvIJ+highiQr0Hq122l/tGhO6T2oLN+tfeUnwoiAA/XcbsbeC
 KTx2GiWWOz5jaK3Gi4iEIZ9IDoApz4lIqxoRJfXL7Ba1X/37Rsv/CRtg40Cc0Mzt
 I1xg0A082c56PC1NLt2WLIjD+fDnTn7hSVHAz9U5tHCnDlPRggfmfK3X20r972Rn
 KY7ZNKwZcG3589/fIm/CpQptavlteLjMp9/PBOm6doOanQhuYpDlBXcTgQA6twsh
 9cL5og==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69b0tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2024 22:22:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483MMWAm007959
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Sep 2024 22:22:32 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 15:22:31 -0700
Message-ID: <42000976-9cba-436c-8cde-38bf521340d7@quicinc.com>
Date: Tue, 3 Sep 2024 15:22:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/21] drm/msm/dpu: add CWB support to dpu_hw_wb
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-10-502b16ae2ebb@quicinc.com>
 <2iyrj4bzvvjapn2p6kef2jub2ivsjszrqwaq3zj33hsbdtzuid@q7s6dqlerebu>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <2iyrj4bzvvjapn2p6kef2jub2ivsjszrqwaq3zj33hsbdtzuid@q7s6dqlerebu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: t2nqRG0gwXW4pl7y0kfqrFBKWrNe2PRo
X-Proofpoint-ORIG-GUID: t2nqRG0gwXW4pl7y0kfqrFBKWrNe2PRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030179
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



On 8/30/2024 10:41 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 01:48:31PM GMT, Jessica Zhang wrote:
>> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
>>
>> Add function ops to allow hw_wb to configure CWB registers and adjust
>> the WB_MUX configuration to account for using dedicated CWB pingpong
>> blocks.
>>
>> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 69 ++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h | 34 +++++++++++++++
>>   2 files changed, 102 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> index 93ff01c889b5..998c9fbd22a6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> @@ -51,6 +51,12 @@
>>   #define WB_CDP_CNTL                           0x2B4
>>   #define WB_OUT_IMAGE_SIZE                     0x2C0
>>   #define WB_OUT_XY                             0x2C4
> 
> Empty line
> 
>> +#define CWB_MUX                               0x000
>> +#define CWB_MODE                              0x004
>> +
>> +/* CWB mux block bit definitions */
>> +#define CWB_MUX_MASK                          GENMASK(3, 0)
>> +#define CWB_MODE_MASK                         GENMASK(2, 0)
>>   
>>   static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
>>   		struct dpu_hw_wb_cfg *data)
>> @@ -173,7 +179,9 @@ static void dpu_hw_wb_bind_pingpong_blk(
>>   	mux_cfg = DPU_REG_READ(c, WB_MUX);
>>   	mux_cfg &= ~0xf;
>>   
>> -	if (pp)
>> +	if (pp >= PINGPONG_CWB_0)
>> +		mux_cfg |= (pp < PINGPONG_CWB_2) ? 0xd : 0xb;
>> +	else if (pp)
>>   		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>>   	else
>>   		mux_cfg |= 0xf;
>> @@ -237,3 +245,62 @@ struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
>>   
>>   	return c;
>>   }
>> +
>> +static void dpu_hw_cwb_setup_input_ctrl(struct dpu_hw_wb *ctx,
>> +				enum dpu_cwb cwb_idx,
>> +				const enum dpu_pingpong pp)
> 
> Align to opening bracket, please.

Hi Dmitry,

Acked for all comments here -- I'll squash the 2 cwb ops together.

Thanks,

Jessica Zhang

> 
>> +{
>> +	struct dpu_hw_blk_reg_map *c;
>> +	int cwb_mux_cfg = 0xF;
>> +
>> +	if (cwb_idx < CWB_0 || cwb_idx >= CWB_MAX)
>> +		return;
>> +
>> +	c = &ctx->cwb_hw[cwb_idx - CWB_0];
>> +
>> +	/*
>> +	 * The CWB_MUX register takes the pingpong index relative to
>> +	 * PINGPONG_CWB_0 and not PINGPONG_0
>> +	 */
>> +	if ((pp != PINGPONG_NONE) && (pp < PINGPONG_MAX))
>> +		cwb_mux_cfg = FIELD_PREP(CWB_MUX_MASK, pp - PINGPONG_CWB_0);
>> +
>> +	DPU_REG_WRITE(c, CWB_MUX, cwb_mux_cfg);
>> +}
>> +
>> +static void dpu_hw_cwb_setup_input_mode(struct dpu_hw_wb *ctx,
>> +				enum dpu_cwb cwb_idx,
>> +				const enum cwb_mode_input input)
>> +{
>> +	struct dpu_hw_blk_reg_map *c;
>> +	int cwb_mux_cfg;
>> +
>> +	if (cwb_idx < CWB_0 || cwb_idx >= CWB_MAX || input >= INPUT_MODE_MAX)
>> +		return;
>> +
>> +	c = &ctx->cwb_hw[cwb_idx - CWB_0];
>> +	cwb_mux_cfg = FIELD_PREP(CWB_MODE_MASK, input);
>> +
>> +	DPU_REG_WRITE(c, CWB_MODE, cwb_mux_cfg);
>> +}
>> +
>> +static void _setup_cwb_ops(struct dpu_hw_wb_ops *ops)
>> +{
>> +	ops->setup_input_ctrl = dpu_hw_cwb_setup_input_ctrl;
>> +	ops->setup_input_mode = dpu_hw_cwb_setup_input_mode;
>> +}
>> +
>> +struct dpu_hw_wb *dpu_hw_wb_init_with_cwb(struct drm_device *dev,
>> +				 const struct dpu_wb_cfg *cfg,
>> +				 void __iomem *addr,
>> +				 const struct dpu_mdss_version *mdss_rev,
>> +				 struct dpu_hw_blk_reg_map *cwb_hw)
>> +{
>> +	struct dpu_hw_wb *c = dpu_hw_wb_init(dev, cfg, addr, mdss_rev);
>> +
>> +	c->cwb_hw = cwb_hw;
>> +
>> +	_setup_cwb_ops(&c->ops);
>> +
>> +	return c;
>> +}
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> index 37497473e16c..1ff40f8325e5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> @@ -21,6 +21,12 @@ struct dpu_hw_wb_cfg {
>>   	struct drm_rect crop;
>>   };
>>   
>> +enum cwb_mode_input {
>> +	INPUT_MODE_LM_OUT,
>> +	INPUT_MODE_DSPP_OUT,
>> +	INPUT_MODE_MAX
>> +};
>> +
>>   /**
>>    *
>>    * struct dpu_hw_wb_ops : Interface to the wb hw driver functions
>> @@ -31,6 +37,8 @@ struct dpu_hw_wb_cfg {
>>    *  @setup_cdp:       setup chroma down prefetch block for writeback block
>>    *  @setup_clk_force_ctrl: setup clock force control
>>    *  @bind_pingpong_blk: enable/disable the connection with ping-pong block
>> + *  @setup_ctrl: setup ctrl register for cwb
>> + *  @setup_mode: setup mode register for cwb
>>    */
>>   struct dpu_hw_wb_ops {
>>   	void (*setup_outaddress)(struct dpu_hw_wb *ctx,
>> @@ -54,11 +62,20 @@ struct dpu_hw_wb_ops {
>>   
>>   	void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
>>   				  const enum dpu_pingpong pp);
>> +
>> +	void (*setup_input_ctrl)(struct dpu_hw_wb *ctx,
>> +				 enum dpu_cwb cwb_idx,
>> +				 const enum dpu_pingpong pp);
>> +
>> +	void (*setup_input_mode)(struct dpu_hw_wb *ctx,
>> +				 enum dpu_cwb cwb_idx,
>> +				 const enum cwb_mode_input input);
> 
> Judging by the usage, could you please add single setup_cwb() callback
> and let WB code call corresponding functions internally.
> 
>>   };
>>   
>>   /**
>>    * struct dpu_hw_wb : WB driver object
>>    * @hw: block hardware details
>> + * @cwb_hw: block hardware details of cwb_muxes
>>    * @idx: hardware index number within type
>>    * @wb_hw_caps: hardware capabilities
>>    * @ops: function pointers
>> @@ -66,6 +83,9 @@ struct dpu_hw_wb_ops {
>>   struct dpu_hw_wb {
>>   	struct dpu_hw_blk_reg_map hw;
>>   
>> +	/* cwb data */
>> +	struct dpu_hw_blk_reg_map *cwb_hw;
>> +
>>   	/* wb path */
>>   	int idx;
>>   	const struct dpu_wb_cfg *caps;
>> @@ -87,4 +107,18 @@ struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
>>   				 void __iomem *addr,
>>   				 const struct dpu_mdss_version *mdss_rev);
>>   
>> +/**
>> + * dpu_hw_wb_init_with_cwb() - Initializes the writeback hw driver object with cwb.
>> + * @dev:  Corresponding device for devres management
>> + * @cfg:  wb_path catalog entry for which driver object is required
>> + * @addr: mapped register io address of MDP
>> + * @hw: array of cwb muxes
>> + * Return: Error code or allocated dpu_hw_wb context
>> + */
> 
> Please move the comment to the function body. This way make W=1 will
> check that it is valid.
> 
>> +struct dpu_hw_wb *dpu_hw_wb_init_with_cwb(struct drm_device *dev,
>> +					const struct dpu_wb_cfg *cfg,
>> +					void __iomem *addr,
>> +					const struct dpu_mdss_version *mdss_rev,
>> +					struct dpu_hw_blk_reg_map *hw);
>> +
>>   #endif /*_DPU_HW_WB_H */
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry
