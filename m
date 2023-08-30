Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A74E78D19E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 03:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750A510E4A4;
	Wed, 30 Aug 2023 01:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0E710E4A4;
 Wed, 30 Aug 2023 01:14:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U0naCr009147; Wed, 30 Aug 2023 01:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lqpIsJbkR0i6dcMGmQDqHyrkmWLSujaVJ+NexLQzJ1M=;
 b=KAOH4wBd1FoWg0aeOxKk59EzjsOX+bIRuYs6RlCQwDU9K8nlv1wvsLgW69agA9QNlaPk
 h2eovPYADwOSLpadV0xE6XrOsC5mBz9iT4Bnu0ywbFyLIldC/hr933QNmYLJYxCQu7l7
 M79XE/xpUv5WRohNdEYCIwQEjjQr/OoMGUZ7zMV9gJybyZs/+joXzYr5YXnBD3PO7qSr
 odQ3gGG5nL/ogAAmAc7Sr+2Q3w8J8QN3S1efxFwyVlXBmnCvupQ7tuJ3pN723vmWrQJk
 iP0FVfNabD95cIr8EsbQmo4j2GIIVsRAXjHhatHCmMHD2WWtC2ZsXnV+Bw9mTHVAVnXl Yg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssmcv8vdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 01:14:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37U1E1l0023816
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 01:14:01 GMT
Received: from [10.71.110.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 18:14:00 -0700
Message-ID: <ed3773ea-973f-07a6-bfc5-4772903406ff@quicinc.com>
Date: Tue, 29 Aug 2023 18:14:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: split irq_control into irq_enable and
 _disable
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
 <20230604144514.949628-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230604144514.949628-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8uUbK-qtMmHb8x6ABn7HPu5wUUjY9BSB
X-Proofpoint-GUID: 8uUbK-qtMmHb8x6ABn7HPu5wUUjY9BSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=995 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300009
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



On 6/4/2023 7:45 AM, Dmitry Baryshkov wrote:
> The single helper for both enable and disable cases is too complicated,
> especially if we start adding more code to these helpers. Split it into
> irq_enable and irq_disable cases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 36 ++++++++---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  6 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 63 ++++++++++---------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 48 +++++++-------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 29 ++++++---
>   5 files changed, 112 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2e1873d29c4b..7c131c5cbe71 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -717,7 +717,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>   	}
>   }
>   
> -static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
> +static void _dpu_encoder_irq_enable(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc;
>   	int i;
> @@ -729,14 +729,32 @@ static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
> -	DPU_DEBUG_ENC(dpu_enc, "enable:%d\n", enable);
> +	DPU_DEBUG_ENC(dpu_enc, "\n");
>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>   
> -		if (phys->ops.irq_control)
> -			phys->ops.irq_control(phys, enable);
> +		phys->ops.irq_enable(phys);
> +	}
> +}
> +
> +static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +	int i;
> +
> +	if (!drm_enc) {
> +		DPU_ERROR("invalid encoder\n");
> +		return;
>   	}
>   
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	DPU_DEBUG_ENC(dpu_enc, "\n");
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		phys->ops.irq_disable(phys);
> +	}
>   }
>   
>   static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
> @@ -762,11 +780,11 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
>   		pm_runtime_get_sync(&dpu_kms->pdev->dev);
>   
>   		/* enable all the irq */
> -		_dpu_encoder_irq_control(drm_enc, true);
> +		_dpu_encoder_irq_enable(drm_enc);
>   
>   	} else {
>   		/* disable all the irq */
> -		_dpu_encoder_irq_control(drm_enc, false);
> +		_dpu_encoder_irq_disable(drm_enc);
>   
>   		/* disable DPU core clks */
>   		pm_runtime_put_sync(&dpu_kms->pdev->dev);
> @@ -827,7 +845,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   		}
>   
>   		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
> -			_dpu_encoder_irq_control(drm_enc, true);
> +			_dpu_encoder_irq_enable(drm_enc);
>   		else
>   			_dpu_encoder_resource_control_helper(drm_enc, true);
>   
> @@ -882,7 +900,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   
>   		if (is_vid_mode &&
>   			  dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE) {
> -			_dpu_encoder_irq_control(drm_enc, true);
> +			_dpu_encoder_irq_enable(drm_enc);
>   		}
>   		/* skip if is already OFF or IDLE, resources are off already */
>   		else if (dpu_enc->rc_state == DPU_ENC_RC_STATE_OFF ||
> @@ -957,7 +975,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   		}
>   
>   		if (is_vid_mode)
> -			_dpu_encoder_irq_control(drm_enc, false);
> +			_dpu_encoder_irq_disable(drm_enc);
>   		else
>   			_dpu_encoder_resource_control_helper(drm_enc, false);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index d48558ede488..faf033cd086e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -84,7 +84,8 @@ struct dpu_encoder_phys;
>    * @handle_post_kickoff:	Do any work necessary post-kickoff work
>    * @trigger_start:		Process start event on physical encoder
>    * @needs_single_flush:		Whether encoder slaves need to be flushed
> - * @irq_control:		Handler to enable/disable all the encoder IRQs
> + * @irq_enable:			Handler to enable all the encoder IRQs
> + * @irq_disable:		Handler to disable all the encoder IRQs
>    * @prepare_idle_pc:		phys encoder can update the vsync_enable status
>    *                              on idle power collapse prepare
>    * @restore:			Restore all the encoder configs.
> @@ -111,7 +112,8 @@ struct dpu_encoder_phys_ops {
>   	void (*handle_post_kickoff)(struct dpu_encoder_phys *phys_enc);
>   	void (*trigger_start)(struct dpu_encoder_phys *phys_enc);
>   	bool (*needs_single_flush)(struct dpu_encoder_phys *phys_enc);
> -	void (*irq_control)(struct dpu_encoder_phys *phys, bool enable);
> +	void (*irq_enable)(struct dpu_encoder_phys *phys);
> +	void (*irq_disable)(struct dpu_encoder_phys *phys);
>   	void (*prepare_idle_pc)(struct dpu_encoder_phys *phys_enc);
>   	void (*restore)(struct dpu_encoder_phys *phys);
>   	int (*get_line_count)(struct dpu_encoder_phys *phys);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 4f8c9187f76d..3422b49f23c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -280,40 +280,44 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
>   	return ret;
>   }
>   
> -static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
> -		bool enable)
> +static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
>   {
>   	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
> -			phys_enc->hw_pp->idx - PINGPONG_0,
> -			enable, atomic_read(&phys_enc->vblank_refcount));

