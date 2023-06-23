Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5059E73BF16
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 21:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5851210E6A6;
	Fri, 23 Jun 2023 19:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6915E10E69E;
 Fri, 23 Jun 2023 19:54:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NHScZW006660; Fri, 23 Jun 2023 19:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KJXCSt6vNX6JuN5fiOipIYi6v7+kPoyW7neXNHF/pW0=;
 b=OXJASK/U9jh8flmL6jx8S59WI7AINvtcc+fWLozyHpxn05jJavdy1lpq9YZ7utRgWawL
 np/XX5bWpVX4+XMcdMk0aZT4nbWxLNY+tntJj/1dKyJsD8/FajhWsYpReuLlAHcTHGsB
 W7iJkdYO/4mpegjRakg9YuhTfAyVP/2cC3g/unUSCJvch2BFbPqQp3yyBjqdt9Vqd3dJ
 WaBRWvnxvMiDqTTYovphDSl+FSpBAvJnzm7vP7KY2lhuluoCaIX2kAqFT0lB/Xmo5j92
 5/0jH56tX+g6OvPyQnb1wVVcNRqbdAmJ/wEZO+6VYlPsYo/rJPEpOLwdHCfY5ahORl4t fg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rcju84db5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 19:54:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NJsJre019340
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 19:54:19 GMT
Received: from [10.110.61.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 12:54:18 -0700
Message-ID: <6e2ded6a-63a9-d32a-7a2f-67d3c72b1aa2@quicinc.com>
Date: Fri, 23 Jun 2023 12:54:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
 <e9d5876a-3113-8c79-c2aa-e1ad175f0d84@quicinc.com>
 <b632e52d-7b86-9f5a-913a-aace26d9a039@linaro.org>
 <c2f632e7-8302-a77f-fc61-ccda3b5a8aac@quicinc.com>
 <eqdu44xcd6qdrmxcdr44dfcliydz6q4oombghjg6ptlcbxf22v@uhqnhnlv6gxi>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <eqdu44xcd6qdrmxcdr44dfcliydz6q4oombghjg6ptlcbxf22v@uhqnhnlv6gxi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Wyi_L1pib2UqUke0dCJpyYoyuAyXISdG
X-Proofpoint-GUID: Wyi_L1pib2UqUke0dCJpyYoyuAyXISdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_11,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306230178
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/23/2023 12:26 AM, Marijn Suijten wrote:
> On 2023-06-22 17:32:17, Abhinav Kumar wrote:
>>
>>
>> On 6/22/2023 5:17 PM, Dmitry Baryshkov wrote:
>>> On 23/06/2023 03:14, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 6/19/2023 2:06 PM, Dmitry Baryshkov wrote:
>>>>> Provide actual documentation for the pclk and hdisplay calculations in
>>>>> the case of DSC compression being used.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>
>>>>> Changes since v1:
>>>>> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
>>>>> - Added a pointer from dsi_timing_setup() docs to
>>>>>     dsi_adjust_pclk_for_compression() (Marijn)
>>>>> - Fixed two typo (Marijn)
>>>>>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
>>>>>    1 file changed, 38 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> index 3f6dfb4f9d5a..a8a31c3dd168 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> @@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host
>>>>> *msm_host)
>>>>>        clk_disable_unprepare(msm_host->byte_clk);
>>>>>    }
>>>>> +/**
>>>>> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for
>>>>> compression case
>>>>> + * @mode: the selected mode for the DSI output
>>>>> + * @dsc: DRM DSC configuration for this DSI output
>>>>> + *
>>>>> + * Adjust the pclk rate by calculating a new hdisplay proportional to
>>>>> + * the compression ratio such that:
>>>>> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
>>>>> + *
>>>>> + * Porches do not need to be adjusted:
>>>>> + * - For the VIDEO mode they are not compressed by DSC and are
>>>>> passed as is.
>>>>> + * - For the CMD mode there are no actual porches. Instead these fields
>>>>> + *   currently represent the overhead to the image data transfer. As
>>>>> such, they
>>>>> + *   are calculated for the final mode parameters (after the
>>>>> compression) and
>>>>> + *   are not to be adjusted too.
>>>>> + *
>>>>> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to
>>>>> use
>>>>> + *  refresh rate and data overhead as a starting point of the
>>>>> calculations.
>>>>> + */
>>>>>    static unsigned long dsi_adjust_pclk_for_compression(const struct
>>>>> drm_display_mode *mode,
>>>>>            const struct drm_dsc_config *dsc)
>>>>
>>>> I am fine with this part of the doc.
>>>>
>>>>>    {
>>>>> @@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host
>>>>> *msm_host, bool is_bonded_dsi)
>>>>>            if (ret)
>>>>>                return;
>>>>> -        /* Divide the display by 3 but keep back/font porch and
>>>>> -         * pulse width same
>>>>> +        /*
>>>>> +         * DPU sends 3 bytes per pclk cycle to DSI. If compression is
>>>>> +         * not used, a single pixel is transferred at each pulse, no
>>>>> +         * matter what bpp or pixel format is used. In case of DSC
>>>>> +         * compression this results (due to data alignment
>>>>> +         * requirements) in a transfer of 3 compressed pixel per pclk
>>>>> +         * cycle.
>>>>> +         *
>>>>
>>>> I dont want to talk about data alignment nor formats and I will not
>>>> ack any references to those.
>>>>
>>>> I would like to keep this simple and say that DPU sends 3 bytes of
>>>> compressed data / pclk (6 with widebus enabled) and all this math is
>>>> doing is that its calculating number of bytes and diving it by 3 OR 6
>>>> with widebus to calculate the pclk cycles. Thats it.
>>>
>>> This makes it unclear, why do we simply by 3 rather than doing * dsc_bpp
>>> / 24.  My description might be inaccurate as I don't have hw docs at
>>> hand, but simple description is not enough.
>>>
>>
>> Why is it unclear? With compression, we are saying we process at 3
>> compressed bytes / pclk and this math is accurately giving the pclk cycles.
>>
>> You are once again trying to arrive at 3 with compression factor in mind
>> by calculating target_bpp / src_bpp.
>>
>> I am saying that its independent of that. Whenever we do compression
>> rate is 3 bytes of compressed data (and 6 with widebus) irrespective of
>> what your dsc_bpp was.
> 
> Abhinav, this is exactly what the confusion the pclk series is about.
> There it was said (and committed to mainline now!) that pclk is based on
> the compression factor of target_bpp / src_bpp.  Now you are saying
> there is a fixed number of bytes sent by the (wide)bus between DPU-DSC
> and DSI.
> 
> Is pclk used for more purposes besides just ticking for the data
> transfer between DPU and DSI?
> 

There is no confusion between what was said earlier and now.

This line is calculating the number of pclks needed to transmit one line 
of the compressed data:

hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);

msm_dsc_get_bytes_per_line() is calculating the number of compressed 
bytes as it uses the target bits_per_pixel

126 	 * @bits_per_pixel:
127 	 * Target bits per pixel with 4 fractional bits, bits_per_pixel << 4
128 	 */
129 	u16 bits_per_pixel;

(like I have said a few times, hdisplay is perhaps confusing us)

If you calculate the bytes this way you are already accounting for the 
compression, so where is the confusion.

The pclk calculation does the same thing of using the ratio instead.

> - Marijn
