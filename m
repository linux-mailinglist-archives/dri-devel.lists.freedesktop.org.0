Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF296A2CC7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 01:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FDB10E649;
	Sun, 26 Feb 2023 00:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F81010E0B4;
 Sun, 26 Feb 2023 00:16:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31Q00NfJ015119; Sun, 26 Feb 2023 00:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=35muwSCUtuPsvNbRk3WyZqi1DQAVgPWtAY8EKeE/V10=;
 b=Ig2OJnaQWsUV/SeWIoUT1Vt6jzJySwQ5CJGGVkAhpY0JChnTMVKlAW+9/eTkOOSmKynB
 SuLscpmb4BEcx4IDiq+aAQWwhAxWQULoChomUuF3JGm1EToxsn9aILX27R5WQjlR2ZVW
 8WPYJyM/J/zYJAFLG9mkrWOqYJoEmqeT/4nq5huwDcNcNNJxvFliOlw5c8p9DlS8xikP
 QIlttYdd43xn4uEk2cRayyjBLDL6basJtbOv/sEMgNkRXXTZvH/XpsLnzhxxhmpA56Jb
 O0fUW/T9KcF+MmG+GFPpTQ36Muv4JKnLC045IsrqMXFpOz2naRMgocjGV4Igv3WwsckD LQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny81q9vqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Feb 2023 00:16:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31Q0G2j0002994
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Feb 2023 00:16:02 GMT
Received: from [10.110.89.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sat, 25 Feb
 2023 16:16:01 -0800
Message-ID: <7650f183-9860-9074-e5d5-539afdf41248@quicinc.com>
Date: Sat, 25 Feb 2023 16:16:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <1b5afec9-454d-e1b9-0274-f0476edb4d21@quicinc.com>
 <CAA8EJprowFyBMdW5QC2zG0gYUtxJ-hHXqhPfYTct2GzYJKLSHg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprowFyBMdW5QC2zG0gYUtxJ-hHXqhPfYTct2GzYJKLSHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: O4notuUZSk1pgo_Z_iXzcnhWBMFM3xjE
X-Proofpoint-GUID: O4notuUZSk1pgo_Z_iXzcnhWBMFM3xjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-25_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302260000
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 andersson@kernel.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On 2/24/2023 3:57 PM, Dmitry Baryshkov wrote:
> On Sat, 25 Feb 2023 at 01:51, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>>
>> On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
>>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>>> Add DSC helper functions based on DSC configuration profiles to produce
>>>> DSC related runtime parameters through both table look up and runtime
>>>> calculation to support DSC on DPU.
>>>>
>>>> There are 6 different DSC configuration profiles are supported
>>>> currently.
>>>> DSC configuration profiles are differiented by 5 keys, DSC version
>>>> (V1.1),
>>>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
>>>> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
>>>>
>>>> Only DSC version V1.1 added and V1.2 will be added later.
>>>
>>> These helpers should go to drivers/gpu/drm/display/drm_dsc_helper.c
>>> Also please check that they can be used for i915 or for amdgpu
>>> (ideally for both of them).
>>>
>>> I didn't check the tables against the standard (or against the current
>>> source code), will do that later.
>>>
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/Makefile                   |   1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c | 209
>>>> +++++++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h |  34 ++++
>>>>    3 files changed, 244 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>>>>    create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>>> index 7274c412..28cf52b 100644
>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>>>        disp/dpu1/dpu_hw_catalog.o \
>>>>        disp/dpu1/dpu_hw_ctl.o \
>>>>        disp/dpu1/dpu_hw_dsc.o \
>>>> +    disp/dpu1/dpu_dsc_helper.o \
>>>>        disp/dpu1/dpu_hw_interrupts.o \
>>>>        disp/dpu1/dpu_hw_intf.o \
>>>>        disp/dpu1/dpu_hw_lm.o \
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>>>> new file mode 100644
>>>> index 00000000..88207e9
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>>>> @@ -0,0 +1,209 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights
>>>> reserved
>>>> + */
>>>> +
>>>> +#include <drm/display/drm_dsc_helper.h>
>>>> +#include "msm_drv.h"
>>>> +#include "dpu_kms.h"
>>>> +#include "dpu_hw_dsc.h"
>>>> +#include "dpu_dsc_helper.h"
>>>> +
>>>> +
>>>
>>> Extra empty line
>>>
>>>> +#define DPU_DSC_PPS_SIZE       128
>>>> +
>>>> +enum dpu_dsc_ratio_type {
>>>> +    DSC_V11_8BPC_8BPP,
>>>> +    DSC_V11_10BPC_8BPP,
>>>> +    DSC_V11_10BPC_10BPP,
>>>> +    DSC_V11_SCR1_8BPC_8BPP,
>>>> +    DSC_V11_SCR1_10BPC_8BPP,
>>>> +    DSC_V11_SCR1_10BPC_10BPP,
>>>> +    DSC_RATIO_TYPE_MAX
>>>> +};
>>>> +
>>>> +
>>>> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
>>>> +        0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
>>>> +        0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>>>
>>> Weird indentation
>>>
>>>> +};
>>>> +
>>>> +/*
>>>> + * Rate control - Min QP values for each ratio type in
>>>> dpu_dsc_ratio_type
>>>> + */
>>>> +static char
>>>> dpu_dsc_rc_range_min_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
>>>> +    /* DSC v1.1 */
>>>> +    {0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13},
>>>> +    {0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 17},
>>>> +    {0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
>>>> +    /* DSC v1.1 SCR and DSC v1.2 RGB 444 */
>>>
>>> What is SCR? Is there any reason to use older min/max Qp params
>>> instead of always using the ones from the VESA-DSC-1.1 standard?
>>
>> Standards change request, some vendors may use scr to work with their panel.
>>
>> These table value are provided by system team.
> 
> So, what will happen if we use values from 1.2 standard (aka 1.1 SCR
> 1) with the older panel?
> 

Standards change request means fixing errors/errata for the given 
standard. Those are typically released as a different spec.

So I referred the DSC 1.1 SCR spec, and it does have a few differences 
in the table compared to DSC 1.1 which will get into DSC 1.2.

Hence the table entries are same between DSC 1.1 SCR and DSC 1.2

You are right, ideally DSC 1.2 should be backwards compatible with DSC 
1.1 in terms of the values (thats what the spec says too) but I am not 
sure if we can expect every panel/DP monitor to be forward compatible 
without any SW change because it might need some firmware update (for 
the panel) or SW update to support that especially during transitions of 
the spec revisions (SCR to be precise).

Typically we do below for DP monitors exactly for the same reason:

DSC_ver_to_use = min(what_we_support, what_DP_monitor_supports) and use 
that table.

For DSI panels, typically in the panel spec it should say whether the 
SCR version needs to be used because we have seen that for some panels ( 
I dont remember exactly which one ) based on which panel and which 
revision of the panel, it might not.

Thats why downstream started adding qcom,mdss-dsc-scr-version to the 
devicetree.

>>>> +    {0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 9, 12},
>>>> +    {0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 13, 16},
>>>> +    {0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
> 
> 
