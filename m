Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872E09B5422
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 21:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3A010E700;
	Tue, 29 Oct 2024 20:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PbbCfCuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9831C10E6F9;
 Tue, 29 Oct 2024 20:42:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TKRBk1012700;
 Tue, 29 Oct 2024 20:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oO2c0S6h3Wlg9m7DoVs4IYzyXoU2r6zhEy+H2tcDFlM=; b=PbbCfCuTxRQa01Zr
 9tRzAuf/r2whr8VwQ3VsNKAxR6vai5tnq8KYhNhwu/0oI2IvpjAgRw0TFRaHoAag
 eG57ygFWaaUBjAcbqohwwwwMtTdeWQiOKhmV3cZ1DlqxUqtF0bIPJ/i2d7LXijqV
 u409vp5mA1RgccXTZUK9O2YV3rSth9+lcpItz08X70U6tdzB33XkAlPXiQ8oonaR
 jx2LzJD9fg1UrZ03EFAJlos4063d3uXQWooeFqinknbo9/c2HGY1704cY26zB2mf
 of0WXfjSz/DLwr7fXE3M1mJYCej/XWATqOmvpc7Aljic0z36mR6XPpXKcprXlk07
 DSMTmw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k6rpg15q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 20:42:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TKgEBZ025105
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 20:42:14 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 13:42:12 -0700
Message-ID: <30f4a216-acbf-41e6-beb0-03ef692dc692@quicinc.com>
Date: Tue, 29 Oct 2024 13:42:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-2-0310fd519765@linaro.org>
 <1dcf786e-463f-4e51-af71-66ee6077b5f1@quicinc.com>
 <jk4tfzg3zw4g23pg7rpre2pn32h6h46u2rc5ydnzuwo7mk3mam@ybw64lkaidyb>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <jk4tfzg3zw4g23pg7rpre2pn32h6h46u2rc5ydnzuwo7mk3mam@ybw64lkaidyb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -K5laccATL1S7-qME9359vAM7Efj-jgE
X-Proofpoint-GUID: -K5laccATL1S7-qME9359vAM7Efj-jgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410290156
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



On 10/28/2024 3:46 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 25, 2024 at 12:00:20PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
>>> In preparation for virtualized planes support, move pstate->pipe
>>> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
>>> case of virtual planes the plane's pipe will not be known up to the
>>> point of atomic_check() callback.
>>>
>>
>> I had R-bed this in v5. Did anything change in v6?
> 
> No, nothing. I'm sorry for forgetting to run `b4 trailers -u`.
> 
>> But one comment below.
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 +++++++++++--------------
>>>    1 file changed, 11 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 37faf5b238b0..725c9a5826fd 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -797,13 +797,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>    	uint32_t max_linewidth;
>>>    	unsigned int rotation;
>>>    	uint32_t supported_rotations;
>>> -	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
>>> -	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
>>> +	const struct dpu_sspp_cfg *pipe_hw_caps;
>>> +	const struct dpu_sspp_sub_blks *sblk;
>>>    	if (new_plane_state->crtc)
>>>    		crtc_state = drm_atomic_get_new_crtc_state(state,
>>>    							   new_plane_state->crtc);
>>> +	pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
>>> +	r_pipe->sspp = NULL;
>>> +
>>> +	if (!pipe->sspp)
>>> +		return -EINVAL;
>>> +
>>> +	pipe_hw_caps = pipe->sspp->cap;
>>> +	sblk = pipe->sspp->cap->sblk;
>>> +
>>>    	min_scale = FRAC_16_16(1, sblk->maxupscale);
>>>    	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>>>    						  min_scale,
>>
>> Do you think it will be better to move the get_sspp() call after the
>> drm_atomic_helper_check_plane_state()?
> 
> I'd say, it makes no difference. I'll check your suggestion if I have to
> send another iteration.
> 

Ok, its a minor comment, I am fine with this change otherwise,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

If you do need to push another version, you can explore that.

>>
>>> @@ -820,7 +829,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>    	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>    	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>    	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> -	r_pipe->sspp = NULL;
>>>    	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>>>    	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
>>> @@ -1286,7 +1294,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
>>>    {
>>>    	struct dpu_plane *pdpu;
>>>    	struct dpu_plane_state *pstate;
>>> -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>>>    	if (!plane) {
>>>    		DPU_ERROR("invalid plane\n");
>>> @@ -1308,16 +1315,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
>>>    		return;
>>>    	}
>>> -	/*
>>> -	 * Set the SSPP here until we have proper virtualized DPU planes.
>>> -	 * This is the place where the state is allocated, so fill it fully.
>>> -	 */
>>> -	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
>>> -	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>>> -	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> -
>>> -	pstate->r_pipe.sspp = NULL;
>>> -
>>>    	__drm_atomic_helper_plane_reset(plane, &pstate->base);
>>>    }
>>>
> 
