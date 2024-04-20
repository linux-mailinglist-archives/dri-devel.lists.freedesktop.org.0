Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684DE8AB94C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 05:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8FF10F2D3;
	Sat, 20 Apr 2024 03:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="npVmqMYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE52110E7FE;
 Sat, 20 Apr 2024 03:58:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43K3n0Qv020902;
 Sat, 20 Apr 2024 03:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=22v+0Ji8Hnv5+qrfyKt6M/+WE2IZwjRwZJUpSRFV+Wk=; b=np
 VmqMYAUwhOAsVZB5KB9Ero2Vzl0LPrmg6h5GOwE+7st3L+gZWa+P3FKM0PSniItw
 AIaxvFrTRjYO//t+eKgJP8UJevBmEcLGffWQ25f613C6gvA6Tq3DSkSVNB1SAgZo
 lg1Mw6MiJ1S5LBIMZhmXe8O3CoIasl6cMpK4T2GCjfdI3cvlfIayDWH47VF7pE56
 HjLH1iVDxmLSIajm7w7U8jfYe+ES1Zo1iFKJkmsEZn6gffPSO0ZYQkAtqGEzwk7a
 1/ChIY9UR1ATqXRmV+fHSWXp13K8W4lkfwCPA5Fx26gwl52L/tdeqv1RfufoE6EC
 lE+UhCqyAiCH6XD4mHGw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm4qd8422-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Apr 2024 03:58:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43K3w7kb010678
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Apr 2024 03:58:07 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 20:58:06 -0700
Message-ID: <9a8fa878-6467-89a0-737c-7535594f01e9@quicinc.com>
Date: Fri, 19 Apr 2024 20:58:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 9/9] drm/msm/dpu: sync mode_config limits to the FB limits
 in dpu_plane.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-9-d0fe6bf81bf1@linaro.org>
 <7198d419-2b46-b9e6-4404-64f86b0b54bb@quicinc.com>
 <CAA8EJpp-oz4U5nT9gv0RtLLx0bR4g6WJdRu2Vz8tPKsZdpn-Tw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp-oz4U5nT9gv0RtLLx0bR4g6WJdRu2Vz8tPKsZdpn-Tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4OE1Q0D7-pidMBWirlEsVAZQ1pmHchGj
X-Proofpoint-ORIG-GUID: 4OE1Q0D7-pidMBWirlEsVAZQ1pmHchGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-20_02,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404200027
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



On 4/19/2024 8:06 PM, Dmitry Baryshkov wrote:
> On Sat, 20 Apr 2024 at 06:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
>>> Lift mode_config limits set by the DPU driver to the actual FB limits as
>>> handled by the dpu_plane.c.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 9 ++-------
>>>    1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 7257ac4020d8..e7dda9eca466 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1136,13 +1136,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>        dev->mode_config.min_width = 0;
>>>        dev->mode_config.min_height = 0;
>>>
>>> -     /*
>>> -      * max crtc width is equal to the max mixer width * 2 and max height is
>>> -      * is 4K
>>> -      */
>>> -     dev->mode_config.max_width =
>>> -                     dpu_kms->catalog->caps->max_mixer_width * 2;
>>> -     dev->mode_config.max_height = 4096;
>>> +     dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
>>> +     dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
>>>
>>
>> Can you please explain a little more about why the previous limits did
>> not work in the multi-monitor case?
>>
>> We support at the most using 2 LMs per display today. Quad pipe support
>> is not there yet. So by bounding to 2 * mixer_width should have been
>> same as rejecting the mixer width in atomic_check.
> 
> This is the framebuffer limit, not a CRTC size limit.
> 

As discussed on IRC, the DRM fwk uses this to limit the modes on the 
connector, please check

2922 	if (out_resp->count_modes == 0) {
2923 		if (is_current_master)
2924 			connector->funcs->fill_modes(connector,
2925 						     dev->mode_config.max_width,
2926 						     dev->mode_config.max_height);
2927 		else
2928 			drm_dbg_kms(dev, "User-space requested a forced probe on 
[CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe",
2929 				    connector->base.id, connector->name);
2930 	}

So the documentation of this doesnt really align with the usage.

Unless we alter these pieces, I am hesitant to ack this.

>>
>>>        dev->max_vblank_count = 0xffffffff;
>>>        /* Disable vblank irqs aggressively for power-saving */
>>>
> 
> 
> 
