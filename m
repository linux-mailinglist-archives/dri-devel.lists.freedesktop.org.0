Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C76F4C3D
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 23:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7CC10E108;
	Tue,  2 May 2023 21:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5403810E04E;
 Tue,  2 May 2023 21:34:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342LS7C7018557; Tue, 2 May 2023 21:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=b5dtkMmKFuleYChfzzG9qNRhDs+EmSuabfd7aLYu79g=;
 b=T6qGV4WQkqj0oafa6qLEUegZXKLuFKOYnZ+nNWh2TCGgUGHXO70PjqdOXrSN5moWrMCc
 ctD/ccqQI3d1z1AVJ18j6HJ3Vxw2jDobDok+ZX9sOYGFYj1TpbILBHG0nyFbanZ1OlS1
 wGfCfAXUu1gKjNngYW57ZNE4dd2tK1qO+l54ZIn7GenhKM3rG/0VqcX/9HIb7fCrmBDn
 Wp7uonOVYnRs/n6IlyjODr8QrEqnfpT48rv90r8sSPDgiPP/FM7M38u/CVdIBN9wwl0B
 HAHxDJmTNTPN04fdcr1HnBQKAHNoYaADmM+/Oc1gfyB5I14kOjadTEdM9/6CLjGaQ83W hw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qays51nkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 21:33:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342LXqrN026574
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 May 2023 21:33:52 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 14:33:51 -0700
Message-ID: <851cacad-dd8e-46c9-31c7-bc1b946024f9@quicinc.com>
Date: Tue, 2 May 2023 14:33:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 3/7] drm/msm/dpu: separate common function to init
 physical encoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230430235732.3341119-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: m1zbJCNWmc9nYBiNhvMrQDCguOqfbfwH
X-Proofpoint-ORIG-GUID: m1zbJCNWmc9nYBiNhvMrQDCguOqfbfwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020184
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



On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
> Move common DPU physical encoder initialization code to the new function
> dpu_encoder_phys_init().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 31 +++++++++++++++++--
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ++
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 19 +++---------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 20 +++---------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 19 +++---------
>   5 files changed, 46 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 8c45c949ec39..c60dce5861e2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2303,8 +2303,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   
>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> -		atomic_set(&phys->vsync_cnt, 0);
> -		atomic_set(&phys->underrun_cnt, 0);
>   
>   		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>   			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> @@ -2505,3 +2503,32 @@ unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
>   
>   	return dpu_enc->dsc_mask;
>   }
> +
> +int dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
> +			  struct dpu_enc_phys_init_params *p)
> +{
> +	int i;
> +
> +	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
> +	phys_enc->intf_idx = p->intf_idx;
> +	phys_enc->wb_idx = p->wb_idx;
> +	phys_enc->parent = p->parent;
> +	phys_enc->dpu_kms = p->dpu_kms;
> +	phys_enc->split_role = p->split_role;
> +	phys_enc->enc_spinlock = p->enc_spinlock;
> +	phys_enc->enable_state = DPU_ENC_DISABLED;
> +
> +	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
> +		phys_enc->irq[i] = -EINVAL;
> +
> +	atomic_set(&phys_enc->vblank_refcount, 0);
> +	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> +	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
> +
> +	atomic_set(&phys_enc->vsync_cnt, 0);
> +	atomic_set(&phys_enc->underrun_cnt, 0);
> +
> +	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 1d434b22180d..7019870215c0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -405,4 +405,7 @@ void dpu_encoder_frame_done_callback(
>   		struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *ready_phys, u32 event);
>   
> +int dpu_encoder_phys_init(struct dpu_encoder_phys *phys,
> +			  struct dpu_enc_phys_init_params *p);
> +
>   #endif /* __dpu_encoder_phys_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 74470d068622..ce86b9ef6bf1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -759,7 +759,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>   {
>   	struct dpu_encoder_phys *phys_enc = NULL;
>   	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
> -	int i, ret = 0;
> +	int ret = 0;
>   
>   	DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
>   
> @@ -770,25 +770,16 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>   		return ERR_PTR(ret);
>   	}
>   	phys_enc = &cmd_enc->base;
> -	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
> -	phys_enc->intf_idx = p->intf_idx;
> +
> +	ret = dpu_encoder_phys_init(phys_enc, p);
> +	if (ret)
> +		return ERR_PTR(ret);

