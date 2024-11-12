Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE549C6329
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 22:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABCC10E65F;
	Tue, 12 Nov 2024 21:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VSxLxg/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3D10E65F;
 Tue, 12 Nov 2024 21:15:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACLCr3x016320;
 Tue, 12 Nov 2024 21:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /tADVTVWYoSeZndEkxjaWqdP520eLRzjYoMvkH0Yfs0=; b=VSxLxg/agVBvzdfP
 sNT2EbWfW9IqCf2q+5WxGN3kj32qBc3urDvPr+IqmZDl5oYXmiOCWBNxto9ylDYb
 1XOZW70uxNN4kM6xkMvUK0m0MyzTFyl5YzadBEfKKIGQ+p9NLuSaN0X91cYsD25w
 BcFZpkJe7pZD3y2ZumRTYdC0sI+YUHPR+J0THOz1wGd0E+f4n2lkJxblPP31wZ1a
 oNnu4yz874S+R/YD98D0avdg/ofJ2BDXn1CqlEEeUh7T0kL86UdbltxwZwkhUniI
 +4A88p6b7eZKakL06JSUd8a+XqGUkOHeOoZJT+yulDl1euoE5HWTM50Scd9x7Xw8
 ZFwrXQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v47y1yeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 21:15:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACLFOqN023337
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 21:15:24 GMT
Received: from [10.216.22.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 13:15:19 -0800
Message-ID: <5a959c08-cc90-4a05-88b2-e1ee666561e2@quicinc.com>
Date: Wed, 13 Nov 2024 02:45:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
To: Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Simona Vetter <simona@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
 <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
 <CAF6AEGvD95RyUXDBjgmoefgO6QyeRw3tpa7EG1MLFKdxcoZ-4g@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGvD95RyUXDBjgmoefgO6QyeRw3tpa7EG1MLFKdxcoZ-4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: v8eAhhWpWJc6NMlkOr28Y0LJkskGPL9I
X-Proofpoint-GUID: v8eAhhWpWJc6NMlkOr28Y0LJkskGPL9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120170
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

On 11/11/2024 8:38 PM, Rob Clark wrote:
> On Sun, Nov 10, 2024 at 9:31 AM Bjorn Andersson
> <bjorn.andersson@oss.qualcomm.com> wrote:
>>
>> Support for per-process page tables requires the SMMU aparture to be
>> setup such that the GPU can make updates with the SMMU. On some targets
>> this is done statically in firmware, on others it's expected to be
>> requested in runtime by the driver, through a SCM call.
>>
>> One place where configuration is expected to be done dynamically is the
>> QCS6490 rb3gen2.
>>
>> The downstream driver does this unconditioanlly on any A6xx and newer,
> 
> nit, s/unconditioanlly/unconditionally/
> 
>> so follow suite and make the call.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> 
> 
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 076be0473eb5..75f5367e73ca 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -572,8 +572,19 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
>>
>>  int adreno_hw_init(struct msm_gpu *gpu)
>>  {

SCM calls into TZ can block for a very long time (seconds). It depends
on concurrent activities from other drivers like crypto for eg:. So we
should not do this in the gpu wake up path.

Practically, gpu probe is the better place to do this.

-Akhil

>> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +       int ret;
>> +
>>         VERB("%s", gpu->name);
>>
>> +       if (adreno_gpu->info->family >= ADRENO_6XX_GEN1 &&
>> +           qcom_scm_set_gpu_smmu_aperture_is_available()) {
>> +               /* We currently always use context bank 0, so hard code this */
>> +               ret = qcom_scm_set_gpu_smmu_aperture(0);
>> +               if (ret)
>> +                       DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
>> +       }
>> +
>>         for (int i = 0; i < gpu->nr_rings; i++) {
>>                 struct msm_ringbuffer *ring = gpu->rb[i];
>>
>>
>> --
>> 2.45.2
>>

