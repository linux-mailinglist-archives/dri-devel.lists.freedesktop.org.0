Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC2900D98
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 23:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0A10ED25;
	Fri,  7 Jun 2024 21:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AT0sDWeI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357710ED0E;
 Fri,  7 Jun 2024 21:39:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457HZdq4006344;
 Fri, 7 Jun 2024 21:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q0jU6H2pG0R2glq2eYHW7328Ak1zyfaEXdCurKDWQek=; b=AT0sDWeIO1H0+TYk
 jNOMB18O7n9DAQAmD32ckgQsI+YEV1gCm+Lore4RNBZFrlAX0yuCaBx+wnSYS7yZ
 ONT8EK8RaPeadSPe49bYFjQ1BaTlhMVXnGmynYbs6XbXlQ70VddXXXWgc2Fj4Rsi
 MKgNz/UjKCEfp2vmCg5xLI4rTdhfqhQtgEaTfuJ5Fiseee5/uiCXZhIwmqKlfF2u
 pH6hdZhLKF++Q6SyiAPB3TEOVnK20LhdBrBvyNAxhqmLjLtRpvtVI/ZSmXGLNl7+
 S0aduYFU2deqNjtmR2HKDi8iLOpY9IuH1lDiA+0KYGfDrCAqFb/faepmZSyzn5FB
 8feHgw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rrv75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2024 21:39:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457Ldaqq031015
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Jun 2024 21:39:36 GMT
Received: from [10.110.34.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 14:39:32 -0700
Message-ID: <12d24d3e-6798-ec26-1d44-a0efc4828f6c@quicinc.com>
Date: Fri, 7 Jun 2024 14:39:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 08/13] drm/msm/dpu: add support for virtual planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-9-dmitry.baryshkov@linaro.org>
 <d828f7b6-ac3d-6696-71f1-682599c5fa64@quicinc.com>
 <abz2qu6mrtmjxpyrwwvnqs5ckcuxt2mpex5kd34o7gcmse6xvy@ympm6vlh2fc2>
 <e4b4aa8f-dc30-7b1f-5778-f4973783457a@quicinc.com>
 <q566tpuzjgpopndtfn2acjkxyhia7lcj33nyrxeilqy5a3cx2e@xlx7y5to2vnc>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <q566tpuzjgpopndtfn2acjkxyhia7lcj33nyrxeilqy5a3cx2e@xlx7y5to2vnc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xUmlgUQvd5jJdzY8lKc1I3pOY1pP9yNs
X-Proofpoint-ORIG-GUID: xUmlgUQvd5jJdzY8lKc1I3pOY1pP9yNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070160
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



