Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DAD8A8DB9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 23:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFDA1137EA;
	Wed, 17 Apr 2024 21:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZxSOuU9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C991137EA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 21:21:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43HKJkjh027275; Wed, 17 Apr 2024 21:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=2GZtLTSkn5P8Go1e017CsTki1su+ecSi7B1HZK8D7Ag=; b=Zx
 SOuU9MUT6Do9lgPChdz+op/Ov2gin+jA9cYSbOOLIkHaYFE0tgAvJanRzH28T3dK
 NO3ydQP/w6Fwf5flVgP15bZbyBczEnWJ16N48ywLo6P1hvrCD2W89ao4ZV8FlHNF
 Lwl5a877NHXQtqmbAXBjdUeFRPq10JOFkfNW4fW7O4OtcbTb0so7V9cqDJ1u4ZKb
 zN6PM1zp58eNp27yYnoXaZP9QpdmAa24i4xEZmRFNxCdvXVEZ44cF0+WVdwjYuRR
 jjMB6xIxUbyse3vPJxLgy7LCkhnsH1jSjZ9m+r7rp3KWi0CuHdI70zleahtStUDn
 gdWbqnkEJ/lHS4lOup+g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xj9w5a79s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2024 21:20:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43HLKW9u001962
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2024 21:20:32 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Apr
 2024 14:20:31 -0700
Message-ID: <e89c5c19-7c8f-476b-a96a-a5bc330278ab@quicinc.com>
Date: Wed, 17 Apr 2024 14:20:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/panel: novatek-nt36672e: stop calling
 regulator_set_load manually
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthias Kaehlcke
 <mka@chromium.org>, Harigovindan P <harigovi@codeaurora.org>, Ritesh Kumar
 <quic_riteshk@quicinc.com>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
 <20240404-drop-panel-unregister-v1-4-9f56953c5fb9@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240404-drop-panel-unregister-v1-4-9f56953c5fb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sUN5mEQ1ForeJ8f8PSD1eri1RLzGU2nn
X-Proofpoint-GUID: sUN5mEQ1ForeJ8f8PSD1eri1RLzGU2nn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_18,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404170151
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/4/2024 3:08 AM, Dmitry Baryshkov wrote:
> Use .init_load_uA part of the bulk regulator API instead of calling
> register_set_load() manually.

Hi Dmitry,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> index 9a870b9b6765..20b7bfe4aa12 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
> @@ -343,17 +343,7 @@ static int nt36672e_1080x2408_60hz_init(struct mipi_dsi_device *dsi)
>   static int nt36672e_power_on(struct nt36672e_panel *ctx)
>   {
>   	struct mipi_dsi_device *dsi = ctx->dsi;
> -	int ret, i;
> -
> -	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
> -		ret = regulator_set_load(ctx->supplies[i].consumer,
> -				regulator_enable_loads[i]);
> -		if (ret) {
> -			dev_err(&dsi->dev, "regulator set load failed for supply %s: %d\n",
> -				ctx->supplies[i].supply, ret);
> -			return ret;
> -		}
> -	}
> +	int ret;
>   
>   	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>   	if (ret < 0) {
> @@ -550,8 +540,10 @@ static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
>   		return -ENODEV;
>   	}
>   
> -	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
> +	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
>   		ctx->supplies[i].supply = regulator_names[i];
> +		ctx->supplies[i].init_load_uA = regulator_enable_loads[i];
> +	}
>   
>   	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
>   			ctx->supplies);
> 
> -- 
> 2.39.2
> 
