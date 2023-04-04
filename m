Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DB6D68CF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4517410E708;
	Tue,  4 Apr 2023 16:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C8310E3FC;
 Tue,  4 Apr 2023 16:29:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 334FvmGx004498; Tue, 4 Apr 2023 16:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nNMMlQ5N7e+GXtSfU0QQZXth2Kyd8/tQoFFwHxweLm8=;
 b=nJYGD2Efldh3mVPjlmNMh8UjlSvcf7LzZzMnB1A+9whHHkFpw4Ck5hs7Y9KCJ1DXeGW0
 jSkzJFozFl0A887mqxT7E5Wjqe7pU9maYFpStQCwGaBnhGb13i4BTq6UwzuC+7t54DSi
 dksFLfssHlrCeug2FBhe2dc35fulCeyMIA1OEH04lgD6qD5B9s9/8JVz7+JiqvS2H6LN
 1UBk89iE38am2xZxvbC3M0M1C8cTjdvj3ZLe2tQHLk95/ZctBXcOK5t3tmQdxjPFin8P
 55K+vZkd6sZZ7L1sw9eXbGoRrcYCNVKpTPYDAgtEwMb8YQQ4FYu/WUe0EU9IMb0GfwfD WA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prpg205jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Apr 2023 16:29:15 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 334GTDdf002032
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Apr 2023 16:29:13 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 4 Apr 2023
 09:29:13 -0700
Message-ID: <3e2c8780-5074-062e-567e-6e75467e50c7@quicinc.com>
Date: Tue, 4 Apr 2023 09:29:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC v2 2/6] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-2-3c13ced536b2@quicinc.com>
 <5b4a3305-1e26-220d-a770-1f6945fbac7a@linaro.org>
 <acdd6ae0-a6e8-3338-5e68-44a93f94de77@quicinc.com>
 <2591482a-a259-5406-83b8-4afeee9e3a43@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <2591482a-a259-5406-83b8-4afeee9e3a43@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sm-kZnV6j3zEK6d8HfzdwkQxlkYWqddx
X-Proofpoint-ORIG-GUID: sm-kZnV6j3zEK6d8HfzdwkQxlkYWqddx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_08,2023-04-04_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=997 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040153
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



