Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A246C708C83
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 01:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C49710E58B;
	Thu, 18 May 2023 23:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5010E58B;
 Thu, 18 May 2023 23:46:26 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34INeQnc003413; Thu, 18 May 2023 23:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=K5WXQU9vdl4rfhFMrmWwxDUgGn5n3lzpKlaAU9r9wNE=;
 b=YgRz0BQnl6HbngyC2AFeFs60pcfVIoKldQWJNDfqxmuANGRVAbb0mB7ffHVvx9UEklMK
 LYRxjKvwefOGciCSnukUZ++AZgOZSH2/EAKCIqMQGsie9DhKu31Oi+whK8LcyKY4O9j+
 p6Xqg+Budx4ZsR5RJwO6/vP51mivt+Ln+zM+njt+mla4jy+Es0T+hFhRxBzlSNIGuoyU
 txS+uw32AtzddxxFZ+O0HYR2v4S0DkI9eE1AzvuOOAuQwIYGlEizkiXUOphpOCBwde1Z
 WPfK8CgMP5tqBl1yuejjMgJ7XFwxQEcWjOLx3Q2FHpRtNvbJoksJ9SYZbdOTSIQIoRa6 hg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn8d2jt9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 23:46:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34INkJMi028576
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 23:46:19 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 18 May
 2023 16:46:19 -0700
Message-ID: <29c1aa19-f1c7-4aff-0f48-b4e849547ebd@quicinc.com>
Date: Thu, 18 May 2023 16:46:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v2 06/13] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230321011821.635977-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HNczoidA_d529IhIOPgRFVtdnCLB01u_
X-Proofpoint-GUID: HNczoidA_d529IhIOPgRFVtdnCLB01u_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_16,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180197
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



On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> Up to now the driver has been using encoder to allocate hardware
> resources. Switch it to use CRTC id in preparation for the next step.
> 

This decision to use encoder id instead of CRTC has been there 
downstream for quite sometime. So most of the delay in reviewing this 
series was trying to understand why we had this in the first place and 
who knew that story.

You are right that from the perspective of clone mode mapping resources 
to CRTC is correct but using encoder id is what has been working so far 
without too much difficulty with a little more management  But another 
use-case can get simplified with this.

There is another angle to this. There are hardware blocks which can do 
writeback and the physical display concurrently. We call it concurrent 
writeback or CWB. This is present even on some of the chipsets already 
supported upstream.

Now, lets say we start a concurrent writeback session , in todays code 
we will allocate the resources with the encoder id of the writeback's 
encoder and the other physical display's encoder.

When the session stops, we can just deallocate the resources of the 
writeback encoder without touching the other encoder. So it will become 
easier to just free up the resources mapped to the encoder.

With clone mode implemented with CRTC id to map resources, we will have 
to probably do some extra book-keeping to handle concurrent writeback.

Thats the use-case which gets impacted with this but for others, there 
shouldnt be a major impact from what we see.

That being said, what benefit are you seeing from making that change now 
for this series? Why is it specifically needed for virtual planes?

I see in the commit text that you have mentioned this is in preparation 
for next step and next step talks about clone mode. But clone mode is 
not there yet. So why this change now?

Resource allocation is centered around LMs for the blocks we have seen 
so far like LM, SSPP  but  ....

DSC is already an exception because in earlier chipsets we saw that PP 
and DSC go together and cannot be muxed but later on that changed.

