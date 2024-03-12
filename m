Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67223879AC0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB3210E238;
	Tue, 12 Mar 2024 17:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mxWqv2o3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B12D10E238;
 Tue, 12 Mar 2024 17:39:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42CGm89f012778; Tue, 12 Mar 2024 17:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=a7qnMApgBR/eHj6sfot4oJkw/Nh/flE5MclON4r0cOk=; b=mx
 Wqv2o3w7B6mN112SxJn55l3i3amgVtjVMveg1aXHIN+5SFaWREGqy2Q2PjuUzIot
 4c+CQToony2BBMP+pYRdO0dD5Xelg3Xj0h4Y1yy44LDYhROSMnqyNyVCzlxGv7Wd
 sLQpRDtrCXD2ZZ4IA/ROLBN/GvbDBBm4okw4cQXiVtWHmW5AuSZTZaVCCA4XC5q8
 m0a4UyzA0q0ajU4IPgsKeNDKzG8FwF6RNJAYSfrrusCxY5Olk24QJhe/g8P6R3+0
 nXkzvqyOXus8vigpNv8hU4hcULq9Btv/Nt1W08Rgg7LqKTY6M5WXSnnOzY+a1JV9
 WcHl9tQeHUSo215fB+Ig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtfwn1nd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 17:39:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42CHdqvU026374
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 17:39:52 GMT
Received: from [10.110.70.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Mar
 2024 10:39:48 -0700
Message-ID: <8e125a99-543d-8328-a2a9-100e223e4faf@quicinc.com>
Date: Tue, 12 Mar 2024 10:39:46 -0700
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZfCKDGq9n9WG3Quj@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2wSykTCw-l23V69a4tWlgiYfn4H8PA7w
X-Proofpoint-GUID: 2wSykTCw-l23V69a4tWlgiYfn4H8PA7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_10,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403120133
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



On 3/12/2024 9:59 AM, Johan Hovold wrote:
> On Tue, Mar 12, 2024 at 05:41:23PM +0100, Johan Hovold wrote:
>> On Tue, Mar 12, 2024 at 11:09:11AM +0100, Johan Hovold wrote:
>>> On Fri, Mar 08, 2024 at 01:45:32PM -0800, Abhinav Kumar wrote:
>>
>>>> @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
>>>>   {
>>>>   	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>>>   
>>>> +	dp->dp_display.link_ready = false;
>>>
>>> As I also pointed out in the other thread, setting link_ready to false
>>> here means that any spurious connect event (during physical disconnect)
>>> will always be processed, something which can currently lead to a leaked
>>> runtime pm reference.
>>>
>>> Wasting some power is of course preferred over crashing the machine, but
>>> please take it into consideration anyway.
>>>
>>> Especially if your intention with this patch was to address the resets
>>> we saw with sc8280xp which are gone since the HPD notify revert (which
>>> fixed the hotplug detect issue that left the bridge in a
>>> half-initialised state).
>>
>> Heh. This is getting ridiculous. I just tried running with this patch
>> and it again breaks hotplug detect in a VT console and in X (where I
>> could enable a reconnected external display by running xrandr twice
>> before).
>>
>> So, please, do not apply this one.
> 
> To make things worse, I indeed also hit the reset when disconnecting
> after such a failed hotplug.
> 
> Johan

Ack, I will hold off till I analyze your issues more which you have 
listed in separate replies. Especially about the spurious connect, I 
believe you are trying to mention that, by adding logs, you are able to 
delay the processing of a connect event to *make* it like a spurious 
one? In case, I got this part wrong, can you pls explain the spurious 
connect scenario again?

A short response on why this change was made is that commit can be 
issued by userspace or the fbdev client. So userspace involvement only 
makes commit happen from a different path. It would be incorrect to 
assume the issues from the earlier bug and the current one are different 
only because there was userspace involvement in that one and not this.

Because in the end, it manifests itself in the same way that 
atomic_enable() did not go through after an atomic_disable() and the 
next atomic_disable() crashes.

Reverting the hpd_notify patch only eliminated some paths but I think 
both you and me agree the issue can still happen and in the very same 
way. So till someone else reports this issue, till HPD is reworked, I 
wanted to do whats possible to avoid this situation. If users are fine 
with what we have, I have no inclination to push this.

