Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7BB703EA0
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 22:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C9510E278;
	Mon, 15 May 2023 20:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AAC10E278;
 Mon, 15 May 2023 20:29:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FJLnZT026627; Mon, 15 May 2023 20:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=54MEuekPaSusawEzK869z4HJqcYaW+vxC8zoGzjQGu8=;
 b=Z5CSFB45PxwDb4Xt2+B0710x/0miPgx5tT5ey0FOHKOdOLHz/HUoGRggnaOJPVS4BFaL
 4y0MmGzdSb+If7RxFimkhgq9uPG/b8+m18NPl+wXG8lguZzNyTS7Gpl4d4uVGbYl3qVy
 QYTzNKiJ0klAxC1rjwKGWHMRxH5q848DY98CX/G+5yjsC6T36Y2Xw80RbYdQ+w8oZB5a
 AP9IRUDutxp+dSJ6HKLiXY2LiKNnIdxb3Qo6bJzm/vufmV4X09Ep3HYneWjvXlfYg3OU
 +MVaueJ57nq+DqblmuiFrm3dCxqFdCKoWRMB7QeyqG03SOGQj1C9dICruuDZ9cPBpExa NA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkkq99dxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 20:29:25 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34FKTOIr002783
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 20:29:24 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 13:29:22 -0700
Message-ID: <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
Date: Mon, 15 May 2023 13:29:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
 <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QoH3VRNLDjn4r0moH4iS3h5iw6POqj-Q
X-Proofpoint-ORIG-GUID: QoH3VRNLDjn4r0moH4iS3h5iw6POqj-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_18,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=875 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305150169
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/14/2023 2:25 PM, Marijn Suijten wrote:
> On 2023-05-12 14:32:14, Jessica Zhang wrote:
>>
>> Introduce MSM-specific DSC helper methods, as some calculations are
>> common between DP and DSC.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 65 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> new file mode 100644
>> index 000000000000..0d2a097b428d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>> + */
>> +
>> +#ifndef MSM_DSC_HELPER_H_
>> +#define MSM_DSC_HELPER_H_
>> +
>> +#include <linux/bug.h>
>> +#include <linux/math.h>
>> +#include <drm/display/drm_dsc_helper.h>
>> +
>> +/*
>> + * Helper methods for MSM specific DSC calculations that are common between timing engine,
>> + * DSI, and DP.
>> + */
> 
> Isn't this more common to have directly below the copyright statement,
> above the includes?

Hi Marijn,

Acked.

> 
>> +
>> +/**
>> + * msm_dsc_get_bpp_int() - get bits per pixel integer value
>> + * @dsc: Pointer to drm dsc config struct
>> + * Returns: BPP integer value
>> + */
>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
> 
> Const, as requested elsewhere.  But this function is not used anywhere
> in any of the series (because we replaced the usages with more sensible
> member accesses like slice_chunk_size).

Acked.

I would prefer to keep this helper so that we have a way to easily get 
BPP information from the DRM DSC config in the future, but if you'd 
prefer we add this helper then, I'm also ok with that.

> 
>> +{
>> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>> +	return dsc->bits_per_pixel >> 4;
>> +}
>> +
>> +/**
>> + * msm_dsc_get_slice_per_intf() - get number of slices per interface
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
> 
> Width of the interface (to query), *in pixels*

Acked.

> 
>> + * Returns: Integer representing the slice per interface
> 
> the *number of slices* per interface.
> 
> Also, the returned value applies specifically to *the given interface*
> (width).

Acked.

> 
>> + */
>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
> 
> Const pointer.
> 
> Also: sliceS_per_intf?  It's pluiral in the docs too.
> 
> Should the argument and return value be u32, to match the uses?  Same
> for everything below.

Acked.

> 
>> +{
>> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
>> +}
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_line() - Calculate bytes per line
> 
> Calculate -> (lowecase) get
> (to match all the other helpers in this file)

Acked.

> 
>> + * @dsc: Pointer to drm dsc config struct
>> + * Returns: Integer value representing pclk per interface
>> + *
>> + * Note: This value will then be passed along to DSI and DP for some more
>> + * calculations. This is because DSI and DP divide the pclk_per_intf value
>> + * by different values depending on if widebus is enabled.
> 
> Can you elaborate what this "note" is trying to tell users of this
> function?  That they should not use bytes_per_line raw?  That it doesn't
> actually represent bytes_per_line if the extra calculations mentioned
> here are not applied?

The latter -- this method is used for calculating the pclk for DSI and 
DP. While it does get the raw bytes_per_line, there are some extra 
calculations needed before it can be set as the pclk_rate. These "extra 
calculations" are different between DP and DSI.

For more context, please refer to the earlier revisions of this patch 
and the usage of the helper in dsi_host.c

> 
>> + */
>> +static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config *dsc)
> 
> const, return u32.

Acked.

> 
>> +{
>> +	return dsc->slice_count * dsc->slice_chunk_size;
> 
> This is a u8 times a u16.  Could it overflow a u16 and should we hence
> cast one of the expressions to u32 first?

Acked.

> 
>> +}
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_intf() - get total bytes per interface
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
>> + * Returns: u32 value representing bytes per interface
> 
> Nit: no need to repeat the type, I think?  Just "number of bytes per
> interface" is more concise.

Acked.

> 
>> + */
>> +static inline u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)
> 
> And one more const.  

Acked.

> Not sure that this helper is useful though: it is
> only used where msm_dsc_get_slice_per_intf() was already called, so it
> makes more sense to the reader to just multiply slice_per_intf by
> slice_chunk_size than to defer to an opaque helper.

I would prefer to keep this as a helper as this math is common between 
DP and DSI, and I believe the name of the helper accurately reflects 
what is being calculated.

If there's any confusion with the name of the method, I am open to 
suggestions.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> +{
>> +	return dsc->slice_chunk_size * msm_dsc_get_slice_per_intf(dsc, intf_width);
>> +}
>> +
>> +#endif /* MSM_DSC_HELPER_H_ */
>>
>> -- 
>> 2.40.1
>>