On 6/7/2024 2:10 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 07, 2024 at 12:22:16PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 6/7/2024 12:16 AM, Dmitry Baryshkov wrote:
>>> On Thu, Jun 06, 2024 at 03:21:11PM -0700, Abhinav Kumar wrote:
>>>> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
>>>>> Only several SSPP blocks support such features as YUV output or scaling,
>>>>> thus different DRM planes have different features.  Properly utilizing
>>>>> all planes requires the attention of the compositor, who should
>>>>> prefer simpler planes to YUV-supporting ones. Otherwise it is very easy
>>>>> to end up in a situation when all featureful planes are already
>>>>> allocated for simple windows, leaving no spare plane for YUV playback.
>>>>>
>>>>> To solve this problem make all planes virtual. Each plane is registered
>>>>> as if it supports all possible features, but then at the runtime during
>>>>> the atomic_check phase the driver selects backing SSPP block for each
>>>>> plane.
>>>>>
>>>>> Note, this does not provide support for using two different SSPP blocks
>>>>> for a single plane or using two rectangles of an SSPP to drive two
>>>>> planes. Each plane still gets its own SSPP and can utilize either a solo
>>>>> rectangle or both multirect rectangles depending on the resolution.
>>>>>
>>>>> Note #2: By default support for virtual planes is turned off and the
>>>>> driver still uses old code path with preallocated SSPP block for each
>>>>> plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
>>>>> kernel parameter.
>>>>>
>>>>
>>>> I like the overall approach in this patch. Some comments below.
>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  50 +++++
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 230 +++++++++++++++++++---
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  19 ++
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  77 ++++++++
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  28 +++
>>>>>     7 files changed, 390 insertions(+), 28 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> index 88c2e51ab166..794c5643584f 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> @@ -1168,6 +1168,49 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>>>>>     	return false;
>>>>>     }
>>>>> +static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
>>>>> +{
>>>>> +	int total_planes = crtc->dev->mode_config.num_total_plane;
>>>>> +	struct drm_atomic_state *state = crtc_state->state;
>>>>> +	struct dpu_global_state *global_state;
>>>>> +	struct drm_plane_state **states;
>>>>> +	struct drm_plane *plane;
>>>>> +	int ret;
>>>>> +
>>>>> +	global_state = dpu_kms_get_global_state(crtc_state->state);
>>>>> +	if (IS_ERR(global_state))
>>>>> +		return PTR_ERR(global_state);
>>>>> +
>>>>> +	dpu_rm_release_all_sspp(global_state, crtc);
>>>>> +
>>>>
>>>> Do we need to call dpu_rm_release_all_sspp() even in the
>>>> _dpu_plane_atomic_disable()?
>>>
>>> It allows the driver to optimize the usage of the SSPP rectangles.
>>>
>>
>> No, what I meant was that we should call dpu_rm_release_all_sspp() in
>> dpu_plane_atomic_update() as well because in the atomic_check() path where
>> its called today, its being called only for zpos_changed and planes_changed
>> but during disable we must call this for sure.
> 
> No. the dpu_rm_release_all_sspp() should only be called during check.
> When dpu_plane_atomic_update() is called, the state should already be
> finalised. The atomic_check() callback is called when a plane is going
> to be disabled.
> 

atomic_check() will be called when plane is disabled but 
dpu_rm_release_all_sspp() may not be called as it is protected by 
zpos_changed and planes_changed. OR you need to add a !visible check 
here to call dpu_rm_release_all_sspp() that time. Thats whay I wrote 
previously.

>>
>>>>
>>>>> +	if (!crtc_state->enable)
>>>>> +		return 0;
>>>>> +
>>>>> +	states = kcalloc(total_planes, sizeof(*states), GFP_KERNEL);
>>>>> +	if (!states)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
>>>>> +		struct drm_plane_state *plane_state =
>>>>> +			drm_atomic_get_plane_state(state, plane);
>>>>> +
>>>>> +		if (IS_ERR(plane_state)) {
>>>>> +			ret = PTR_ERR(plane_state);
>>>>> +			goto done;
>>>>> +		}
>>>>> +
>>>>> +		states[plane_state->normalized_zpos] = plane_state;
>>>>> +	}
>>>>> +
>>>>> +	ret = dpu_assign_plane_resources(global_state, state, crtc, states, total_planes);
>>>>> +
>>>>> +done:
>>>>> +	kfree(states);
>>>>> +	return ret;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>     static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>>>>     		struct drm_atomic_state *state)
>>>>>     {
>>>>> @@ -1183,6 +1226,13 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>>>>     	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>>>>> +	if (dpu_use_virtual_planes &&
>>>>> +	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
>>>>
>>>> Here, I assume you are relying on DRM to set zpos_changed. But can you
>>>> please elaborate why we have to reassign planes when zpos_changes?
>>>
>>> Because the SSPP might be split between two planes. If zpos has changed
>>> we might have to break this split and use two different SSPPs for those
>>> planes.
>>>
>>
>> Got it. But that support has not been added yet so belongs to a later
>> patchset?
> 
> Yes and no. This patch still fills the plane states array following the
> zpos order. If the z-order changes, the result of
> dpu_assign_plane_resources() might change too. The actual algorithm that
> assigns SSPPs is a different code unit. So, I do not want to get back to
> this code while changing the dpu_assign_plane_resources()
> implementation.
> 

Not entirely convinced but lets see.


>>
>>>>
>>>>> +		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
>>>>> +		if (rc < 0)
>>>>> +			return rc;
>>>>> +	}
>>>>> +
>>>>>     	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
>>>>>     		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>>>>>     				crtc->base.id, crtc_state->enable,
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> index 9a1fe6868979..becdd98f3c40 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> @@ -51,6 +51,9 @@
>>>>>     #define DPU_DEBUGFS_DIR "msm_dpu"
>>>>>     #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>>>>> +bool dpu_use_virtual_planes = false;
>>>>> +module_param(dpu_use_virtual_planes, bool, 0);
>>>>> +
>>>>>     static int dpu_kms_hw_init(struct msm_kms *kms);
>>>>>     static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
>>>>> @@ -770,8 +773,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>>>>>     			  type, catalog->sspp[i].features,
>>>>>     			  catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR));
>>>>> -		plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
>>>>> -				       (1UL << max_crtc_count) - 1);
>>>>> +		if (dpu_use_virtual_planes)
>>>>> +			plane = dpu_plane_init_virtual(dev, type, (1UL << max_crtc_count) - 1);
>>>>> +		else
>>>>> +			plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
>>>>> +					       (1UL << max_crtc_count) - 1);
>>>>>     		if (IS_ERR(plane)) {
>>>>>     			DPU_ERROR("dpu_plane_init failed\n");
>>>>>     			ret = PTR_ERR(plane);
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>> index e2adc937ea63..195257660057 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>> @@ -64,6 +64,8 @@
>>>>>     #define ktime_compare_safe(A, B) \
>>>>>     	ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
>>>>> +extern bool dpu_use_virtual_planes;
>>>>> +
>>>>>     struct dpu_kms {
>>>>>     	struct msm_kms base;
>>>>>     	struct drm_device *dev;
>>>>> @@ -138,6 +140,8 @@ struct dpu_global_state {
>>>>>     	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
>>>>>     	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
>>>>>     	uint32_t cdm_to_enc_id;
>>>>> +
>>>>> +	uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
>>>>
>>>> I will re-visit this sspp_to_crtc_id mapping after checking the rest of the
>>>> patches.
>>>>
>>>>>     };
>>>>>     struct dpu_global_state
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> index a41ffa2d774b..2961b809ccf3 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> @@ -876,7 +876,7 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>>>>>     	drm_rect_rotate_inv(&pipe_cfg->src_rect,
>>>>>     			    new_plane_state->fb->width, new_plane_state->fb->height,
>>>>>     			    new_plane_state->rotation);
>>>>> -	if (r_pipe_cfg->src_rect.x1 != 0)
>>>>> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
>>>>>     		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
>>>>>     				    new_plane_state->fb->width, new_plane_state->fb->height,
>>>>>     				    new_plane_state->rotation);
>>>>> @@ -942,7 +942,7 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>>>>>     	if (ret)
>>>>>     		return ret;
>>>>> -	if (r_pipe_cfg->src_rect.x1 != 0) {
>>>>> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
>>>>>     		/*
>>>>>     		 * In parallel multirect case only the half of the usual width
>>>>>     		 * is supported for tiled formats. If we are here, we know that
>>>>> @@ -1022,6 +1022,113 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>>>     	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
>>>>>     }
>>>>
>>>> This part should goto patch 6 right?
>>>
>>> Why? This is only relevant for the virtual planes.
>>>
>>
>> Patch 6 introducted the if (r_pipe_cfg->src_rect.x1 != 0) checks from
>> afaict. Was that to ensure there was a valid src_rect for the r_pipe before
>> invoking drm_rect_rotate_inv()?
>>
>> This patch changes it from using x1!=0 to using drm_rect_width().
>>
>> Why cant this check be moved to that patch itself is my question.
> 
> I now understand your concern. Yes, this should (and in fact must) be
> moved to that patch.
> 
>>
>>>>
>>>>> +static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>>>>> +					  struct drm_atomic_state *state)
>>>>> +{
>>>>> +	struct drm_plane_state *plane_state =
>>>>> +		drm_atomic_get_plane_state(state, plane);
>>>>> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
>>>>> +	const struct dpu_format *format;
>>>>> +	struct drm_crtc_state *crtc_state;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (plane_state->crtc)
>>>>> +		crtc_state = drm_atomic_get_new_crtc_state(state,
>>>>> +							   plane_state->crtc);
>>>>> +
>>>>> +	ret = dpu_plane_atomic_check_nopipe(plane, plane_state, crtc_state);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	if (!plane_state->visible) {
>>>>> +		/*
>>>>> +		 * resources are freed by dpu_crtc_assign_plane_resources(),
>>>>> +		 * but clean them here.
>>>>> +		 */
>>>>> +		pstate->pipe.sspp = NULL;
>>>>> +		pstate->r_pipe.sspp = NULL;
>>>>> +
>>>>> +		return 0;
>>>>> +	}
>>>>> +
>>>>> +	format = to_dpu_format(msm_framebuffer_format(plane_state->fb));
>>>>> +
>>>>> +	/* force resource reallocation if the format of FB has changed */
>>>>> +	if (pstate->saved_fmt != format) {
>>>>> +		crtc_state->planes_changed = true;
>>>>
>>>> planes_changed means planes on this CRTC are updated. We are using this to
>>>> track that the underlying SSPP of the plane needs to be changed?
>>>>
>>>> Is this still correct because this might conflict with the DRM's expectation
>>>> of planes_changed.
>>>
>>> No, it still means that the planes were changed. DRM doesn't seem to
>>> care about the format changes. We do.
>>>
>>
>> Yes, I am aware that we need to detect format changes and re-assign SSPP if
>> needed if the SSPP does not support the format which was requested.
>>
>> My question was whether planes_changed is the right way to track that
>> because that is being used by DRM to track whether the plane's CRTC changed
>> so I dont know whether its appropriate to overload that meaning.
> 
> planes_changed is a hint that planes were updated. It is not limited to
> just toggling the planes.
> 
>> Also from the other comment below, since we are dropping saved_fmt, do we
>> need to retain planes_changed setting?
> 
> Yes. We still need to track the YUV <-> RGB-related changes.
> 

Ok, got it.

>>
>>>>
>>>>> +		pstate->saved_fmt = format;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>>> +					      struct dpu_global_state *global_state,
>>>>> +					      struct drm_atomic_state *state,
>>>>> +					      struct drm_plane_state *plane_state)
>>>>> +{
>>>>> +	const struct drm_crtc_state *crtc_state = NULL;
>>>>> +	struct drm_plane *plane = plane_state->plane;
>>>>> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>>>>> +	struct dpu_rm_sspp_requirements reqs;
>>>>> +	struct dpu_plane_state *pstate;
>>>>> +	struct dpu_sw_pipe *pipe;
>>>>> +	struct dpu_sw_pipe *r_pipe;
>>>>> +	const struct dpu_format *fmt;
>>>>> +
>>>>> +	if (plane_state->crtc)
>>>>> +		crtc_state = drm_atomic_get_new_crtc_state(state,
>>>>> +							   plane_state->crtc);
>>>>> +
>>>>> +	pstate = to_dpu_plane_state(plane_state);
>>>>> +	pipe = &pstate->pipe;
>>>>> +	r_pipe = &pstate->r_pipe;
>>>>> +
>>>>> +	pipe->sspp = NULL;
>>>>> +	r_pipe->sspp = NULL;
>>>>> +
>>>>> +	if (!plane_state->fb)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	fmt = to_dpu_format(msm_framebuffer_format(plane_state->fb));
>>>>> +	reqs.yuv = DPU_FORMAT_IS_YUV(fmt);
>>>>> +	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
>>>>> +		(plane_state->src_h >> 16 != plane_state->crtc_h);
>>>>> +
>>>>> +	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>>>>> +
>>>>> +	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>>>> +	if (!pipe->sspp)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
>>>>> +}
>>>>> +
>>>>> +int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>>>>> +			       struct drm_atomic_state *state,
>>>>> +			       struct drm_crtc *crtc,
>>>>> +			       struct drm_plane_state **states,
>>>>> +			       unsigned int num_planes)
>>>>> +{
>>>>> +	unsigned int i;
>>>>> +	int ret;
>>>>> +
>>>>> +	for (i = 0; i < num_planes; i++) {
>>>>> +		struct drm_plane_state *plane_state = states[i];
>>>>> +
>>>>> +		if (!plane_state ||
>>>>> +		    !plane_state->visible)
>>>>> +			continue;
>>>>> +
>>>>> +		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>>>>> +							 state, plane_state);
>>>>> +		if (ret)
>>>>> +			break;
>>>>> +	}
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>>     static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
>>>>>     {
>>>>>     	const struct dpu_format *format =
>>>>> @@ -1342,12 +1449,14 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>>>>>     	drm_printf(p, "\tstage=%d\n", pstate->stage);
>>>>> -	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
>>>>> -	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
>>>>> -	drm_printf(p, "\tmultirect_index[0]=%s\n",
>>>>> -		   dpu_get_multirect_index(pipe->multirect_index));
>>>>> -	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>>> -	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
>>>>> +	if (pipe->sspp) {
>>>>> +		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
>>>>> +		drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
>>>>> +		drm_printf(p, "\tmultirect_index[0]=%s\n",
>>>>> +			   dpu_get_multirect_index(pipe->multirect_index));
>>>>> +		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>>> +		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
>>>>> +	}
>>>>
>>>> I dont mind this being pushed out as a separate patch to protect pipe->sspp.
>>>> Even though it is static assignment today, there is no harm against adding
>>>> this protection even today IMO.
>>>
>>> No, it doesn't make sense. Currently pipe->sspp is always valid.
>>> Unnecessary checks do harm, they make you think that the condition they
>>> are checking might be invalid.
>>>
>>
>> Ack.
>>
>>>>
>>>>>     	if (r_pipe->sspp) {
>>>>>     		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
>>>>> @@ -1436,31 +1545,29 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
>>>>>     		.atomic_update = dpu_plane_atomic_update,
>>>>>     };
>>>>> +static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
>>>>> +	.prepare_fb = dpu_plane_prepare_fb,
>>>>> +	.cleanup_fb = dpu_plane_cleanup_fb,
>>>>> +	.atomic_check = dpu_plane_virtual_atomic_check,
>>>>> +	.atomic_update = dpu_plane_atomic_update,
>>>>> +};
>>>>> +
>>>>>     /* initialize plane */
>>>>> -struct drm_plane *dpu_plane_init(struct drm_device *dev,
>>>>> -		uint32_t pipe, enum drm_plane_type type,
>>>>> -		unsigned long possible_crtcs)
>>>>> +static struct drm_plane *dpu_plane_init_common(struct drm_device *dev,
>>>>> +					       enum drm_plane_type type,
>>>>> +					       unsigned long possible_crtcs,
>>>>> +					       bool inline_rotation,
>>>>> +					       const uint32_t *format_list,
>>>>> +					       uint32_t num_formats,
>>>>> +					       enum dpu_sspp pipe)
>>>>>     {
>>>>>     	struct drm_plane *plane = NULL;
>>>>> -	const uint32_t *format_list;
>>>>>     	struct dpu_plane *pdpu;
>>>>>     	struct msm_drm_private *priv = dev->dev_private;
>>>>>     	struct dpu_kms *kms = to_dpu_kms(priv->kms);
>>>>> -	struct dpu_hw_sspp *pipe_hw;
>>>>> -	uint32_t num_formats;
>>>>>     	uint32_t supported_rotations;
>>>>>     	int ret;
>>>>> -	/* initialize underlying h/w driver */
>>>>> -	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
>>>>> -	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
>>>>> -		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
>>>>> -		return ERR_PTR(-EINVAL);
>>>>> -	}
>>>>> -
>>>>> -	format_list = pipe_hw->cap->sblk->format_list;
>>>>> -	num_formats = pipe_hw->cap->sblk->num_formats;
>>>>> -
>>>>>     	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
>>>>>     				0xff, &dpu_plane_funcs,
>>>>>     				format_list, num_formats,
>>>>> @@ -1486,7 +1593,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>>>>>     	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
>>>>> -	if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
>>>>> +	if (inline_rotation)
>>>>>     		supported_rotations |= DRM_MODE_ROTATE_MASK;
>>>>>     	drm_plane_create_rotation_property(plane,
>>>>> @@ -1494,10 +1601,81 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>>>>>     	drm_plane_enable_fb_damage_clips(plane);
>>>>> -	/* success! finalize initialization */
>>>>> +	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
>>>>> +					pipe, plane->base.id);
>>>>> +	return plane;
>>>>> +}
>>>>> +
>>>>> +struct drm_plane *dpu_plane_init(struct drm_device *dev,
>>>>> +				 uint32_t pipe, enum drm_plane_type type,
>>>>> +				 unsigned long possible_crtcs)
>>>>> +{
>>>>> +	struct drm_plane *plane = NULL;
>>>>> +	struct msm_drm_private *priv = dev->dev_private;
>>>>> +	struct dpu_kms *kms = to_dpu_kms(priv->kms);
>>>>> +	struct dpu_hw_sspp *pipe_hw;
>>>>> +
>>>>> +	/* initialize underlying h/w driver */
>>>>> +	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
>>>>> +	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
>>>>> +		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
>>>>> +		return ERR_PTR(-EINVAL);
>>>>> +	}
>>>>> +
>>>>> +
>>>>> +	plane = dpu_plane_init_common(dev, type, possible_crtcs,
>>>>> +				      pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION),
>>>>> +				      pipe_hw->cap->sblk->format_list,
>>>>> +				      pipe_hw->cap->sblk->num_formats,
>>>>> +				      pipe);
>>>>> +	if (IS_ERR(plane))
>>>>> +		return plane;
>>>>> +
>>>>>     	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
>>>>>     	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
>>>>>     					pipe, plane->base.id);
>>>>> +
>>>>> +	return plane;
>>>>> +}
>>>>> +
>>>>> +struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
>>>>> +					 enum drm_plane_type type,
>>>>> +					 unsigned long possible_crtcs)
>>>>> +{
>>>>> +	struct drm_plane *plane = NULL;
>>>>> +	struct msm_drm_private *priv = dev->dev_private;
>>>>> +	struct dpu_kms *kms = to_dpu_kms(priv->kms);
>>>>> +	bool has_inline_rotation = false;
>>>>> +	const u32 *format_list = NULL;
>>>>> +	u32 num_formats = 0;
>>>>> +	int i;
>>>>> +
>>>>> +	/* Determine the largest configuration that we can implement */
>>>>> +	for (i = 0; i < kms->catalog->sspp_count; i++) {
>>>>> +		const struct dpu_sspp_cfg *cfg = &kms->catalog->sspp[i];
>>>>> +
>>>>> +		if (test_bit(DPU_SSPP_INLINE_ROTATION, &cfg->features))
>>>>> +			has_inline_rotation = true;
>>>>> +
>>>>> +		if (!format_list ||
>>>>> +		    cfg->sblk->csc_blk.len) {
>>>>
>>>> But format_list is being assigned to NULL just a few lines above. Why is
>>>> this check needed?
>>>
>>> It was assigned before the loop.
>>>
>>
>> Yes, I got this part but missed on why we needed the loop at all.
> 
> Which set of formats should the virtual plane use?
> 
>>>>
>>>> I dont get why this part can also goto dpu_plane_init_common() as it looks
>>>> identical to me.
>>>
>>> And it is not. For the non-virtual case there is no loop around formats
>>> list assignment.
>>>
>>
>> Ah okay, I misunderstood the logic. After reading the comment above the loop
>> I get what you are trying to do here.
>>
>> But I dont get why you really need to do that?
>>
>> 1) In this patch the relationship between virtual plane and SSPP is still
>> 1:1 so what is wrong to retain the sspp's actual format for the plane rather
>> than picking the best format (you are targetting Vig SSPP)
> 
> No. With this patch there is no 1:1 relationship. The RM will select the
> SSPP that suits the requirements (YUV, scaling, rotation, etc).
> 

Yes but there is always only one SSPP for one plane is what I meant. 
That does not change till the next patch.

In that sense, I dont see why you need to expose the superset of formats.

>> In fact, that will reduce atomic_check() failures with this patch because
>> compositor will still work the same way as it used to work before by not
>> trying an unsupported format on a plane.
> 
> The virtual plane should support any of the formats that the backing
> hardware can support. If (for example) we only had RGB-only and YUV-only
> hardware blocks, the driver would have to construct a _superset_ of
> those formats. Fortunately this is not the case and VIG supports a
> strict superset of what DMA (or RGB) SSPP supports.
> 

Yes, thats why I said plane_formats_yuv is enough in my next point below 
because Vig is super set of DMA or IOW Vig is the most feature rich plane.

>> If one plane maps to two SSPPs, then yes we can go with the superset of
>> formats but that comes in a later patch right?
>>
>> 2) So even if we want to do it this way from this patch itself, I think all
>> you are looking for is whether there is a Vig SSPP and if so use
>> plane_formats_yuv. There is no need for this loop IMO.
>>
>> 3) I noticed that virt_format_list is still present in the driver. If you
>> are planning to not use that perhaps drop it with this series.
> 
> Ack
> 
>>
>>>>
>>>>
>>>>> +			format_list = cfg->sblk->format_list;
>>>>> +			num_formats = cfg->sblk->num_formats;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	plane = dpu_plane_init_common(dev, type, possible_crtcs,
>>>>> +				      has_inline_rotation,
>>>>> +				      format_list,
>>>>> +				      num_formats,
>>>>> +				      SSPP_NONE);
>>>>
>>>> Ok, here is the part which we were discussing in
>>>>
>>>> https://patchwork.freedesktop.org/patch/582820/?series=131109&rev=1#comment_1087370
>>>>
>>>> So yes, that part belongs to this patch.
>>>
>>> I'll check it while preparing the next iteration.
>>>
>>>>
>>>>> +	if (IS_ERR(plane))
>>>>> +		return plane;
>>>>> +
>>>>> +	drm_plane_helper_add(plane, &dpu_plane_virtual_helper_funcs);
>>>>> +
>>>>> +	DPU_DEBUG("%s created virtual id:%u\n", plane->name, plane->base.id);
>>>>> +
>>>>>     	return plane;
>>>>>     }
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>>> index a3ae45dc95d0..15f7d60d8b85 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>>> @@ -30,6 +30,7 @@
>>>>>      * @plane_fetch_bw: calculated BW per plane
>>>>>      * @plane_clk: calculated clk per plane
>>>>>      * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
>>>>> + * @saved_fmt: format used by the plane's FB, saved for for virtual plane support
>>>>>      */
>>>>>     struct dpu_plane_state {
>>>>>     	struct drm_plane_state base;
>>>>> @@ -46,6 +47,8 @@ struct dpu_plane_state {
>>>>>     	u64 plane_clk;
>>>>>     	bool needs_dirtyfb;
>>>>> +
>>>>> +	const struct dpu_format *saved_fmt;
>>>>>     };
>>>>
>>>> Why is saved_fmt needed?
>>>>
>>>> The use-case which comes to my mind is lets say if we have a RGB format and
>>>> we need to switch to a YUV format, basically switch from DMA to ViG SSPP,
>>>> then yes we have to mark planes_changed as we need to switch the underlying
>>>> SSPP that time, but why cant we simply check that by means of a check to see
>>>> if the fmt is YUV and whether CSC block is present in the SSPP.
>>>
>>> Yes, correct. And vice versa, going from YUV to RGB might free the VIG
>>> SSPP.
>>>
>>>>
>>>> This will lead to dpu_crtc_reassign_planes() getting called for format
>>>> changes even when the new format might be available in the same SSPP.
>>>
>>> So use 'needs_vig' instead of storing the format? Sounds good to me.
>>>
>>
>> Yes thats the idea. Basically "needs_reassignment". You could even go from
>> Vig to DMA if the use-case can just use DMA to save up Vig.
>>
>> Also, do we really need to cache anything in the plane state to track this?
>>
>> If we have a function called dpu_crtc_needs_plane_reassignment() will go
>> through the current plane state and the current SSPP from the global state
>> and see if needs reassignment.
> 
> No, looking at the global state won't be possible here. I'd have to lock
> the private object before consulting it, which might cause EDEADLOCK
> later on during resource reallocation. So all necessary information
> should be stored in the dpu_plane_state.
> 

But you are already calling dpu_kms_get_global_state() in 
dpu_crtc_reassign_planes().

>>
>>>>
>>>>>     #define to_dpu_plane_state(x) \
>>>>> @@ -75,6 +78,16 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>>>>>     		uint32_t pipe, enum drm_plane_type type,
>>>>>     		unsigned long possible_crtcs);
>>>>> +/**
>>>>> + * dpu_plane_init_virtual - create new dpu virtualized plane
>>>>> + * @dev:   Pointer to DRM device
>>>>> + * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
>>>>> + * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
>>>>> + */
>>>>> +struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
>>>>> +					 enum drm_plane_type type,
>>>>> +					 unsigned long possible_crtcs);
>>>>> +
>>>>>     /**
>>>>>      * dpu_plane_color_fill - enables color fill on plane
>>>>>      * @plane:  Pointer to DRM plane object
>>>>> @@ -91,4 +104,10 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
>>>>>     static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
>>>>>     #endif
>>>>> +int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>>>>> +			       struct drm_atomic_state *state,
>>>>> +			       struct drm_crtc *crtc,
>>>>> +			       struct drm_plane_state **states,
>>>>> +			       unsigned int num_planes);
>>>>> +
>>>>>     #endif /* _DPU_PLANE_H_ */
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>> index 44938ba7a2b7..7264a4d44a14 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>> @@ -694,6 +694,83 @@ int dpu_rm_reserve(
>>>>>     	return ret;
>>>>>     }
>>>>> +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
>>>>> +					struct dpu_global_state *global_state,
>>>>> +					struct drm_crtc *crtc,
>>>>> +					struct dpu_rm_sspp_requirements *reqs)
>>>>> +{
>>>>> +	uint32_t crtc_id = crtc->base.id;
>>>>> +	unsigned int weight, best_weght = UINT_MAX;
>>>>
>>>> best_weight?
>>>
>>> Yes
>>>
>>>>
>>>>> +	struct dpu_hw_sspp *hw_sspp;
>>>>> +	unsigned long mask = 0;
>>>>> +	int i, best_idx = -1;
>>>>> +
>>>>> +	/*
>>>>> +	 * Don't take cursor feature into consideration until there is proper support for SSPP_CURSORn.
>>>>> +	 */
>>>>> +	mask |= BIT(DPU_SSPP_CURSOR);
>>>>> +
>>>>> +	if (reqs->scale)
>>>>> +		mask |= BIT(DPU_SSPP_SCALER_RGB) |
>>>>> +			BIT(DPU_SSPP_SCALER_QSEED2) |
>>>>> +			BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE);
>>>>> +
>>>>> +	if (reqs->yuv)
>>>>> +		mask |= BIT(DPU_SSPP_CSC) |
>>>>> +			BIT(DPU_SSPP_CSC_10BIT);
>>>>> +
>>>>> +	if (reqs->rot90)
>>>>> +		mask |= BIT(DPU_SSPP_INLINE_ROTATION);
>>>>> +
>>>>> +	for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++) {
>>>>> +		if (!rm->hw_sspp[i])
>>>>> +			continue;
>>>>> +
>>>>> +		if (global_state->sspp_to_crtc_id[i])
>>>>> +			continue;
>>>>> +
>>>>> +		hw_sspp = rm->hw_sspp[i];
>>>>> +
>>>>> +		/* skip incompatible planes */
>>>>> +		if (reqs->scale && !hw_sspp->cap->sblk->scaler_blk.len)
>>>>> +			continue;
>>>>> +
>>>>> +		if (reqs->yuv && !hw_sspp->cap->sblk->csc_blk.len)
>>>>> +			continue;
>>>>> +
>>>>> +		if (reqs->rot90 && !(hw_sspp->cap->features & DPU_SSPP_INLINE_ROTATION))
>>>>> +			continue;
>>>>> +
>>>>> +		/*
>>>>> +		 * For non-yuv, non-scaled planes prefer simple (DMA or RGB)
>>>>> +		 * plane, falling back to VIG only if there are no such planes.
>>>>> +		 *
>>>>> +		 * This way we'd leave VIG sspps to be later used for YUV formats.
>>>>> +		 */
>>>>> +		weight = hweight64(hw_sspp->cap->features & ~mask);
>>>>
>>>> This approach is assuming that ViG feature masks are more than DMA.
>>>> Hence the hweight of DMA SSPP's features is less than hweight of ViG SSPPs.
>>>>
>>>> Is this really true? Because there are other bits such as DMA_SDM845_MASK
>>>> which might increase the hweight of DMA SSPPs
>>>
>>> Which bits are present in the DMA mask, which are not present in the VIG
>>> mask? Also for the older platforms there are three kinds of planes: VIG,
>>> DMA and RGB. The selection algorithm should not require significant
>>> changes to support that case.
>>>
>>
>> DMA_SDM845_MASK has DPU_SSPP_QOS_8LVL which is not there in VIG_MSM8998_MASK
>> afaict. But we really cannot be counting the number of feature bits and
>> going by that.
> 
> MSM8998 uses DMA_MSM8998_MASK, not DMA_SDM845_MASK.
> 
>> Hence, inherently, going by hweight is not right because whenever we add a
>> catalog change to add a new feature bit to SSPP, we have to come back here
>> and make sure this logic will not break.
>>>>
>>>> I would rather make it simpler.
>>>>
>>>> 1) if we need scaling || yuv, then we have to get only a Vig
>>>> 2) else, first try to get a DMA SSPP
>>>
>>> How would you distinguish between VIG and DMA?
>>>
>>
>> the type SSPP_TYPE_VIG OR SSPP_TYPE_DMA. We also have a SSPP_TYPE_RGB so
>> that should address your concern about the third type of plane (Vig, DMA,
>> RGB).
> 
> I don't particularly like the idea of using type. We still need to
> evaluate plane's features. Consider QCM2290, where VIG planes do not
> support scaling.
> 
> I will evaluate if I can rework this part to use type, while still
> checking for the feature bit. BTW: should we prefer RGB or DMA plane if
> all other conditions are met?
> 

