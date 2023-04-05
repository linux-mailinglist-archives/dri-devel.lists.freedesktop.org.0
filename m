Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDA66D88C2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 22:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9BE10E569;
	Wed,  5 Apr 2023 20:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95B010E29D;
 Wed,  5 Apr 2023 20:39:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 335KaE5I016550; Wed, 5 Apr 2023 20:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xKojwkrbLVuuB+GLIH2O88EU75DH9K1culwn4sx9p4M=;
 b=Sjxk2XRxHO8+OGhZCEEVzS15azB5Ay40YOLe/m5hj89KGmr0SMxIsw7jX/g3N+EF6dP5
 dS8io9yVdz7pwZHg7d9wmgAMJ4KXqtTfbJjCOxyu7MCHrmW0QmxX+0CBto3nATliUyeY
 GFnQXQKUs3jB3++0Rfu3CpjBE/pkpSfINXZR6+35E51ZbIwdFTO3QhQjIH/bfyGFGsne
 /7Xe4izsAT0d9Gj5s2Q1KxIsYTPMBWgvj8tfFFJVwwwbcZ4r+Anu94Fqv6AEziMkn6LJ
 8JJB4kMkbTBU7BsfbBgYtTOUGbZ5L9qHfucnetBIczSCnCRxaGozoqEYdTUg335Fqdjt Qw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prn7qkx1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 20:39:29 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335KdSkc001775
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Apr 2023 20:39:28 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 5 Apr 2023
 13:39:27 -0700
Message-ID: <89b15ad1-773e-314f-a7f1-e03169ca9195@quicinc.com>
Date: Wed, 5 Apr 2023 13:39:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/6] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-4-1b79c78b30d7@quicinc.com>
 <1cf2d02a-e8d7-1aa8-de3f-3321295d2d09@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <1cf2d02a-e8d7-1aa8-de3f-3321295d2d09@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: wqItgUEBPYRjWwaRI1Eq9i9bUqIV-Usr
X-Proofpoint-GUID: wqItgUEBPYRjWwaRI1Eq9i9bUqIV-Usr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_14,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304050184
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



On 4/5/2023 12:27 PM, Dmitry Baryshkov wrote:
> On 05/04/2023 03:41, Jessica Zhang wrote:
>> Use MSM and DRM DSC helper methods to configure DSC for DSI.
>>
>> Changes in V2:
>> - *_calculate_initial_scale_value --> *_set_initial_scale_value
>> - Split pkt_per_line and eol_byte_num changes to a separate patch
>> - Moved pclk_per_line calculation to hdisplay adjustment in `if (dsc)`
>>    block of dsi_update_dsc_timing()
>>
>> Changes in v3:
>> - Split pclk_per_intf calculation into a separate patch
>> - Added slice_width check to dsi_timing_setup
>> - Used MSM DSC helper to calculate total_bytes_per_intf
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 74d38f90398a..6a6218a9655f 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -28,6 +28,7 @@
>>   #include "dsi.xml.h"
>>   #include "sfpb.xml.h"
>>   #include "dsi_cfg.h"
>> +#include "msm_dsc_helper.h"
>>   #include "msm_kms.h"
>>   #include "msm_gem.h"
>>   #include "phy/dsi_phy.h"
>> @@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct 
>> msm_dsi_host *msm_host, bool is_cmd_mod
>>       /* first calculate dsc parameters and then program
>>        * compress mode registers
>>        */
>> -    slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>> +    slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>>       /*
>>        * If slice_count is greater than slice_per_intf
>> @@ -858,7 +859,7 @@ static void dsi_update_dsc_timing(struct 
>> msm_dsi_host *msm_host, bool is_cmd_mod
>>       if (dsc->slice_count > slice_per_intf)
>>           dsc->slice_count = 1;
>> -    total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>> +    total_bytes_per_intf = msm_dsc_get_bytes_per_intf(dsc, hdisplay);
>>       eol_byte_num = total_bytes_per_intf % 3;
>>       pkt_per_line = slice_per_intf / dsc->slice_count;
>> @@ -936,6 +937,12 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>               return;
>>           }
>> +        if (!dsc->slice_width || (mode->hdisplay < dsc->slice_width)) {
>> +            pr_err("DSI: invalid slice width %d (pic_width: %d)\n",
>> +                   dsc->slice_width, mode->hdisplay);
>> +            return;
>> +        }
> 
> This is not the "use of MSM and DRM DSC helper methods" and thus should 
> be moved to a separate patch.

Hi Dmitry,

Acked.

Thanks,

Jessica Zhang

> 
>> +
>>           dsc->pic_width = mode->hdisplay;
>>           dsc->pic_height = mode->vdisplay;
>>           DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>> @@ -1759,7 +1766,7 @@ static int dsi_populate_dsc_params(struct 
>> msm_dsi_host *msm_host, struct drm_dsc
>>           return ret;
>>       }
>> -    dsc->initial_scale_value = 32;
>> +    drm_dsc_set_initial_scale_value(dsc);
>>       dsc->line_buf_depth = dsc->bits_per_component + 1;
>>       return drm_dsc_compute_rc_parameters(dsc);
>>
> 
> -- 
> With best wishes
> Dmitry
> 
