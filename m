Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E89D6F5CBC
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 19:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746AC10E33F;
	Wed,  3 May 2023 17:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C856A10E328;
 Wed,  3 May 2023 17:10:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343EqIDA012512; Wed, 3 May 2023 17:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xedohLVoYxPec4E1c7GC+Ewwx4H1Qhde+jh2MpigbA8=;
 b=VDHI0sCbm0B3k+eJuLMqr9jgtlTzx5z1F3dh48dGvRsH8NLp43+fYCN9/sbF6rSFt0qK
 SZ27qxfA14As8OGee4rg6hok/iXhnhXzmrzaI5b3nXD8vYM84BKrjmTucfDogYBzvbgo
 vH/aNob8eYav6/nG/O5drpL0dEpNjVl/IVD3yO35u6r9tNJ23xxGMXobzyJ+09170Cgc
 p318fAru+8hASTlTGynnuc33oXmCObKizmClxwJsb3c2sGeXoAjDX2h7Gdp7+9z9CLbC
 BXh3ni57ygJ/5moS7Q/lF/85pYl6UeHYt+iQDZz23FXQ/RTS3DfH/IsIO8b4cGq+QwNK uw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbsr40b40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 17:10:18 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343HAHk2014148
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 17:10:17 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 10:10:16 -0700
Message-ID: <14ed17e5-de5e-3ea6-84b7-4e7c045c9765@quicinc.com>
Date: Wed, 3 May 2023 10:10:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] drm/msm/dsi: Adjust pclk rate for compression
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-1-6bc6f03ae735@quicinc.com>
 <dc926d1c-2637-34a7-df82-c6bd119bfadd@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <dc926d1c-2637-34a7-df82-c6bd119bfadd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WR23AbmmI96jLITRnwSfG4LvSAbFjoSU
X-Proofpoint-ORIG-GUID: WR23AbmmI96jLITRnwSfG4LvSAbFjoSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_12,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030146
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/3/2023 1:33 AM, Dmitry Baryshkov wrote:
> On 03/05/2023 04:19, Jessica Zhang wrote:
>> Divide the pclk rate by the compression ratio when DSC is enabled
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 43a5ec33eee8..35c69dbe5f6f 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -561,7 +561,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host 
>> *msm_host)
>>       clk_disable_unprepare(msm_host->byte_clk);
>>   }
>> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode 
>> *mode, bool is_bonded_dsi)
>> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode 
>> *mode,
>> +        struct drm_dsc_config *dsc, bool is_bonded_dsi)
>>   {
>>       unsigned long pclk_rate;
>> @@ -576,6 +577,11 @@ static unsigned long dsi_get_pclk_rate(const 
>> struct drm_display_mode *mode, bool
>>       if (is_bonded_dsi)
>>           pclk_rate /= 2;
>> +    /* If DSC is enabled, divide pclk by compression ratio */
>> +    if (dsc)
>> +        pclk_rate = DIV_ROUND_UP(pclk_rate,
>> +                dsc->bits_per_component * 3 / msm_dsc_get_bpp_int(dsc));
>> +
> 
> Don't we loose precision here?
> Would DIV_ROUND_UP(pclk_rate * bpp, dsc->bpc * 3) be better?

Hi Dmitry,

Acked.

Thanks,

Jessica Zhang

> 
>>       return pclk_rate;
>>   }
>> @@ -585,7 +591,7 @@ unsigned long dsi_byte_clk_get_rate(struct 
>> mipi_dsi_host *host, bool is_bonded_d
>>       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>       u8 lanes = msm_host->lanes;
>>       u32 bpp = dsi_get_bpp(msm_host->format);
>> -    unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>> +    unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, 
>> is_bonded_dsi);
>>       u64 pclk_bpp = (u64)pclk_rate * bpp;
>>       if (lanes == 0) {
>> @@ -604,7 +610,7 @@ unsigned long dsi_byte_clk_get_rate(struct 
>> mipi_dsi_host *host, bool is_bonded_d
>>   static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi)
>>   {
>> -    msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, 
>> is_bonded_dsi);
>> +    msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, 
>> msm_host->dsc, is_bonded_dsi);
>>       msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, 
>> is_bonded_dsi,
>>                               msm_host->mode);
>> @@ -634,7 +640,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>       dsi_calc_pclk(msm_host, is_bonded_dsi);
>> -    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) 
>> * bpp;
>> +    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, 
>> is_bonded_dsi) * bpp;
>>       do_div(pclk_bpp, 8);
>>       msm_host->src_clk_rate = pclk_bpp;
>>
> 
> -- 
> With best wishes
> Dmitry
> 
