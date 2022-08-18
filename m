Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91104598858
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 18:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C782BC51E;
	Thu, 18 Aug 2022 16:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43860B5B2F;
 Thu, 18 Aug 2022 16:06:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IFrR4d009879;
 Thu, 18 Aug 2022 16:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sjDjAQnJv+oym65id1D4iYi4CjbwvuRwU/uJHJdLZVc=;
 b=Pp+/ajHMJpqLwx3kzQ0CV1LK0jYw1wuPEau1YEW6OcPIIsjdBHth51liaZ767qwm4Fay
 ALCySy+FnAKeUi/ydw9qtr90nS1ZqIJlAJvIUOj28nM80NrxENGHBOxaKAl31369s3Vp
 LR9bk9NwKEkS12W0dhY9FtHlSr1sn3G1hBkoDLJuZIkyVsYtXZT2yvf+c3rlSRF02wh8
 rs6oyEWoN33ZS8cym6b/mQ1N8JWuyxVTORGxecsRhXm62q2F3oxcVsqS3Q4BYZFAXN5I
 CndVSE5D6CRtVicZXkks94CpqX6YQtEg+BJR96B8tIRAfnY3VZ58NDOSCoqHpY5bO61U yA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j0wynp68n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 16:06:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27IG6W8K024383
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 16:06:32 GMT
Received: from [10.111.166.229] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 09:06:29 -0700
Message-ID: <5d2bd7db-801a-838e-1e47-2cbb9cfe445f@quicinc.com>
Date: Thu, 18 Aug 2022 09:06:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3] drm/msm/dp: check hpd_state before push idle pattern
 at dp_bridge_disable()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n533SUb3Bg=pR8Fhwo-M5qLWiti4nzLR-rSGVAsrXgEYNQ@mail.gmail.com>
 <dbda8bce-2890-e5e3-4052-073a52eb06a6@quicinc.com>
 <CAE-0n51NyrP8CikcK_3wj4EEsurmmSZ4RY3pLhJJmkY2_8wNZw@mail.gmail.com>
 <0641a116-5b58-4305-bf2d-f53dcb747276@quicinc.com>
 <1e792f49-febf-43bf-d828-8ecf99cbeba3@quicinc.com>
 <CAE-0n50QXiJs=k78Tmd7om28MgWChypwC8LPRzF2jx_qB5+0FQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n50QXiJs=k78Tmd7om28MgWChypwC8LPRzF2jx_qB5+0FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YDa1b5-Qnmed3qS8RnJmromVm4v5x4LQ
X-Proofpoint-GUID: YDa1b5-Qnmed3qS8RnJmromVm4v5x4LQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180059
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On 8/15/2022 10:08 AM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-08-11 08:20:01)
>>
>> On 8/10/2022 6:00 PM, Abhinav Kumar wrote:
>>>
>>> Even then, you do have a valid point. DRM framework should not have
>>> caused the disable path to happen without an enable.
>>>
>>> I went through the stack mentioned in the issue.
>>>
>>> Lets see this part of the stack:
>>>
>>> dp_ctrl_push_idle+0x40/0x88
>>>   dp_bridge_disable+0x24/0x30
>>>   drm_atomic_bridge_chain_disable+0x90/0xbc
>>>   drm_atomic_helper_commit_modeset_disables+0x198/0x444
>>>   msm_atomic_commit_tail+0x1d0/0x374
>>>
>>> In drm_atomic_helper_commit_modeset_disables(), we call
>>> disable_outputs().
>>>
>>> AFAICT, this is the only place which has a protection to not call the
>>> disable() flow if it was not enabled here:
>>>
>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_helper.c#L1063
>>>
>>>
>>> But that function is only checking crtc_state->active. Thats set by
>>> the usermode:
>>>
>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_uapi.c#L407
>>>
>>>
>>> Now, if usermode sets that to true and then crashed it can bypass this
>>> check and we will crash in the location kuogee is trying to fix.
> 
> That seems bad, no? We don't want userspace to be able to crash and then
> be able to call the disable path when enable never succeeded.
> 
>>>
>>>  From the issue mentioned in
>>> https://gitlab.freedesktop.org/drm/msm/-/issues/17, the reporter did
>>> mention the usermode crashed.
>>>
>>> So this is my tentative analysis of whats happening here.
>>>
>>> Ideally yes, we should have been protected by the location mentioned
>>> above in disable_outputs() but looks to me due to the above hypothesis
>>> its getting bypassed.
> 
> Can you fix the problem there? Not fixing it means that every driver out
> there has to develop the same "fix", when it could be fixed in the core
> one time.
> 

As per discussion on IRC with Rob, we have pushed another fix for this 
issue 
https://lore.kernel.org/all/1660759314-28088-1-git-send-email-quic_khsieh@quicinc.com/.

So, we can drop this one in favor of the other.

Thanks

Abhinav
> Ideally drivers are simple. They configure the hardware for what the
> function pointer is asking for. State management and things like that
> should be pushed into the core framework so that we don't have to
> duplicate that multiple times.
> 
>>>
>>> Thanks
>>>
>>> Abhinav
>>>
>>>
>> Ii sound likes that there is a hole either at user space or drm.
>>
>> But that should not cause dp_bridge_disable() at dp driver to crash.
> 
> Agreed.
> 
>>
>> Therefore it is properly to check hdp_state condition at
>> dp_bridge_disable() to prevent it from crashing.
>>
> 
> Disagree. Userspace shouldn't be able to get drm into a wedged state.
