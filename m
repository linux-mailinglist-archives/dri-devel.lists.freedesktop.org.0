Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B4B6CF7A2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 01:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CD610E1B2;
	Wed, 29 Mar 2023 23:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F07810E03F;
 Wed, 29 Mar 2023 23:45:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32TKgcCQ009411; Wed, 29 Mar 2023 23:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8LCH4lEoBHNHEILWCwXuiUnrxISwYb1djIm9KBWLi5s=;
 b=Of0vyQbvQc9GzbO34mJpOK9Zr5jC9tl5c/CqJf5wFdOBwVG7osvUHmFEkRZUnJ1TYrVL
 k9hknfdvlRoEiIzK/DLehKZbsyPbBbxDhdxggawt0Sm9CweQlrdMl57jFXYv7y/OZZpT
 OcgGClSK2gx2aYN9WOX+Vr/maqW/TEbKZh8QcvgqSCdowM63Oz7SNC/0O+RX3Fs2tggc
 FNkb8TwhLSZ4+DT9H2j/Sitp8GEFKrhzB7gM4Fc5MQmqlFEg7FBkwUD4gLUNkxlzA/Op
 rU0rMBn8jYkaf+tVA8sLA8QJ0Kf6dviJe8gxosn7LmqkmB6G7qFFNw29DdYCzQB1JUMb 8A== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmjjd23x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Mar 2023 23:45:10 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNj9Gj001358
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Mar 2023 23:45:09 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 29 Mar
 2023 16:45:08 -0700
Message-ID: <9ba94f43-845f-886f-a87e-ec46613b74b6@quicinc.com>
Date: Wed, 29 Mar 2023 16:45:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 3/5] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-3-f3e479f59b6d@quicinc.com>
 <4e12cc50-cd34-e1a1-3a91-0da369b785c1@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <4e12cc50-cd34-e1a1-3a91-0da369b785c1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pDKDZSGAULlnbd8CG6dMbGZZV4NWnTeJ
X-Proofpoint-ORIG-GUID: pDKDZSGAULlnbd8CG6dMbGZZV4NWnTeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=955 bulkscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290176
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/29/2023 4:31 PM, Dmitry Baryshkov wrote:
> On 30/03/2023 02:18, Jessica Zhang wrote:
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>> index 619926da1441..648c530b5d05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>> @@ -3,6 +3,8 @@
>>    * Copyright (c) 2020-2022, Linaro Limited
>>    */
>> +#include <drm/display/drm_dsc_helper.h>
>> +
>>   #include "dpu_kms.h"
>>   #include "dpu_hw_catalog.h"
>>   #include "dpu_hwio.h"
>> @@ -102,7 +104,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc 
>> *hw_dsc,
>>       data |= dsc->final_offset;
>>       DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
>> -    det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
>> +    det_thresh_flatness = drm_dsc_calculate_det_thresh_flatness(dsc);
> 
> But this changes the value! Compare:
> 
> bpc | old | new
> 8   | 7   | 2
> 10  | 11  | 8
> 12  | 15  | 256
> 
> If this is intentional, please state so and maybe add a Fixes tag.

Hi Dmitry,

Yep this was intentional to match downstream and the spec. Will add a 
fixes tag for this.

Thanks,

Jessica Zhang

> 
> 
>>       data = det_thresh_flatness << 10;
>>       data |= dsc->flatness_max_qp << 5;
>>       data |= dsc->flatness_min_qp;
>>
> 
> -- 
> With best wishes
> Dmitry
> 
