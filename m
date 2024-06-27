Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6691B179
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 23:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4624A10EB71;
	Thu, 27 Jun 2024 21:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MeNOILQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5956210EB6E;
 Thu, 27 Jun 2024 21:21:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RApq2d022654;
 Thu, 27 Jun 2024 21:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ClD8B0XIV/gMjVP7hTc6S7bRef+iJKEvYNkqxuRf7WE=; b=MeNOILQ+pwzY+3vW
 m0m13RLiVP36fnzSXN147Y27M1uK8JJ1QSsBHD6BSYniYlJUTe0nDPKpb2I1/oww
 8/SuXgtcSNWX+7B8ti935z9f5FhQHYUzDE6ZDfpqWrulUAgKP316Dv0CZCT+d3+w
 QhrelkTLrZSweCMFiS1WKK/zFq26O3FSGYQ2llNHwqMmW5RJdZOUAR9mNGjPNSO4
 6MYicZzbNeg3kPIUzfXoRpHB2x2Ro4Mku7lizWj71rkPFIQ9K6ezJs3XqxHCXpss
 sA/c0ONKc9j1Mp1+t51vb2zIcMg4PLKMGBBRqP45i8+fGMBNhFY71glX18KyDq9w
 8v/wiA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9n17r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 21:21:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45RLLa4q010942
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 21:21:36 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 14:21:35 -0700
Message-ID: <3749ac14-54d0-fb62-345b-cef62399b6d4@quicinc.com>
Date: Thu, 27 Jun 2024 14:21:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] drm/msm/dpu: check ubwc support before adding
 compressed formats
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
CC: <freedreno@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240627205328.2912859-1-quic_abhinavk@quicinc.com>
 <CAF6AEGuGYG5mO-4KdNFbQFMA4dKj2PWT22xeh-3AFgedAG0uHw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAF6AEGuGYG5mO-4KdNFbQFMA4dKj2PWT22xeh-3AFgedAG0uHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ckvG6ABqAkgLC0rj7b6YUq4SqZEWx0oG
X-Proofpoint-GUID: ckvG6ABqAkgLC0rj7b6YUq4SqZEWx0oG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_14,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406270159
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



On 6/27/2024 2:13 PM, Rob Clark wrote:
> On Thu, Jun 27, 2024 at 1:53 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> On QCM2290 chipset DPU does not support UBWC.
>>
>> Add a dpu cap to indicate this and do not expose compressed formats
>> in this case.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c               | 5 ++++-
>>   3 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> index 3cbb2fe8aba2..6671f798bacc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> @@ -12,6 +12,7 @@ static const struct dpu_caps qcm2290_dpu_caps = {
>>          .max_mixer_blendstages = 0x4,
>>          .has_dim_layer = true,
>>          .has_idle_pc = true,
>> +       .has_no_ubwc = true,
>>          .max_linewidth = 2160,
>>          .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index af2ead1c4886..676d0a283922 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -342,6 +342,7 @@ struct dpu_rotation_cfg {
>>    * @has_dim_layer      dim layer feature status
>>    * @has_idle_pc        indicate if idle power collapse feature is supported
>>    * @has_3d_merge       indicate if 3D merge is supported
>> + * @has_no_ubwc        indicate if UBWC is supported
>>    * @max_linewidth      max linewidth for sspp
>>    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>>    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
>> @@ -354,6 +355,7 @@ struct dpu_caps {
>>          bool has_dim_layer;
>>          bool has_idle_pc;
>>          bool has_3d_merge;
>> +       bool has_no_ubwc;
> 
> has_no_ubwc sounds kinda awkward compared to has_ubwc.  But I guess
> you wanted to avoid all that churn..
> 

Yes I wanted to avoid modifying all the catalogs.

> How about instead, if msm_mdss_data::ubwc_{enc,dec}_version are zero,
> then we know there is no ubwc support in the display.
> 

hmm ... should work .... I can post a v2 with this and avoid touching 
the catalog altogether.

> BR,
> -R
> 
> 
>>          /* SSPP limits */
>>          u32 max_linewidth;
>>          u32 pixel_ram_size;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 6000e84598c2..31fe0fc4c02e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -1341,10 +1341,13 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>>   static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>>                  uint32_t format, uint64_t modifier)
>>   {
>> +       struct dpu_plane *pdpu = to_dpu_plane(plane);
>> +       const struct dpu_caps *caps = pdpu->catalog->caps;
>> +
>>          if (modifier == DRM_FORMAT_MOD_LINEAR)
>>                  return true;
>>
>> -       if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
>> +       if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED && !caps->has_no_ubwc)
>>                  return dpu_find_format(format, qcom_compressed_supported_formats,
>>                                  ARRAY_SIZE(qcom_compressed_supported_formats));
>>
>> --
>> 2.44.0
>>
