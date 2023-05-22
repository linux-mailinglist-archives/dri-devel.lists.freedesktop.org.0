Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F370CDC3
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0C010E3A7;
	Mon, 22 May 2023 22:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8A410E3A0;
 Mon, 22 May 2023 22:22:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MMJmEe002546; Mon, 22 May 2023 22:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hgNEJWTNMh2WjUXSW13kkkCEcxk1xBn2eSYcYcso7HY=;
 b=MFfWJHJXVPnQ9Ufz/VQsX/jtQhTJ0xmL5IZKYCLGIcydYCu285uRXX/QKfYMCm+Ne7jv
 RWcPd/LiKEtyDg00SV3E1/55jLah3QE3eXBMsm2Kj+1MBY/wmSmnrXimDk7fOp92SKQ2
 K4Ic0IPPjP6NntYkEKamvm0UhAsAviFECxmxwuHFwCqzknJl9cqWuVNUkzcXvQ9clyAL
 iY5oG5mFImFoU4xcNORMmQv1nlwqnsjjATEYoE1VPCKf199oyVqINUgDrqVTfEyoEjVk
 4vbf1mxkO1694KwSRqesXwhalBFIHhNb67ieN1/JNoFfmBCRSmOhzCjapzQZkOllThAG LQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qraasrv9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 22:22:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MMM1Hm007613
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 22:22:01 GMT
Received: from [10.110.65.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 15:22:01 -0700
Message-ID: <266dcc31-18dc-10ad-6e2a-4e21239a74dc@quicinc.com>
Date: Mon, 22 May 2023 15:22:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 06/13] drm/msm/dpu: switch RM to use
 crtc_id rather than enc_id for allocation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-7-dmitry.baryshkov@linaro.org>
 <29c1aa19-f1c7-4aff-0f48-b4e849547ebd@quicinc.com>
 <bf12ab07-4901-0a97-6e97-77d537a2cfe3@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <bf12ab07-4901-0a97-6e97-77d537a2cfe3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lB7n1lOoHD0S3jO6EMPrTDnD4x9bCzo7
X-Proofpoint-ORIG-GUID: lB7n1lOoHD0S3jO6EMPrTDnD4x9bCzo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220189
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the delay, other topics delayed my response on this one.

On 5/18/2023 6:50 PM, Dmitry Baryshkov wrote:
> On 19/05/2023 02:46, Abhinav Kumar wrote:
>>
>>
>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>> Up to now the driver has been using encoder to allocate hardware
>>> resources. Switch it to use CRTC id in preparation for the next step.
>>>
>>
>> This decision to use encoder id instead of CRTC has been there 
>> downstream for quite sometime. So most of the delay in reviewing this 
>> series was trying to understand why we had this in the first place and 
>> who knew that story.
>>
>> You are right that from the perspective of clone mode mapping 
>> resources to CRTC is correct but using encoder id is what has been 
>> working so far without too much difficulty with a little more 
>> management  But another use-case can get simplified with this.
> 
> Thank you for the historical perspective and for the feedback.
> 
> I think that keeping resource allocation in dpu_encoder was required 
> when INTF/WB themselves were allocated through the RM. However as 
> INTF/WB blocks are now allocated in a static way, it doesn't make so 
> much sense anymore.
> 

No, whether intf/wb block themselves are allocated through RM or not did 
not really go into this. It was just about considering where all 
hardware blocks make sense to be mapped : crtc or encoder. At the end, 
considering the dsc, cwb and some more blocks encoder id was used.

>>
>> There is another angle to this. There are hardware blocks which can do 
>> writeback and the physical display concurrently. We call it concurrent 
>> writeback or CWB. This is present even on some of the chipsets already 
>> supported upstream.
>>
>> Now, lets say we start a concurrent writeback session , in todays code 
>> we will allocate the resources with the encoder id of the writeback's 
>> encoder and the other physical display's encoder.
>>
>> When the session stops, we can just deallocate the resources of the 
>> writeback encoder without touching the other encoder. So it will 
>> become easier to just free up the resources mapped to the encoder.
> 
> I have not looked into CWB programming. However from your description it 
> would be as easy to do a full reallocation of the pipeline as just 
> dropping the CWB/extra encoder. In fact this is what the driver was 
> doing: in case of a modeset, drop all old resources and allocate full 
> set of resources.
> 

Correct and the reason it was able to seamlessly drop all the old 
resources was because of the encoder_id mapping, for the cwb use-case 
using crtc id will not be so seamless to release the resources.

