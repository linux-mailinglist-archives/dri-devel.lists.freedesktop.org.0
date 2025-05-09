Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42AAAB2011
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 00:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98710E06A;
	Fri,  9 May 2025 22:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="D2s7JSBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2B410E06A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 22:46:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDsFm010638;
 Fri, 9 May 2025 22:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vo9dQjLWV8iMmF8fDbx9crO2WyeG2aLIqkY9Z9NGVGM=; b=D2s7JSBCF4A8vZm4
 nb2wCJmbTACBek8UXBlyd/OuVmT80qLR3E/UCRNTdouZQwwMEhNpg7pojbPo14/L
 cch1eGcVQaFUZOI+MQtjvK0gEogNP+SgvSjIih22nvRtymgaktiDFiErfOVGWhrf
 idKa8NP+QbSe3yPFpMYW7B+1LeNFs0ktUeRrfLxVJDLoGQkd/G1gJcT3PilJyjtD
 oGB50Yi+T8AaHpAMIccc0hWq3u7qRjATfftzbSgGeEaj6i4rnvW62tio5qvyX5Dq
 xC+I5IguHQYGMN7gMJF1jkGI6sBKuxA8NUO4dT3Vgy6qwvrusH1L1Z83M1Gx/cjA
 V1/UMw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmnykh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 May 2025 22:46:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549MkTnT025790
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 May 2025 22:46:29 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 15:46:28 -0700
Message-ID: <b2b440e6-bb77-42ae-9f71-4635b17b230e@quicinc.com>
Date: Fri, 9 May 2025 15:46:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/panel: visionox-rm69299: switch to _multi
 variants
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
 <20250509-topic-misc-shift6-panel-v2-3-c2c2d52abd51@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-3-c2c2d52abd51@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681e85d6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=We4kPWDl41RPRepBkE0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0SXrN_GSLV9Fi05YorV5z6dKTxaCHRKG
X-Proofpoint-GUID: 0SXrN_GSLV9Fi05YorV5z6dKTxaCHRKG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIzMCBTYWx0ZWRfX8CEjGJ32SLip
 Ro4dme3Bez6GlXciN16J8Hg0Q8ihIwiisCV8eU1bmD3AvYcbFbw7ojClw95J312bMpUFLQru+5l
 8ViBSGtBje6nVmITT/j569efV9r72nECO6VY6kyh4kh9wwB5PptU0yTHtNtuSEkzX62hL5QeCPF
 vOFsz9vi9NkIuXgYz4xRD+X70ILZUSPriZJhvnMXphdzIo1DKJnUKhAyd0PpnACEwwAxn5r0lhM
 gjrFAFiMBpr+J5B8bzHUxYQR1flZEc3jdjwD2cHiSRZUFwzkBOsokmwc4gv4UIdYlCmJatirjgZ
 2YWzP3I1TEuP8BYOcO35425GolTeNcyInLObE97wL07z11wvjMRQA6O8igFqmGWhWifcvCAEjEW
 6MHbv2qStIM01Jq67jqPCV0vgonvjo2j+gUIr98rmLmYPfDWKfc/HgD/qQqx/fhfLXGMhNxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_09,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
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
> Switch to the DSI _multi variants to simplify error handling.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 48 +++++++-------------------
>   1 file changed, 13 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 156bca0197481b470fa85b2eab7c979b76e489b6..c3c14150a5546512151fb15c8e9a91269ca21c65 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -72,30 +72,24 @@ static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
>   static int visionox_rm69299_unprepare(struct drm_panel *panel)
>   {
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   
>   	ctx->dsi->mode_flags = 0;
>   
> -	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_OFF, NULL, 0);
> -	if (ret < 0)
> -		dev_err(ctx->panel.dev, "set_display_off cmd failed ret = %d\n", ret);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   
>   	/* 120ms delay required here as per DCS spec */
> -	msleep(120);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>   
> -	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_ENTER_SLEEP_MODE, NULL, 0);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "enter_sleep cmd failed ret = %d\n", ret);
> -	}
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
> -	ret = visionox_rm69299_power_off(ctx);
> -
> -	return ret;
> +	return visionox_rm69299_power_off(ctx);
>   }
>   
>   static int visionox_rm69299_prepare(struct drm_panel *panel)
>   {
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   	int ret, i;
>   
>   	ret = visionox_rm69299_power_on(ctx);
> @@ -104,36 +98,20 @@ static int visionox_rm69299_prepare(struct drm_panel *panel)
>   
>   	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   
> -	for (i = 0; i < ctx->desc->init_seq_len; i++) {
> -		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, &ctx->desc->init_seq[i * 2], 2);
> -		if (ret < 0) {
> -			dev_err(ctx->panel.dev,	"cmd tx failed, ret = %d\n", ret);
> -			return ret;
> -		}
> -	}
> +	for (i = 0; i < ctx->desc->init_seq_len; i++)
> +		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, &ctx->desc->init_seq[i * 2], 2);
>   
> -	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "exit_sleep_mode cmd failed ret = %d\n", ret);
> -		goto power_off;
> -	}
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>   
>   	/* Per DSI spec wait 120ms after sending exit sleep DCS command */
> -	msleep(120);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>   
> -	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_ON, NULL, 0);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "set_display_on cmd failed ret = %d\n", ret);
> -		goto power_off;
> -	}
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   
>   	/* Per DSI spec wait 120ms after sending set_display_on DCS command */
> -	msleep(120);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>   
> -	return 0;
> -
> -power_off:
> -	return ret;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
> 

