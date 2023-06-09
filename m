Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3829A728CAE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 02:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2585510E622;
	Fri,  9 Jun 2023 00:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD75B10E620;
 Fri,  9 Jun 2023 00:57:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3590t9Hc016372; Fri, 9 Jun 2023 00:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2fKYjIDFEeEZLcNjFbw+D0NMeTE+q9kGiCeEcA4lLtk=;
 b=W5JmTs/usrvuFDCJ/boNJ1+bM/NUW/khjxwYQgf50obhv04//qZZlo3NmdEKA/9xpdUh
 yRuUItgWPQHM3/L6yA52JFCI195RjSFQJCJyxh5pVEB3JQbfl79nHJVBWC8qnF09uMua
 eh/anWpMsLwyITadXg4XYK8is6P5RwlHykFbQMjwqaDnRPHwYRpIwKYz1itifh2kOMlJ
 46mN+KQBPDUPngNrpeckXiFa9RHBYzLkXTbxDik1wZVHpxHgvMwZaLuBzbTEi0gVuyUQ
 KYXbX9DKEwQ0SvPKTn5FenKXP7uFgCYGu9TWYwK8csm4AQBrQTt16IcFND9DClq8c8bH 0g== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3ceahrc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 00:57:10 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3590v90K018969
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Jun 2023 00:57:09 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 8 Jun 2023
 17:57:09 -0700
Message-ID: <f63435ca-933a-52be-d879-1d9cc9441107@quicinc.com>
Date: Thu, 8 Jun 2023 17:56:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [Freedreno] [PATCH v5 2/5] drm/msm/dsi: Adjust pclk rate for
 compression
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v5-0-028c10850491@quicinc.com>
 <20230405-add-dsc-support-v5-2-028c10850491@quicinc.com>
 <js3mcglahq53mcyxa6deltjlu4xpc2pnafwz2rbk3dl4ovws2o@5xw2wzvfaj2v>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <js3mcglahq53mcyxa6deltjlu4xpc2pnafwz2rbk3dl4ovws2o@5xw2wzvfaj2v>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dgpT9CpmNtolv6oCYWIg6GyWsAc3tpoH
X-Proofpoint-GUID: dgpT9CpmNtolv6oCYWIg6GyWsAc3tpoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_18,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090006
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
Cc: freedreno@lists.freedesktop.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/8/2023 1:36 PM, Marijn Suijten wrote:
> Same title suggestion as earlier: s/adjust/reduce

Hi Marijn,

Acked.

