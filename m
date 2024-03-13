Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA887AD08
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7A010F3BB;
	Wed, 13 Mar 2024 17:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HIFH71lf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC6A10F2C3;
 Wed, 13 Mar 2024 17:24:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42D7kCjq031221; Wed, 13 Mar 2024 17:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=HsXYLo4vxmd7FYkONEKhNYJ7yL8L99rg/zJTykm0JYo=; b=HI
 FH71lftMUPi/6Qh8LVdfNe6y4JITb8nbq0sFS8Q05ayyHUdV8V9sC0F6OteeOyqZ
 qa5GkpnlNC5+JarcwCv1i8qPmMHd5r9sPumVYNTRu4gmbj30Z9TCPxMHkDn7CMRd
 Y5ULDX6CJfqg5JBvjp1yXLcMwSUWXpQyc26eUPO1vKjoETrIBo1Bkx+aUx043Nix
 E10+lIQsqaVK8D8yRqAZK6v981kz22SAAx3yL/ISvgKg8x8vfcWVYT9H/1HFrPVI
 AL+7EBAp+Y2oqXFt5UHFgbG+Iu7bNCm4oyB8fw7qO9isb22vG/UQFhx7EqwnzZp8
 4mL7ZRIP/20fM1pPB5Sw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wu81m1871-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 17:24:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42DHOFml013855
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 17:24:15 GMT
Received: from [10.110.70.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 10:24:10 -0700
Message-ID: <ec2cba17-5644-6cf6-f6c9-d37d7ca56204@quicinc.com>
Date: Wed, 13 Mar 2024 10:24:08 -0700
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZfFhXG5yd6O29spS@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: k_KsKkFVR1NcTEJbp5-f7QVlS1rPpC3D
X-Proofpoint-GUID: k_KsKkFVR1NcTEJbp5-f7QVlS1rPpC3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_09,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130132
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



On 3/13/2024 1:18 AM, Johan Hovold wrote:
> On Tue, Mar 12, 2024 at 10:39:46AM -0700, Abhinav Kumar wrote:
>> On 3/12/2024 9:59 AM, Johan Hovold wrote:
> 
>>>> Heh. This is getting ridiculous. I just tried running with this patch
>>>> and it again breaks hotplug detect in a VT console and in X (where I
>>>> could enable a reconnected external display by running xrandr twice
>>>> before).
>>>>
>>>> So, please, do not apply this one.
>>>
>>> To make things worse, I indeed also hit the reset when disconnecting
>>> after such a failed hotplug.
> 
>> Ack, I will hold off till I analyze your issues more which you have
>> listed in separate replies. Especially about the spurious connect, I
>> believe you are trying to mention that, by adding logs, you are able to
>> delay the processing of a connect event to *make* it like a spurious
>> one? In case, I got this part wrong, can you pls explain the spurious
>> connect scenario again?
> 
> No, I only mentioned the debug printks in passing as instrumentation
> like that may affect race conditions (but I'm also hitting the resets
> also with no printks in place).
> 
> The spurious connect event comes directly from the pmic firmware, and
> even if we may optimise things by implementing some kind of debounce,
> the hotplug implementation needs to be robust enough to not kill the
> machine if such an event gets through.
> 
> Basically what I see is that during physical disconnect there can be
> multiple hpd notify events (e.g. connect, disconnect, connect):
> 
> [  146.910195] usb 5-1: USB disconnect, device number 4
> [  146.931026] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 1, status = 2
> [  146.934785] msm-dp-display ae98000.displayport-controller: dp_hpd_unplug_handle
> [  146.938114] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 1, status = 1
> [  146.940245] [CONNECTOR:35:DP-2] status updated from disconnected to connected
> [  146.955193] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 0, status = 2
> 
> And it is the spurious connect event while the link is being tore down
> that triggers the hotplug processing that leads to the reset.
> 
> Similarly, I've seen spurious disconnect events while the plug in being
> inserted.
> 

This is quite weird and also explains why most of the issues were seen 
only with sc8280xp. pmic spurious events are busting the hpd logic.

Agreed, that DP driver should be robust enough to handle this but this 
will also bust usermode to send down unnecessary frames. Someone should 
address why these spurious events are coming.

>> A short response on why this change was made is that commit can be
>> issued by userspace or the fbdev client. So userspace involvement only
>> makes commit happen from a different path. It would be incorrect to
>> assume the issues from the earlier bug and the current one are different
>> only because there was userspace involvement in that one and not this.
>>
>> Because in the end, it manifests itself in the same way that
>> atomic_enable() did not go through after an atomic_disable() and the
>> next atomic_disable() crashes.
> 
> Right, but your proposed fix would not actually fix anything and judging
> from the sparse commit message and diff itself it is clearly only meant
> to mitigate the case where user space is involved, which is *not* the
> case here.
> 

No, I think there is some disconnect in the way you are reading that 
patch perhaps due to some missing details OR I am missing your point.

Like I said, drm_atomic_commit() can be issued by userspace or the fbdev 
client in the driver. Thats the only userspace involvement.

Now, why the patch was made or was expected to work.

There can be a race condition between the time the DP driver gets the 
hpd disconnect event and when the hpd thread processes that event 
allowing the commit to sneak in. This is something which has always been 
there even without pm_runtime series and remains even today.

In this race condition, the setting of "link_ready" to false can be a 
bit delayed if we go through the HPD event processing increasing the 
race condition window.

If link_ready is false, atomic_check() fails, thereby failing any 
commits and hence not allowing the atomic_disable() / atomic_enable() 
cycle and hence avoiding this reset.

The patch is moving the setting of link_ready to false earlier by not 
putting it through the HPD event thread and hence trying to reduce the 
window of the issue.

> Johan
