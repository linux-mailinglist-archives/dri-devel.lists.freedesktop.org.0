Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203AC90E18A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 04:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D00810E19E;
	Wed, 19 Jun 2024 02:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Pmd03ZGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C6B10E823
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 02:11:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILa2D2014475;
 Wed, 19 Jun 2024 02:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KeuoxgDDAALmmdSqLWiT617mXh7+XeqPTu6aoDZgU3M=; b=Pmd03ZGtH81W2QSb
 M+Y7jqH/fNFGqgJjAcZv16DbdMoT9C8moxg1kfKy1GPRgWMbLDUqbtim9YI6lhoi
 mkhBy2hX9ujIDCH7/WUOEwIktoAPaQEVkRwgCLUcX0oIT9fasnxFuk1mX/DV+GSG
 NRhXfDiMvZEM1JXRSdmxhQlaxU3dzzzs6ua+NMOh/aqlEUgeCj5l9TmbG6TdefLe
 XdFcTivki12Pg5Rvc9kzGd6EfNhXXeyAhsiVVWy6bXNtZoUltdOLPIJqLRi0FbMZ
 AfGOw9DJ2XWPWys2RuCfevm3mT/M9EVKKzdlrcr15nOLOm81qqX3YuOAoutdB+ax
 /L1sCQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9x0dn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 02:11:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45J2AxpP018934
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 02:10:59 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 19:10:59 -0700
Message-ID: <0ace8b23-6686-65ae-9923-85de6fc806ee@quicinc.com>
Date: Tue, 18 Jun 2024 19:10:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Correct sequencing of usage of DRM writeback connector
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Brian Starkey <brian.starkey@arm.com>, "Hoosier, Matt"
 <Matt.Hoosier@garmin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, <nd@arm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
 <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
 <5e17dea9-e430-51f5-83f9-ce02241438f8@quicinc.com>
 <cnbiivlsrutjbxw7jeetuyrnm3luvepstlwqxxrzsfhyzlgukk@3jx64owwkv2h>
 <ZnFUg91URIHn_SbR@phenom.ffwll.local>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZnFUg91URIHn_SbR@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1a21X5XAmV7PI-EuTwBFGZx1QzaCmGxe
X-Proofpoint-GUID: 1a21X5XAmV7PI-EuTwBFGZx1QzaCmGxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_08,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190016
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