>> With clone mode implemented with CRTC id to map resources, we will 
>> have to probably do some extra book-keeping to handle concurrent 
>> writeback.
> 
> Probably not much. We'd have to describe the topology/requirements and 
> then pass that to RM. I have been waiting for this patchset (and up to 
> some point the DSC/ctl) to be reviewed before finalizing/submitting the 
> patches that rework the CTL interface to use this kind of data structure.
> 

There is some effort there from what I can see in the cwb case. I am 
unable to visualize how your rework will help that case. If you want to 
move this mapping to crtc id to that series to convince us how, then it 
is a better fit for that series.

>> Thats the use-case which gets impacted with this but for others, there 
>> shouldnt be a major impact from what we see.
>>
>> That being said, what benefit are you seeing from making that change 
>> now for this series? Why is it specifically needed for virtual planes?
>>
>> I see in the commit text that you have mentioned this is in 
>> preparation for next step and next step talks about clone mode. But 
>> clone mode is not there yet. So why this change now?
> 
> There were several items that triggered this review.
> 
> First thing first. Current design allocates resources from 
> dpu_encoder_virt_atomic_check(), then in 
> dpu_encoder_virt_atomic_mode_set() the driver has to poke manually in 
> the cstate and fill CTL and LM. This kept on bugging me for some time. 
> The encoder should not be poking into the CRTC state.
> 

Interesting point, but the DRM documentation seems to allow that and I 
think now thats one of the positives to have things in encoder's atomic 
check.

803 	 * This callback is used to validate encoder state for atomic drivers.
804 	 * Since the encoder is the object connecting the CRTC and connector it
805 	 * gets passed both states, to be able to validate interactions and
806 	 * update the CRTC to match what the encoder needs for the requested
807 	 * connector.
808 	 *

Encoder is the place where we have both the crtc and the connector state 
being passed down to. the crtc's atomic check doesnt have the states of 
encoder. So it just seems the encoder's atomic check is more centralized 
for the entire pipeline.

> Then came the virtual planes. I think you'd agree that for the virtual 
> planes we assign SSPPs to the CRTCs. My initial design kept enc_id for 
> all the resources except the SSPP blocks (which were allocated per 
> crtc_id). This was not perfect from the symmetry point of view.
> 

Yes for SSPPs, since they are connected to LMs and LM is mapped to CRTC 
yes its right that it will be better of to map to CRTC , only if we 
think about these two blocks in isolation. But if I would think that if 
we want to validate the pipeline encoder is more central.

> Above all, filling the cstate in mode_set was too late for atomic_check 
> to look into allocated LM to see if it supports MIXER_SOURCESPLIT or 
> not. See dpu_plane_atomic_check().
> 
> I started by moving the cstate filling from the 
> dpu_encoder_virt_atomic_mode_set() to dpu_encoder_virt_atomic_check(). 
> And then it just became natural to turn it to be CRTC-centric code. The 
> encoder doesn't have to peek into CRTC state. CRTC/plane do not have to 
> delay the checks becasuse the necessary data is provided by the other 
> party at a later point.
> 

I agree that moving from mode_set() to atomic_check() for the cstate had 
to be done. But like I wrote encoder being passed a crtc state is 
exactly for this purpose as its central to crtc and connector.

>> Resource allocation is centered around LMs for the blocks we have seen 
>> so far like LM, SSPP  but  ....
> 
> And LM is a CRTC.
> 
>> DSC is already an exception because in earlier chipsets we saw that PP 
>> and DSC go together and cannot be muxed but later on that changed.
>>
>> Now, I have explained this case but I am not getting why we need to 
>> make the change for this series. Is it absolutely necessary?
> 
> Strictly, we don't. I can work around all the deficiencies of the 
> current code. But it is more natural to do it now rather than later.
> 

Overall, like I wrote in my last response, I am not against the idea but 
from your reasoning so far and from the responses i have given above, I 
do not think that this series demands this change necessarily. I think 
without this change, the virtual plane series itself is pretty small to 
review and will be an easier task to land that first. We should deal 
with it on a need basis rather than just deciding to use virtual planes 
to make this design change.

>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  16 +--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  10 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 119 ++++++++++----------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  15 ++-
>>>   4 files changed, 77 insertions(+), 83 deletions(-)
> 
> 
> [trimmed the patch contents, it is not relevant to this discussion]
> 
