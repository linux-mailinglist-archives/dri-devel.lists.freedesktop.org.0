Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E487389CD8A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 23:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A88E10F3B4;
	Mon,  8 Apr 2024 21:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nEgWtIEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7BF10EE2E;
 Mon,  8 Apr 2024 21:23:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 438KhqgH008534; Mon, 8 Apr 2024 21:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=W8p0/s1UgB3N8CYG7Fp+xe/u8df/dP5sgIH3czhokHc=; b=nE
 gWtIEPH2RTi0H5RcaLb38CvFJSxe4hGp9vDcFSl3hW6ybKbh903OyyILClpIHlO0
 XdLyvJsLiRsVZy0q+J/FSw1guP0i89mugyIOQnCgPq/zep7s20aPKjlB/dXRXcY3
 Zc2Q2rT1iBhAxZUsxhoKdi1B1NsY1rQ2lyPikduUCSZBuLg8gzHhlY6Lk6gj+6Pk
 qPh+Kkdo6wfCTPAKYm7LenIc9VKXbP0FUYz8jVvKsGkFWDgk9RSFjvwTf1QSueq2
 No1Dlg4aY6liyWhNZ1a5Z1IZOTOG0njRKEQHvS0peY2mAPlz4QAf2jsQTYCSUlwX
 oU/kabNcXkZmu9Fw7dyw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbg01vnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2024 21:23:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438LNZLX031220
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 8 Apr 2024 21:23:35 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 14:23:33 -0700
Message-ID: <905222ad-612a-3eaf-d966-23c89c99e1f0@quicinc.com>
Date: Mon, 8 Apr 2024 14:23:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, <freedreno@lists.freedesktop.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
 <swboyd@chromium.org>, <quic_jesszhan@quicinc.com>,
 <quic_bjorande@quicinc.com>, <johan@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
 <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
 <01cb1c0d-a801-37f9-2f55-2bbd8d3a68b9@quicinc.com>
 <CAA8EJprzH0LiWNx9Udt6og3G063odY6ccvaAgsNS1r3zG8TmdA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprzH0LiWNx9Udt6og3G063odY6ccvaAgsNS1r3zG8TmdA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pU5XtUu0P-MOXzfD0nHXKiswY9p_So5N
X-Proofpoint-ORIG-GUID: pU5XtUu0P-MOXzfD0nHXKiswY9p_So5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_17,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080163
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



On 4/8/2024 2:12 PM, Dmitry Baryshkov wrote:
> On Mon, 8 Apr 2024 at 22:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 4/7/2024 11:48 AM, Bjorn Andersson wrote:
>>> On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
>>>> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> [..]
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index d80f89581760..bfb6dfff27e8 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -1665,7 +1665,7 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>>>               return;
>>>>
>>>>       if (!dp_display->link_ready && status == connector_status_connected)
>>>> -            dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>>>> +            dp_hpd_plug_handle(dp, 0);
>>>
>>> If I read the code correctly, and we get an external connect event
>>> inbetween a previous disconnect and the related disable call, this
>>> should result in a PLUG_INT being injected into the queue still.
>>>
>>> Will that not cause the same problem?
>>>
>>> Regards,
>>> Bjorn
>>>
>>
>> Yes, your observation is correct and I had asked the same question to
>> kuogee before taking over this change and posting.
> 
> Should it then have the Co-developed-by trailers?
> 

hmmm, perhaps but that didnt result in any code change between v2 and 
v3, so I didnt add it.

>> We will have to handle that case separately. I don't have a good
>> solution yet for it without requiring further rework or we drop the
>> below snippet.
>>
>>           if (state == ST_DISCONNECT_PENDING) {
>>                   /* wait until ST_DISCONNECTED */
>>                   dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
>>                   mutex_unlock(&dp->event_mutex);
>>                   return 0;
>>           }
>>
>> I will need sometime to address that use-case as I need to see if we can
>> handle that better and then drop the the DISCONNECT_PENDING state to
>> address this fully. But it needs more testing.
>>
>> But, we will need this patch anyway because without this we will not be
>> able to fix even the most regular and commonly seen case of basic
>> connect/disconnect receiving complementary events.
> 
> Hmm, no. We need to drop the HPD state machine, not to patch it. Once
> the driver has proper detect() callback, there will be no
> complementary events. That is a proper way to fix the code, not these
> kinds of band-aids patches.
> 

I had discussed this part too :)

I totally agree we should fix .detect()'s behavior to just match cable 
connect/disconnect and not link_ready status.

But that alone would not have fixed this issue. If HPD thread does not 
get scheduled and plug_handle() was not executed, .detect() would have 
still returned old status as we will update the cable status only in 
plug_handle() / unplug_handle() to have a common API between internal 
and external hpd execution.

So we need to do both, make .detect() return correct status AND drop hpd 
event thread processing.

But, dropping the hpd event thread processing alone was fixing the 
complimentary events issue. So kuogee had only this part in this patch.


>>>>       else if (dp_display->link_ready && status == connector_status_disconnected)
>>>> -            dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>>>> +            dp_hpd_unplug_handle(dp, 0);
>>>>    }
>>>> --
>>>> 2.43.2
>>>>
> 
> 
> 
