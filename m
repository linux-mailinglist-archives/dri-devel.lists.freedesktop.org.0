Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C9A1AC00
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 22:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF82D10E8B0;
	Thu, 23 Jan 2025 21:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AXV9eC0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B22F10E8AB;
 Thu, 23 Jan 2025 21:41:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NFTiMK007879;
 Thu, 23 Jan 2025 21:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yMaJ2fMkCXuJ6Wx7Q3YI0C1Ppt4qT8eiHcHyCRKa52o=; b=AXV9eC0eVzl54iuL
 faDoP2LyWYQm+Ip1Aexekzl4Spkk6mouFSak43uNoOZinYGt4mCQ1vekpdpEmY94
 lz17RoVtET54ys3lsECHkf/NbyrhtNcKTa6L82RPJTqcg37rKFGVXBsm0/JXI/Wu
 WEMckQlOdt57hMwtPVk4yXX1L9i0i6uoVNprfIlcpcmKZ9wpktiTdNGtF2rd2x7e
 MnPo2QrsmcAOmTD6lhO5BCfHfwN9oOtXofVpsb4oYNAdLqpOGgFlT1/H8CXTp1/M
 SNZErIsgxzTK1ykp6Uy7QZzpZtiH+08WiiVXNdHvoQAF1niG9IZKlVtYPaGqYiVZ
 pnCFwQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44brf50t88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2025 21:41:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NLfFWD011619
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2025 21:41:15 GMT
Received: from [10.110.95.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 13:41:14 -0800
Message-ID: <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
Date: Thu, 23 Jan 2025 13:41:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/35] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
 <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
Content-Language: en-US
In-Reply-To: <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hO0edgcZhui8Fgc89mx_t92Fk3VXsJu8
X-Proofpoint-GUID: hO0edgcZhui8Fgc89mx_t92Fk3VXsJu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_09,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230155
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



On 1/23/2025 1:32 PM, Abhinav Kumar wrote:
> 
> 
> On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
>> Continue migration to the MDSS-revision based checks and replace
>> DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10 
>> ++--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
>>   7 files changed, 5 insertions(+), 20 deletions(-)
>>
> 
> <snip>
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> index 
>> 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> @@ -319,7 +319,7 @@ struct dpu_hw_pingpong 
>> *dpu_hw_pingpong_init(struct drm_device *dev,
>>           c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
>>       }
>> -    if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
>> +    if (mdss_rev->core_major_ver < 7) {
>>           c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>>           c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>>           c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>>
> 
> So far in this series, we replaced the feature bits with >= checks of 
> core_revisions. That kind of works as usually feature bits get added 
> after a specific version.
> 
> With this patch and later, whenever we use < checks it gets a bit tricky 
> as we might also need an upper bound. Feature bits gave individual 
> control of chipsets but generalizing that all chipsets < 7 have PP DSC 
> is also not correct. I have to really cross-check but there could be 
> some old chipsets which do not have DSC at all.

This raises another question as well.

what if some register was introduced >= X version but was then dropped 
in a newer chipset.

Is it not difficult for the user to go back to the files of each of the 
sub-blocks and alter these checks rather than just fixing up the catalog.
