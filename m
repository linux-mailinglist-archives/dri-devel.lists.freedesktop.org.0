Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C389113A7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 22:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6228010E190;
	Thu, 20 Jun 2024 20:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="H7B95zwU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D3210E190;
 Thu, 20 Jun 2024 20:49:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHBuXq007642;
 Thu, 20 Jun 2024 20:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L131EqETndfb/DKl2bJVBeDeWiesLf2ho4x5BMgpd5E=; b=H7B95zwUOPGzyfqV
 Y9bg3pdtZRdUW2CKNUmv/YeX1gj7BNmdDN+66QCTDDz2YNxWojTFAmFmKZvpfYQ+
 Ehh8+9KKc2m9mACKVtdfCz2Mp19Kc4otFzk5oNbyjCVI4aNZHJwrIk1+45p7Fg8A
 3hd+a5YOcb8yd/DEgxb1waWYSPsSE8vSAgeW51VW64d9MVWxRtl8KwU73eaM/daD
 V1MMLve1qjjbiTyqAbzbnsX37YCldM5iD1g8wcXYs0T5YB5skB9iHAvo+siAWVzE
 0G5TKY9B3QBmHgXIrVHLKUXhSehqptUufAt5k1UsD7wZ9/SdraJSGK0J44XWTgJD
 UaF3UA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrm2ghtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2024 20:49:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45KKnfD4021965
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2024 20:49:41 GMT
Received: from [10.110.82.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 13:49:35 -0700
Message-ID: <6d416e1a-1069-8355-e9f3-d2732df081a3@quicinc.com>
Date: Thu, 20 Jun 2024 13:49:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-5-ab384e6021af@linaro.org>
 <f34c4210-fd59-9d27-0987-3345631c9e35@quicinc.com>
 <xymopystyfjj3hpqes3uiw2g3dqynxzvz23snrbfzf2judgxnt@j4nmpcbuy7a4>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <xymopystyfjj3hpqes3uiw2g3dqynxzvz23snrbfzf2judgxnt@j4nmpcbuy7a4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pLEuhf6XKDyruNehC6lYVtmamw6skELe
X-Proofpoint-ORIG-GUID: pLEuhf6XKDyruNehC6lYVtmamw6skELe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406200150
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



On 6/20/2024 1:32 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 20, 2024 at 01:27:15PM GMT, Abhinav Kumar wrote:
>>
>>
>> On 6/7/2024 6:23 AM, Dmitry Baryshkov wrote:
>>> The mode_set callback is deprecated, it doesn't get the
>>> drm_bridge_state, just mode-related argumetns. Turn it into the
>>> atomic_enable callback as suggested by the documentation.
>>>
>>
>> mode_set is deprecated but atomic_mode_set is not.
> 
> There is no atomic_mode_set() in drm_bridge_funcs. Also:
> 

Please excuse me. I thought since encoder has atomic_mode_set(), bridge 
has one too.

> * This is deprecated, do not use!
> * New drivers shall set their mode in the
> * &drm_bridge_funcs.atomic_enable operation.
>

Yes I saw this note but it also says "new drivers" and not really 
enforcing migrating existing ones which are using modeset to atomic_enable.

My concern is that today the timing engine setup happens in encoder's 
enable() and the hdmi's timing is programmed in mode_set().

Ideally, we should program hdmi's timing registers first before the 
encoder's timing.

Although timing engine is not enabled yet, till post_kickoff, this is 
changing the sequence.

If this really required for rest of this series?

>>
>> I would rather use atomic_mode_set because moving to atomic_enable() would
>> be incorrect.
>>
>> That would be called after encoder's enable and hence changes the sequence.
>> That was not the intention of this patch.
>>
>> NAK.
>>
>>> Acked-by: Maxime Ripard <mripard@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 ++++++++++++++++++++++++++-------
>>>    1 file changed, 26 insertions(+), 7 deletions(-)
> 
> 
