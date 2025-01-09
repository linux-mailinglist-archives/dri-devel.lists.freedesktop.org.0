Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07396A06AF1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 03:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ECA10E1B9;
	Thu,  9 Jan 2025 02:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="R4wslZ78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B39810E1B9;
 Thu,  9 Jan 2025 02:28:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508IgkM7007921;
 Thu, 9 Jan 2025 02:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 izdwFs4Omex+dJXp6hLRP8EEckjkqVRofQXCOIMvH/0=; b=R4wslZ78ZuR68gH6
 nrU89nIWDKb2vI+tDRzvqal/PHh6UD1fMn61r8j6l/OWLBox74soi+1BXyAXGLOm
 TSF5J5V1GGqwrErJyQS76V4XTqXuV1tZP/Q+E+5RWHm9GqlJmxsgzgGnlULHJSEh
 dgUP1VY+PQbp4kb15B5028NM2sHAkpE2MKUfnCMi6nMLcm0mSMXGU3nTVcH97hvG
 ioCfc46Cq2Q5QKHgUl7tP4w9U1lS+AUNdHYEjlzk9wKVeiQxxE/lBBbH0vCptW5b
 WsQmJdYt+Xs79UYahGMntC3ZlpWOn7UFeU50lv1GXChbLs7Jy13qXdIUsvTh5Pkz
 cGqqMw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvnrvmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 02:27:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5092REIo025237
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 02:27:14 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 18:27:13 -0800
Message-ID: <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
Date: Wed, 8 Jan 2025 18:27:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Chandan
 Uddaraju <chandanu@codeaurora.org>, Jeykumar Sankaran
 <jsanka@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Archit
 Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NYlA8ec3ct0BErbmdCZWiblNC9UWplim
X-Proofpoint-ORIG-GUID: NYlA8ec3ct0BErbmdCZWiblNC9UWplim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090017
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



On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> The MSM driver uses drm_atomic_helper_check() which mandates that none
> of the atomic_check() callbacks toggles crtc_state->mode_changed.
> Perform corresponding check before calling the drm_atomic_helper_check()
> function.
> 
> Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
>   drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
>   5 files changed, 77 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -753,6 +753,34 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
>   	cstate->num_mixers = num_lm;
>   }
>   
> +/**
> + * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> + * @drm_enc:    Pointer to drm encoder structure
> + * @crtc_state:	Corresponding CRTC state to be checked
> + * @conn_state: Corresponding Connector's state to be checked
> + *
> + * Check if the changes in the object properties demand full mode set.
> + */
> +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	struct msm_display_topology topology;
> +
> +	DPU_DEBUG_ENC(dpu_enc, "\n");
> +
> +	/* Using mode instead of adjusted_mode as it wasn't computed yet */
> +	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> +
> +	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> +		crtc_state->mode_changed = true;
> +	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> +		crtc_state->mode_changed = true;
> +
> +	return 0;
> +}

How will this work exactly?

needs_cdm is set in the encoder's atomic_check which is called inside 
drm_atomic_helper_check(). But this function is called before that.

So needs_cdm will never hit.


> +
>   static int dpu_encoder_virt_atomic_check(
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> @@ -786,10 +814,6 @@ static int dpu_encoder_virt_atomic_check(
>   
>   	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
>   
> -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
> -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
>   	/*
>   	 * Release and Allocate resources on every modeset
>   	 */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 92b5ee390788d16e85e195a664417896a2bf1cae..da133ee4701a329f566f6f9a7255f2f6d050f891 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -88,4 +88,8 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>   
>   bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
>   
> +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state);
> +
>   #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index dae8a94d3366abfb8937d5f44d8968f1d0691c2d..e2d822f7d785dc0debcb28595029a3e2050b0cf4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -446,6 +446,31 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
>   
> +static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *new_crtc_state;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *new_conn_state;
> +	int i;
> +
> +	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
> +		struct drm_encoder *encoder;
> +
> +		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
> +
> +		if (!new_conn_state->crtc || !new_conn_state->best_encoder)
> +			continue;
> +
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
> +
> +		encoder = new_conn_state->best_encoder;
> +
> +		dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
> +	}
> +
> +	return 0;
> +}
> +
>   static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
>   {
>   	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> @@ -1049,6 +1074,7 @@ static const struct msm_kms_funcs kms_funcs = {
>   	.irq             = dpu_core_irq,
>   	.enable_commit   = dpu_kms_enable_commit,
>   	.disable_commit  = dpu_kms_disable_commit,
> +	.check_mode_changed = dpu_kms_check_mode_changed,
>   	.flush_commit    = dpu_kms_flush_commit,
>   	.wait_flush      = dpu_kms_wait_flush,
>   	.complete_commit = dpu_kms_complete_commit,
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index a7a2384044ffdb13579cc9a10f56f8de9beca761..364df245e3a209094782ca1b47b752a729b32a5b 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -183,10 +183,16 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
>   
>   int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>   {
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct msm_kms *kms = priv->kms;
>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>   	struct drm_crtc *crtc;
> -	int i;
> +	int i, ret = 0;
>   
> +	/*
> +	 * FIXME: stop setting allow_modeset and move this check to the DPU
> +	 * driver.
> +	 */
>   	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
>   				      new_crtc_state, i) {
>   		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
> @@ -196,6 +202,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>   		}
>   	}
>   
> +	if (kms && kms->funcs && kms->funcs->check_mode_changed)
> +		ret = kms->funcs->check_mode_changed(kms, state);
> +	if (ret)
> +		return ret;
> +
>   	return drm_atomic_helper_check(dev, state);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index e60162744c669773b6e5aef824a173647626ab4e..ec2a75af89b09754faef1a07adc9338f7d78161e 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -59,6 +59,13 @@ struct msm_kms_funcs {
>   	void (*enable_commit)(struct msm_kms *kms);
>   	void (*disable_commit)(struct msm_kms *kms);
>   
> +	/**
> +	 * @check_mode_changed:
> +	 *
> +	 * Verify if the commit requires a full modeset on one of CRTCs.
> +	 */
> +	int (*check_mode_changed)(struct msm_kms *kms, struct drm_atomic_state *state);
> +
>   	/**
>   	 * Prepare for atomic commit.  This is called after any previous
>   	 * (async or otherwise) commit has completed.
> 
