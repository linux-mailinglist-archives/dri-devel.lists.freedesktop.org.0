Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94FA8AB8D1
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 04:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBF810E34A;
	Sat, 20 Apr 2024 02:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RpY5abcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4E710E34A;
 Sat, 20 Apr 2024 02:37:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43K2PI7Z012975;
 Sat, 20 Apr 2024 02:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=qQeJxd3XpNCrhcCAyF6vFunW9hdhRagP8XVaq3dxLCY=; b=Rp
 Y5abcJji7V+RRDFVcxglFOtqExW9mFNGFnSraAhN0qw7fuM2uUSkJKeGJgfXjzOA
 XKb+EIyw041VpFK1uMr17jkkI5HPeCKYcJCHtX3C1jMZrSFB94p9ug2VYRGj9ZLn
 2u2ABbz6g9i9whE7bRHBGKykaebZ8lBuuTixzLWcvwcNmL8ElLHVgslrTlkRl7Vr
 pqFLtVx9/WLeEhsyvvw1DhMmiCBs0A4/eMygfzrrOpsVpLT9a7VAwNufxWHf4RyS
 UG0smepDn+ROwxvYyRYssFcejF+CdHaw2g0nvEYJrcucgzs9MsnefeiajIY8dJwa
 gzi9hBkFh8qVN+qPjmag==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm4w7r0g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Apr 2024 02:37:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43K2bkjf003833
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Apr 2024 02:37:46 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 19:37:45 -0700
Message-ID: <81322c16-8d82-16e7-dafd-93c29b07f169@quicinc.com>
Date: Fri, 19 Apr 2024 19:37:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes to
 atomic_check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
 <a122a43a-8def-0c11-41ef-b01fab33f98e@quicinc.com>
 <rqddqmqznhq4liusiyvowt4lfybb25qfdxak6ql6hdrreduutt@6uwkrlsxa4gw>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <rqddqmqznhq4liusiyvowt4lfybb25qfdxak6ql6hdrreduutt@6uwkrlsxa4gw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NcxkCZXvuy6n7YWIZG1c9YbwFzfGeG8_
X-Proofpoint-ORIG-GUID: NcxkCZXvuy6n7YWIZG1c9YbwFzfGeG8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-20_02,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404200016
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



On 4/19/2024 6:34 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 19, 2024 at 05:14:01PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
>>> Move a call to dpu_format_populate_plane_sizes() to the atomic_check
>>> step, so that any issues with the FB layout can be reported as early as
>>> possible.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index d9631fe90228..a9de1fbd0df3 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -673,12 +673,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
>>>    		}
>>>    	}
>>> -	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
>>> -	if (ret) {
>>> -		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
>>> -		return ret;
>>> -	}
>>> -
>>>    	/* validate framebuffer layout before commit */
>>>    	ret = dpu_format_populate_addrs(pstate->aspace,
>>>    					new_state->fb,
>>> @@ -864,6 +858,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>    		return -E2BIG;
>>>    	}
>>> +	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
>>> +	if (ret) {
>>> +		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>
>> I think we need another function to do the check. It seems incorrect to
>> populate the layout to the plane state knowing it can potentially fail.
> 
> why? The state is interim object, which is subject to checks. In other
> parts of the atomic_check we also fill parts of the state, perform
> checks and then destroy it if the check fails.
> 

Yes, the same thing you wrote.

I felt we can perform the validation and reject it before populating it 
in the state as it seems thats doable here rather than populating it 
without knowing whether it can be discarded.

> Maybe I'm missing your point here. Could you please explain what is the
> problem from your point of view?
> 
>>
>> Can we move the validation part of dpu_format_populate_plane_sizes() out to
>> another helper dpu_format_validate_plane_sizes() and use that?
>>
>> And then make the remaining dpu_format_populate_plane_sizes() just a void
>> API to fill the layout?
> 