Was it intentional to re-use this trace and not add a new one for 
dpu_encoder_phys_cmd_irq_enable/dpu_encoder_phys_cmd_irq_disable?

Just thinking if the trace names Vs function names not matching would 
become confusing.

> -
> -	if (enable) {
> +					phys_enc->hw_pp->idx - PINGPONG_0,
> +					true,
> +					atomic_read(&phys_enc->vblank_refcount));
> +
> +	dpu_core_irq_register_callback(phys_enc->dpu_kms,
> +				       phys_enc->irq[INTR_IDX_PINGPONG],
> +				       dpu_encoder_phys_cmd_pp_tx_done_irq,
> +				       phys_enc);
> +	dpu_core_irq_register_callback(phys_enc->dpu_kms,
> +				       phys_enc->irq[INTR_IDX_UNDERRUN],
> +				       dpu_encoder_phys_cmd_underrun_irq,
> +				       phys_enc);
> +	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
> +
> +	if (dpu_encoder_phys_cmd_is_master(phys_enc))
>   		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_PINGPONG],
> -				dpu_encoder_phys_cmd_pp_tx_done_irq,
> -				phys_enc);
> -		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_UNDERRUN],
> -				dpu_encoder_phys_cmd_underrun_irq,
> -				phys_enc);
> -		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
> +					       phys_enc->irq[INTR_IDX_CTL_START],
> +					       dpu_encoder_phys_cmd_ctl_start_irq,
> +					       phys_enc);
> +}
>   
> -		if (dpu_encoder_phys_cmd_is_master(phys_enc))
> -			dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -					phys_enc->irq[INTR_IDX_CTL_START],
> -					dpu_encoder_phys_cmd_ctl_start_irq,
> -					phys_enc);
> -	} else {
> -		if (dpu_encoder_phys_cmd_is_master(phys_enc))
> -			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -					phys_enc->irq[INTR_IDX_CTL_START]);
> +static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
> +{
> +	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
> +			phys_enc->hw_pp->idx - PINGPONG_0,
> +			false,
> +			atomic_read(&phys_enc->vblank_refcount));
>   
> +	if (dpu_encoder_phys_cmd_is_master(phys_enc))
>   		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_UNDERRUN]);
> -		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
> -		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_PINGPONG]);
> -	}
> +				phys_enc->irq[INTR_IDX_CTL_START]);
> +
> +	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
> +	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
> +	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
>   }
>   
>   static void dpu_encoder_phys_cmd_tearcheck_config(
> @@ -744,7 +748,8 @@ static void dpu_encoder_phys_cmd_init_ops(
>   	ops->wait_for_vblank = dpu_encoder_phys_cmd_wait_for_vblank;
>   	ops->trigger_start = dpu_encoder_phys_cmd_trigger_start;
>   	ops->needs_single_flush = dpu_encoder_phys_cmd_needs_single_flush;
> -	ops->irq_control = dpu_encoder_phys_cmd_irq_control;
> +	ops->irq_enable = dpu_encoder_phys_cmd_irq_enable;
> +	ops->irq_disable = dpu_encoder_phys_cmd_irq_disable;
>   	ops->restore = dpu_encoder_phys_cmd_enable_helper;
>   	ops->prepare_idle_pc = dpu_encoder_phys_cmd_prepare_idle_pc;
>   	ops->handle_post_kickoff = dpu_encoder_phys_cmd_handle_post_kickoff;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index e26629e9e303..a550b290246c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -611,30 +611,35 @@ static void dpu_encoder_phys_vid_handle_post_kickoff(
>   	}
>   }
>   
> -static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
> -		bool enable)
> +static void dpu_encoder_phys_vid_irq_enable(struct dpu_encoder_phys *phys_enc)
>   {
>   	int ret;
>   
>   	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
> -			    phys_enc->hw_intf->idx - INTF_0,
> -			    enable,
> -			    atomic_read(&phys_enc->vblank_refcount));
> -
> -	if (enable) {
> -		ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
> -		if (WARN_ON(ret))
> -			return;
> -
> -		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_UNDERRUN],
> -				dpu_encoder_phys_vid_underrun_irq,
> -				phys_enc);
> -	} else {
> -		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
> -		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_UNDERRUN]);
> -	}
> +					phys_enc->hw_intf->idx - INTF_0,
> +					true,
> +					atomic_read(&phys_enc->vblank_refcount));
> +
> +	ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
> +	if (WARN_ON(ret))
> +		return;
> +
> +	dpu_core_irq_register_callback(phys_enc->dpu_kms,
> +				       phys_enc->irq[INTR_IDX_UNDERRUN],
> +				       dpu_encoder_phys_vid_underrun_irq,
> +				       phys_enc);
> +}
> +
> +static void dpu_encoder_phys_vid_irq_disable(struct dpu_encoder_phys *phys_enc)
> +{
> +	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
> +					phys_enc->hw_intf->idx - INTF_0,
> +					false,
> +					atomic_read(&phys_enc->vblank_refcount));
> +
> +	dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
> +	dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> +					 phys_enc->irq[INTR_IDX_UNDERRUN]);
>   }
>   
>   static int dpu_encoder_phys_vid_get_line_count(
> @@ -687,7 +692,8 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>   	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
>   	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
>   	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_vblank;
> -	ops->irq_control = dpu_encoder_phys_vid_irq_control;
> +	ops->irq_enable = dpu_encoder_phys_vid_irq_enable;
> +	ops->irq_disable = dpu_encoder_phys_vid_irq_disable;
>   	ops->prepare_for_kickoff = dpu_encoder_phys_vid_prepare_for_kickoff;
>   	ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
>   	ops->needs_single_flush = dpu_encoder_phys_vid_needs_single_flush;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index e9325cafb1a8..858fe6656c9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -382,21 +382,31 @@ static void dpu_encoder_phys_wb_done_irq(void *arg, int irq_idx)
>   }
>   
>   /**
> - * dpu_encoder_phys_wb_irq_ctrl - irq control of WB
> + * dpu_encoder_phys_wb_irq_enable - irq control of WB
>    * @phys:	Pointer to physical encoder
> - * @enable:	indicates enable or disable interrupts
>    */
> -static void dpu_encoder_phys_wb_irq_ctrl(
> -		struct dpu_encoder_phys *phys, bool enable)
> +static void dpu_encoder_phys_wb_irq_enable(struct dpu_encoder_phys *phys)
>   {
>   
>   	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
>   
> -	if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
> +	if (atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
>   		dpu_core_irq_register_callback(phys->dpu_kms,
> -				phys->irq[INTR_IDX_WB_DONE], dpu_encoder_phys_wb_done_irq, phys);
> -	else if (!enable &&
> -			atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
> +					       phys->irq[INTR_IDX_WB_DONE],
> +					       dpu_encoder_phys_wb_done_irq,
> +					       phys);
> +}
> +
> +/**
> + * dpu_encoder_phys_wb_irq_disable - irq control of WB
> + * @phys:	Pointer to physical encoder
> + */
> +static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
> +{
> +
> +	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
> +
> +	if (atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
>   		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
>   }
>   
> @@ -670,7 +680,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   	ops->trigger_start = dpu_encoder_helper_trigger_start;
>   	ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
>   	ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
> -	ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
> +	ops->irq_enable = dpu_encoder_phys_wb_irq_enable;
> +	ops->irq_disable = dpu_encoder_phys_wb_irq_disable;
>   	ops->is_valid_for_commit = dpu_encoder_phys_wb_is_valid_for_commit;
>   
>   }
