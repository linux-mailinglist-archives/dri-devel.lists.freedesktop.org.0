Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326CD6FFB08
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 22:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE11B10E5F6;
	Thu, 11 May 2023 20:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0040C10E0DB;
 Thu, 11 May 2023 20:05:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BJWwEu016642; Thu, 11 May 2023 20:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XLlTXjRjRAFAnrh3QAtvPmeVhBNXuAfbHEMY2+iVYx8=;
 b=UDoU+0MqiviVedNF4Pkpmm6WBbOrLPWxVJr75PDn0t3SjreLHuL8nN4L3f99JSW1Gkwl
 WtMPgXl9cBSqy5NtS8k/A/idWSfxlqbsK2Wydtjd9y1do56ldWIGBRZ9OVy0w7Wa3DiA
 5wPF8yUz/E3jgSwBmD2IKQj5rQn4T1jMVCnTANBQtvcgJ/Yh8jredKVpo8ky8m5tU/SZ
 KLZjM+TAzZEazHOOQtnuBZgR/8M27MVN0O0rMqSa6IMSQ9twMG16T/zn17g1zw1PjhuR
 YLuzPFldDcGdz0ErCJvDWV8Wf6agvlN4LCO/DXH2TjA36f//g1ACeAbVXzifNUjN+ge+ 0w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgqekj932-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 20:05:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34BK5Jrv027976
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 20:05:19 GMT
Received: from [10.110.82.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 11 May
 2023 13:05:17 -0700
Message-ID: <c13adcf7-61e0-4665-c281-28d734159255@quicinc.com>
Date: Thu, 11 May 2023 13:05:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v7 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-4-df48a2c54421@quicinc.com>
 <4jjgeylpyofynlybonwuveumwvyjphtnbtctu6pwdrigckropw@dmkahbb3au3d>
 <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
 <rvqyvkpspwos6peqzf3lrmnv4pkxrnyxm2eohdza6yujyykwui@xe2m33ez6mec>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <rvqyvkpspwos6peqzf3lrmnv4pkxrnyxm2eohdza6yujyykwui@xe2m33ez6mec>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: O-uZdxQNGgqCH65lNWXrPEMI-64z0aoT
X-Proofpoint-ORIG-GUID: O-uZdxQNGgqCH65lNWXrPEMI-64z0aoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305110170
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/10/2023 11:15 PM, Marijn Suijten wrote:
> On 2023-05-10 14:03:14, Jessica Zhang wrote:
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
>>>>    drivers/gpu/drm/msm/Makefile         |  1 +
>>>>    drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++++
>>>>    drivers/gpu/drm/msm/msm_dsc_helper.h | 69 ++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 96 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>>> index 7274c41228ed..b814fc80e2d5 100644
>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>> @@ -94,6 +94,7 @@ msm-y += \
>>>>    	msm_atomic_tracepoints.o \
>>>>    	msm_debugfs.o \
>>>>    	msm_drv.o \
>>>> +	msm_dsc_helper.o \
>>>>    	msm_fb.o \
>>>>    	msm_fence.o \
>>>>    	msm_gem.o \
>>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>>> new file mode 100644
>>>> index 000000000000..29feb3e3b5a4
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>>> @@ -0,0 +1,26 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>>>> + */
>>>> +
>>>> +#include <linux/kernel.h>
>>>> +#include <drm/drm_fixed.h>
>>>> +
>>>> +#include "msm_dsc_helper.h"
>>>> +
>>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>>>> +{
>>>> +	return drm_fixp_from_fraction(dsc->slice_width * msm_dsc_get_bpp_int(dsc), 8);
>>>
>>> How about using dsc->slice_chunk_size?
>>
>> Hi Marijn,
>>
>> Thanks for pointing this out. However, I would prefer to keep this fixed
>> point version of the slice_chunk_size math as the downstream DP math
>> also uses fixed point [1].
> 
> That looks like a totally different computation.  For this specific
> value it appears drm_fixp_from_fraction does rounding whereas
> DIV_ROUND_UP always rounds up when used for slice_chunk_size, but these
> values are generally multiples of 8.  slice_chunk_size will also take
> fractional bpp into account (even if unsupported by DPU otherwise).
> 
>> If we are able to confirm that integer math also works for DP, we will
>> make the change to use slice_chunk_size within the DP DSC series.
> 
> Don't think the DP series alone should point that out, as it heavily
> depends on the relation between slice size and bpp parameters, and
> whether those end up with a fractional part or not (are you able to test
> and confirm all those combinations?).  Regardless it seems more natural
> to use slice_chunk_size which is used in various other ways and sent in
> the PPS: it wouldn't make sense to adhere to a different slice byte
> count elsewhere.
> 

They are not totally different.

I guess what Jessica is trying to say here is we will have to do more 
validation with slice/bpp combinations for DP to conclude whether there 
is a difference in math. We can go with two approaches:

1) Either go with slice_chunk_size for now and re-validate with the 
monitors we have and drop this particular helper
2) Keep this particular helper for now and upon more validation if we 
see it's same across more combinations, drop this later.

