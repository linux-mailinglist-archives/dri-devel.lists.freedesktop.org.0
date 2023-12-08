Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA75080A8C8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A130510E08A;
	Fri,  8 Dec 2023 16:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACEC10EAD6;
 Fri,  8 Dec 2023 16:24:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8FZMI9010729; Fri, 8 Dec 2023 16:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JTh/W8E+X96Y3B97mD4d20YenBuucvd9tHFxnzC7JoA=;
 b=TisIb56WnrMZv9CTLtpKRnw9zyXjXGpPAipridtx7LjOrLy+L8s+ASWjnnc7YWeC+8Mb
 V2gc5CpeyYCkfnfVSKeP1FEkWAlsP3LiqQiWioPy5YNMTHQ4m9DYKVbB/S07HcrNc9V7
 rt3nam8whxydj22ul2Od3AmuYWF+vB+UNkKNxW1kXP5nR+xSqBIt8r+wXswZ1W/GTcQS
 ByzayUic3EhuYCNibR18xgGP+vO8AhrlRCskqGudjafS6NE9vAXM8t1J9AXMCya0ajnK
 9N62l7x8LAfqYbJR+D9VepNFS18U+H4CaUQyDt5SrgO4ons28RT7F373NI4I14jdKZS6 TA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uv5wpg5a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 16:24:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GOJ3l008604
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 16:24:19 GMT
Received: from [10.110.30.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 08:24:16 -0800
Message-ID: <ceb7e736-22f3-0cf3-3d65-7ec33e7c9d95@quicinc.com>
Date: Fri, 8 Dec 2023 08:24:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 04/16] drm/msm/dpu: move csc matrices to dpu_hw_util
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-5-quic_abhinavk@quicinc.com>
 <CAA8EJpro4ehwZ8Gs+ASUmrMJS0HbnDXd5pXwijs1jkDpR-kAOQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpro4ehwZ8Gs+ASUmrMJS0HbnDXd5pXwijs1jkDpR-kAOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8ewUNYkJJh8i4djhatMbVdf5-6M7br8T
