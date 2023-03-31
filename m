Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B06D13D5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 02:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610DA10E301;
	Fri, 31 Mar 2023 00:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C7810E301;
 Fri, 31 Mar 2023 00:07:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32UNw649020947; Fri, 31 Mar 2023 00:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PVv+yngciahSuCTzgEKJxghdZYPuOTiCUP5D84dyYm0=;
 b=I5ekw9/1ufk2rD2C/dCpurJaQtKF3s9u9GQjBrfcCBf/xvJ0ghdspN9bvdy4z0PVP2tE
 sn5RAWTYmDoBu1lR0YUiq+CT1GR/h3tmSZhp00PfLhegoCJmf+h0QaEvNIRk+lZfgXYJ
 JxRNL+0EdBBXk3xdiECZIzFOYhBZ49HAtVDGlrGD9BT6woX1P2rvalSyjiIp783qbmCx
 57zBRoFEQoLxod+mAcJnSo8Bd3qecvTOn/kjVXmdEAFdJYtFEjcMgnkUy3yvfsZQZD+e
 Kllw8BuN8vkj0gTbBF6nOx5XCO24ojDpEtqkyLpYPz7iMF/PSnjQizBHjl8k10UkvNRp 8w== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pncx0s328-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 00:07:30 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32V07Tah018319
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 00:07:29 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 30 Mar
 2023 17:07:28 -0700
Message-ID: <6461a8b8-f620-5f9c-9533-f65ac42c0524@quicinc.com>
Date: Thu, 30 Mar 2023 17:07:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
 <0698ce89-d70c-c3f4-f006-18130858aacf@linaro.org>
 <2c9ac12f-df2f-8576-555b-3d84a6205ee3@quicinc.com>
 <c3ac5c2b-e0e0-5d7c-67d3-4fc2316b68c5@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <c3ac5c2b-e0e0-5d7c-67d3-4fc2316b68c5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DKmpaPh4T9ohswR1ACZItFwXWcCuB8rq
X-Proofpoint-GUID: DKmpaPh4T9ohswR1ACZItFwXWcCuB8rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_13,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303300188
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



On 3/30/2023 4:14 PM, Dmitry Baryshkov wrote:
> On 31/03/2023 01:49, Jessica Zhang wrote:
>>
>>
>> On 3/29/2023 4:48 PM, Dmitry Baryshkov wrote:
>>> On 30/03/2023 02:18, Jessica Zhang wrote:
>>>> Use MSM and DRM DSC helper methods.
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
>>>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> index 74d38f90398a..7419fe58a941 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> @@ -31,6 +31,7 @@
>>>>   #include "msm_kms.h"
>>>>   #include "msm_gem.h"
>>>>   #include "phy/dsi_phy.h"
>>>> +#include "disp/msm_dsc_helper.h"
>>>>   #define DSI_RESET_TOGGLE_DELAY_MS 20
>>>> @@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct 
>>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>>   {
>>>>       struct drm_dsc_config *dsc = msm_host->dsc;
>>>>       u32 reg, reg_ctrl, reg_ctrl2;
>>>> -    u32 slice_per_intf, total_bytes_per_intf;
>>>> +    u32 slice_per_intf;
>>>>       u32 pkt_per_line;
>>>>       u32 eol_byte_num;
>>>>       /* first calculate dsc parameters and then program
>>>>        * compress mode registers
>>>>        */
>>>> -    slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>>>> +    slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>>>
>>> This looks good
>>>
>>>>       /*
>>>>        * If slice_count is greater than slice_per_intf
>>>> @@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct 
>>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>>       if (dsc->slice_count > slice_per_intf)
>>>>           dsc->slice_count = 1;
>>>> -    total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>>> +    eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, hdisplay,
>>>> +            dsi_get_bpp(msm_host->format));
>>>> -    eol_byte_num = total_bytes_per_intf % 3;
>>>> -    pkt_per_line = slice_per_intf / dsc->slice_count;
>>>> +    pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;
>>>
>>> And for these values the result is definitely changed. Separate patch 
>>> & description please. Just in case, "values per downstream kernel" is 
>>> not a proper description for such changes.
>>
>> Hi Dmitry,
>>
>> Sure, I can put this into a separate patch.
>>
>> The reason this was changed from slice_count to SLICE_PER_PKT was 
>> because slice count and slice per packet aren't always equivalent. 
>> There can be cases where panel configures DSC to have multiple soft 
>> slices per interface, but the panel only specifies 1 slice per packet.
> 
> Please put this nice description into the commit message. It is exactly 
> what I was looking for!
> 
> BTW: Do you expect to change MSM_DSC_SLICE_PER_PKT later or it will stay 
> at "1"? If so, it might be easier to drop it and instead add a comment.

MSM_DSC_SLICE_PER_PKT is the default value for panels that don't specify 
a slice_per_pkt value. (Now that I think about it, might be better to 
call it MSM_DSC_DEFAULT_SLICE_PER_PKT instead...)

I don't expect it to change in the future, but it's a little more 
readable than just dividing by 1 IMO. If you prefer dropping the macro 
and adding a comment, I'm also okay with that.

Thanks,

Jessica Zhang

> 
> Regarding eol_byte_num, probably the best explanation would be that is 
> is a size of a padding rather than a size of a trailer bytes in a line 
> (and thus original calculation was incorrect).
> 
>>
>>>
>>>>       if (is_cmd_mode) /* packet data type */
>>>>           reg = 
>>>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
>>>> @@ -911,6 +912,11 @@ static void dsi_timing_setup(struct 
>>>> msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>       DBG("");
>>>> +    if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
>>>> +        /* Default widebus_en to false for now. */
>>>> +        hdisplay = msm_dsc_get_pclk_per_line(msm_host->dsc, 
>>>> mode->hdisplay,
>>>> +                dsi_get_bpp(msm_host->format));
>>>> +
>>>
>>> This is definitely something new and thus should probably go into a 
>>> separate patch and be described. Also I'm not sure how does that 
>>> interact with the hdisplay-related calculations below, under the 
>>> if(dsc) clause.
>>
>> After double-checking the math here, I think this part of the change 
>> is actually wrong. pclk_per_line is essentially doing hdisplay / 3, 
>> which is a repeat of what's being done in the `if (dsc)` block.
>>
>> Will replace `hdisplay /= 3` with the pclk_per_line calculation.
> 
> Thanks!
> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>>       /*
>>>>        * For bonded DSI mode, the current DRM mode has
>>>>        * the complete width of the panel. Since, the complete
>>>> @@ -1759,7 +1765,7 @@ static int dsi_populate_dsc_params(struct 
>>>> msm_dsi_host *msm_host, struct drm_dsc
>>>>           return ret;
>>>>       }
>>>> -    dsc->initial_scale_value = 32;
>>>> +    dsc->initial_scale_value = 
>>>> drm_dsc_calculate_initial_scale_value(dsc);
>>>
>>> This is fine, we only support 8bpp where these values match.
>>>
>>>>       dsc->line_buf_depth = dsc->bits_per_component + 1;
>>>>       return drm_dsc_compute_rc_parameters(dsc);
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
