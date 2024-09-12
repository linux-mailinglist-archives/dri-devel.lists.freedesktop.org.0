Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F3975E3A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 02:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F050210E8CE;
	Thu, 12 Sep 2024 00:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="O2wKfq8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300E410E8CE;
 Thu, 12 Sep 2024 00:54:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BEm6SZ018059;
 Thu, 12 Sep 2024 00:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8Ih1bUx3KcsBMZWUmWZgzv2wwRZZ6EQj/FyuNOvDE+E=; b=O2wKfq8+0q7/rbQG
 b64dRW0StvhGBY2eM3hqBo4KKqBcpe4wb/XUIcgx45sWRpA70jdQLbQvUnre1I6A
 ib7Y5MT8OszYe2fqz2RIQ5reV5M4RJEdpo6x6EQFnhCmgLLTmga1v2kf1dceD9Xd
 acFi/wGX/wQBtNzifqx5MwbGmBgn2d2YDiMrqZhhm5PL9ZiBrMP4dAMmJ7Vi57AS
 DmEk0x6vSElejTCghvtJOPQyRoVU8g8S0O4+fN0woN33zAnpnkhzIMBD/PaBTaOs
 UQk5IHeG1QyDE3dRXZYMci95+5e4r6QaYMX2dsdjB5U11TtZKVU165AEFcIls+BQ
 l38Fqw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6pbctu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 00:54:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C0slx9010230
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 00:54:47 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Sep
 2024 17:54:45 -0700
Message-ID: <34dad274-a048-4a1f-8acb-894d264ebe80@quicinc.com>
Date: Wed, 11 Sep 2024 17:54:44 -0700
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
 <33f29f1c-157a-424e-89c6-c1549a2d6403@quicinc.com>
 <20240910-liberal-platinum-scorpion-d43cff@houat>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240910-liberal-platinum-scorpion-d43cff@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: rp1R-rxA_sJcONcGVzujrn9-7xijuvPu
X-Proofpoint-GUID: rp1R-rxA_sJcONcGVzujrn9-7xijuvPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120005
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

On 9/10/2024 1:40 AM, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Sep 09, 2024 at 12:59:47PM GMT, Abhinav Kumar wrote:
>> On 9/9/2024 6:37 AM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Thu, Sep 05, 2024 at 03:11:24PM GMT, Abhinav Kumar wrote:
>>>> In certain use-cases, a CRTC could switch between two encoders
>>>> and because the mode being programmed on the CRTC remains
>>>> the same during this switch, the CRTC's mode_changed remains false.
>>>> In such cases, the encoder's mode_set also gets skipped.
>>>>
>>>> Skipping mode_set on the encoder for such cases could cause an issue
>>>> because even though the same CRTC mode was being used, the encoder
>>>> type could have changed like the CRTC could have switched from a
>>>> real time encoder to a writeback encoder OR vice-versa.
>>>>
>>>> Allow encoder's mode_set to happen even when connectors changed on a
>>>> CRTC and not just when the mode changed.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> The patch and rationale looks sane to me, but we should really add kunit
>>> tests for that scenarii.
>>>
>>
>> Thanks for the review.
>>
>> We have a IGT for recreating this scenario and thats how this issue was
>> captured
>>
>> kms_writeback --run-subtest writeback-check-output -c <primary display mode>
>>
>> We had added an option ( 'c' - custom mode) a couple of yrs ago to allow
>> writeback to be tested using any mode the user passes in (https://lore.kernel.org/r/all/YuJhGkkxah9U6FGx@platvala-desk.ger.corp.intel.com/T/)
>>
>> If we pass in the same resolution as the primary RT display, this scenario
>> always happens as the CRTC switches between RT encoder and WB encoder. Hope
>> that addresses some of the concern.
> 
> Unless it can easily be run in some sort of CI loop by anyone
> contributing to that part of the kernel, it doesn't.
> 
> Don't get me wrong, it's a great feature, but it doesn't help making
> sure that issue never creeps back in.
> 

Ack, I understand.

>> Regarding KUnit tests, I have a couple of questions:
>>
>> 1) This is more of a run-time scenario where CRTC switch happens, does this
>> qualify for a KUnit or perhaps I am missing something.
> 
> We've been using kunit to perform integration tests in the kernel too,
> so I would say that it definitely qualifies.
> 
>> 2) Is there any existing KUnit test file under drm/tests for validating
>> drm_atomic_helper_commit_modeset_disables() /
>> drm_atomic_helper_commit_modeset_enables() path because this will fall under
>> that bucket. I didnt find any matching case where we can extend this.
> 
> We don't have that at the moment, but we shouldn't be too far off. The
> HDMI framework I contributed some months ago for example has all the
> mode checking infrastructure in kunit. So you already have some way to
> create a driver, a new state, modify that state and check it.
> 
> The only thing missing in your case is being able to commit it and check
> that it has run, which shouldn't be too hard
> 
> Maxime

Alright. Yes I reviewed the hdmi infrastructure tests and you seem to 
have most of the pieces. I just need to find some cycles to work on this 
:) so you can have my name down for it and either me one of our team 
members or perhaps with some help from other msm developers we can get 
it added.

The reason I was hoping to get this reviewed and added as a "fix" was we 
had already run into this scenario with kms_writeback test case and the 
same scenario was seen in another msm bug 
https://gitlab.freedesktop.org/drm/msm/-/issues/59 leading to a null ptr 
crash but we ended up fixing that within msm because that was a better 
fix anyway so I was thinking this change would help to resolve these 
types of issues for us once for all.

But if this needs to wait for the KUnit to be added, thats fine, we will 
resend this one along with the KUnit once we work on it.

