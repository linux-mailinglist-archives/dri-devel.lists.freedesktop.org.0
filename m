Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6EAA074AF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 12:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF66A10ED76;
	Thu,  9 Jan 2025 11:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ACrO7Sqv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8EB10E366;
 Thu,  9 Jan 2025 11:28:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096qYqX009896;
 Thu, 9 Jan 2025 11:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7VOsZOL91cnSNmUxwP6JvrtfctbXJqndgsMxurhIG88=; b=ACrO7SqvL5n7iXR8
 TAL6KLdMk7mHhCB7wn7pFODrW6ZVAVNnv7j+FH9iuyzjLVWBs2pA8ggR9kPJF3CW
 f+AT4h+hIjI8wy/KuBKhn2W4SmTQjq+UUetK1JC1v67ZbpY60adF7wv8K2CDaqUM
 PaptQz2mK6doI/eNS7rb9im0yhqDOpF4s6GMejEtmYTuVMT0txIq8rJrvd5Py/e0
 yPE1GKvzZ2JSgeF+eYv9oYU1UA/t7LAuILbhpGR5PZNfEVpDx6fYcF9iaSeWgB2b
 lWEJzc9iKHdr+k7m1nEsuOO1/2onM3ONTrGQZ6+yOKs8ohOuk5dvs7HZ4bG0Nm6P
 erVVzw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429jt8nak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 11:28:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509BSkYv024392
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 11:28:46 GMT
Received: from [10.206.104.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 03:28:39 -0800
Message-ID: <7a7c0b64-0b38-4130-875d-cf73266032bd@quicinc.com>
Date: Thu, 9 Jan 2025 16:58:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] drm/msm/a6xx: Increase HFI response timeout
To: <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Maya Matuszczyk <maccraft123mc@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-2-08a5efaf4a23@quicinc.com>
 <00a01ba3-8b03-4a41-a8a0-650aaf661f12@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <00a01ba3-8b03-4a41-a8a0-650aaf661f12@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: w5bm3R8otdmmmGltXdVOEQ6MsZy22KSg
X-Proofpoint-GUID: w5bm3R8otdmmmGltXdVOEQ6MsZy22KSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090091
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

On 1/9/2025 1:24 PM, neil.armstrong@linaro.org wrote:
> On 08/01/2025 21:39, Akhil P Oommen wrote:
>> When ACD feature is enabled, it triggers some internal calibrations
>> which result in a pretty long delay during the first HFI perf vote.
>> So, increase the HFI response timeout to match the downstream driver.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/
>> msm/adreno/a6xx_hfi.c
>> index 3c183c1c6266..7d04b242363c 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -108,7 +108,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu
>> *gmu, u32 id, u32 seqnum,
>>         /* Wait for a response */
>>       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>> -        val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
>> +        val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
>>         if (ret) {
>>           DRM_DEV_ERROR(gmu->dev,
>> @@ -725,7 +725,7 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>>       }
>>         /* Send ACD table to GMU */
>> -    ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg),
>> NULL, 0);
>> +    ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, acd_table,
>> sizeof(*acd_table), NULL, 0);
>>       if (ret) {
>>           DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret);
>>           return ret;
>>
> 
> Ok it's here, this should be on previous patch!

Aah! It got messed up when I squashed fixup commits.

-Akhil.

> 
> Neil

