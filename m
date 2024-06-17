Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02AC90B9A3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618310E49B;
	Mon, 17 Jun 2024 18:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="c+Sm1+2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4885210E4A0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 18:28:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HAd4Ei009912;
 Mon, 17 Jun 2024 18:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eMr4D/ENvq9MJGmkMcMlpvZPrYVJGO/q4c+W1NmMLqo=; b=c+Sm1+2qDOivRV06
 n0p/MnuJtQgx/N09yQcNX4fbQbleTHySYosTd3a94olCM/ovvhUadjm+E9qq3JrV
 WixeGjrNiqC1aYYibZvxtksWDCwJQryyKAM5GPKyiflkr3jFKWemW9lrDwINU2ds
 O7LRmTu4pWnz7hXZOmcmal+Nl+XEVcwcqNNrjNanFNCiLtQJYUnIqQqtFGTNNWqn
 voxoPRVXdpg+OBb5vb/EiHb5o+C7fKpLNoxe/ceLdg9XnQITXWYyRPZwfw8MyoU9
 VmVFrSenGHBV3pj0lKzn8UmbGjnELP0wrFxAkC8szmXZHEX4UUJcoptMSSMsXN7C
 LXVtyQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys0nfcsad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2024 18:28:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45HISbDG009335
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2024 18:28:37 GMT
Received: from [10.110.93.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 11:28:37 -0700
Message-ID: <5e17dea9-e430-51f5-83f9-ce02241438f8@quicinc.com>
Date: Mon, 17 Jun 2024 11:28:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Correct sequencing of usage of DRM writeback connector
To: Brian Starkey <brian.starkey@arm.com>, Daniel Vetter <daniel@ffwll.ch>
CC: "Hoosier, Matt" <Matt.Hoosier@garmin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pekka
 Paalanen" <pekka.paalanen@collabora.com>, <nd@arm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
 <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FL2nfMkIO3OVX4kGEVXFP45hJyDMuGF7
X-Proofpoint-ORIG-GUID: FL2nfMkIO3OVX4kGEVXFP45hJyDMuGF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170143
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

Hi

On 6/17/2024 9:54 AM, Brian Starkey wrote:
> Hi,
> 
> On Mon, Jun 17, 2024 at 05:16:36PM +0200, Daniel Vetter wrote:
>> On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:
>>> Hi,
>>>
>>> There is a discussion ongoing over in the compositor world about the implication of this cautionary wording found in the documentation for the DRM_MODE_CONNECTOR_WRITEBACK connectors:
>>>
>>>>   *  "WRITEBACK_OUT_FENCE_PTR":
>>>>   *	Userspace can use this property to provide a pointer for the kernel to
>>>>   *	fill with a sync_file file descriptor, which will signal once the
>>>>   *	writeback is finished. The value should be the address of a 32-bit
>>>>   *	signed integer, cast to a u64.
>>>>   *	Userspace should wait for this fence to signal before making another
>>>>   *	commit affecting any of the same CRTCs, Planes or Connectors.
>>>>   *	**Failure to do so will result in undefined behaviour.**
>>>>   *	For this reason it is strongly recommended that all userspace
>>>>   *	applications making use of writeback connectors *always* retrieve an
>>>>   *	out-fence for the commit and use it appropriately.
>>>>   *	From userspace, this property will always read as zero.
>>>
>>> The question is whether it's realistic to hope that a DRM writeback
>>> connector can produce results on every frame, and do so without dragging
>>> down the frame-rate for the connector.
>>>
>>> The wording in the documentation above suggests that it is very likely
>>> the fence fd won't signal userspace until after the vblank following the
>>> scanout during which the writeback was applied (call that frame N). This
>>> would mean that the compositor driving the connector would typically be
>>> unable to legally queue a page flip for frame N+1.
>>>
>>> Is this the right interpretation? Is the writeback hardware typically
>>> even designed with a streaming use-case in mind? Maybe it's just
>>> intended for occasional static screenshots.
>>
>> So typically writeback hardware needs its separate crtc (at least the
>> examples I know of) and doesn't make a lot of guarantees that it's fast
>> enough for real time use. Since it's a separate crtc it shouldn't hold up
>> the main composition loop, and so this should be all fine.
> 
> On Mali-DP and Komeda at least, you can use writeback on the same CRTC
> that is driving a "real" display, and it should generally work. If the
> writeback doesn't keep up then the HW will signal an error, but it was
> designed to work in-sync with real scanout, on the same pipe.
> 

Same with MSM hardware. You can use writeback with same CRTC that is 
driving a "real" display and yes we call it concurrent writeback. So I 
think it is correct in the documentation to expect to wait till this is 
signaled if the same CRTC is being used.

>>
>> If/when we have hardware and driver support where you can use the
>> writeback connector as a real-time streamout kind of thing, then we need
>> to change all this, because with the current implementation, there's
>> indeed the possibility that funny things can happen if you ignore the
>> notice (funny as in data corruption, not funny as the kernel crashes of
>> course).
> 
> Indeed, the wording was added (from what I remember from so long
> ago...) because it sounded like different HW made very different
> guarantees/non-guarantees about what data would be written when, so
> perhaps you'd end up with some pixels from the next frame in your
> buffer or something.
> 
> Taking Mali-DP/Komeda again, the writeback configuration is latched
> along with everything else, and writeback throughput permitting, it
> should "just work" if you submit a new writeback every frame. It
> drains out the last of the data during vblank, before starting on the
> next frame. That doesn't help the "general case" though.
> 

Would it be fair to summarize it like below:

1) If the same CRTC is shared with the real time display, then the 
hardware is expected to fire this every frame so userspace should wait 
till this is signaled.

2) If a different CRTC is used for the writeback, then the composition 
loop for the real time display should not block on this unless its a 
mirroring use-case, then we will be throttled by the lowest refresh rate 
anyway.

>>
>> If we already have devices where you can use writeback together with real
>> outputs, then I guess that counts as an oopsie :-/
> 
> Well "works fine" fits into the "undefined behaviour" bucket, just as
> well as "corrupts your fb" does :-)
> 
> -Brian
> 
>>
>> Cheers, Sima
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