> 
> On 2023-05-22 18:08:56, Jessica Zhang wrote:
>> Adjust the pclk rate to divide hdisplay by the compression ratio when DSC
>> is enabled.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index a448931af804..88f370dd2ea1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -561,7 +561,18 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>>   	clk_disable_unprepare(msm_host->byte_clk);
>>   }
>>   
>> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
>> +static unsigned long dsi_adjust_compressed_pclk(const struct drm_display_mode *mode,
> 
> Nit: adjust_pclk_for_compression

Acked.

> 
> As discussed before we realized that this change is more-or-less a hack,
> since downstream calculates pclk quite differently - at least for
> command-mode panels.  Do you still intend to land this patch this way,
> or go the proper route by introducing the right math from the get-go?
> Or is the math at least correct for video-mode panels?

Sorry but can you please clarify what exactly is incorrect or different 
about this math when compared to downstream? And, if you think that this 
math is incorrect, what exactly has to be changed to make it the "right 
math"?

We've already shown step-by-step [1] not only how the resulting pclk 
from the downstream code matches out upstream calculations, but also how 
the inclusion of porches in the upstream math would make up for the fact 
that upstream has no concept of transfer time [2].

If the lack of transfer time in the upstream math is the issue, I 
believe that that's not within the scope of this series, as transfer 
time is not something specific to DSC.

Moreover, as stated in an earlier revision [3], there is no way to 
validate DSC over DSI for video mode. As far as I know, we do not have a 
way to validate video mode datapath for DSI in general.

[1] https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1936144
[2] https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1945792
[3] 
https://patchwork.freedesktop.org/patch/535117/?series=117219&rev=1#comment_970492

> 
> This function requires a documentation comment to explain that all.
> 
>> +		const struct drm_dsc_config *dsc)
>> +{
>> +	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
> 
> This sounds like a prime candidate for msm_dsc_get_bytes_per_line(), if
> bits_per_component==8 is assumed.  In fact, it then becomes identical
> to the following line in dsi_host.c which you added previously:
> 
> 	hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> 
> If not, what is the difference between these two calculations?  Maybe
> they both need to be in a properly-named helper.

While the math technically matches up (assuming, also, that 
mode->hdisplay == slice_width * slice_count for all cases), there are 
conceptual differences between the pclk and hdisplay calculations.

Just to reiterate what was already said on IRC:

In the pclk calculation, we're multiplying pclk by the compression ratio 
(which would be target_bpp / src_bpp) -- please note that here, we 
calculate src_bpp by doing bpc * 3.

In the hdisplay calculation, we calculate the bytes per line and divide 
by 3 (bytes) to account for the fact that we can only process 3 bytes 
per pclk cycle.

So while I understand why you would want to put this behind a shared 
helper, I think abstracting the pclk and hdisplay math away would 
obfuscate the conceptual difference between the 2 calculations.

> 
>> +			dsc->bits_per_component * 3);
> 
> As we established in the drm/msm issue [2] there is currently a
> confusion whether this /3 (and the /3 in dsi_timing_setup) come from the
> ratio between dsi_get_bpp() and dsc->bpp or something else.  Can you
> clarify that with constants and comments?

Sure, we are planning to add a patch to the end of this series 
documenting the math.

> 
> [2]: https://gitlab.freedesktop.org/drm/msm/-/issues/24
> 
>> +
>> +	return (new_hdisplay + (mode->htotal - mode->hdisplay))
>> +			* mode->vtotal * drm_mode_vrefresh(mode);
> 
> As clarified in [1] I was not necessarily suggesting to move this math
> to a separate helper, but to also use a few more properly-named
> intermediate variables to not have multi-line math and self-documenting
> code.  These lines could be split to be much more clear.

Acked.

> 
> [1]: https://lore.kernel.org/linux-arm-msm/u4x2vldkzsokfcpbkz3dtwcllbdk4ljcz6kzuaxt5frx6g76o5@uku6abewvye7/
> 
>> +}
>> +
>> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
>> +		const struct drm_dsc_config *dsc, bool is_bonded_dsi)
>>   {
>>   	unsigned long pclk_rate;
>>   
>> @@ -576,6 +587,10 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
>>   	if (is_bonded_dsi)
>>   		pclk_rate /= 2;
>>   
>> +	/* If DSC is enabled, divide hdisplay by compression ratio */
>> +	if (dsc)
>> +		pclk_rate = dsi_adjust_compressed_pclk(mode, dsc);
> 
> The confusion with this comment (and the reason the aforementioned
> discussion [2] carried on so long) stems from the fact a division makes
> sense for a bit/byte clock, but not for a pixel clock: we still intend
> to send the same number of pixels, just spending less bytes on them.  So
> as you clarify the /3 above, can you also clarify that here or drop this
> comment completely when the function is correctly documented instead?

Acked.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> +
>>   	return pclk_rate;
>>   }
>>   
>> @@ -585,7 +600,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>   	u8 lanes = msm_host->lanes;
>>   	u32 bpp = dsi_get_bpp(msm_host->format);
>> -	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>> +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
>>   	unsigned long pclk_bpp;
>>   
>>   	if (lanes == 0) {
>> @@ -604,7 +619,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>>   
>>   static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   {
>> -	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
>> +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
>>   	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
>>   							msm_host->mode);
>>   
>>
>> -- 
>> 2.40.1
>>
