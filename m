Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D3C87C145
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 17:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9940410FBFA;
	Thu, 14 Mar 2024 16:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cwxIgnhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D798610FBFA;
 Thu, 14 Mar 2024 16:31:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42EGHJkj013712; Thu, 14 Mar 2024 16:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=yPYdJbLgCFGA2QMZNool66yl52Em7MqMSkzRA3w9sEc=; b=cw
 xIgnhXkNsKVEXoFseQKl7kpWswMMKEe7KvxmCYz/PHOYcgsmM6jIcRCcCQYVkFFU
 MTnyTK8DbGnZtx5yPBFM9ESQO04pi3kx37JbuVi6uZs1488WYplwWDrvgYNueqcu
 SAaApfWoauGeNvC87K61lGHzV1kyMJzqTVE8/gE9+7gKKsZmuxWQsET4uBBoqYXD
 WZOMbMLnI81E49/5GMgo0Y58iE3AX5mJQi5VXTKWDMFfBLg4v1S1rwqwHhoYisBH
 J8Ev4BJaDEcfzvd2XPuVZxDQdbgGM8ZQIf5awjc/hYBCndUjApLU3u0kUfusrLFD
 LepBi2TT86XRQ3OSa4Kw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuwtm91bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Mar 2024 16:31:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EGV3sI023227
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Mar 2024 16:31:03 GMT
Received: from [10.110.35.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 09:30:59 -0700
Message-ID: <9313aa00-41f0-15af-a646-3f4e4b3098c7@quicinc.com>
Date: Thu, 14 Mar 2024 09:30:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dp: move link_ready out of HPD event thread
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Sean Paul
 <sean@poorly.run>, "Marijn Suijten" <marijn.suijten@somainline.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_parellan@quicinc.com>,
 <quic_bjorande@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
 <ZfApxyVAJMK4bL8O@hovoldconsulting.com>
 <ZfCFsmNv62-KMkA6@hovoldconsulting.com>
 <ZfCKDGq9n9WG3Quj@hovoldconsulting.com>
 <8e125a99-543d-8328-a2a9-100e223e4faf@quicinc.com>
 <ZfFhXG5yd6O29spS@hovoldconsulting.com>
 <ec2cba17-5644-6cf6-f6c9-d37d7ca56204@quicinc.com>
 <ZfMaEIzv3Z3ny3y0@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZfMaEIzv3Z3ny3y0@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5oI3SQZcCosyUifU_jsvnfXEt116Ck3H
X-Proofpoint-GUID: 5oI3SQZcCosyUifU_jsvnfXEt116Ck3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 adultscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140124
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



On 3/14/2024 8:38 AM, Johan Hovold wrote:
> On Wed, Mar 13, 2024 at 10:24:08AM -0700, Abhinav Kumar wrote:
>> On 3/13/2024 1:18 AM, Johan Hovold wrote:
> 
>>> Right, but your proposed fix would not actually fix anything and judging
>>> from the sparse commit message and diff itself it is clearly only meant
>>> to mitigate the case where user space is involved, which is *not* the
>>> case here.
> 
>> There can be a race condition between the time the DP driver gets the
>> hpd disconnect event and when the hpd thread processes that event
>> allowing the commit to sneak in. This is something which has always been
>> there even without pm_runtime series and remains even today.
>>
>> In this race condition, the setting of "link_ready" to false can be a
>> bit delayed if we go through the HPD event processing increasing the
>> race condition window.
>>
>> If link_ready is false, atomic_check() fails, thereby failing any
>> commits and hence not allowing the atomic_disable() / atomic_enable()
>> cycle and hence avoiding this reset.
>>
>> The patch is moving the setting of link_ready to false earlier by not
>> putting it through the HPD event thread and hence trying to reduce the
>> window of the issue.
> 
> Perhaps I'm missing something in the race that you are trying to
> describe (and which I've asked you to describe in more detail so that I
> don't have to spend more time trying to come up with a reproducer
> myself).
> 

The race condition is between the time we get disconnect event and set 
link_ready to false, a commit can come in. Because setting link_ready to 
false happens in the event thread so it could be slightly delayed.

It will be hard to reproduce this. Only way I can think of is to delay 
the EV_NOTIFICATION for sometime and see in dp_bridge_hpd_notify()

         else if (dp_display->link_ready && status == 
connector_status_disconnected)
                 dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);

as dp_add_event() will add the event, then wakeup the event_q.

Before the event thread wakes up and processes this unplug event, the 
commit can come in. This is the race condition i was thinking of.

> I do understand how your patch works, but my point is that it does
> not fix the race that we are hitting on sc8280xp and, unless I'm missing
> something, it is not even sufficient to fix the race you are talking
> about as user space can still trigger that ioctl() before you clear the
> link_ready flag.
> 
> That's why I said that it is only papering over the issue by making the
> race window smaller (and this should also be highlighted in the commit
> message).
> 

Yes, I have already accepted this part. It only reduces the race window 
smaller.

> For some reason it also made things worse on sc8280xp, but I did not
> spend time on tracking down exactly why.
> 

This part I agree. I need to check why sc8280xp again does not like this 
patch. You dont have to spend time, I will do it and till then I will 
hold this patch off.

> Johan
