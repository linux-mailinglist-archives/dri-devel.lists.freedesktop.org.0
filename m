Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EF5A06DA3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 06:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F5210ECE6;
	Thu,  9 Jan 2025 05:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EgpBfsU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EE810ECE5;
 Thu,  9 Jan 2025 05:38:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508IhbSs009782;
 Thu, 9 Jan 2025 05:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7bcBrUGZU3oSdj+RMaXnYeauDYK8CRFSZRzCt4FDK1I=; b=EgpBfsU/C3jN/B5v
 fYppFGu5YCVrrgc9y8amuepa2B5u5ST0gJTxR9Nr2f4u9t1F+Et+xf8gWeUfPgku
 NFcDLuM2YyVQMhDvI+gR7Ipd9jZNNAh1AsSGtDwsf1H/rpA2pQULvCYyAlxC3pdo
 PJVpueiH3dGBvQeg/MsobWs7oJ9O+Af5Z5zpIYFjeTSu2guafKBhg141booOmVEY
 ed0G5ld+HnVR7ks3uFJr5vbJcic6V/dFS29E4MjQRMFqszWrOYc/dE+qs0cXA5SX
 YZT7KIoeMSvWEy/7NoYNFu0v5gkeXLYHwOm9fdcWo6La+bpa7mdfgRpptOvzLs7K
 XsTKfA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvns8bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 05:37:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5095bPpn026692
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 05:37:25 GMT
Received: from [10.110.60.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 21:37:24 -0800
Message-ID: <a8159ad0-3d33-4331-899c-6728862a728a@quicinc.com>
Date: Wed, 8 Jan 2025 21:37:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/dpu: don't use active in atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Archit
 Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
 <b4f1d7c2-c9eb-4b9a-b8b7-f335910601d8@quicinc.com>
 <vhqmcb6fu6mfmbjo3jyjdhzpowhvnxbtxg2osk42xwogrsylku@5hvs6mtizqcr>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <vhqmcb6fu6mfmbjo3jyjdhzpowhvnxbtxg2osk42xwogrsylku@5hvs6mtizqcr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: K-77J62A8fTO3UPPxfgqcT_bmKbYGZbG
X-Proofpoint-ORIG-GUID: K-77J62A8fTO3UPPxfgqcT_bmKbYGZbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090044
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



On 1/8/2025 8:22 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 08, 2025 at 05:19:40PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
>>> The driver isn't supposed to consult crtc_state->active/active_check for
>>> resource allocation. Instead all resources should be allocated if
>>> crtc_state->enabled is set. Stop consulting active / active_changed in
>>> order to determine whether the hardware resources should be
>>> (re)allocated.
>>>
>>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>>> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
>>> Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 ----
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
>>>    2 files changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 7191b1a6d41b3a96f956d199398f12b2923e8c82..65e33eba61726929b740831c95330756b2817e28 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -1264,10 +1264,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>>    	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
>>> -	/* force a full mode set if active state changed */
>>> -	if (crtc_state->active_changed)
>>> -		crtc_state->mode_changed = true;
>>> -
>>>    	if (cstate->num_mixers) {
>>>    		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
>>>    		if (rc)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..d1ccdca6044353f110bf5b507788efe368f223a3 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -793,12 +793,11 @@ static int dpu_encoder_virt_atomic_check(
>>>    		crtc_state->mode_changed = true;
>>>    	/*
>>>    	 * Release and Allocate resources on every modeset
>>> -	 * Dont allocate when active is false.
>>>    	 */
>>>    	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>>>    		dpu_rm_release(global_state, drm_enc);
>>> -		if (!crtc_state->active_changed || crtc_state->enable)
>>
>> I think this was leftover code.
>>
>> What happened was, we used to have dpu_rm_reserve() both in dpu_encoder's
>> atomic_check and mode_set. Hence this is checking !active_changed because
>> that case was expected to get handled in mode_set to avoid duplicate
>> dpu_rm_reserve() calls. Code has progressed since then to drop the
>> dpu_rm_reserve() from mode_set and only use atomic_check.
>>
>> So the correct fixes tag for this should be:
>>
>> Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")
> 
> Actually it should be:
> 
> Fixes: ccc862b957c6 ("drm/msm/dpu: Fix reservation failures in modeset")
> 

Ack.

>> With that addressed, this is
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>> +		if (crtc_state->enable)
>>>    			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>>>    					drm_enc, crtc_state, topology);
>>>    		if (!ret)
>>>
> 
