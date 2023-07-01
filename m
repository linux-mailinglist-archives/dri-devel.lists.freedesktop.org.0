Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98F17445CB
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 03:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3E910E512;
	Sat,  1 Jul 2023 01:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C1A10E50E;
 Sat,  1 Jul 2023 01:15:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3610kkSq029938; Sat, 1 Jul 2023 01:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SrBTJweWkdi0gemAtFUVQdHBHpnvXFNNG3Qz2bB+FlU=;
 b=GZ+82djH8AFt/Cm7sVrC/iHBD8CB3urTs6JVL/Db6sJq4owToc/cUb36CrSz9zunSN39
 /drjxmHZOqtyhPR8KM++Ff2X50osGdkKK4bgbjwL/7NMy0X+AcSU6rctEQkeQUmRv5ID
 429zCfaXr3Dgyc/6/Kk49KhK6Z/nzfvfv8kvsD0QGms2rAj2VTJZ1eWFkINpwGvMDSVi
 w+Ya3vkRsUexmAAq2VgKiVTUCS4nml295U9f70sPnWCnydjNfNTUmhQnrFRVjQG/hTyc
 AFY/LVnD5eb0cI6A7pNpHTAh1Qfj4/haD2sq1z2xbG7eAyZeRnvOT7VGymgahpcmiUci MA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rj6y30crx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Jul 2023 01:14:45 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3611EjAG030031
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 1 Jul 2023 01:14:45 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 30 Jun
 2023 18:14:44 -0700
Message-ID: <4531c809-8d0a-143b-961b-7218854d18f0@quicinc.com>
Date: Fri, 30 Jun 2023 18:14:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC v4 6/7] drm/msm/dpu: Allow NULL FBs in atomic commit
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-6-f4ec0caa742d@quicinc.com>
 <cca48c01-b84a-dff6-57ae-356971edacf3@linaro.org>
 <20230630112153.5da36b6a@eldfell>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230630112153.5da36b6a@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BGx2i0UQTu6SpT2E4JW7wfERDEBvvn7B
X-Proofpoint-GUID: BGx2i0UQTu6SpT2E4JW7wfERDEBvvn7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_14,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=983 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307010010
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/30/2023 1:21 AM, Pekka Paalanen wrote:
> On Fri, 30 Jun 2023 03:52:37 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
>> On 30/06/2023 03:25, Jessica Zhang wrote:
>>> Since solid fill planes allow for a NULL framebuffer in a valid commit,
>>> add NULL framebuffer checks to atomic commit calls within DPU.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++++++-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 45 +++++++++++++++++++------------
>>>    2 files changed, 36 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 1edf2b6b0a26..d1b37d2cc202 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -451,6 +451,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>>>    	struct drm_plane_state *state;
>>>    	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>>>    	struct dpu_plane_state *pstate = NULL;
>>> +	const struct msm_format *fmt;
>>>    	struct dpu_format *format;
>>>    	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>>>    
>>> @@ -470,7 +471,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>>>    		pstate = to_dpu_plane_state(state);
>>>    		fb = state->fb;
>>>    
>>> -		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>>> +		if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb)
>>> +			fmt = msm_framebuffer_format(pstate->base.fb);
>>> +		else
>>> +			fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
>>> +					DRM_FORMAT_RGBA8888, 0);
>>
>> The DRM_FORMAT_RGBA8888 should be defined somewhere in patch 1 as format
>> for the solid_fill, then that define can be used in this patch.
> 
> Isn't this just a driver-specific decision to convert a RGB323232
> solid_fill to be presented as a RGBA8888?

Hi Dmitry and Pekka,

Yes, the ABGR8888 format is specific to msm/dpu. In earlier revisions of 
the series, we had come to an agreement that the solid fill property 
should take RGB323232 to match the similar Wayland single pixel buffer 
protocol [1].

[1] 
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104

> 
> Though, below there is ABGR8888 used for something... inconsistent?

Typo on my part. The format should be consistently ABGR8888.

Thanks,

Jessica Zhang

> 
> 
> Thanks,
> pq
> 
>>
>>> +
>>> +		format = to_dpu_format(fmt);
>>>    
>>>    		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>>>    			bg_alpha_enable = true;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 5f0984ce62b1..4476722f03bb 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -837,8 +837,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>    
>>>    	pipe_cfg->dst_rect = new_plane_state->dst;
>>>    
>>> -	fb_rect.x2 = new_plane_state->fb->width;
>>> -	fb_rect.y2 = new_plane_state->fb->height;
>>> +	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && new_plane_state->fb) {
>>> +		fb_rect.x2 = new_plane_state->fb->width;
>>> +		fb_rect.y2 = new_plane_state->fb->height;
>>> +	}
>>>    
>>>    	/* Ensure fb size is supported */
>>>    	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
>>> @@ -848,10 +850,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>    		return -E2BIG;
>>>    	}
>>>    
>>> -	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>>> -
>>>    	max_linewidth = pdpu->catalog->caps->max_linewidth;
>>>    
>>> +	if (drm_plane_solid_fill_enabled(new_plane_state))
>>> +		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>>> +	else
>>> +		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>>> +
>>>    	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>>>    		/*
>>>    		 * In parallel multirect case only the half of the usual width
>>> @@ -1082,21 +1087,32 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>>    	struct drm_crtc *crtc = state->crtc;
>>>    	struct drm_framebuffer *fb = state->fb;
>>>    	bool is_rt_pipe;
>>> -	const struct dpu_format *fmt =
>>> -		to_dpu_format(msm_framebuffer_format(fb));
>>> +	const struct dpu_format *fmt;
>>>    	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>>>    	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>>>    	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>>>    	struct msm_gem_address_space *aspace = kms->base.aspace;
>>>    	struct dpu_hw_fmt_layout layout;
>>>    	bool layout_valid = false;
>>> -	int ret;
>>>    
>>> -	ret = dpu_format_populate_layout(aspace, fb, &layout);
>>> -	if (ret)
>>> -		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>>> -	else
>>> -		layout_valid = true;
>>> +	if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
>>> +		int ret;
>>> +
>>> +		fmt = to_dpu_format(msm_framebuffer_format(fb));
>>> +
>>> +		ret = dpu_format_populate_layout(aspace, fb, &layout);
>>> +		if (ret)
>>> +			DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>>> +		else
>>> +			layout_valid = true;
>>> +
>>> +		DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
>>> +				", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
>>> +				crtc->base.id, DRM_RECT_ARG(&state->dst),
>>> +				(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>>> +	} else {
>>> +		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>>> +	}
>>>    
>>>    	pstate->pending = true;
>>>    
>>> @@ -1104,11 +1120,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>>    	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
>>>    	pdpu->is_rt_pipe = is_rt_pipe;
>>>    
>>> -	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
>>> -			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
>>> -			crtc->base.id, DRM_RECT_ARG(&state->dst),
>>> -			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>>> -
>>>    	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
>>>    				   drm_mode_vrefresh(&crtc->mode),
>>>    				   layout_valid ? &layout : NULL);
>>>    
>>
> 
