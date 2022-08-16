Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E759604A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 18:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7FCA92F6;
	Tue, 16 Aug 2022 16:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F585A90C4;
 Tue, 16 Aug 2022 16:31:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GGIRGD020603;
 Tue, 16 Aug 2022 16:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+JVztAJrFmffVkcN5cBnFPtMt3xVZVog5t/baqeuFaE=;
 b=ZRKRhj6WbFlB6BFz/rg5/agOADzOJb3rJTF+Na4PKSrcAL9AywOqmE29+1TzVYijOvOs
 fG7XUH1Lmmv4xcl5L+yjkNhJNynM6IE+zqlkEoUMlWBTP7LK/L9N+xHy2cWJ+INJiDy3
 UIvylx06AvnHJFimoArP6vLvTOEo1eNZDmPVqoBwDiV8HaUfye+nNvz/2ep5YuDlgwIq
 9tCrl6bq5XDdRcCa1SecIMwjJuKe6I53nNE6bk+W7hErApCZxZqzvWG/jSa2rciYQF2+
 IqnwRMhOpeN3ZbKXsEILTgyi078MO4FtciEZQLQgacukNYv3XSBcPYeiL/mRxvcEHkeC rQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j08un1bhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 16:31:42 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27GGVfS0020453
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 16:31:41 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 09:31:41 -0700
Received: from [10.110.125.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 16 Aug
 2022 09:31:39 -0700
Message-ID: <f6493f87-479a-7755-914d-5bb7d1560ee3@quicinc.com>
Date: Tue, 16 Aug 2022 09:31:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] drm/msm/dp: check hpd_state before push idle pattern
 at dp_bridge_disable()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, <agross@kernel.org>,
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
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n50QXiJs=k78Tmd7om28MgWChypwC8LPRzF2jx_qB5+0FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Hg0hR1wVYjLHqsYyJBSGS-lYas6GHNIA
X-Proofpoint-GUID: Hg0hR1wVYjLHqsYyJBSGS-lYas6GHNIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160062
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


On 8/15/2022 10:08 AM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-08-11 08:20:01)
>> On 8/10/2022 6:00 PM, Abhinav Kumar wrote:
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
> That seems bad, no? We don't want userspace to be able to crash and then
> be able to call the disable path when enable never succeeded.
>
>>>  From the issue mentioned in
>>> https://gitlab.freedesktop.org/drm/msm/-/issues/17, the reporter did
>>> mention the usermode crashed.
>>>
>>> So this is my tentative analysis of whats happening here.
>>>
>>> Ideally yes, we should have been protected by the location mentioned
>>> above in disable_outputs() but looks to me due to the above hypothesis
>>> its getting bypassed.
> Can you fix the problem there? Not fixing it means that every driver out
> there has to develop the same "fix", when it could be fixed in the core
> one time.

The reporter is running GNOME Display Manager (gdm3) instead of chrome.

We can not duplicate this problem locally. Hence we can not confirm this 
is the root cause of this bug or not.

Do you know who is more proper to investigate more into this?

> Ideally drivers are simple. They configure the hardware for what the
> function pointer is asking for. State management and things like that
> should be pushed into the core framework so that we don't have to
> duplicate that multiple times.
>
>>> Thanks
>>>
>>> Abhinav
>>>
>>>
>> Ii sound likes that there is a hole either at user space or drm.
>>
>> But that should not cause dp_bridge_disable() at dp driver to crash.
> Agreed.
>
>> Therefore it is properly to check hdp_state condition at
>> dp_bridge_disable() to prevent it from crashing.
>>
> Disagree. Userspace shouldn't be able to get drm into a wedged state.

not sure for this.

I agree if this is simple driver such as i2c which does not need to 
maintain any states during operation.

but mdp/dp is far more complexity. we really do not want to have any 
crash happen at mdp/dp in the filed.

would you please reconsider our point to add this hdp_state checking 
here to prevent any crash happen.