dpu_encoder_phys_init() seems to always return 0, so we can make that 
void and drop ret and return here?

>   
>   	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
> -	phys_enc->parent = p->parent;
> -	phys_enc->dpu_kms = p->dpu_kms;
> -	phys_enc->split_role = p->split_role;
>   	phys_enc->intf_mode = INTF_MODE_CMD;
> -	phys_enc->enc_spinlock = p->enc_spinlock;
>   	cmd_enc->stream_sel = 0;
> -	phys_enc->enable_state = DPU_ENC_DISABLED;
> -	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
> -		phys_enc->irq[i] = -EINVAL;
>   
> -	atomic_set(&phys_enc->vblank_refcount, 0);
> -	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> -	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
>   	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
> -	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
>   	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
>   
>   	DPU_DEBUG_CMDENC(cmd_enc, "created\n");
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 3a374292f311..aca3849621e2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -699,7 +699,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   		struct dpu_enc_phys_init_params *p)
>   {
>   	struct dpu_encoder_phys *phys_enc = NULL;
> -	int i;
> +	int ret;
>   
>   	if (!p) {
>   		DPU_ERROR("failed to create encoder due to invalid parameter\n");
> @@ -712,24 +712,14 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   		return ERR_PTR(-ENOMEM);
>   	}
>   
> -	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
> -	phys_enc->intf_idx = p->intf_idx;
> -
>   	DPU_DEBUG_VIDENC(phys_enc, "\n");
>   
> +	ret = dpu_encoder_phys_init(phys_enc, p);
> +	if (ret)
> +		return ERR_PTR(ret);

same here.

> +
>   	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
> -	phys_enc->parent = p->parent;
> -	phys_enc->dpu_kms = p->dpu_kms;
> -	phys_enc->split_role = p->split_role;
>   	phys_enc->intf_mode = INTF_MODE_VIDEO;
> -	phys_enc->enc_spinlock = p->enc_spinlock;
> -	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
> -		phys_enc->irq[i] = -EINVAL;
> -
> -	atomic_set(&phys_enc->vblank_refcount, 0);
> -	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> -	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
> -	phys_enc->enable_state = DPU_ENC_DISABLED;
>   
>   	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->intf_idx);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index f879d006de21..c252127552c6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -683,7 +683,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>   	struct dpu_encoder_phys *phys_enc = NULL;
>   	struct dpu_encoder_phys_wb *wb_enc = NULL;
>   	int ret = 0;
> -	int i;
>   
>   	DPU_DEBUG("\n");
>   
> @@ -701,28 +700,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>   	}
>   
>   	phys_enc = &wb_enc->base;
> -	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
> -	phys_enc->wb_idx = p->wb_idx;
> +
> +	ret = dpu_encoder_phys_init(phys_enc, p);
> +	if (ret)
> +		return ERR_PTR(ret);

same here

>   
>   	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
> -	phys_enc->parent = p->parent;
> -	phys_enc->dpu_kms = p->dpu_kms;
> -	phys_enc->split_role = p->split_role;
>   	phys_enc->intf_mode = INTF_MODE_WB_LINE;
> -	phys_enc->wb_idx = p->wb_idx;
> -	phys_enc->enc_spinlock = p->enc_spinlock;
>   
>   	atomic_set(&wb_enc->wbirq_refcount, 0);
>   
> -	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
> -		phys_enc->irq[i] = -EINVAL;
> -
> -	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> -	atomic_set(&phys_enc->vblank_refcount, 0);
>   	wb_enc->wb_done_timeout_cnt = 0;
>   
> -	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
> -	phys_enc->enable_state = DPU_ENC_DISABLED;
>   
>   	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n",
>   			phys_enc->wb_idx);
