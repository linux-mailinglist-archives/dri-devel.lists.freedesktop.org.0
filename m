Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3527FAFDC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 03:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DA110E40E;
	Tue, 28 Nov 2023 02:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D453310E40E;
 Tue, 28 Nov 2023 02:05:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AS0uuIR028511; Tue, 28 Nov 2023 02:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SVeXcK+Nv4n4xxLY2e9Af6K/gI+CEi7+y1nYoGbbgUg=;
 b=GCpOggXsufpb5fekZhHet+LBWtPTOWNzZOtBLpAX8pUxriuLTb71Xtr6o8Qd5RVmzfWz
 3Gj5P451ZL+RD82fhEu7+NrCmdTAFvHCH7hGnq3ByIS35Fx4bTB2ox7Kbchhw052XNnH
 rfkFCZ19fW4krCG0M+ExTWCun/DZlQ3ugWYJ8t3yaHlJ4xeZOEKwnYqnHOxCuvidd2Dx
 OwvyMCwU3KGHhzegCv+B5/rpH9D8QCj310ztH5Oc5TD+/cu+DG638RGA9BBxMImk9zuk
 whXxZP7wfmnDcpOQnh8MRWA9v3wHqCLCIZUb+MoWIFQf+P0JiMP6G+zIlmKiYO4+64DK Xg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umwn5scyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 02:05:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS25kOL002397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 02:05:46 GMT
Received: from [10.110.19.196] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 18:05:46 -0800
Message-ID: <3b2ec0ce-a931-9eee-6d6e-261990800524@quicinc.com>
Date: Mon, 27 Nov 2023 18:05:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/mdp4: flush vblank event on disable
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
 <60dc2b72-188f-7b6e-4e14-b90f10997a44@quicinc.com>
 <CAA8EJpoKOPVLC9n_2MC2Es7XssEs5G5O4ESJ_-krA8aGG_fb0Q@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoKOPVLC9n_2MC2Es7XssEs5G5O4ESJ_-krA8aGG_fb0Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WXR1tRmyPf8IXtfkBzenYds3dYkkBkn5
X-Proofpoint-GUID: WXR1tRmyPf8IXtfkBzenYds3dYkkBkn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_01,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=971 mlxscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280015
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/27/2023 3:17 PM, Dmitry Baryshkov wrote:
> On Tue, 28 Nov 2023 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 11/27/2023 1:54 PM, Dmitry Baryshkov wrote:
>>> Flush queued events when disabling the crtc. This avoids timeouts when
>>> we come back and wait for dependencies (like the previous frame's
>>> flip_done).
>>>
>>> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
>>> index 169f9de4a12a..3100957225a7 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
>>> @@ -269,6 +269,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
>>>    {
>>>        struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
>>>        struct mdp4_kms *mdp4_kms = get_kms(crtc);
>>> +     unsigned long flags;
>>>
>>>        DBG("%s", mdp4_crtc->name);
>>>
>>> @@ -281,6 +282,14 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
>>>        mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
>>>        mdp4_disable(mdp4_kms);
>>>
>>> +     if (crtc->state->event && !crtc->state->active) {
>>> +             WARN_ON(mdp4_crtc->event);
>>
>> Do you need a WARN_ON() here? Just wondering how often this might happen
>> and spam.
> 
> Well, it is atomic_disable(), so it happens only on modesets or output
> disable. Also, this is a port of mdp5 code, see commit e765ea77b0fd
> ("drm/msm: Issue queued events when disabling crtc"). We don't have
> reports from MDP5 code, so there should be no comparable reports for
> MDP4.
> 

Ok, I thought this was ported from dpu code, even that has the same 
logic but not the WARN_ON().

But I am fine with this,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


>> otherwise LGTM.
>>
>>> +             spin_lock_irqsave(&mdp4_kms->dev->event_lock, flags);
>>> +             drm_crtc_send_vblank_event(crtc, crtc->state->event);
>>> +             crtc->state->event = NULL;
>>> +             spin_unlock_irqrestore(&mdp4_kms->dev->event_lock, flags);
>>> +     }
>>> +
>>>        mdp4_crtc->enabled = false;
>>>    }
>>>
> 
> 
> 