On 4/3/2023 5:33 PM, Dmitry Baryshkov wrote:
> On 04/04/2023 00:38, Jessica Zhang wrote:
>>
>>
>> On 4/2/2023 4:21 AM, Dmitry Baryshkov wrote:
>>> On 31/03/2023 21:49, Jessica Zhang wrote:
>>>> Introduce MSM-specific DSC helper methods, as some calculations are
>>>> common between DP and DSC.
>>>>
>>>> Changes in v2:
>>>> - Moved files up to msm/ directory
>>>> - Dropped get_comp_ratio() helper
>>>> - Used drm_int2fixp() to convert to integers to fp
>>>> - Style changes to improve readability
>>>> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
>>>> - Changed msm_dsc_get_slice_per_intf() to a static inline method
>>>> - Dropped last division step of msm_dsc_get_pclk_per_line() and changed
>>>>    method name accordingly
>>>> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
>>>> - Fixed some math issues caused by passing in incorrect types to
>>>>    drm_fixed methods in get_bytes_per_soft_slice()
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 53 
>>>> ++++++++++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 42 
>>>> ++++++++++++++++++++++++++++
>>>>   3 files changed, 96 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/Makefile 
>>>> b/drivers/gpu/drm/msm/Makefile
>>>> index 7274c41228ed..b814fc80e2d5 100644
>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>> @@ -94,6 +94,7 @@ msm-y += \
>>>>       msm_atomic_tracepoints.o \
>>>>       msm_debugfs.o \
>>>>       msm_drv.o \
>>>> +    msm_dsc_helper.o \
>>>>       msm_fb.o \
>>>>       msm_fence.o \
>>>>       msm_gem.o \
>>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c 
>>>> b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>>> new file mode 100644
>>>> index 000000000000..60b73e17e6eb
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>>> @@ -0,0 +1,53 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved
>>>> + */
>>>> +
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/errno.h>
>>>> +#include <drm/drm_fixed.h>
>>>> +
>>>> +#include "msm_drv.h"
>>>> +#include "msm_dsc_helper.h"
>>>> +
>>>> +static s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc, int 
>>>> intf_width, u32 src_bpp)
>>>
>>> intf_width is unused
>>
>> Hi Dmitry,
>>
>> Acked.
>>
>>>
>>>> +{
>>>> +    int bpp = msm_dsc_get_bpp_int(dsc);
>>>> +    s64 numerator_fp, denominator_fp;
>>>> +    s64 comp_ratio_fp = drm_fixp_from_fraction(src_bpp, bpp);
>>>> +
>>>> +    numerator_fp = drm_int2fixp(dsc->slice_width * 3);
>>>
>>> You have lost dsc->bits_per_component here.
>>
>> This was moved to the denominator calculation, but I'll move it back 
>> to this line to avoid confusion.
> 
> Maybe you occasionally mixed bpp and bpc, because there is no 
> bits_per_component usage in denominator. Could you please recheck the 
> calculations.
> 
>>
>>>
>>>> +    denominator_fp = drm_fixp_from_fraction(comp_ratio_fp * 8, 
>>>> drm_int2fixp(bpp));
>>>
>>> denominator_fp = drm_fixp_from_fraction(src_bpp * 8, bpp);
>>
>> Acked.
>>
>>>
>>>> +
>>>> +    return drm_fixp_div(numerator_fp, denominator_fp);
>>>> +}
>>>> +
>>>> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int 
>>>> intf_width, u32 src_bpp)
>>>> +{
>>>> +    u32 bytes_per_soft_slice, extra_eol_bytes, bytes_per_intf;
>>>> +    s64 bytes_per_soft_slice_fp;
>>>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>>>> +
>>>> +    bytes_per_soft_slice_fp = get_bytes_per_soft_slice(dsc, 
>>>> intf_width, src_bpp);
>>>> +    bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>>>> +
>>>> +    bytes_per_intf = bytes_per_soft_slice * slice_per_intf;
>>>> +    extra_eol_bytes = bytes_per_intf % 3;
>>>> +    if (extra_eol_bytes != 0)
>>>> +        extra_eol_bytes = 3 - extra_eol_bytes;
>>>
>>> I become confused here when I checked eol_bytes in the display techpack.
>>>
>>> I see that for DP the dp_panel_dsc_pclk_param_calc() calculates 
>>> dsc->eol_bytes_num in this way, the size to pad dsc_byte_count * 
>>> slice_per_intf to 3 bytes.
>>>
>>> However, for DSI this is a simple as total_bytes_per_intf % 3 , so it 
>>> is not a padding, but a length of the last chunk.
>>>
>>> Could you please clarify? If the techpack code is correct, I'd prefer 
>>> if we return last chunk size here and calculate the padding length in 
>>> the DP driver.
>>
>> I've double checked the calculations between DP and DSI, and I think 
>> you're right. Will move the `if (extra_eol_bytes != 0)` block out to 
>> DP code.
> 
> Ack. Could you please check with HW team that our understanding is correct?

Hey Dmitry,

I've checked with the HW team and looks like the math for eol_byte_nums 
differs between DP and DSI.

For DSI, eol_byte_num = bytes_per_intf % 3

But for DP, eol_byte_num = (bytes_per_intf % 3 == 0) ? 0 : 3 - 
bytes_per_intf % 3 *only* for non-widebus.

For DP && widebus enabled, eol_byte_num = (bytes_per_intf % 6 == 0) ? 0 
: 6 - bytes_per_intf % 6

In that case, we should move even the bytes_per_intf % 3 out and change 
this method to msm_dsc_get_bytes_per_intf() instead.

Thanks,

Jessica Zhang

> 
>>
>>>
>>>> +
>>>> +    return extra_eol_bytes;
>>>> +}
>>>> +
>>>> +int msm_dsc_get_uncompressed_pclk_per_line(struct drm_dsc_config 
>>>> *dsc, int intf_width, u32 src_bpp)
>>>
>>> Basing on Abhinav's description ("pclk_per_line can be only per 
>>> interface") would it better be named as 
>>> msm_dsc_get_uncompressed_pclk_per_intf() ? or 
>>> msm_dsc_get_uncompressed_pclk_for_intf() ?
>>>
>>> BTW: if get_bytes_per_soft_slice() doesn't use intf_width, we can 
>>> probably drop it here too.
>>>
>>>> +{
>>>> +    s64 data_width;
>>>> +
>>>> +    if (!dsc->slice_width || (intf_width < dsc->slice_width))
>>>> +        return -EINVAL;
>>>
>>> Error code is not validated at dsi_timing_setup. I'd suggest moving 
>>> error checks there and dropping the error handling here. If 
>>> dsc->slice_width is not set, we should stop much earlier than 
>>> drm_bridge's pre_enable() callback.
>>
>> Acked.
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>> +
>>>> +    data_width = drm_fixp_mul(dsc->slice_count,
>>>> +            get_bytes_per_soft_slice(dsc, intf_width, src_bpp));
>>>> +
>>>> +    return drm_fixp2int_ceil(data_width);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h 
>>>> b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>>> new file mode 100644
>>>> index 000000000000..743cd324b7d9
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>>> @@ -0,0 +1,42 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved
>>>> + */
>>>> +
>>>> +#ifndef MSM_DSC_HELPER_H_
>>>> +#define MSM_DSC_HELPER_H_
>>>> +
>>>> +#include <drm/display/drm_dsc_helper.h>
>>>> +#include <drm/drm_modes.h>
>>>> +
>>>> +/*
>>>> + * Helper methods for MSM specific DSC calculations that are common 
>>>> between timing engine,
>>>> + * DSI, and DP.
>>>> + */
>>>> +
>>>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
>>>> +{
>>>> +    WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>>>> +    return dsc->bits_per_pixel >> 4;
>>>> +}
>>>> +
>>>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>>>> *dsc, int intf_width)
>>>> +{
>>>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>>>> +}
>>>> +
>>>> +static inline u32 msm_dsc_get_dce_bytes_per_line(struct 
>>>> drm_dsc_config *dsc, int intf_width)
>>>> +{
>>>> +    return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
>>>> +}
>>>> +
>>>> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int 
>>>> intf_width, u32 src_bpp);
>>>> +u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int 
>>>> intf_width);
>>>> +
>>>> +/* Calculate uncompressed pclk per line. This value will then be 
>>>> passed along to
>>>> + * DSI and DP to calculate pclk_per_line. This is because DSI and 
>>>> DP divide the
>>>> + * uncompressed pclk_per_line by different values depending on if 
>>>> widebus is enabled.
>>>> + */
>>>> +int msm_dsc_get_uncompressed_pclk_per_line(struct drm_dsc_config *dsc,
>>>> +        int intf_width, u32 src_bpp);
>>>> +#endif /* MSM_DSC_HELPER_H_ */
>>>>
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
>>>
> 
> -- 
> With best wishes
> Dmitry
> 
