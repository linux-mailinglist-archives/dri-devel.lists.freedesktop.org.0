Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89C80B064
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 00:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2506210EB5E;
	Fri,  8 Dec 2023 23:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CD210EB57;
 Fri,  8 Dec 2023 23:09:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8MHQrc026832; Fri, 8 Dec 2023 23:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tQ6grR4LJdqpwYa3CRtd1/jjh2P7zwynOMleaQIDQh8=;
 b=RGQOq4w0mqobbvlFfrHSYweW/KymVO3Li2xkVks2Ap8ISiiF9jcB5XAmYTJH+YWnUb+M
 VItQr8POsCSZ01OxR77hrehWT0MNyawjb5EepOjL5YO6bBveuvI7asx7/uN/gAoC62gy
 43lIWY5vTNtPRo7UZs7Xu2nEm0zqSmPcjmwC4eMPPsKG4Tkqzjk9ilVDqL75/n0ozTz0
 tFkV6Y8JltV/XkKOCS0gERPQseP62Tq6uqC81skYpG6T0F+1Sn/C9hTtFy2ITrcS8fnU
 8vkON6aDGjwJ2yKOHZpNd8Okb2qhCIrY4NAdneXJnq2uAn7vWSzC9iJU/2+Y9cp0ym7T 8g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuyxb1nqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 23:09:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8N9Zvb028854
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 23:09:35 GMT
Received: from [10.110.30.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 15:09:33 -0800
Message-ID: <1ab1862b-f486-00ee-91b4-ae20ff9e4321@quicinc.com>
Date: Fri, 8 Dec 2023 15:09:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: introduce separate wb2_format
 arrays for rgb and yuv
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-16-quic_abhinavk@quicinc.com>
 <CAA8EJpqfCfETawp1up76S6gryO+Q4KxPB3ThwZCe7DCkp=GkBQ@mail.gmail.com>
 <8eea4a8e-0c70-3768-79f0-1a2bfe083ed7@quicinc.com>
 <CAA8EJpoLzgwEYRcSKZUY1W9KUE9s3WR_bzpA3hmf5X9JGDGutA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoLzgwEYRcSKZUY1W9KUE9s3WR_bzpA3hmf5X9JGDGutA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dIwmZZZBLyp8LljmQfK7fpc6qbz1m5Ye
X-Proofpoint-GUID: dIwmZZZBLyp8LljmQfK7fpc6qbz1m5Ye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_14,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312080193
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



On 12/8/2023 12:45 PM, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 19:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> On 12/8/2023 3:44 AM, Dmitry Baryshkov wrote:
>>> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> Lets rename the existing wb2_formats array wb2_formats_rgb to indicate
>>>> that it has only RGB formats and can be used on any chipset having a WB
>>>> block.
>>>>
>>>> Introduce a new wb2_formats_rgb_yuv array to the catalog to
>>>> indicate support for YUV formats to writeback in addition to RGB.
>>>>
>>>> Chipsets which have support for CDM block will use the newly added
>>>> wb2_formats_rgb_yuv array.
>>>
>>> This means that the catalog can go out of sync, if one adds a CDM
>>> block but doesn't update wb_formats and vice versa.
>>> Can we deduce the format list from the WB code? Is the format list
>>> really static or does it change between platforms (please keep msm8996
>>> / msm8998 in mind).
>>>
>>
>> Yes this is a valid concern. catalog could potentially go out of sync.
>>
>> I checked a few chipsets now and the WB formats didnt change among them.
>>
>> I do need to check more chipsets but downstream does not maintain this
>> in devicetree which means we can just move these arrays to WB code
>> instead of maintaining them in the catalog.
> 
> I think we should be comparing to some of the oldest generations, like
> msm8998/sdm660 or ideally even msm8996/37/17/53.
> 

I compared msm8998 just now and it does have different wb2 formats 
supported as compared to sc7280/sm8250.

So unfortunately, this will have to remain in catalog for now.

>> We will still need to maintain two arrays. One to be used if CDM block
>> has been added and the other if not.
> 
> Yes.
> 

>> I must confess one point though. I have not seen any chipset yet where
>> WB block is present but CDM block is not.
> 
> I think this was the case for some of mdp5 1.x chips, but according to
> my data this is correct for all the platforms that we want to support.
> 
>> So at this point, the only purpose of the two arrays will be till the
>> point where CDM blk has been added to all the required chipsets in the
>> catalog. Then we can drop the RGB only array and maintain the one which
>> has all formats.
>>

I think if we have to generalize this, some more study is needed of how 
to maintain this in the catalog without missing out on some more 
formats. But for now, what do you think of below approach:

1) We have these two arrays as I have added these only for sc7280/sm8250 
and have confirmed that the formats listed there are accurate. At the 
very least, they do not expose more formats than what is supported. So 
even if someone adds CDM for other chipsets, they can re-use 
wb2_formats_rgb_and_yuv. It will certainly work just that its not the 
full list of supported formats.

