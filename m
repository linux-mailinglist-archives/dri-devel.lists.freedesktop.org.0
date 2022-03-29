Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1CA4EB535
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 23:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F3110E8EA;
	Tue, 29 Mar 2022 21:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644CA10E0F8;
 Tue, 29 Mar 2022 21:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648589092; x=1680125092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i9Sdtbkuhqp481oJl00WLh2Z+wfgKWLPxEauoQP9hAg=;
 b=g6Yfv+q8Qx7WHHttD5V+STTu8VgmeCLctcGA9mazUSxh98dY4PrkNP2i
 vu0Tw7Gu5w76UAoV1bwyLtEyCODOmYv5cFBdBkSRcLAn8RjahFBl/vExI
 HW270xjPWCMTe0k5NjUsDcGulq9i/svwMi4jIUqZ2ByvlbKU4CigrQJM1 o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 29 Mar 2022 14:24:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 14:24:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 14:24:36 -0700
Received: from [10.110.122.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 14:24:35 -0700
Message-ID: <713d0a4d-0a33-7d1e-b2a9-c3b9aa09a9cb@quicinc.com>
Date: Tue, 29 Mar 2022 14:24:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assuming this series is newer and supersedes 
https://patchwork.freedesktop.org/patch/464353/?series=97307&rev=2,

please check below.

On 2/16/2022 7:45 PM, Dmitry Baryshkov wrote:
> Remove loops over hw_vbif. Instead always VBIF's idx as an index in the
> array. This fixes an error in dpu_kms_hw_init(), where we fill
> dpu_kms->hw_vbif[i], but check for an error pointer at
> dpu_kms->hw_vbif[vbif_idx].
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 29 +++++++++++-------------
>   2 files changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d0653a9ec694..81a35c8d62e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -790,11 +790,9 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   	_dpu_kms_mmu_destroy(dpu_kms);
>   
>   	if (dpu_kms->catalog) {
> -		for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
> -			u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
> -
> -			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx])
> -				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
> +		for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
> +			if (dpu_kms->hw_vbif[i])
> +				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[i]);
>   		}
>   	}
>   
> @@ -1102,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
>   		u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
>   
> -		dpu_kms->hw_vbif[i] = dpu_hw_vbif_init(vbif_idx,
> +		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
>   				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
>   		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
>   			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index 21d20373eb8b..cbbf77b17fc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -11,6 +11,14 @@
>   #include "dpu_hw_vbif.h"
>   #include "dpu_trace.h"
>   
> +static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif vbif_idx)
> +{
> +	if (vbif_idx > ARRAY_SIZE(dpu_kms->hw_vbif))
> +		return dpu_kms->hw_vbif[vbif_idx];

Shouldnt this be

if (vbif_idx < ARRAY_SIZE(dpu_kms->hw_vbif))
	return dpu_kms->hw_vbif[vbif_idx];

> +
> +	return NULL;
> +}
> +
>   /**
>    * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
>    * @vbif:	Pointer to hardware vbif driver
> @@ -148,20 +156,15 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
>   void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>   		struct dpu_vbif_set_ot_params *params)
>   {
> -	struct dpu_hw_vbif *vbif = NULL;
> +	struct dpu_hw_vbif *vbif;
>   	struct dpu_hw_mdp *mdp;
>   	bool forced_on = false;
>   	u32 ot_lim;
> -	int ret, i;
> +	int ret;
>   
>   	mdp = dpu_kms->hw_mdp;
>   
> -	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
> -		if (dpu_kms->hw_vbif[i] &&
> -				dpu_kms->hw_vbif[i]->idx == params->vbif_idx)
> -			vbif = dpu_kms->hw_vbif[i];
> -	}
> -
> +	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
>   	if (!vbif || !mdp) {
>   		DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
>   				vbif != NULL, mdp != NULL);
> @@ -204,7 +207,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>   void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>   		struct dpu_vbif_set_qos_params *params)
>   {
> -	struct dpu_hw_vbif *vbif = NULL;
> +	struct dpu_hw_vbif *vbif;
>   	struct dpu_hw_mdp *mdp;
>   	bool forced_on = false;
>   	const struct dpu_vbif_qos_tbl *qos_tbl;
> @@ -216,13 +219,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>   	}
>   	mdp = dpu_kms->hw_mdp;
>   
> -	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
> -		if (dpu_kms->hw_vbif[i] &&
> -				dpu_kms->hw_vbif[i]->idx == params->vbif_idx) {
> -			vbif = dpu_kms->hw_vbif[i];
> -			break;
> -		}
> -	}
> +	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
>   
>   	if (!vbif || !vbif->cap) {
>   		DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
