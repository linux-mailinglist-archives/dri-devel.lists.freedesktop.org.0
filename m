Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C09D9018
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 02:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAA110E3E0;
	Tue, 26 Nov 2024 01:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aKRynTBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EBB10E3DD;
 Tue, 26 Nov 2024 01:41:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APEAii4000996;
 Tue, 26 Nov 2024 01:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xC8LsOhOKhtFlMr6+pMsh3+JxF3b8PDqZdseL10V6ZQ=; b=aKRynTBfoT6iH0sM
 v5hNSualczhiSzOepHrWJ7jwL4gkAAnlodb3Tg+S31ukec611nTXGF2KsgfFVIAG
 A9UGiVToooRuPbCnGtvsDiD32rpwFictuDxyyDETX4ZMGMVXCftxrZVNQgn2tUJK
 XB3lIaKq/6hlAdFh6IaOEOMaK6iBIM9ZcybUeYAxYDB+zjmu7kH2xrGu5mXAN2ZB
 XtvWNmEb4QCh/OTtT+t1kKyFC8zawUfusOuEH8RqNhjGOzAeWHSLrxcFgZBDsNrn
 3s6EWsyROxUThOnI8GyS4Z0OyUFvZIQ587c+pS0XXf5qjfvfsm3UgPnzOWqqejnm
 nAJ4Ug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434ts1hdv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2024 01:41:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ1fgLO030259
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2024 01:41:42 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 17:41:35 -0800
Message-ID: <4799eab5-2238-41d4-bb55-9dd63080e604@quicinc.com>
Date: Tue, 26 Nov 2024 09:41:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] drm/msm/dsi: Add support for SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Li Liu
 <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-7-35252e3a51fe@quicinc.com>
 <mcvhfkh3ycrx2ganumsxlc7lx53ed55yk4syh5qev3jqqgkeqj@h5vnfpgjwtj5>
 <bfc87132-a63e-4f3f-99b7-1a1bd7eb60ce@quicinc.com>
 <CAA8EJpoYwGHenThgxaKcapjTng3BchpbVBfzXqBvTDGBzv2J-w@mail.gmail.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <CAA8EJpoYwGHenThgxaKcapjTng3BchpbVBfzXqBvTDGBzv2J-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CzQG4YMlEQ62zgJOgVX6sVpjEHlUdVWt
X-Proofpoint-ORIG-GUID: CzQG4YMlEQ62zgJOgVX6sVpjEHlUdVWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260013
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



On 2024/11/26 6:11, Dmitry Baryshkov wrote:
> On Mon, 25 Nov 2024 at 04:31, fange zhang <quic_fangez@quicinc.com> wrote:
>>
>>
>>
>> On 2024/11/22 18:10, Dmitry Baryshkov wrote:
>>> On Fri, Nov 22, 2024 at 05:56:50PM +0800, Fange Zhang wrote:
>>>> From: Li Liu <quic_lliu6@quicinc.com>
>>>>
>>>> Add support for DSI 2.3.1 (block used on SM6150).
>>>>
>>>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>>>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 +++-
>>>>    drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
>>>>    2 files changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>>> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..fe02724bddf69c2e8d6816589f4ea410fa666e5b 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>>> @@ -171,7 +171,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>>>>       .num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>>>>       .io_start = {
>>>>               { 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
>>>> -            { 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
>>>> +            { 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6150 / SM6375 */
>>>
>>> Not true
>> Should I remove it or add it behind the SDM670?
> 
> You should not be sending patches which provide false information. Why
> did you add it to the wrong line in the first place?
sorry i missed it, will remove it in next patch
> 
>>>
>>>>       },
>>>>    };
>>>>
>>>> @@ -286,6 +286,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>>>>               &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>>>       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
>>>>               &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>>> +    {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_1,
>>>> +            &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>>>       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
>>>>               &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>>>       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>>>> index 4c9b4b37681b066dbbc34876c38d99deee24fc82..120cb65164c1ba1deb9acb513e5f073bd560c496 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>>>> @@ -23,6 +23,7 @@
>>>>    #define MSM_DSI_6G_VER_MINOR_V2_2_0        0x20000000
>>>>    #define MSM_DSI_6G_VER_MINOR_V2_2_1        0x20020001
>>>>    #define MSM_DSI_6G_VER_MINOR_V2_3_0        0x20030000
>>>> +#define MSM_DSI_6G_VER_MINOR_V2_3_1 0x20030001
>>>>    #define MSM_DSI_6G_VER_MINOR_V2_4_0        0x20040000
>>>>    #define MSM_DSI_6G_VER_MINOR_V2_4_1        0x20040001
>>>>    #define MSM_DSI_6G_VER_MINOR_V2_5_0        0x20050000
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>
> 
> 

