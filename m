Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A6AB2017
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 00:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C229E10E034;
	Fri,  9 May 2025 22:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="otvLlPU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80E110E034
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 22:49:04 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Bhxfo022749;
 Fri, 9 May 2025 22:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X/M7B4QlGrtsLMZCbD2WHCXdmlwFM6v9WbDPN8DCkxY=; b=otvLlPU5KeTLHU0G
 Vft5E2f4Kaf0GTRzVPxpz6c9byeNUr+lRXdk/rtzqjtiPI5ihPfMvek/U0YZkDBy
 9oLLXdIAZqrY4Kag5I/vXHxyoek92MWEez+d373Om+ZOUmyNBCU9E3nKEirdrWLd
 7ugEomaJPkIfhK7TLuc1DbV+r3oFKi2SaLksXSYWj5QDeITg9Lff1txGNX70Sa4g
 xXfcZQMNm8bB6Iv4RdCj60JS+gujna7pG76uN8fT/ecK7o7dpC5EcVoIqTuIoxjY
 l3ufhrvwwlcn7Bw6CfBbTNIe7CIDqS6UNG2Tl+L9CUsED5rwvMCVaqLIQgxtOslS
 HyGUhw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp861r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 May 2025 22:48:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549Mmx5H009241
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 May 2025 22:48:59 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 15:48:58 -0700
Message-ID: <9a27cd5e-855b-4736-9dc1-14d2f7366774@quicinc.com>
Date: Fri, 9 May 2025 15:48:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/panel: visionox-rm69299: switch to
 devm_drm_panel_alloc()
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
 <20250509-topic-misc-shift6-panel-v2-5-c2c2d52abd51@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-5-c2c2d52abd51@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681e865b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=m1CBc06sofYiQK5y7b0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: llkJ1IQJzXP0srehKX5JVHri2d5iEyvZ
X-Proofpoint-GUID: llkJ1IQJzXP0srehKX5JVHri2d5iEyvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIzMCBTYWx0ZWRfX2kHY8CcHlQSP
 6Khbq3SU6zS+y+KBrQ0EiV2QU9xllcQw5Iexu6s3hhUuAH6wkCnyZOWCUkpHwzBBBlLcHEYIqGM
 EUHYtpHBpH5VBO5riJGws9IwEyAdiOF4vyvH0trg140My3+PUwKRV5C/VD4120CVnfPuoxqparn
 4RZttbwly2iCaGQWlw3WiqTjXZZChM6ZRujfO7gs4k19YUnRwZbjx/WTksKc7IQQXQfoxM/+aEW
 K5qxkks6nJh7t6tQr6u1jYB8C+BGeTNQ4mLxxshowYVoyCXoPrOm5pmZFF6twOdTuCxuELgn+/4
 ELWP9Y4CGRBykpkdlgJ5Qk4GMXA0J/VeHJdHwCqLHLF3wc7ISNeMkPfuWSveraV6j0DPhMTHFFF
 STKKCm6dziBnYTLGweprtakTnyXICZAax8timYEV/CeAmFRIXXxbs95/z6NvSr5ynXhvIAG/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_09,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090230
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
> Switch to devm_drm_panel_alloc() to add panel refcounting.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index fe921d5fb1942c47c5b849e827c244d7fbde25a3..fda1caa9052dd1c61c2dc23934d5faa8a52a6e31 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -167,7 +167,9 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   	struct visionox_rm69299 *ctx;
>   	int ret;
>   
> -	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	ctx = devm_drm_panel_alloc(dev, struct visionox_rm69299, panel,
> +				   &visionox_rm69299_drm_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
>   	if (!ctx)
>   		return -ENOMEM;
>   
> @@ -190,8 +192,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   		return PTR_ERR(ctx->reset_gpio);
>   	}
>   
> -	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
> -		       DRM_MODE_CONNECTOR_DSI);
>   	drm_panel_add(&ctx->panel);
>   
>   	dsi->lanes = 4;
> 

