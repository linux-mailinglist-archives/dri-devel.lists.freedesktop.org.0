Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8E66FBC25
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 02:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D8910E326;
	Tue,  9 May 2023 00:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6001410E321;
 Tue,  9 May 2023 00:51:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3490jiEv023960; Tue, 9 May 2023 00:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cUEebjqm+EV2xT7FXHfuiStCdJK79pH3VQ+P0d2mD68=;
 b=A8KpZUjQoiYFQZ4zhFb8iGa0LTZqre2UbJ9Ym9VrSoAZfSjXQ/InXS9eyMqOCuzZIDZ2
 Oel+GhyNUVOiC6NeLTNtiksXBPB8JXAVACvqHGMXgRHDRpmxbGpJD6ZCpJr2DhjIK7CX
 E9SBKVcxHmcOyppFS8MupTm3aYjr2wjrj/VkgYvvMUd4B8HU3cYUP5IKqehUG20kC9Vo
 4N25UHuzNcBc4ldruyF5sLLIteWeCph9Rk0RVefiTroMbbX4ocYNogq3YlcEPGJOUYpR
 bNzO8H78/ph5U5u38RbpmP7aDiejbgN3pbusJfUwTSroLz34emLMTTYjYWCpHTM1hdT6 eA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77h8e79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 00:51:10 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3490p92B012653
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 May 2023 00:51:09 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 17:51:09 -0700
Message-ID: <c969a71a-e922-80f3-fce1-a6b469c75ebe@quicinc.com>
Date: Mon, 8 May 2023 17:51:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 6/7] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-6-cb7f59f0f7fb@quicinc.com>
 <ynr6n5p2envixdn6pycjo4fat6n64xe4pkplhq5c2ukhi2q2tf@hqlsuusl66cl>
 <7ef70055-610c-8ab6-9e3b-515cf3fa542f@quicinc.com>
 <2r5rgl2rxrdognhlisruwgw74stefxmsmmqutz7wd3r4oxy52o@kd4ne4y2dc3u>
 <zuviqzvqnw5cgn3mg7ha55kqggmlxageijryoyv7q4eh3d2h6t@lhegcj7ixd4z>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <zuviqzvqnw5cgn3mg7ha55kqggmlxageijryoyv7q4eh3d2h6t@lhegcj7ixd4z>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pPPgd3QmP3ph-aPKaWuUEt8z8Xl6qX5y
X-Proofpoint-ORIG-GUID: pPPgd3QmP3ph-aPKaWuUEt8z8Xl6qX5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_17,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090006
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/7/2023 11:34 AM, Marijn Suijten wrote:
> On 2023-05-07 17:27:33, Marijn Suijten wrote:
>> On 2023-05-04 15:05:15, Abhinav Kumar wrote:
>>>
>>>
>>> On 5/4/2023 2:56 PM, Marijn Suijten wrote:
>>>> On 2023-04-12 16:25:20, Jessica Zhang wrote:
>>>>> hdisplay for compressed images should be calculated as bytes_per_slice *
>>>>> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
>>>>> dsi_timing_setup instead of directly using mode->hdisplay.
>>>>>
>>>>> Changes in v3:
>>>>> - Split from previous patch
>>>>> - Initialized hdisplay as uncompressed pclk per line at the beginning of
>>>>>     dsi_timing_setup as to not break dual DSI calculations
>>>>>
>>>>> Changes in v4:
>>>>> - Moved pclk_per_intf calculations to DSC hdisplay adjustments
>>>>>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> index 508577c596ff..ae966d4e349d 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>>    		 * pulse width same
>>>>>    		 */
>>>>>    		h_total -= hdisplay;
>>>>> -		hdisplay /= 3;
>>>>> +		hdisplay = msm_dsc_get_pclk_per_intf(msm_host->dsc) / 3;
>>>>
>>>> This patch is unfortunately regressing the Sony Xperia XZ3 (sdm845,
>>>> single DSI), which will only show garbage when it is applied.
>>>>
>>>> Are you sure this is correct, and the helper is returning the right
>>>> values?  I'll see if I can help review and validate those later, and
>>>> debug if necessary.
>>>>
>>>> - Marijn
>>>
>>> To help us debug these kind of issues, can you pls point us to your
>>> panel driver?
>>
>> https://github.com/SoMainline/linux/commit/b154ea72e6c2ca0d4a33a28cc24e3a762dba4948
> 
> I found the fix myself after piecing together the hints provided across
> the many different patch series.  This panel driver assigns
> slice_count=1 based on downstream's qcom,mdss-dsc-slice-per-pkt = <1>,
> but as per the many slice_count-related fixes the latter DT parameter is
> a QCOM-specific hardware feature, whereas slice_count is simply the
> number of slices per line.
> 
> Since a line is a scanline, and that panel has a width of hdisplay=1440
> and a slice_width of 720, the number of slices spanning a line is simply
> slice_count=hdisplay/slice_width=2.  This makes the panel work again
> atop the four-or-so-series without a revert of this patch.
> 
> Is it a big ask to request a single, coherent series fixing all uses of
> slice_count - and implementing support for slice-per-pkt - instead of
> having the patches spread across multiple series?  That makes it much
> easier to cover ground here and review this series, as slice_count seems
> to be used everywhere where downstream used slice_per_pkt - even I
> mistakenly used it after assuming it was the same based on the original
> patches.

Hi Marijn,

Just want to document the changes we agreed on regarding the slice_count 
fixes:

I will move "drm/msm/dsi: Fix calculation for pkt_per_line" to the "Add 
DSC v1.2 Support for DSI" series so that all the 
slice_count/slice_per_pkt fixes are consolidated.

In addition I will also add a patch in "Add DSC v1.2 Support for DSI" to 
remove the incorrect `dsc->slice_count = 1` line in dsi_update_dsc_timing().

Thanks,

Jessica Zhang

> 
> - Marijn
