Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3686AB2014
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 00:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF8310E040;
	Fri,  9 May 2025 22:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LuJA5ls6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3558310E040
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 22:48:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549FR3oM019182;
 Fri, 9 May 2025 22:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZgaR+vknlQx0EyAQgwM4GKyocHctEKNYfe8Jqkx11IA=; b=LuJA5ls6Bl/wThld
 oxU0bxGt3xz2vzJnUUG+r1hUCkFazhNKgqVhBHdIPxjrTjzQJcuc0p7KmBMv4TVS
 qdz7YZ55HDcdqSYHr1gqe8ob7dW9VzbQWJcJsZh94RK+2ltCTlgPOrFykpOSJ6hH
 V9uZmeHOvDBUjCLDSNRhG/n6vlhzCQaD1WgKqQN3+/kGMEB0NfQ61WgbhSoyjAy1
 Ab5k46mttPwa2Xbalqc/faRO2N36kMrZf0UZRWkha6F8gny4nSGaZJrz3PrvdgSr
 OJwzmsvbXDLi7nrVYhHXUsBT2VlhvaQJRNKhQdsqb84WbYLxHW6mA5fLba0wnTLU
 Yn59Xg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj5efp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 May 2025 22:48:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549MmOB4020584
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 May 2025 22:48:24 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 15:48:24 -0700
Message-ID: <6a9933d0-8020-4296-a0bb-676246ded6f3@quicinc.com>
Date: Fri, 9 May 2025 15:48:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/panel: visionox-rm69299: switch to
 devm_regulator_bulk_get_const()
To: Neil Armstrong <neil.armstrong@linaro.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Casey Connolly <casey.connolly@linaro.org>
References: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
 <20250509-topic-misc-shift6-panel-v2-4-c2c2d52abd51@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-4-c2c2d52abd51@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681e8639 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=XctEy6qvjqWVlUf_3XMA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIzMCBTYWx0ZWRfX8bxTrTK0RaG3
 vzufi4/PXVEXM0s15/dhzJSVlR55dSa3qD9hbi/Hu7eg2iOuB8WClYLAH7kru8p43rrvkPYNbR/
 3y7zb7FJRQNRZwIGizIo4UFQV9n7pk7EFMUNkvV6NLWg7bKQKCuOhm+9PkaWId1dX2g6KGb8nqJ
 I7wKJL5/0jfwWhkSvojXxRK7WvAD4gdcSDKWLYDhN0evLilrn+S8yqyQUoNf2nSpsNRsm91Abv8
 P35HzweUxQm+CfeC+MVhTC6a1N7eMPaRNXqyazpAcMXLUTs7/DjUtdx2o+HW1BmfWNdTL3bk7MQ
 25Q/nNTX9ViBYaloYfY1nEBErspBAYpw7ZEiIoFZU9nNgXq0OfjttrQi34oVc2BkSIA0PghdVhD
 X3gt+DV7/mt40R3pWs31VeAgvnCNRlfz6eACsca988H59p/cllNN+wWoCIctFM6FhvpT1nLh
X-Proofpoint-GUID: fP3EAkJVHC_s7XljW8pcL_y2SnEzCZ8s
X-Proofpoint-ORIG-GUID: fP3EAkJVHC_s7XljW8pcL_y2SnEzCZ8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_09,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090230
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



On 5/9/2025 1:59 AM, Neil Armstrong wrote:
> Switch to devm_regulator_bulk_get_const() to move the supply
> data to const.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index c3c14150a5546512151fb15c8e9a91269ca21c65..fe921d5fb1942c47c5b849e827c244d7fbde25a3 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -24,12 +24,17 @@ struct visionox_rm69299_panel_desc {
>   
>   struct visionox_rm69299 {
>   	struct drm_panel panel;
> -	struct regulator_bulk_data supplies[2];
> +	struct regulator_bulk_data *supplies;
>   	struct gpio_desc *reset_gpio;
>   	struct mipi_dsi_device *dsi;
>   	const struct visionox_rm69299_panel_desc *desc;
>   };
>   
> +static const struct regulator_bulk_data visionox_rm69299_supplies[] = {
> +	{ .supply = "vdda", .init_load_uA = 32000 },
> +	{ .supply = "vdd3p3", .init_load_uA = 13200 },
> +};
> +
>   static const u8 visionox_rm69299_1080x2248_60hz_init_seq[][2] = {
>   	{ 0xfe, 0x00 }, { 0xc2, 0x08 }, { 0x35, 0x00 }, { 0x51, 0xff },
>   };
> @@ -43,7 +48,8 @@ static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
>   {
>   	int ret;
>   
> -	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_rm69299_supplies),
> +				    ctx->supplies);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -66,7 +72,8 @@ static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
>   {
>   	gpiod_set_value(ctx->reset_gpio, 0);
>   
> -	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	return regulator_bulk_disable(ARRAY_SIZE(visionox_rm69299_supplies),
> +				      ctx->supplies);
>   }
>   
>   static int visionox_rm69299_unprepare(struct drm_panel *panel)
> @@ -172,12 +179,8 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   
>   	ctx->dsi = dsi;
>   
> -	ctx->supplies[0].supply = "vdda";
> -	ctx->supplies[0].init_load_uA = 32000;
> -	ctx->supplies[1].supply = "vdd3p3";
> -	ctx->supplies[1].init_load_uA = 13200;
> -
> -	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(visionox_rm69299_supplies),
> +					    visionox_rm69299_supplies, &ctx->supplies);
>   	if (ret < 0)
>   		return ret;
>   
> 