I just have a slight preference for (2), but looks like your preference 
is for (1) but this is just more validation work for us which is fine I 
guess this time since we will revalidate DP again anyway.

>> I also want to note that this math has stayed the same throughout all 7
>> revisions. In the interest of making review more efficient, I think it
>> would be helpful to point out important details like this early on in
>> the process. That way we can address major concerns early on and keep
>> the number of revisions per series low.
> 
> I've already expressed to Abhinav and you that the revisions for all
> these series were coming in way too hot, leaving no time for review and
> discussions before the next revision hits the list.  If you want to keep
> the number of revisions low, v8 shouln't have already been sent.
> 

You had the concern for DSC 1.2 DPU series from kuogee. So to respect 
that we held that back the entire end of last week and early this week 
(~6 days) and posted today.

Now, you have the same concern with this series from jessica. Sorry, as 
much as i would like to get your feedback on every series, I cannot hold 
back every QC display developer to wait for your reviews on patch rev 1 
before posting patch rev 2. They all work mostly independently. So if 
one reviewer say dmitry has reviewed one revision and we agreed on the 
comments, in the absence of another comment from another reviewer, the 
developer is going to post the next revision for more reviews as its 
more efficient to manage their time as they are in the same context. 
This is nothing unusual from normal upstream development.

If by the time you start reviewing its going to be revision 7 or 8, then 
start it as a fresh review which it is for you, folks are obviously 
going to question why you didnt review revisions 1-7 so far. So I cannot 
take sides on this.

I wish I could help more to accommodate your schedules but its hard to 
control who pushes when with distributed development and tell each of 
them to hold back.

> I desire to review *and test* all these patches (which I believe is in
> everyone's best interest) and have not initially been able to do so as
> all these efforts come out of my free time, which is sometimes limited
> of has been used to finalize the INTF TE series (which is a dependency
> of these series).
> 
> It should be pretty obvious to see that this patch has not had a reply
> from me on any of the previous revisions, and there are more patches
> that I have not been able to comment on yet.
> 
> The alternative to that is of course not seeing enough value in my
> review and testing (or ""late"" comments...) and merging it regardless
> at some point, but that's not up to me to decide.
> 
> - Marijn

Thats true even for mine or other's reviews :) that if i am not able to 
get to some patches on time and other reviewers are happy with it they 
do get landed in the tree. Has happened many times and I have not 
complained. I just fix the issues on top of them (which again happens a 
lot) and move on.

So there doesnt seem to be any rule as such today that wait for this 
particular developer to review and validate.

> 
>>
>> [1]
>> https://github.com/ianmacd/gts6lwifi/blob/master/drivers/gpu/drm/msm/dp/dp_panel.c#L335
>>
>>>
>>>> +}
>>>> +
>>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)
>>>> +{
>>>> +	u32 bytes_per_soft_slice;
>>>> +	s64 bytes_per_soft_slice_fp;
>>>> +	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>>>> +
>>>> +	bytes_per_soft_slice_fp = msm_dsc_get_bytes_per_soft_slice(dsc);
>>>> +	bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>>>> +
>>>> +	return bytes_per_soft_slice * slice_per_intf;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>>> new file mode 100644
>>>> index 000000000000..38f3651d0b79
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>>> @@ -0,0 +1,69 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
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
>>>> + * Helper methods for MSM specific DSC calculations that are common between timing engine,
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
>>
>> Acked.
>>
>>>
>>>> + * @dsc: Pointer to drm dsc config struct
>>>> + * Returns: BPP integer value
>>>> + */
>>>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
>>>> +{
>>>> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>>>> +	return dsc->bits_per_pixel >> 4;
>>>> +}
>>>> +
>>>> +/**
>>>> + * msm_dsc_get_slice_per_intf - get number of slices per interface
>>>> + * @dsc: Pointer to drm dsc config struct
>>>> + * @intf_width: interface width
>>>> + * Returns: Integer representing the slice per interface
>>>> + */
>>>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
>>>> +{
>>>> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
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
>>>> + * Note: This value will then be passed along to DSI and DP for some more
>>>> + * calculations. This is because DSI and DP divide the pclk_per_intf value
>>>> + * by different values depending on if widebus is enabled.
>>>> + */
>>>> +static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config *dsc)
>>>> +{
>>>> +	return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * msm_dsc_get_bpp_int(dsc), 8);
>>>
>>> dsc->slice_chunk_size * dsc->slice_count?
>>
>> Acked.
>>
>>>
>>>> +}
>>>> +
>>>> +/**
>>>> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice for dsc
>>>
>>> Explain to the reader what a "soft" slice is?
>>
>> A soft slice is a slice defined in software as opposed to "hard slices"
>> that are defined by hardware.
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
>>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width);
>>>> +
>>>> +#endif /* MSM_DSC_HELPER_H_ */
>>>>
>>>> -- 
>>>> 2.40.1
>>>>
