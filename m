Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBA991B65F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 07:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD4F10EBB7;
	Fri, 28 Jun 2024 05:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IyLNm8Di";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A6210EBB3;
 Fri, 28 Jun 2024 05:44:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RL6DNF015295;
 Fri, 28 Jun 2024 05:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7vFZZqH20Du4+0rEJZkm4d1bS5cXe7cGcBbOZAvl9GI=; b=IyLNm8Di4p+qBqLV
 BZtlfw2Jmz1oYuUOJqlhMeZJHJ75k61TYHeaYNOOMAvtP4NhA3cbyFKXcBiCgr6A
 QeVg7cvx5ABQ9cmYbTJffuQt2B82q32BO8djjbI2+7le8yyo36ep1flehvEg4798
 8SC/hgpEd8+15HzWd0I75Bi0Ma8ICFE6y5YOx1p8hanIED0+0mVfwGzBlup8qlYF
 j/gQFQTks2onL54ph4MboGcLtrLdGP0QqG2dFtq1k/STA3BoJtxR1zWZwj7MeQ74
 QCCN8LTwPhwjDQI0y0hfGyElOXnaTUeH9ok6nFplYDq17TOUzUUeNJSgA+8qnnWT
 cNuiig==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400gcmdj60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 05:43:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45S5hx8V004491
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 05:43:59 GMT
Received: from [10.110.116.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 22:43:58 -0700
Message-ID: <19c49c3b-057c-ce83-1ec6-4929676ff0e7@quicinc.com>
Date: Thu, 27 Jun 2024 22:43:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] drm/msm/dpu: check ubwc support before adding
 compressed formats
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <freedreno@lists.freedesktop.org>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240627205328.2912859-1-quic_abhinavk@quicinc.com>
 <CAF6AEGuGYG5mO-4KdNFbQFMA4dKj2PWT22xeh-3AFgedAG0uHw@mail.gmail.com>
 <3749ac14-54d0-fb62-345b-cef62399b6d4@quicinc.com>
 <CAA8EJppM1429sGzW6hq4QzLEjVX5Cf+8Jt5y94+VocFmPyxz+Q@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppM1429sGzW6hq4QzLEjVX5Cf+8Jt5y94+VocFmPyxz+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KJ2HU5jse8lKYgW_K4mAAIrqAu1xOz_W
X-Proofpoint-ORIG-GUID: KJ2HU5jse8lKYgW_K4mAAIrqAu1xOz_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_02,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280039
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



On 6/27/2024 4:22 PM, Dmitry Baryshkov wrote:
> On Fri, 28 Jun 2024 at 00:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/27/2024 2:13 PM, Rob Clark wrote:
>>> On Thu, Jun 27, 2024 at 1:53 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> On QCM2290 chipset DPU does not support UBWC.
>>>>
>>>> Add a dpu cap to indicate this and do not expose compressed formats
>>>> in this case.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 ++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c               | 5 ++++-
>>>>    3 files changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>> index 3cbb2fe8aba2..6671f798bacc 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>> @@ -12,6 +12,7 @@ static const struct dpu_caps qcm2290_dpu_caps = {
>>>>           .max_mixer_blendstages = 0x4,
>>>>           .has_dim_layer = true,
>>>>           .has_idle_pc = true,
>>>> +       .has_no_ubwc = true,
>>>>           .max_linewidth = 2160,
>>>>           .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>    };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> index af2ead1c4886..676d0a283922 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> @@ -342,6 +342,7 @@ struct dpu_rotation_cfg {
>>>>     * @has_dim_layer      dim layer feature status
>>>>     * @has_idle_pc        indicate if idle power collapse feature is supported
>>>>     * @has_3d_merge       indicate if 3D merge is supported
>>>> + * @has_no_ubwc        indicate if UBWC is supported
>>>>     * @max_linewidth      max linewidth for sspp
>>>>     * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>>>>     * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
>>>> @@ -354,6 +355,7 @@ struct dpu_caps {
>>>>           bool has_dim_layer;
>>>>           bool has_idle_pc;
>>>>           bool has_3d_merge;
>>>> +       bool has_no_ubwc;
>>>
>>> has_no_ubwc sounds kinda awkward compared to has_ubwc.  But I guess
>>> you wanted to avoid all that churn..
>>>
>>
>> Yes I wanted to avoid modifying all the catalogs.
>>
>>> How about instead, if msm_mdss_data::ubwc_{enc,dec}_version are zero,
>>> then we know there is no ubwc support in the display.
>>>
>>
>> hmm ... should work .... I can post a v2 with this and avoid touching
>> the catalog altogether.
> 
> Yes, this sounds much better.
> 

Ok, does this qualify for a Fixes tag too? Because exposing ubwc formats 
on non-ubwc supported chipsets seems like a bug.
