Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A1497230E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 22:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E271310E676;
	Mon,  9 Sep 2024 19:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iuS79stn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1064110E676;
 Mon,  9 Sep 2024 19:59:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489DRtFk013606;
 Mon, 9 Sep 2024 19:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J72WK2RGCwvG9VPFYBPuwiDSYDaAZDqHxKz7l3oggHc=; b=iuS79stn5b0ZUKo/
 e68naM2k0+HLQQk72bfrnMdtZFz9m86vZN70DPen5khiviClmJ+fykH3CAHgWEuQ
 jriK2shU8aIrjqd463SuvSjZu1vy76cpPfDtB0hDfVgh+HY8VrjVPBgARRi5Lz0K
 wTx+tuOWVlJvchW742CXZjoV0lXxvpVzhrWklSHCWdAx5QdAIKuYhvpGdOI5UVeE
 ZP36gJBWKHPXZ3OeUn7G184vXu1iAgB0MQakL1S9pC2N44/rHm9NLaqFFFIKu35F
 7j42mq2NDkbk/2OyWedIlje7syDh0oJGVgHtDP2LlOvK5lCcfz/CpxuqSeV+k1oY
 dCSaFA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6skx4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Sep 2024 19:59:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489JxmCh001320
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Sep 2024 19:59:48 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 12:59:48 -0700
Message-ID: <33f29f1c-157a-424e-89c6-c1549a2d6403@quicinc.com>
Date: Mon, 9 Sep 2024 12:59:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: allow encoder mode_set even when connectors
 change for crtc
To: Maxime Ripard <mripard@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <robdclark@gmail.com>, <dmitry.baryshkov@linaro.org>,
 <quic_jesszhan@quicinc.com>, <linux-kernel@vger.kernel.org>
References: <20240905221124.2587271-1-quic_abhinavk@quicinc.com>
 <20240909-neat-stoic-hamster-cbbe42@houat>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240909-neat-stoic-hamster-cbbe42@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4z2wR5P7p1xx7a__05Xp-CkQo0SrqxiQ
X-Proofpoint-ORIG-GUID: 4z2wR5P7p1xx7a__05Xp-CkQo0SrqxiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090157
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

Hi Maxime

On 9/9/2024 6:37 AM, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Sep 05, 2024 at 03:11:24PM GMT, Abhinav Kumar wrote:
>> In certain use-cases, a CRTC could switch between two encoders
>> and because the mode being programmed on the CRTC remains
>> the same during this switch, the CRTC's mode_changed remains false.
>> In such cases, the encoder's mode_set also gets skipped.
>>
>> Skipping mode_set on the encoder for such cases could cause an issue
>> because even though the same CRTC mode was being used, the encoder
>> type could have changed like the CRTC could have switched from a
>> real time encoder to a writeback encoder OR vice-versa.
>>
>> Allow encoder's mode_set to happen even when connectors changed on a
>> CRTC and not just when the mode changed.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The patch and rationale looks sane to me, but we should really add kunit
> tests for that scenarii.
> 

Thanks for the review.

We have a IGT for recreating this scenario and thats how this issue was 
captured

kms_writeback --run-subtest writeback-check-output -c <primary display mode>

We had added an option ( 'c' - custom mode) a couple of yrs ago to allow 
writeback to be tested using any mode the user passes in 
(https://lore.kernel.org/r/all/YuJhGkkxah9U6FGx@platvala-desk.ger.corp.intel.com/T/)

If we pass in the same resolution as the primary RT display, this 
scenario always happens as the CRTC switches between RT encoder and WB 
encoder. Hope that addresses some of the concern.

Regarding KUnit tests, I have a couple of questions:

1) This is more of a run-time scenario where CRTC switch happens, does 
this qualify for a KUnit or perhaps I am missing something.

2) Is there any existing KUnit test file under drm/tests for validating 
drm_atomic_helper_commit_modeset_disables() / 
drm_atomic_helper_commit_modeset_enables() path because this will fall 
under that bucket. I didnt find any matching case where we can extend this.

Thanks

Abhinav

> Maxime