Now, I have explained this case but I am not getting why we need to make 
the change for this series. Is it absolutely necessary?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  16 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 119 ++++++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  15 ++-
>   4 files changed, 77 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index a2cb23dea0b8..270c85ea898a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -634,11 +634,11 @@ static int dpu_encoder_virt_atomic_check(
>   	 * Dont allocate when active is false.
>   	 */
>   	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -		dpu_rm_release(global_state, drm_enc);
> +		dpu_rm_release(global_state, crtc_state->crtc);
>   
>   		if (!crtc_state->active_changed || crtc_state->enable)
>   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -					drm_enc, crtc_state, &topology);
> +					crtc_state->crtc, &topology);
>   	}
>   
>   	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> @@ -1034,14 +1034,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   
>   	/* Query resource that have been reserved in atomic check step. */
>   	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
> +		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>   		ARRAY_SIZE(hw_pp));
>   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> +		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>   	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> +		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
>   	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> +		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
>   		ARRAY_SIZE(hw_dspp));
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> @@ -1050,7 +1050,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   
>   	if (dpu_enc->dsc) {
>   		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -							drm_enc->base.id, DPU_HW_BLK_DSC,
> +							drm_enc->crtc, DPU_HW_BLK_DSC,
>   							hw_dsc, ARRAY_SIZE(hw_dsc));
>   		for (i = 0; i < num_dsc; i++) {
>   			dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> @@ -1994,7 +1994,7 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
>   	global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
>   
>   	num_lm = dpu_rm_get_assigned_resources(&phys_enc->dpu_kms->rm, global_state,
> -		phys_enc->parent->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> +		phys_enc->parent->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
>   
>   	for (i = 0; i < num_lm; i++) {
>   		hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index ed80ed6784ee..934874eb2248 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -129,11 +129,11 @@ struct vsync_info {
>   struct dpu_global_state {
>   	struct drm_private_state base;
>   
> -	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> -	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
> -	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> -	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> -	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
> +	uint32_t pingpong_to_crtc_id[PINGPONG_MAX - PINGPONG_0];
> +	uint32_t mixer_to_crtc_id[LM_MAX - LM_0];
> +	uint32_t ctl_to_crtc_id[CTL_MAX - CTL_0];
> +	uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
> +	uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
>   };
>   
>   struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 952e139c0234..f0a94008d17a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -19,9 +19,9 @@
>   
>   
>   static inline bool reserved_by_other(uint32_t *res_map, int idx,
> -				     uint32_t enc_id)
> +				     uint32_t crtc_id)
>   {
> -	return res_map[idx] && res_map[idx] != enc_id;
> +	return res_map[idx] && res_map[idx] != crtc_id;
>   }
>   
>   int dpu_rm_destroy(struct dpu_rm *rm)
> @@ -312,7 +312,7 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
>    *	pingpong
>    * @rm: dpu resource manager handle
>    * @global_state: resources shared across multiple kms objects
> - * @enc_id: encoder id requesting for allocation
> + * @crtc_id: encoder id requesting for allocation
>    * @lm_idx: index of proposed layer mixer in rm->mixer_blks[], function checks
>    *      if lm, and all other hardwired blocks connected to the lm (pp) is
>    *      available and appropriate
> @@ -325,14 +325,14 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
>    */
>   static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
> -		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
> +		uint32_t crtc_id, int lm_idx, int *pp_idx, int *dspp_idx,
>   		struct msm_display_topology *topology)
>   {
>   	const struct dpu_lm_cfg *lm_cfg;
>   	int idx;
>   
>   	/* Already reserved? */
> -	if (reserved_by_other(global_state->mixer_to_enc_id, lm_idx, enc_id)) {
> +	if (reserved_by_other(global_state->mixer_to_crtc_id, lm_idx, crtc_id)) {
>   		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
>   		return false;
>   	}
> @@ -344,7 +344,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>   		return false;
>   	}
>   
> -	if (reserved_by_other(global_state->pingpong_to_enc_id, idx, enc_id)) {
> +	if (reserved_by_other(global_state->pingpong_to_crtc_id, idx, crtc_id)) {
>   		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
>   				lm_cfg->pingpong);
>   		return false;
> @@ -360,7 +360,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>   		return false;
>   	}
>   
> -	if (reserved_by_other(global_state->dspp_to_enc_id, idx, enc_id)) {
> +	if (reserved_by_other(global_state->dspp_to_crtc_id, idx, crtc_id)) {
>   		DPU_DEBUG("lm %d dspp %d already reserved\n", lm_cfg->id,
>   				lm_cfg->dspp);
>   		return false;
> @@ -372,7 +372,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>   
>   static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   			       struct dpu_global_state *global_state,
> -			       uint32_t enc_id,
> +			       uint32_t crtc_id,
>   			       struct msm_display_topology *topology)
>   
>   {
> @@ -396,7 +396,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   		lm_idx[lm_count] = i;
>   
>   		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> -				enc_id, i, &pp_idx[lm_count],
> +				crtc_id, i, &pp_idx[lm_count],
>   				&dspp_idx[lm_count], topology)) {
>   			continue;
>   		}
> @@ -416,7 +416,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   			}
>   
>   			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
> -					global_state, enc_id, j,
> +					global_state, crtc_id, j,
>   					&pp_idx[lm_count], &dspp_idx[lm_count],
>   					topology)) {
>   				continue;
> @@ -433,12 +433,12 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   	}
>   
>   	for (i = 0; i < lm_count; i++) {
> -		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
> -		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
> -		global_state->dspp_to_enc_id[dspp_idx[i]] =
> -			topology->num_dspp ? enc_id : 0;
> +		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
> +		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
> +		global_state->dspp_to_crtc_id[dspp_idx[i]] =
> +			topology->num_dspp ? crtc_id : 0;
>   
> -		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
> +		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, crtc_id,
>   					 pp_idx[i] + PINGPONG_0);
>   	}
>   
> @@ -448,7 +448,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   static int _dpu_rm_reserve_ctls(
>   		struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
> -		uint32_t enc_id,
> +		uint32_t crtc_id,
>   		const struct msm_display_topology *top)
>   {
>   	int ctl_idx[MAX_BLOCKS];
> @@ -467,7 +467,7 @@ static int _dpu_rm_reserve_ctls(
>   
>   		if (!rm->ctl_blks[j])
>   			continue;
> -		if (reserved_by_other(global_state->ctl_to_enc_id, j, enc_id))
> +		if (reserved_by_other(global_state->ctl_to_crtc_id, j, crtc_id))
>   			continue;
>   
>   		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
> @@ -491,8 +491,8 @@ static int _dpu_rm_reserve_ctls(
>   		return -ENAVAIL;
>   
>   	for (i = 0; i < ARRAY_SIZE(ctl_idx) && i < num_ctls; i++) {
> -		global_state->ctl_to_enc_id[ctl_idx[i]] = enc_id;
> -		trace_dpu_rm_reserve_ctls(i + CTL_0, enc_id);
> +		global_state->ctl_to_crtc_id[ctl_idx[i]] = crtc_id;
> +		trace_dpu_rm_reserve_ctls(i + CTL_0, crtc_id);
>   	}
>   
>   	return 0;
> @@ -500,7 +500,7 @@ static int _dpu_rm_reserve_ctls(
>   
>   static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>   			       struct dpu_global_state *global_state,
> -			       struct drm_encoder *enc,
> +			       uint32_t crtc_id,
>   			       const struct msm_display_topology *top)
>   {
>   	int num_dsc = top->num_dsc;
> @@ -513,14 +513,14 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>   			return -EIO;
>   		}
>   
> -		if (global_state->dsc_to_enc_id[i]) {
> +		if (global_state->dsc_to_crtc_id[i]) {
>   			DPU_ERROR("DSC %d is already allocated\n", i);
>   			return -EIO;
>   		}
>   	}
>   
>   	for (i = 0; i < num_dsc; i++)
> -		global_state->dsc_to_enc_id[i] = enc->base.id;
> +		global_state->dsc_to_crtc_id[i] = crtc_id;
>   
>   	return 0;
>   }
> @@ -528,25 +528,25 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>   static int _dpu_rm_make_reservation(
>   		struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
> -		struct drm_encoder *enc,
> +		uint32_t crtc_id,
>   		struct msm_display_topology *topology)
>   {
>   	int ret;
>   
> -	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
> +	ret = _dpu_rm_reserve_lms(rm, global_state, crtc_id, topology);
>   	if (ret) {
>   		DPU_ERROR("unable to find appropriate mixers\n");
>   		return ret;
>   	}
>   
> -	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
> +	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
>   				   topology);
>   	if (ret) {
>   		DPU_ERROR("unable to find appropriate CTL\n");
>   		return ret;
>   	}
>   
> -	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
> +	ret  = _dpu_rm_reserve_dsc(rm, global_state, crtc_id, topology);
>   	if (ret)
>   		return ret;
>   
> @@ -554,97 +554,92 @@ static int _dpu_rm_make_reservation(
>   }
>   
>   static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
> -				  uint32_t enc_id)
> +				  uint32_t crtc_id)
>   {
>   	int i;
>   
>   	for (i = 0; i < cnt; i++) {
> -		if (res_mapping[i] == enc_id)
> +		if (res_mapping[i] == crtc_id)
>   			res_mapping[i] = 0;
>   	}
>   }
>   
>   void dpu_rm_release(struct dpu_global_state *global_state,
> -		    struct drm_encoder *enc)
> +		    struct drm_crtc *crtc)
>   {
> -	_dpu_rm_clear_mapping(global_state->pingpong_to_enc_id,
> -		ARRAY_SIZE(global_state->pingpong_to_enc_id), enc->base.id);
> -	_dpu_rm_clear_mapping(global_state->mixer_to_enc_id,
> -		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
> -	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
> -		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
> -	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
> -		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
> -	_dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
> -		ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
> +	uint32_t crtc_id = crtc->base.id;
> +
> +	_dpu_rm_clear_mapping(global_state->pingpong_to_crtc_id,
> +		ARRAY_SIZE(global_state->pingpong_to_crtc_id), crtc_id);
> +	_dpu_rm_clear_mapping(global_state->mixer_to_crtc_id,
> +		ARRAY_SIZE(global_state->mixer_to_crtc_id), crtc_id);
> +	_dpu_rm_clear_mapping(global_state->ctl_to_crtc_id,
> +		ARRAY_SIZE(global_state->ctl_to_crtc_id), crtc_id);
> +	_dpu_rm_clear_mapping(global_state->dsc_to_crtc_id,
> +		ARRAY_SIZE(global_state->dsc_to_crtc_id), crtc_id);
> +	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
> +		ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
>   }
>   
>   int dpu_rm_reserve(
>   		struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
> -		struct drm_encoder *enc,
> -		struct drm_crtc_state *crtc_state,
> +		struct drm_crtc *crtc,
>   		struct msm_display_topology *topology)
>   {
>   	int ret;
>   
> -	/* Check if this is just a page-flip */
> -	if (!drm_atomic_crtc_needs_modeset(crtc_state))
> -		return 0;
> -
>   	if (IS_ERR(global_state)) {
>   		DPU_ERROR("failed to global state\n");
>   		return PTR_ERR(global_state);
>   	}
>   
> -	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
> -		      enc->base.id, crtc_state->crtc->base.id);
> +	DRM_DEBUG_KMS("reserving hw for crtc %d\n", crtc->base.id);
>   
>   	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
>   		      topology->num_lm, topology->num_dsc,
>   		      topology->num_intf);
>   
> -	ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
> +	ret = _dpu_rm_make_reservation(rm, global_state, crtc->base.id, topology);
>   	if (ret)
>   		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
>   
> -
> -
>   	return ret;
>   }
>   
>   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> -	struct dpu_global_state *global_state, uint32_t enc_id,
> +	struct dpu_global_state *global_state, struct drm_crtc *crtc,
>   	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
>   {
> +	uint32_t crtc_id = crtc->base.id;
>   	struct dpu_hw_blk **hw_blks;
> -	uint32_t *hw_to_enc_id;
> +	uint32_t *hw_to_crtc_id;
>   	int i, num_blks, max_blks;
>   
>   	switch (type) {
>   	case DPU_HW_BLK_PINGPONG:
>   		hw_blks = rm->pingpong_blks;
> -		hw_to_enc_id = global_state->pingpong_to_enc_id;
> +		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
>   		max_blks = ARRAY_SIZE(rm->pingpong_blks);
>   		break;
>   	case DPU_HW_BLK_LM:
>   		hw_blks = rm->mixer_blks;
> -		hw_to_enc_id = global_state->mixer_to_enc_id;
> +		hw_to_crtc_id = global_state->mixer_to_crtc_id;
>   		max_blks = ARRAY_SIZE(rm->mixer_blks);
>   		break;
>   	case DPU_HW_BLK_CTL:
>   		hw_blks = rm->ctl_blks;
> -		hw_to_enc_id = global_state->ctl_to_enc_id;
> +		hw_to_crtc_id = global_state->ctl_to_crtc_id;
>   		max_blks = ARRAY_SIZE(rm->ctl_blks);
>   		break;
>   	case DPU_HW_BLK_DSPP:
>   		hw_blks = rm->dspp_blks;
> -		hw_to_enc_id = global_state->dspp_to_enc_id;
> +		hw_to_crtc_id = global_state->dspp_to_crtc_id;
>   		max_blks = ARRAY_SIZE(rm->dspp_blks);
>   		break;
>   	case DPU_HW_BLK_DSC:
>   		hw_blks = rm->dsc_blks;
> -		hw_to_enc_id = global_state->dsc_to_enc_id;
> +		hw_to_crtc_id = global_state->dsc_to_crtc_id;
>   		max_blks = ARRAY_SIZE(rm->dsc_blks);
>   		break;
>   	default:
> @@ -654,17 +649,17 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   
>   	num_blks = 0;
>   	for (i = 0; i < max_blks; i++) {
> -		if (hw_to_enc_id[i] != enc_id)
> +		if (hw_to_crtc_id[i] != crtc_id)
>   			continue;
>   
>   		if (num_blks == blks_size) {
> -			DPU_ERROR("More than %d resources assigned to enc %d\n",
> -				  blks_size, enc_id);
> +			DPU_ERROR("More than %d resources assigned to crtc %d\n",
> +				  blks_size, crtc_id);
>   			break;
>   		}
>   		if (!hw_blks[i]) {
> -			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
> -				  type, enc_id);
> +			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
> +				  type, crtc_id);
>   			break;
>   		}
>   		blks[num_blks++] = hw_blks[i];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index f05697462856..f402bec8322b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -62,32 +62,31 @@ int dpu_rm_destroy(struct dpu_rm *rm);
>    *	HW blocks can then be accessed through dpu_rm_get_* functions.
>    *	HW Reservations should be released via dpu_rm_release_hw.
>    * @rm: DPU Resource Manager handle
> - * @drm_enc: DRM Encoder handle
> - * @crtc_state: Proposed Atomic DRM CRTC State handle
> + * @crtc: DRM CRTC handle
>    * @topology: Pointer to topology info for the display
>    * @Return: 0 on Success otherwise -ERROR
>    */
> -int dpu_rm_reserve(struct dpu_rm *rm,
> +int dpu_rm_reserve(
> +		struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
> -		struct drm_encoder *drm_enc,
> -		struct drm_crtc_state *crtc_state,
> +		struct drm_crtc *crtc,
>   		struct msm_display_topology *topology);
>   
>   /**
>    * dpu_rm_reserve - Given the encoder for the display chain, release any
>    *	HW blocks previously reserved for that use case.
>    * @rm: DPU Resource Manager handle
> - * @enc: DRM Encoder handle
> + * @crtc: DRM CRTC handle
>    * @Return: 0 on Success otherwise -ERROR
>    */
>   void dpu_rm_release(struct dpu_global_state *global_state,
> -		struct drm_encoder *enc);
> +		struct drm_crtc *crtc);
>   
>   /**
>    * Get hw resources of the given type that are assigned to this encoder.
>    */
>   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> -	struct dpu_global_state *global_state, uint32_t enc_id,
> +	struct dpu_global_state *global_state, struct drm_crtc *crtc,
>   	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
>   
>   /**
