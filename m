Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC889A642
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 23:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D87010EA3A;
	Fri,  5 Apr 2024 21:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="am02KRi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4888310EAAD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 21:43:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435LbM5b020139; Fri, 5 Apr 2024 21:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=YuuiR+RQPJyVoIjepBYrkuvRsZsSLh0GmO9Ed1j7vq0=; b=am
 02KRi+njP+X606LAEly7XjL3xQ7IO/wsTuKDla2/G7DK94aisqZhxLhf7ovcscqB
 LU0izX9sf0LK1dw+2vguduJuekcjsF1VIxJGlVCtzd7LcxTprb8KCjswEfCDio/I
 lg4hFawm33QQBQHGpe/OKBi2cUlKJyEh1c7gzTET2T1S/9uY75mIDeQL+0egRfsd
 6zQGbURcshpBq5yG0aBo4dsB6vkplYq6UIDj+ymWsnYWfuzdI7Hx8BlR6tK5CnKC
 jOLzxUXnp+Tf01mq2MZBx5Sv8qGfHeQySTtQ+mMJIbZheAT8dh6cOwOTBhtzGtaG
 eVtNcX95y0hxyF7jrJdQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xaaj1a333-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 21:42:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435LgR26003029
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Apr 2024 21:42:27 GMT
Received: from [10.110.71.75] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 14:42:26 -0700
Message-ID: <b67f530d-6128-44dc-aa93-60fc629c06c6@quicinc.com>
Date: Fri, 5 Apr 2024 14:42:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/panel: visionox-rm69299: don't unregister DSI
 device
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
 <20240404-drop-panel-unregister-v1-1-9f56953c5fb9@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240404-drop-panel-unregister-v1-1-9f56953c5fb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KkZvom-pySkCLQEs6pQaZznMgyU0JQGX
X-Proofpoint-GUID: KkZvom-pySkCLQEs6pQaZznMgyU0JQGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_26,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050155
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



On 4/4/2024 3:07 AM, Dmitry Baryshkov wrote:
> The DSI device for the panel was registered by the DSI host, so it is an
> error to unregister it from the panel driver. Drop the call to
> mipi_dsi_device_unregister().

Hi Dmitry,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Fixes: c7f66d32dd43 ("drm/panel: add support for rm69299 visionox panel")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 775144695283..b15ca56a09a7 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -253,8 +253,6 @@ static void visionox_rm69299_remove(struct mipi_dsi_device *dsi)
>   	struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
>   
>   	mipi_dsi_detach(ctx->dsi);
> -	mipi_dsi_device_unregister(ctx->dsi);
> -
>   	drm_panel_remove(&ctx->panel);
>   }
>   
> 
> -- 
> 2.39.2
> 
