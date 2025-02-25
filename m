Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD3A43559
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 07:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9349610E49C;
	Tue, 25 Feb 2025 06:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XNRh+F6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B37610E36F;
 Tue, 25 Feb 2025 06:35:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OKOmDJ015364;
 Tue, 25 Feb 2025 06:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G5wLAQ2SISBLFUCx4diUD5E+j7DrZlbJZLbDRxONCcs=; b=XNRh+F6HPPj7WMD/
 qm0tFXE+cj/vzmsJ1iBtIQWg7e/QfAil8yR7ZfSM4eFlfmxdtdHRPs6UB3VBR8k+
 PU7gom9MjlSH12YvVpKFzJFjC8+PfDIGDYzfGSznNFcrkD9qK4SV8AsRLntX7mEe
 g5mwrILTYGK047J/+iLz7kXAPwb7/6oe4jtoqUdRbowl21rDfI4e4peOA8DKjp5j
 hMYzlxZ5XNu6Ih/x75dN+nqnHkxDevAQXKb3Duf7l4vQiMvw/QPR1XHh8tLzqtMZ
 tSQcZgv+538ttx8iJX5Phu861vuZk9ofjTZ+g0f7yfywAaHACxwzJ/LfS+LOMvPl
 d1btdQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 450kqg404y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 06:34:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51P6YoRA020803
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 06:34:50 GMT
Received: from [10.216.12.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 22:34:43 -0800
Message-ID: <891c0e28-dda6-4025-8455-4033f9b3406a@quicinc.com>
Date: Tue, 25 Feb 2025 12:04:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Rob Clark <robdclark@gmail.com>
CC: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
 Rob Clark <robdclark@chromium.org>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
 <CAF6AEGvDR1md6D2dnqJWOW5v3t2wnaC29VD1fyX5q48bzqEkHQ@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <CAF6AEGvDR1md6D2dnqJWOW5v3t2wnaC29VD1fyX5q48bzqEkHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: t7CXTnGOgrqsMkH-nPVXS7XAht9tiN4n
X-Proofpoint-ORIG-GUID: t7CXTnGOgrqsMkH-nPVXS7XAht9tiN4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_02,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250041
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

On 2/18/2025 11:52 PM, Rob Clark wrote:
> On Thu, Feb 13, 2025 at 8:10 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Adreno 621 has a different memory map for GPUCC block. So update
>> a6xx_gpu_state code to dump the correct set of gpucc registers.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 13 ++++++++++---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 17 +++++++++++++++++
>>  2 files changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> index 0fcae53c0b14..2c10474ccc95 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> @@ -1214,12 +1214,12 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>
>>         a6xx_state->gmu_registers = state_kcalloc(a6xx_state,
>> -               3, sizeof(*a6xx_state->gmu_registers));
>> +               4, sizeof(*a6xx_state->gmu_registers));
>>
>>         if (!a6xx_state->gmu_registers)
>>                 return;
>>
>> -       a6xx_state->nr_gmu_registers = 3;
>> +       a6xx_state->nr_gmu_registers = 4;
> 
> nit, this and splitting out a6xx_gpucc_reg from a6xx_gmu_cx_registers
> could probably be it's own commit

Ack. Will split this patch.

-Akhil

> 
> BR,
> -R
> 
>>
>>         /* Get the CX GMU registers from AHB */
>>         _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
>> @@ -1227,6 +1227,13 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>>         _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
>>                 &a6xx_state->gmu_registers[1], true);
>>
>> +       if (adreno_is_a621(adreno_gpu))
>> +               _a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
>> +                       &a6xx_state->gmu_registers[2], false);
>> +       else
>> +               _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
>> +                       &a6xx_state->gmu_registers[2], false);
>> +
>>         if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>>                 return;
>>
>> @@ -1234,7 +1241,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>>         gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
>>
>>         _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
>> -               &a6xx_state->gmu_registers[2], false);
>> +               &a6xx_state->gmu_registers[3], false);
>>  }
>>
>>  static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
>> index dd4c28a8d923..e545106c70be 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
>> @@ -363,6 +363,9 @@ static const u32 a6xx_gmu_cx_registers[] = {
>>         0x51e0, 0x51e2, 0x51f0, 0x51f0, 0x5200, 0x5201,
>>         /* GMU AO */
>>         0x9300, 0x9316, 0x9400, 0x9400,
>> +};
>> +
>> +static const u32 a6xx_gmu_gpucc_registers[] = {
>>         /* GPU CC */
>>         0x9800, 0x9812, 0x9840, 0x9852, 0x9c00, 0x9c04, 0x9c07, 0x9c0b,
>>         0x9c15, 0x9c1c, 0x9c1e, 0x9c2d, 0x9c3c, 0x9c3d, 0x9c3f, 0x9c40,
>> @@ -373,6 +376,17 @@ static const u32 a6xx_gmu_cx_registers[] = {
>>         0xbc00, 0xbc16, 0xbc20, 0xbc27,
>>  };
>>
>> +static const u32 a621_gmu_gpucc_registers[] = {
>> +       /* GPU CC */
>> +       0x9800, 0x980e, 0x9c00, 0x9c0e, 0xb000, 0xb004, 0xb400, 0xb404,
>> +       0xb800, 0xb804, 0xbc00, 0xbc05, 0xbc14, 0xbc1d, 0xbc2a, 0xbc30,
>> +       0xbc32, 0xbc32, 0xbc41, 0xbc55, 0xbc66, 0xbc68, 0xbc78, 0xbc7a,
>> +       0xbc89, 0xbc8a, 0xbc9c, 0xbc9e, 0xbca0, 0xbca3, 0xbcb3, 0xbcb5,
>> +       0xbcc5, 0xbcc7, 0xbcd6, 0xbcd8, 0xbce8, 0xbce9, 0xbcf9, 0xbcfc,
>> +       0xbd0b, 0xbd0c, 0xbd1c, 0xbd1e, 0xbd40, 0xbd70, 0xbe00, 0xbe16,
>> +       0xbe20, 0xbe2d,
>> +};
>> +
>>  static const u32 a6xx_gmu_cx_rscc_registers[] = {
>>         /* GPU RSCC */
>>         0x008c, 0x008c, 0x0101, 0x0102, 0x0340, 0x0342, 0x0344, 0x0347,
>> @@ -386,6 +400,9 @@ static const struct a6xx_registers a6xx_gmu_reglist[] = {
>>         REGS(a6xx_gmu_gx_registers, 0, 0),
>>  };
>>
>> +static const struct a6xx_registers a6xx_gpucc_reg = REGS(a6xx_gmu_gpucc_registers, 0, 0);
>> +static const struct a6xx_registers a621_gpucc_reg = REGS(a621_gmu_gpucc_registers, 0, 0);
>> +
>>  static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
>>  static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu);
>>
>>
>> --
>> 2.45.2
>>