Ok, qcm2290 really seems like an odd case but point taken.

I am fine if it needs to be a combination of type and feature bit but 
certainly not hweight of feature bit. If you want to use type along with 
presence of scaler blk feature bit thats fine.

I need to check if there is any feature loss in RGB Vs DMA. Let me check 
and get back. This needs some history digging.

>>
>>
>>>> 3) if (2) fails, we have to try to get a ViG SSPP.
>>>>
>>>> Lets be more explicit about the SSPP type here rather than using hweight.
>>>>
>>>>
>>>>> +		if (weight < best_weght) {
>>>>> +			best_weght = weight;
>>>>> +			best_idx = i;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	if (best_idx < 0)
>>>>> +		return NULL;
>>>>> +
>>>>> +	global_state->sspp_to_crtc_id[best_idx] = crtc_id;
>>>>> +
>>>>> +	return rm->hw_sspp[best_idx];
>>>>> +}
>>>>> +
>>>>> +void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>>>>> +			     struct drm_crtc *crtc)
>>>>> +{
>>>>> +	uint32_t crtc_id = crtc->base.id;
>>>>> +
>>>>> +	_dpu_rm_clear_mapping(global_state->sspp_to_crtc_id,
>>>>> +		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>>>>> +}
>>>>> +
>>>>>     int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>>>>     	struct dpu_global_state *global_state, uint32_t enc_id,
>>>>>     	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>>> index e63db8ace6b9..bf9110547385 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>>> @@ -37,6 +37,12 @@ struct dpu_rm {
>>>>>     	struct dpu_hw_blk *cdm_blk;
>>>>>     };
>>>>> +struct dpu_rm_sspp_requirements {
>>>>> +	bool yuv;
>>>>> +	bool scale;
>>>>> +	bool rot90;
>>>>> +};
>>>>> +
>>>>>     /**
>>>>>      * dpu_rm_init - Read hardware catalog and create reservation tracking objects
>>>>>      *	for all HW blocks.
>>>>> @@ -82,6 +88,28 @@ int dpu_rm_reserve(struct dpu_rm *rm,
>>>>>     void dpu_rm_release(struct dpu_global_state *global_state,
>>>>>     		struct drm_encoder *enc);
>>>>> +/**
>>>>> + * dpu_rm_reserve_sspp - Reserve the required SSPP for the provided CRTC
>>>>> + * @rm: DPU Resource Manager handle
>>>>> + * @global_state: private global state
>>>>> + * @crtc: DRM CRTC handle
>>>>> + * @reqs: SSPP required features
>>>>> + */
>>>>> +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
>>>>> +					struct dpu_global_state *global_state,
>>>>> +					struct drm_crtc *crtc,
>>>>> +					struct dpu_rm_sspp_requirements *reqs);
>>>>> +
>>>>> +/**
>>>>> + * dpu_rm_release_all_sspp - Given the CRTC, release all SSPP
>>>>> + *	blocks previously reserved for that use case.
>>>>> + * @rm: DPU Resource Manager handle
>>>>> + * @crtc: DRM CRTC handle
>>>>> + * @Return: 0 on Success otherwise -ERROR
>>>>> + */
>>>>
>>>> This is void so does not return anything?
> 
> Yes
> 
>>>>
>>>>> +void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>>>>> +			     struct drm_crtc *crtc);
>>>>> +
>>>>>     /**
>>>>>      * Get hw resources of the given type that are assigned to this encoder.
>>>>>      */
>>>
> 