X-Proofpoint-ORIG-GUID: 8ewUNYkJJh8i4djhatMbVdf5-6M7br8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080135
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/8/2023 3:12 AM, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Since the type and usage of CSC matrices is spanning across DPU
>> lets introduce a helper to the dpu_hw_util to return the CSC
>> corresponding to the request type. This will help to add more
>> supported CSC types such as the RGB to YUV one which is used in
>> the case of CDM.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 54 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 39 ++-------------
>>   3 files changed, 64 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> index 0b05061e3e62..59a153331194 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> @@ -87,6 +87,60 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
>>   #define QOS_QOS_CTRL_VBLANK_EN            BIT(16)
>>   #define QOS_QOS_CTRL_CREQ_VBLANK_MASK     GENMASK(21, 20)
>>
>> +static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
>> +       {
>> +               /* S15.16 format */
>> +               0x00012A00, 0x00000000, 0x00019880,
>> +               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
>> +               0x00012A00, 0x00020480, 0x00000000,
>> +       },
>> +       /* signed bias */
>> +       { 0xfff0, 0xff80, 0xff80,},
>> +       { 0x0, 0x0, 0x0,},
>> +       /* unsigned clamp */
>> +       { 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
>> +       { 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
>> +};
>> +
>> +static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
>> +       {
>> +               /* S15.16 format */
>> +               0x00012A00, 0x00000000, 0x00019880,
>> +               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
>> +               0x00012A00, 0x00020480, 0x00000000,
>> +       },
>> +       /* signed bias */
>> +       { 0xffc0, 0xfe00, 0xfe00,},
>> +       { 0x0, 0x0, 0x0,},
>> +       /* unsigned clamp */
>> +       { 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
>> +       { 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
>> +};
>> +
>> +/**
>> + * dpu_hw_get_csc_cfg - get the CSC matrix based on the request type
>> + * @type:              type of the requested CSC matrix from caller
>> + * Return: CSC matrix corresponding to the request type in DPU format
>> + */
>> +const struct dpu_csc_cfg *dpu_hw_get_csc_cfg(enum dpu_hw_csc_cfg_type type)
>> +{
>> +       const struct dpu_csc_cfg *csc_cfg = NULL;
>> +
>> +       switch (type) {
>> +       case DPU_HW_YUV2RGB_601L:
>> +               csc_cfg = &dpu_csc_YUV2RGB_601L;
>> +               break;
>> +       case DPU_HW_YUV2RGB_601L_10BIT:
>> +               csc_cfg = &dpu_csc10_YUV2RGB_601L;
>> +               break;
>> +       default:
>> +               DPU_ERROR("unknown csc_cfg type\n");
>> +               break;
>> +       }
>> +
>> +       return csc_cfg;
>> +}
>> +
>>   void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
>>                  u32 reg_off,
>>                  u32 val,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> index fe083b2e5696..49f2bcf6de15 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> @@ -19,6 +19,11 @@
>>   #define MISR_CTRL_STATUS_CLEAR          BIT(10)
>>   #define MISR_CTRL_FREE_RUN_MASK         BIT(31)
>>
>> +enum dpu_hw_csc_cfg_type {
>> +       DPU_HW_YUV2RGB_601L,
>> +       DPU_HW_YUV2RGB_601L_10BIT,
>> +};
>> +
>>   /*
>>    * This is the common struct maintained by each sub block
>>    * for mapping the register offsets in this block to the
>> @@ -368,4 +373,6 @@ bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
>>                             const struct dpu_clk_ctrl_reg *clk_ctrl_reg,
>>                             bool enable);
>>
>> +const struct dpu_csc_cfg *dpu_hw_get_csc_cfg(enum dpu_hw_csc_cfg_type type);
> 
> I don't think we need extra enum and wrapper. Just export const data
> structures directly.
> 

I liked this approach because the blocks of DPU such as plane and CDM 
are clients to the dpu_hw_util and just request the type and the util 
handles their request of returning the correct csc matrix.

Do you see any issue with this?

>> +
>>   #endif /* _DPU_HW_UTIL_H */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 3235ab132540..31641889b9f0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -21,6 +21,7 @@
>>   #include "dpu_kms.h"
>>   #include "dpu_formats.h"
>>   #include "dpu_hw_sspp.h"
>> +#include "dpu_hw_util.h"
>>   #include "dpu_trace.h"
>>   #include "dpu_crtc.h"
>>   #include "dpu_vbif.h"
>> @@ -508,50 +509,16 @@ static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
>>          }
>>   }
>>
>> -static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
>> -       {
>> -               /* S15.16 format */
>> -               0x00012A00, 0x00000000, 0x00019880,
>> -               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
>> -               0x00012A00, 0x00020480, 0x00000000,
>> -       },
>> -       /* signed bias */
>> -       { 0xfff0, 0xff80, 0xff80,},
>> -       { 0x0, 0x0, 0x0,},
>> -       /* unsigned clamp */
>> -       { 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
>> -       { 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
>> -};
>> -
>> -static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
>> -       {
>> -               /* S15.16 format */
>> -               0x00012A00, 0x00000000, 0x00019880,
>> -               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
>> -               0x00012A00, 0x00020480, 0x00000000,
>> -               },
>> -       /* signed bias */
>> -       { 0xffc0, 0xfe00, 0xfe00,},
>> -       { 0x0, 0x0, 0x0,},
>> -       /* unsigned clamp */
>> -       { 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
>> -       { 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
>> -};
>> -
>>   static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe,
>>                                                      const struct dpu_format *fmt)
>>   {
>> -       const struct dpu_csc_cfg *csc_ptr;
>> -
>>          if (!DPU_FORMAT_IS_YUV(fmt))
>>                  return NULL;
>>
>>          if (BIT(DPU_SSPP_CSC_10BIT) & pipe->sspp->cap->features)
>> -               csc_ptr = &dpu_csc10_YUV2RGB_601L;
>> +               return dpu_hw_get_csc_cfg(DPU_HW_YUV2RGB_601L_10BIT);
>>          else
>> -               csc_ptr = &dpu_csc_YUV2RGB_601L;
>> -
>> -       return csc_ptr;
>> +               return dpu_hw_get_csc_cfg(DPU_HW_YUV2RGB_601L);
>>   }
>>
>>   static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
>> --
>> 2.40.1
>>
> 
> 