2) Even if we do add CDM to other chipsets, what I can confirm is this 
will not break them as the list of formats we have right now are only 
lesser than the full list and not more.

3) In the follow up RFT which we discussed in the cover letter, let me 
try to re-factor wb2_formats based on the list of chipsets that are 
present in catalog including the older ones you have listed.

The issue is wb2_formats (so writeback) and not CDM itself as these are 
supported WB formats. So I think we need to re-work this a bit.

>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>    .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |  4 +-
>>>>    .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  4 +-
>>>>    .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  4 +-
>>>>    .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  4 +-
>>>>    .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 +-
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 37 ++++++++++++++++++-
>>>>    6 files changed, 46 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
>>>> index 04d2a73dd942..eb5dfff2ec4f 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
>>>> @@ -341,8 +341,8 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
>>>>                   .name = "wb_2", .id = WB_2,
>>>>                   .base = 0x65000, .len = 0x2c8,
>>>>                   .features = WB_SM8250_MASK,
>>>> -               .format_list = wb2_formats,
>>>> -               .num_formats = ARRAY_SIZE(wb2_formats),
>>>> +               .format_list = wb2_formats_rgb,
>>>> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb),
>>>>                   .xin_id = 6,
>>>>                   .vbif_idx = VBIF_RT,
>>>>                   .maxlinewidth = 4096,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>> index 58b0f50518c8..a57d50b1f028 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>> @@ -336,8 +336,8 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
>>>>                   .name = "wb_2", .id = WB_2,
>>>>                   .base = 0x65000, .len = 0x2c8,
>>>>                   .features = WB_SM8250_MASK,
>>>> -               .format_list = wb2_formats,
>>>> -               .num_formats = ARRAY_SIZE(wb2_formats),
>>>> +               .format_list = wb2_formats_rgb_yuv,
>>>> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>>>>                   .clk_ctrl = DPU_CLK_CTRL_WB2,
>>>>                   .xin_id = 6,
>>>>                   .vbif_idx = VBIF_RT,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>> index bcfedfc8251a..7382ebb6e5b2 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>> @@ -157,8 +157,8 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
>>>>                   .name = "wb_2", .id = WB_2,
>>>>                   .base = 0x65000, .len = 0x2c8,
>>>>                   .features = WB_SM8250_MASK,
>>>> -               .format_list = wb2_formats,
>>>> -               .num_formats = ARRAY_SIZE(wb2_formats),
>>>> +               .format_list = wb2_formats_rgb,
>>>> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb),
>>>>                   .clk_ctrl = DPU_CLK_CTRL_WB2,
>>>>                   .xin_id = 6,
>>>>                   .vbif_idx = VBIF_RT,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>> index 19c2b7454796..2f153e0b5c6a 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>> @@ -169,8 +169,8 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
>>>>                   .name = "wb_2", .id = WB_2,
>>>>                   .base = 0x65000, .len = 0x2c8,
>>>>                   .features = WB_SM8250_MASK,
>>>> -               .format_list = wb2_formats,
>>>> -               .num_formats = ARRAY_SIZE(wb2_formats),
>>>> +               .format_list = wb2_formats_rgb_yuv,
>>>> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>>>>                   .clk_ctrl = DPU_CLK_CTRL_WB2,
>>>>                   .xin_id = 6,
>>>>                   .vbif_idx = VBIF_RT,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>> index bf56265967c0..ad48defa154f 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>> @@ -315,8 +315,8 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
>>>>                   .name = "wb_2", .id = WB_2,
>>>>                   .base = 0x65000, .len = 0x2c8,
>>>>                   .features = WB_SM8250_MASK,
>>>> -               .format_list = wb2_formats,
>>>> -               .num_formats = ARRAY_SIZE(wb2_formats),
>>>> +               .format_list = wb2_formats_rgb,
>>>> +               .num_formats = ARRAY_SIZE(wb2_formats_rgb),
>>>>                   .xin_id = 6,
>>>>                   .vbif_idx = VBIF_RT,
>>>>                   .maxlinewidth = 4096,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index 1be3156cde05..c52cac7a2288 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> @@ -202,7 +202,7 @@ static const u32 rotation_v2_formats[] = {
>>>>           /* TODO add formats after validation */
>>>>    };
>>>>
>>>> -static const uint32_t wb2_formats[] = {
>>>> +static const uint32_t wb2_formats_rgb[] = {
>>>>           DRM_FORMAT_RGB565,
>>>>           DRM_FORMAT_BGR565,
>>>>           DRM_FORMAT_RGB888,
>>>> @@ -236,6 +236,41 @@ static const uint32_t wb2_formats[] = {
>>>>           DRM_FORMAT_XBGR4444,
>>>>    };
>>>>
>>>> +static const uint32_t wb2_formats_rgb_yuv[] = {
>>>> +       DRM_FORMAT_RGB565,
>>>> +       DRM_FORMAT_BGR565,
>>>> +       DRM_FORMAT_RGB888,
>>>> +       DRM_FORMAT_ARGB8888,
>>>> +       DRM_FORMAT_RGBA8888,
>>>> +       DRM_FORMAT_ABGR8888,
>>>> +       DRM_FORMAT_XRGB8888,
>>>> +       DRM_FORMAT_RGBX8888,
>>>> +       DRM_FORMAT_XBGR8888,
>>>> +       DRM_FORMAT_ARGB1555,
>>>> +       DRM_FORMAT_RGBA5551,
>>>> +       DRM_FORMAT_XRGB1555,
>>>> +       DRM_FORMAT_RGBX5551,
>>>> +       DRM_FORMAT_ARGB4444,
>>>> +       DRM_FORMAT_RGBA4444,
>>>> +       DRM_FORMAT_RGBX4444,
>>>> +       DRM_FORMAT_XRGB4444,
>>>> +       DRM_FORMAT_BGR565,
>>>> +       DRM_FORMAT_BGR888,
>>>> +       DRM_FORMAT_ABGR8888,
>>>> +       DRM_FORMAT_BGRA8888,
>>>> +       DRM_FORMAT_BGRX8888,
>>>> +       DRM_FORMAT_XBGR8888,
>>>> +       DRM_FORMAT_ABGR1555,
>>>> +       DRM_FORMAT_BGRA5551,
>>>> +       DRM_FORMAT_XBGR1555,
>>>> +       DRM_FORMAT_BGRX5551,
>>>> +       DRM_FORMAT_ABGR4444,
>>>> +       DRM_FORMAT_BGRA4444,
>>>> +       DRM_FORMAT_BGRX4444,
>>>> +       DRM_FORMAT_XBGR4444,
>>>> +       DRM_FORMAT_NV12,
>>>> +};
>>>> +
>>>>    /*************************************************************
>>>>     * SSPP sub blocks config
>>>>     *************************************************************/
>>>> --
>>>> 2.40.1
>>>>
>>>
>>>
> 
> 
> 
