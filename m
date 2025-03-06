Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C2A556C5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612D010E842;
	Thu,  6 Mar 2025 19:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SbWbAgCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDD010E239;
 Thu,  6 Mar 2025 19:33:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526GBrsU028697;
 Thu, 6 Mar 2025 19:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IwLHjhxCbIupO+Ici2uDvXbo2UOsy6BC/HswKiajNh4=; b=SbWbAgCLvAX/NtQ4
 yEEfzEXa9Xt6keSyyRRGFIuAawfV3R8cTbcuWg/2sdyZbp3SfRuY2BgcNOJujt5D
 DRJt/+29g81d1S+2knYLpEOCINEdUTJCbqJJTnVxOnZcpLP48kuEGD3wxft8hPV6
 fZ8G9qkOshIkGfLB3KNMIVjTRHJJDR6FMeBk7b47U/6VAidsT0zZmIGp6Q56DKVa
 dal3xvHycA63jxEybHMUZKQI5xFSjRCgHmSGm6x3hujD2qkKx0gIzToA5z4DyYaK
 m6NKgMurxXndsZjbm1q0kQm9Lii4evF7d6vSTk6v12TR8MmsXkhH736X8NDFC/85
 8VcSkw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577rpj2sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Mar 2025 19:33:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526JXlDv012649
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Mar 2025 19:33:47 GMT
Received: from [10.71.111.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 11:33:46 -0800
Message-ID: <b125d75f-eb71-469b-808e-3078f2f7e266@quicinc.com>
Date: Thu, 6 Mar 2025 11:33:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
 <vjufkcrkungrwy7w4pxzsac57ilzk2dt3eeypzy6pna2z5ocxg@uf237ixu6kqq>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <vjufkcrkungrwy7w4pxzsac57ilzk2dt3eeypzy6pna2z5ocxg@uf237ixu6kqq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=EYQyQOmC c=1 sm=1 tr=0 ts=67c9f89c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8
 a=Wk0X1AvzGiqwg1-dC_sA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5zfaIFqklpmxodH7m3zKRMo5TyvT8Bnj
X-Proofpoint-GUID: 5zfaIFqklpmxodH7m3zKRMo5TyvT8Bnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060147
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



On 3/5/2025 10:44 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 05, 2025 at 07:16:51PM -0800, Jessica Zhang wrote:
>> Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
>> dedicated CWB PINGPONGs
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>> index ae1534c49ae0..3f88c3641d4a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
>> @@ -214,7 +214,9 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
>>   	mux_cfg = DPU_REG_READ(c, CDM_MUX);
>>   	mux_cfg &= ~0xf;
>>   
>> -	if (pp)
>> +	if (pp >= PINGPONG_CWB_0)
>> +		mux_cfg |= 0xd;
> 
> Shouldn't it be 0xb for PINGPONG_CWB_2 and 3?
> 

No, this register CDM_MUX can take only 0xd for CWB PPs.

0xb is not listed as a valid value at all.

>> +	else if (pp)
>>   		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>>   	else
>>   		mux_cfg |= 0xf;
>>
>> ---
>> base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
>> change-id: 20250305-cdm-cwb-mux-fix-69ed5297d4f7
>>
>> Best regards,
>> -- 
>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>
> 

