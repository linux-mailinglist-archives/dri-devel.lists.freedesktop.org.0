Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D284868316
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB59B10E434;
	Mon, 26 Feb 2024 21:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CpP7hZZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925A510E434
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 21:30:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41QKwsYa019642; Mon, 26 Feb 2024 21:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=OSTWp44jheoa+xWT8hPngVRc04ZAp2z+qsvzZU/7mDA=; b=Cp
 P7hZZZmWZMa815xpw+50oPvnQcfPVQsAMO8cyVR6VpAUp1tJBQhHMQsjU4e21T1t
 pQIRNDGKIT0Fp7k5i3Ovzz4WrgHAQpSyD+gsENjgg+HyGBRbM0e15ddOhpofIOwQ
 vXSmDQUp4DBBPHlMHAk8QdO9wgur/MPAf4qStJEjnxeaHJms8W8uwZAiCA6V9RhY
 Qzpnu7+3fRUs0h19SWPKCW5alFWLL25iVdX8tbPdZY/J4I3AahXQ4v4KLBydjrrq
 mg0JpWaZG0LYQuTn+mKFQIubkPFR/gFwpLZfCpJ1F+m5J67HQoFvwzv3+kfRt+9P
 YikV4yW/iXNmyDFuQN9g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxmj579-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 21:30:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QLUd6b020034
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 21:30:39 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 13:30:38 -0800
Message-ID: <192173ee-4e38-409e-ba59-0658d3d9c8c5@quicinc.com>
Date: Mon, 26 Feb 2024 13:30:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panel: simple: add CMT430B19N00 LCD panel support
Content-Language: en-US
To: =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Yen-Mei Goh <yen-mei.goh@keysight.com>
References: <20240223134517.728568-1-jeremie.dautheribes@bootlin.com>
 <20240223134517.728568-4-jeremie.dautheribes@bootlin.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240223134517.728568-4-jeremie.dautheribes@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wv-O8GxRmI9WbcAdf98Aerc4acGB1-LI
X-Proofpoint-ORIG-GUID: wv-O8GxRmI9WbcAdf98Aerc4acGB1-LI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260165
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



On 2/23/2024 5:45 AM, Jérémie Dautheribes wrote:
> Add support for Crystal Clear Technology CMT430B19N00 4.3" 480x272
> TFT-LCD panel.
> 
> Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>

Hi Jérémie,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 20e3df1c59d4..b940220f56e2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1457,6 +1457,32 @@ static const struct panel_desc boe_hv070wsa = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct drm_display_mode cct_cmt430b19n00_mode = {
> +	.clock = 9000,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 43,
> +	.hsync_end = 480 + 43 + 8,
> +	.htotal = 480 + 43 + 8 + 4,
> +	.vdisplay = 272,
> +	.vsync_start = 272 + 12,
> +	.vsync_end = 272 + 12 + 8,
> +	.vtotal = 272 + 12 + 8 + 4,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc cct_cmt430b19n00 = {
> +	.modes = &cct_cmt430b19n00_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 95,
> +		.height = 53,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct drm_display_mode cdtech_s043wq26h_ct7_mode = {
>   	.clock = 9000,
>   	.hdisplay = 480,
> @@ -4402,6 +4428,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,hv070wsa-100",
>   		.data = &boe_hv070wsa
> +	}, {
> +		.compatible = "cct,cmt430b19n00",
> +		.data = &cct_cmt430b19n00,
>   	}, {
>   		.compatible = "cdtech,s043wq26h-ct7",
>   		.data = &cdtech_s043wq26h_ct7,
> -- 
> 2.34.1
> 
