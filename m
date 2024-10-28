Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781AF9B2C53
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1870F10E457;
	Mon, 28 Oct 2024 10:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WpXAxDHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE1B10E454;
 Mon, 28 Oct 2024 10:08:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNnA4K017530;
 Mon, 28 Oct 2024 10:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u6w09vuiLva5b8cnrEum/UWUMtRM/0/5HzAWBBqc9eQ=; b=WpXAxDHHSWUl947b
 jXMxOO5ewytWmwojDUfj5Y3opOccO99hO7nPOk2mVAYMUdGuyTMk8rwVGv0OTLCT
 70EvAsHyy8dxdWRWNa8gEoGt8BljfGwFFX2sBN1VQj0146YeVLwZJ1WcLEKSl9ne
 t5aV0xbnjudpUTa/vRhBbhxxe99dbqP0NwLNv0dNpWuKossxZqkmkyB7SY+f8yYj
 g+biBBf6A5cDvoT4x+oJFpdKtuvYFvADskZ03kR9FfNHMGx1pu/wjqOBd28CEKqj
 7zdUoWM1dUMosZv39FVXuC1ULCwDc/uJIEVrTe1ufLkXSK/F0htY9UJkRiqWC22A
 E/bDew==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt6vd4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 10:07:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SA7qfZ025319
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 10:07:52 GMT
Received: from [10.216.3.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 03:07:46 -0700
Message-ID: <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
Date: Mon, 28 Oct 2024 15:37:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 Arnd Bergmann <arnd@kernel.org>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: yM4lroPHSvQX2DwzVgWCZySGtX_3rfx5
X-Proofpoint-GUID: yM4lroPHSvQX2DwzVgWCZySGtX_3rfx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280083
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

On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
> On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
>> Clang-19 and above sometimes end up with multiple copies of the large
>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>> fill the structure, but these create another copy of the structure on
>> the stack which gets copied to the first.
>>
>> If the functions get inlined, that busts the warning limit:
>>
>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
>>
>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
>> the stack. Also, use this opportunity to skip re-initializing this table
>> to optimize gpu wake up latency.
>>
>> Cc: Arnd Bergmann <arnd@kernel.org>
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
>>  2 files changed, 23 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> index 94b6c5cab6f4..b4a79f88ccf4 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>>  	struct completion pd_gate;
>>  
>>  	struct qmp *qmp;
>> +	struct a6xx_hfi_msg_bw_table *bw_table;
>>  };
>>  
>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index cdb3f6e74d3e..55e51c81be1f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>  
>>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>  {
>> -	struct a6xx_hfi_msg_bw_table msg = { 0 };
>> +	struct a6xx_hfi_msg_bw_table *msg;
>>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>  
>> +	if (gmu->bw_table)
>> +		goto send;
>> +
>> +	msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> 
> Is it necessary after being sent? Isn't it better to just kzalloc() it
> and then kfree() it at the end of the function?

Keeping it around will help to cut down unnecessary work during
subsequent gpu wake ups.

-Akhil.

> 
>> +	if (!msg)
>> +		return -ENOMEM;
>> +
>>  	if (adreno_is_a618(adreno_gpu))
>> -		a618_build_bw_table(&msg);
>> +		a618_build_bw_table(msg);
>>  	else if (adreno_is_a619(adreno_gpu))
>> -		a619_build_bw_table(&msg);
>> +		a619_build_bw_table(msg);
>>  	else if (adreno_is_a640_family(adreno_gpu))
>> -		a640_build_bw_table(&msg);
>> +		a640_build_bw_table(msg);
>>  	else if (adreno_is_a650(adreno_gpu))
>> -		a650_build_bw_table(&msg);
>> +		a650_build_bw_table(msg);
>>  	else if (adreno_is_7c3(adreno_gpu))
>> -		adreno_7c3_build_bw_table(&msg);
>> +		adreno_7c3_build_bw_table(msg);
>>  	else if (adreno_is_a660(adreno_gpu))
>> -		a660_build_bw_table(&msg);
>> +		a660_build_bw_table(msg);
>>  	else if (adreno_is_a690(adreno_gpu))
>> -		a690_build_bw_table(&msg);
>> +		a690_build_bw_table(msg);
>>  	else if (adreno_is_a730(adreno_gpu))
>> -		a730_build_bw_table(&msg);
>> +		a730_build_bw_table(msg);
>>  	else if (adreno_is_a740_family(adreno_gpu))
>> -		a740_build_bw_table(&msg);
>> +		a740_build_bw_table(msg);
>>  	else
>> -		a6xx_build_bw_table(&msg);
>> +		a6xx_build_bw_table(msg);
>> +
>> +	gmu->bw_table = msg;
>>  
>> -	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, &msg, sizeof(msg),
>> +send:
>> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, gmu->bw_table, sizeof(*(gmu->bw_table)),
>>  		NULL, 0);
>>  }
>>  
>>
>> ---
>> base-commit: 74c374648ed08efb2ef339656f2764c28c046956
>> change-id: 20241024-stack-size-fix-28af7abd3fab
>>
>> Best regards,
>> -- 
>> Akhil P Oommen <quic_akhilpo@quicinc.com>
>>
> 

