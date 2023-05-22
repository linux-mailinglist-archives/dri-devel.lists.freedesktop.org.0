Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8D070CDFE
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FADF10E3AC;
	Mon, 22 May 2023 22:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF60210E3AB;
 Mon, 22 May 2023 22:32:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MLTkrO001952; Mon, 22 May 2023 22:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=o5ykXhg3wu5gYRzykIK1EzM8R4+bF4RthS27GpuDXQE=;
 b=Ar7jMxsQ6MEbmrsNsYQsT7s+s6jnjb+cgbTMqM81TZwMrV6dOg2vbIW8t0ZFOBtUQNbd
 BjDy4R/bEqjgQ4XTi1va43MQPIbU6cWal1GzFyr6kTSs5ZzDiOzAMmXtGdQMEicXR+to
 RgYIHQsSWzJ2SdqnXemomVNPkzFzeOwfQ1IPcsFV/aqRDp0YwvqKUKxWGgJ3soNtoOcb
 BXBXrQK01ky3xvokMzznOCfkQ/5VYCMdM6zL669x0hwWaau05zwzK/vitVxr48+9Z7Re
 JPYnqYgAkudUvbmP9z9oXDXw+typbiVj8rCb9j0dtuBFkioMQdOgaqKAUOhm33TYQwdk Mg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qr6h0sdnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 22:32:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MMWiPv014771
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 22:32:44 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 15:32:43 -0700
Message-ID: <c1df53d9-e476-64bb-f8cb-cc2bf9cb7ff8@quicinc.com>
Date: Mon, 22 May 2023 15:32:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/5] drm/msm/dsi: Adjust pclk rate for compression
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-2-15daf84f8dcb@quicinc.com>
 <ybyb3sijo462w4qeoihmm6sd3m7ht2p4clhh7qdzk4fnej7v3e@j4pf2kzu2d4v>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <ybyb3sijo462w4qeoihmm6sd3m7ht2p4clhh7qdzk4fnej7v3e@j4pf2kzu2d4v>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: slj-DDewJZeNHasgsIIUI6-vAnUatDWI
X-Proofpoint-ORIG-GUID: slj-DDewJZeNHasgsIIUI6-vAnUatDWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220190
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/22/2023 2:31 PM, Marijn Suijten wrote:
> On 2023-05-22 13:30:21, Jessica Zhang wrote:
>> Adjust the pclk rate to divide hdisplay by the compression ratio when DSC
>> is enabled.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> As discussed previously, this patch would apply a lot more cleanly on
> top of:
> 
> https://lore.kernel.org/linux-arm-msm/20230520200103.4019607-1-dmitry.baryshkov@linaro.org/T/#u
> 
> (This is the v2 that doesn't change the callback, but does change the
> code flow so that you have to *touch less lines* in this patch).

Hi Marijn,

Sounds good. I'll rebase on top of that.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 18d38b90eb28..d04f8bbd707d 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -561,7 +561,18 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>>   	clk_disable_unprepare(msm_host->byte_clk);
>>   }
>>   
>> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
>> +static unsigned long dsi_adjust_compressed_pclk(const struct drm_display_mode *mode,
>> +		const struct drm_dsc_config *dsc)
>> +{
>> +	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
>> +			dsc->bits_per_component * 3);
>> +
>> +	return (new_hdisplay + (mode->htotal - mode->hdisplay))
>> +			* mode->vtotal * drm_mode_vrefresh(mode);
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
>>   	u64 pclk_bpp = (u64)pclk_rate * bpp;
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
>> @@ -634,7 +649,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   
>>   	dsi_calc_pclk(msm_host, is_bonded_dsi);
>>   
>> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
>> +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi) * bpp;
>>   	do_div(pclk_bpp, 8);
>>   	msm_host->src_clk_rate = pclk_bpp;
>>   
>>
>> -- 
>> 2.40.1
>>
