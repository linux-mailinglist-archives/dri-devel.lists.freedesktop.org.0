Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4659EFB92
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFED110E657;
	Thu, 12 Dec 2024 18:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="V4GbCNY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B477110E64F;
 Thu, 12 Dec 2024 18:53:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCCVrAA001154;
 Thu, 12 Dec 2024 18:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uwbHsF8yN9WteMxFcuKuZLkIjVBzI8Vo3RrjLt350d8=; b=V4GbCNY0NIX5RbY7
 m3/wrGkWxTK9d7HLU5FiUt6nrSQZRpxmAQLw6lXwDIgIadcMhBFmEZuSoki552Qz
 m6+JZ4Ott88G3gNWTlq/nqC3ccT4J7rN9ljn2jV+hQlXdLfDHB/D4KZXi+9rohLg
 dKfGbmQIEWyL4+LHQTWlk0FSb2+MaxcwYe+5un3tOUSdaH8rOjMxj7uv4MSms/u/
 tq3dqER2DQaIHiASC+ZiE9aexehOoCE9VzV0vdfY9YNKQA9H2WRwRNQj9dm9322C
 GFKJxajqBrZOv0IQWsOCc2tpOaHoNHo/YNfhFZbTVPse9PcD5oOD1gmSAMbiZG2l
 ar/+yg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes2evt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 18:53:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCIr4UB007186
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 18:53:04 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 10:53:02 -0800
Message-ID: <ab2e0099-3970-4bc8-8a33-db53609838bc@quicinc.com>
Date: Thu, 12 Dec 2024 10:52:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/msm/dp: set safe_to_exit_level before
 printing it
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "kernel test robot" <lkp@intel.com>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-1-0b1c65e7dba3@linaro.org>
 <01f84965-8a11-4d6d-99a6-b0e37240d4cb@quicinc.com>
 <iugoc25pnh5zzzr5mamutycqohj2z2255omgh3ztyoqgyjkg23@c7axf3mg5wy5>
 <49d330b8-86fe-40a6-864b-cbb28dc2f555@quicinc.com>
Content-Language: en-US
In-Reply-To: <49d330b8-86fe-40a6-864b-cbb28dc2f555@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZpLZPC6tekxuh-Lg5NvRfz4lGnU3lFLj
X-Proofpoint-ORIG-GUID: ZpLZPC6tekxuh-Lg5NvRfz4lGnU3lFLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120136
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



On 12/12/2024 10:31 AM, Abhinav Kumar wrote:
> 
> 
> On 12/12/2024 12:58 AM, Dmitry Baryshkov wrote:
>> On Wed, Dec 11, 2024 at 05:14:18PM -0800, Abhinav Kumar wrote:
>>>
>>>
>>> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
>>>> Rather than printing random garbage from stack and pretending that 
>>>> it is
>>>> the default safe_to_exit_level, set the variable beforehand.
>>>>
>>>> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port 
>>>> on MSM")
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: 
>>>> https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_audio.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_audio.c
>>>> index 
>>>> 74e01a5dd4195d5e0e04250663886f1116f25711..5cbb11986460d1e4ed1890bdf66d0913e013083c 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>>>> @@ -329,10 +329,10 @@ static void 
>>>> msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
>>>>            safe_to_exit_level = 5;
>>>>            break;
>>>>        default:
>>>> +        safe_to_exit_level = 14;
>>>>            drm_dbg_dp(audio->drm_dev,
>>>>                    "setting the default safe_to_exit_level = %u\n",
>>>>                    safe_to_exit_level);
>>>> -        safe_to_exit_level = 14;
>>>>            break;
>>>>        }
>>>>
>>>
>>> This was already picked up in -fixes, so no need to include
>>
>> I have been rebasing on linux-next. Please make sure that your -fixes
>> branch is a part of linux-next.
>>
> 
> Its merged to msm-fixes not just my fixes branch. I am pretty sure 
> msm-fixes is part of linux-next.


Actually, I noticed just now that msm-fixes is not part of linux-next. 
So pls ignore my comment. drm-fixes is part of linux-next. We should be 
sending out our PR pretty soon. So you will be able to drop this after that.