On 6/18/2024 2:33 AM, Daniel Vetter wrote:
> On Mon, Jun 17, 2024 at 10:52:27PM +0300, Dmitry Baryshkov wrote:
>> On Mon, Jun 17, 2024 at 11:28:35AM GMT, Abhinav Kumar wrote:
>>> Hi
>>>
>>> On 6/17/2024 9:54 AM, Brian Starkey wrote:
>>>> Hi,
>>>>
>>>> On Mon, Jun 17, 2024 at 05:16:36PM +0200, Daniel Vetter wrote:
>>>>> On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:
>>>>>> Hi,
>>>>>>
>>>>>> There is a discussion ongoing over in the compositor world about the implication of this cautionary wording found in the documentation for the DRM_MODE_CONNECTOR_WRITEBACK connectors:
>>>>>>
>>>>>>>    *  "WRITEBACK_OUT_FENCE_PTR":
>>>>>>>    *	Userspace can use this property to provide a pointer for the kernel to
>>>>>>>    *	fill with a sync_file file descriptor, which will signal once the
>>>>>>>    *	writeback is finished. The value should be the address of a 32-bit
>>>>>>>    *	signed integer, cast to a u64.
>>>>>>>    *	Userspace should wait for this fence to signal before making another
>>>>>>>    *	commit affecting any of the same CRTCs, Planes or Connectors.
>>>>>>>    *	**Failure to do so will result in undefined behaviour.**
>>>>>>>    *	For this reason it is strongly recommended that all userspace
>>>>>>>    *	applications making use of writeback connectors *always* retrieve an
>>>>>>>    *	out-fence for the commit and use it appropriately.
>>>>>>>    *	From userspace, this property will always read as zero.
>>>>>>
>>>>>> The question is whether it's realistic to hope that a DRM writeback
>>>>>> connector can produce results on every frame, and do so without dragging
>>>>>> down the frame-rate for the connector.
>>>>>>
>>>>>> The wording in the documentation above suggests that it is very likely
>>>>>> the fence fd won't signal userspace until after the vblank following the
>>>>>> scanout during which the writeback was applied (call that frame N). This
>>>>>> would mean that the compositor driving the connector would typically be
>>>>>> unable to legally queue a page flip for frame N+1.
>>>>>>
>>>>>> Is this the right interpretation? Is the writeback hardware typically
>>>>>> even designed with a streaming use-case in mind? Maybe it's just
>>>>>> intended for occasional static screenshots.
>>>>>
>>>>> So typically writeback hardware needs its separate crtc (at least the
>>>>> examples I know of) and doesn't make a lot of guarantees that it's fast
>>>>> enough for real time use. Since it's a separate crtc it shouldn't hold up
>>>>> the main composition loop, and so this should be all fine.
>>>>
>>>> On Mali-DP and Komeda at least, you can use writeback on the same CRTC
>>>> that is driving a "real" display, and it should generally work. If the
>>>> writeback doesn't keep up then the HW will signal an error, but it was
>>>> designed to work in-sync with real scanout, on the same pipe.
>>>>
>>>
>>> Same with MSM hardware. You can use writeback with same CRTC that is driving
>>> a "real" display and yes we call it concurrent writeback. So I think it is
>>> correct in the documentation to expect to wait till this is signaled if the
>>> same CRTC is being used.
> 
> TIL
> 
>>>>> If/when we have hardware and driver support where you can use the
>>>>> writeback connector as a real-time streamout kind of thing, then we need
>>>>> to change all this, because with the current implementation, there's
>>>>> indeed the possibility that funny things can happen if you ignore the
>>>>> notice (funny as in data corruption, not funny as the kernel crashes of
>>>>> course).
>>>>
>>>> Indeed, the wording was added (from what I remember from so long
>>>> ago...) because it sounded like different HW made very different
>>>> guarantees/non-guarantees about what data would be written when, so
>>>> perhaps you'd end up with some pixels from the next frame in your
>>>> buffer or something.
>>>>
>>>> Taking Mali-DP/Komeda again, the writeback configuration is latched
>>>> along with everything else, and writeback throughput permitting, it
>>>> should "just work" if you submit a new writeback every frame. It
>>>> drains out the last of the data during vblank, before starting on the
>>>> next frame. That doesn't help the "general case" though.
>>>>
>>>
>>> Would it be fair to summarize it like below:
>>>
>>> 1) If the same CRTC is shared with the real time display, then the hardware
>>> is expected to fire this every frame so userspace should wait till this is
>>> signaled.
>>
>> As I wrote in response to another email in this thread, IMO existing
>> uAPI doesn't fully allow this. There is no way to enforce 'vblank'
>> handling onto the userspace. So userspace should be able to supply at
>> least two buffers and then after the vblank it should be able to enqueue
>> the next buffer, while the filled buffer is automatically dequeued by
>> the driver and is not used for further image output.
> 

Sorry for the late response. What I meant was, if we are using 
concurrent writeback with the real time display, it should be capable of 
running at the same speed as the real time display. I do not have the 
numbers to share but atleast that's the expectation.

But, yes I do admit that current UAPI does not fully allow having a 
queue depth for WB FBs. And having it will help us.

> Yeah if you want streaming writeback we need a queue depth of at least 2
> in the kms api. Will help a lot on all hardware, but on some it's required
> because the time when the writeback buffer is fully flushed is after the
> point of no return for the next frame (which is when the vblank event is
> supposed to go out).
> 
> I think over the years we've slowly inched forward to make at least the
> drm code safe for a queue depth of 2 in the atomic machinery, but the
> writeback and driver code probably needs a bunch of work.
> -Sima
> 
>>
>>>
>>> 2) If a different CRTC is used for the writeback, then the composition loop
>>> for the real time display should not block on this unless its a mirroring
>>> use-case, then we will be throttled by the lowest refresh rate anyway.
>>
>> what is mirroring in this case? You have specified that a different CRTC
>> is being used.
>>

Definition of mirroring could be thought of in two ways:

1) in clone mode, the WB is running at the same rate as the real time 
display and hence if we are mirroring the content this way there is same 
CRTC.

2) lets say I want to mirror my content using wifi display but the 
end-monitor is running on a different resolution and fps, then I cannot 
use clone mode in this case right because the CRTC which the writeback 
is using will be programmed for a different mode than the real time display.

For the second case, it is still mirroring the content but with a 
different CRTC so will be slowed down by the slowest display otherwise 
the displays will go out of sync. This is what I meant in this use-case.

>>>
>>>>>
>>>>> If we already have devices where you can use writeback together with real
>>>>> outputs, then I guess that counts as an oopsie :-/
>>>>
>>>> Well "works fine" fits into the "undefined behaviour" bucket, just as
>>>> well as "corrupts your fb" does :-)
>>
>>
>> -- 
>> With best wishes
>> Dmitry
> 
