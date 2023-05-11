Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C56FFAF8
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 22:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D647710E0E7;
	Thu, 11 May 2023 20:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CEC10E0E7;
 Thu, 11 May 2023 20:02:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BHoq7E012649; Thu, 11 May 2023 20:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4RTeJimaw1HuVE/ufMevCMTT7pKeRhjm6MlPnqAQjYc=;
 b=KNJbw8SyjbzDSpLWi6wrMXDejrEQ645hYUFKUf82IWX/TLGRclVOLY/U2I7UlG8Cj1hY
 Bmg/f9pgYTaXjTP6XBbumgnyPlDPAnKhsI+mdajq8/OtQkJV00o9H+HlK43FEpeTcxyJ
 gqYNfDZQp+rU82QdBOB979fjlu316+/4LQB+rvGEV9ceFiK4YbwNDrwsUMVPPpSvPHKo
 1wJKzlxyodlOmxs3QPWE8kGME8Ht1anbclMwOr0io4EVvWq+zneWsLxdQrrTTLJzs0f7
 CRfHrUWLFQ4qW3gilJdxunaXoClftQhqBT28CJ5ZrIs7O/5EeB4Wfl9oSfZn5bgC9JYV 7w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qged2k94g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 20:02:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34BK28K8020772
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 20:02:08 GMT
Received: from [10.110.82.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 11 May
 2023 13:02:07 -0700
Message-ID: <2b33b0cc-1c28-e015-8569-8712130514e2@quicinc.com>
Date: Thu, 11 May 2023 13:02:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v7 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-4-df48a2c54421@quicinc.com>
 <4jjgeylpyofynlybonwuveumwvyjphtnbtctu6pwdrigckropw@dmkahbb3au3d>
 <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
 <8c883eb6-26f7-8f82-04a4-d3a556d90138@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <8c883eb6-26f7-8f82-04a4-d3a556d90138@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: zxEArULCrW2BiO1VDnVmp6YSFJcIfbRk
X-Proofpoint-GUID: zxEArULCrW2BiO1VDnVmp6YSFJcIfbRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_15,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110169
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/10/2023 11:28 PM, Dmitry Baryshkov wrote:
> On 11/05/2023 00:03, Jessica Zhang wrote:
>>
>>
>> On 5/9/2023 11:33 PM, Marijn Suijten wrote:
>>> On 2023-05-09 15:06:50, Jessica Zhang wrote:
>>>> Introduce MSM-specific DSC helper methods, as some calculations are
>>>> common between DP and DSC.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++++
>>>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 69 
>>>> ++++++++++++++++++++++++++++++++++++
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
>>>> index 000000000000..29feb3e3b5a4
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>>> @@ -0,0 +1,26 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved
>>>> + */
>>>> +
>>>> +#include <linux/kernel.h>
>>>> +#include <drm/drm_fixed.h>
>>>> +
>>>> +#include "msm_dsc_helper.h"
>>>> +
>>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>>>> +{
>>>> +    return drm_fixp_from_fraction(dsc->slice_width * 
>>>> msm_dsc_get_bpp_int(dsc), 8);
>>>
>>> How about using dsc->slice_chunk_size?
>>
>> Hi Marijn,
>>
>> Thanks for pointing this out. However, I would prefer to keep this 
>> fixed point version of the slice_chunk_size math as the downstream DP 
>> math also uses fixed point [1].
> 
> This is pretty weak argument. Especially since this particular piece of 
> code does lots of wrong or inefficient things.
> 

I guess Jessica's concern was we will have to revalidate some bpc/bpp 
and slice combinations again for DP. So its a question of keeping this 
helper for now and dropping it if unnecessary later or dropping it now 
itself. If the consensus is going to be to drop this, we will just 
re-test the monitors we have and do it.

>>
>> If we are able to confirm that integer math also works for DP, we will 
>> make the change to use slice_chunk_size within the DP DSC series.
> 
> This is why we usually do not accept API-only series. It is next to 
> imposible to judge if the API is good enough without the actual users.
> 
>>
>> I also want to note that this math has stayed the same throughout all 
>> 7 revisions. In the interest of making review more efficient, I think 
>> it would be helpful to point out important details like this early on 
>> in the process. That way we can address major concerns early on and 
>> keep the number of revisions per series low.
> 
> This is not always possible. We grasp the details of the patchset as we 
> review and dive into the patchset under the review and other close 
> enough patches/commits. So it is infrequent but still valid when at some 
> point a reviewer (or the author) would come up with the comments 
> demanding significant changes to the patch.
> 

I dont think Jessica is really complaining about multiple reviewers. Its 
a question of when those reviews are coming. Not reviewing revisions 1-7 
and starting the reviews at revision 8 (that essentially becomes 
revision 1 now) , is going to make this go on forever.

So its a bit frustrating from the developers point of view to just 
ignore revisions 1-7 and start at rev 8.

>>
>> [1] 
>> https://github.com/ianmacd/gts6lwifi/blob/master/drivers/gpu/drm/msm/dp/dp_panel.c#L335 
>>
>>
>>>
>>>> +}
>>>> +
>>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>>> intf_width)
>>>> +{
>>>> +    u32 bytes_per_soft_slice;
>>>> +    s64 bytes_per_soft_slice_fp;
>>>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>>>> +
>>>> +    bytes_per_soft_slice_fp = msm_dsc_get_bytes_per_soft_slice(dsc);
>>>> +    bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>>>> +
>>>> +    return bytes_per_soft_slice * slice_per_intf;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h 
>>>> b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>>> new file mode 100644
>>>> index 000000000000..38f3651d0b79
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>>> @@ -0,0 +1,69 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved
>>>> + */
>>>> +
>>>> +#ifndef MSM_DSC_HELPER_H_
>>>> +#define MSM_DSC_HELPER_H_
>>>> +
>>>> +#include <linux/bug.h>
>>>> +#include <linux/math.h>
>>>> +#include <drm/display/drm_dsc_helper.h>
>>>> +
>>>> +/*
>>>> + * Helper methods for MSM specific DSC calculations that are common 
>>>> between timing engine,
>>>> + * DSI, and DP.
>>>> + */
>>>> +
>>>> +/**
>>>> + * msm_dsc_get_bpp_int - get bits per pixel integer value
>>>
>>> For all function docs, don't forget the trailing parenthesis after the
>>> function name: msm_dsc_get_bpp_int()
>>>
>>> https://www.kernel.org/doc/html/next/doc-guide/kernel-doc.html#function-documentation 
>>>
>>
>> Acked.
>>
>>>
>>>> + * @dsc: Pointer to drm dsc config struct
>>>> + * Returns: BPP integer value
>>>> + */
>>>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
>>>> +{
>>>> +    WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>>>> +    return dsc->bits_per_pixel >> 4;
>>>> +}
>>>> +
>>>> +/**
>>>> + * msm_dsc_get_slice_per_intf - get number of slices per interface
>>>> + * @dsc: Pointer to drm dsc config struct
>>>> + * @intf_width: interface width
>>>> + * Returns: Integer representing the slice per interface
>>>> + */
>>>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>>>> *dsc, int intf_width)
>>>> +{
>>>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>>>
>>> Looks good.
>>>
>>>> +}
>>>> +
>>>> +/**
>>>> + * msm_dsc_get_bytes_per_line - Calculate bytes per line
>>>> + * @dsc: Pointer to drm dsc config struct
>>>> + * Returns: Integer value representing pclk per interface
>>>> + *
>>>> + * Note: This value will then be passed along to DSI and DP for 
>>>> some more
>>>> + * calculations. This is because DSI and DP divide the 
>>>> pclk_per_intf value
>>>> + * by different values depending on if widebus is enabled.
>>>> + */
>>>> +static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config 
>>>> *dsc)
>>>> +{
>>>> +    return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * 
>>>> msm_dsc_get_bpp_int(dsc), 8);
>>>
>>> dsc->slice_chunk_size * dsc->slice_count?
>>
>> Acked.
>>
>>>
>>>> +}
>>>> +
>>>> +/**
>>>> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice 
>>>> for dsc
>>>
>>> Explain to the reader what a "soft" slice is?
>>
>> A soft slice is a slice defined in software as opposed to "hard 
>> slices" that are defined by hardware.
>>
>> Since the slice-related variables in drm_dsc_config hold information 
>> related to soft slices and there is no separate variable for hard 
>> slices, I'll change this name to *_get_bytes_per_slice instead.
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>> - Marijn
>>>
>>>> + * @dsc: Pointer to drm dsc config struct
>>>> + * Returns: s31.32 fixed point value representing bytes per soft slice
>>>> + */
>>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
>>>> +
>>>> +/**
>>>> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
>>>> + * @dsc: Pointer to drm dsc config struct
>>>> + * @intf_width: interface width
>>>> + * Returns: u32 value representing bytes per interface
>>>> + */
>>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>>> intf_width);
>>>> +
>>>> +#endif /* MSM_DSC_HELPER_H_ */
>>>>
>>>> -- 
>>>> 2.40.1
>>>>
> 
