Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13898D21C8
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 18:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F9A10E582;
	Tue, 28 May 2024 16:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YqVvx0OV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B28112376
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 16:39:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SBZaaX029559;
 Tue, 28 May 2024 16:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RGFf3q2KPsVLxGQHqjukDALhrvUhzkxB90RUCbCUZwQ=; b=YqVvx0OV2SB3XVo0
 jC95tTmwxkAYoBBnjMDTdBkOwUI4Yg0Q0MZMm9qYoFg/vzeMy9wL3P889hNp6llw
 IjYS9c1iAnFWV2X2DXVKoqXrVvNKgmEDW8a8jrlxW2zg4Nww9t0R1HIIlm2t+gjA
 rRlklNH6T+f6ArAZZMc2qcprhAaOc09PgsMay7S3odcV1GUhFzxo3H4XqL/QlWJp
 wniHtUUBxjYwwNtVfMCZjxsXTml3YXjTk6CUBB3xBs3e0HUWCyVj2yjLViVEU1k9
 CmbMjgl+2pxmLbB4VD+ltl+DAn9cDiw5y3MhQslrUaderyz5ypoOOOAaBFFzhf7T
 MYvKbw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2ppqub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 16:39:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SGddAK014514
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 16:39:39 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 09:39:39 -0700
Message-ID: <fe7a27b4-c245-4a02-a0c6-8f8603146938@quicinc.com>
Date: Tue, 28 May 2024 09:39:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: sitronix-st7789v: Add check for
 of_drm_get_panel_orientation
Content-Language: en-US
To: Chen Ni <nichen@iscas.ac.cn>, <neil.armstrong@linaro.org>,
 <sam@ravnborg.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <sre@kernel.org>, <michael.riesch@wolfvision.net>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240528030832.2529471-1-nichen@iscas.ac.cn>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240528030832.2529471-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 79FZCCsuuZvM01rxRvA7Koe-GGFSvtBK
X-Proofpoint-ORIG-GUID: 79FZCCsuuZvM01rxRvA7Koe-GGFSvtBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280124
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



On 5/27/2024 8:08 PM, Chen Ni wrote:
> Add check for the return value of of_drm_get_panel_orientation() and
> return the error if it fails in order to catch the error.
> 
> Fixes: b27c0f6d208d ("drm/panel: sitronix-st7789v: add panel orientation support")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Hi Chen Ni,

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index 88e80fe98112..8b15e225bf37 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -643,7 +643,9 @@ static int st7789v_probe(struct spi_device *spi)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to get backlight\n");
>   
> -	of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
> +	ret = of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
> +	if (ret)
> +		return dev_err_probe(&spi->dev, ret, "Failed to get orientation\n");
>   
>   	drm_panel_add(&ctx->panel);
>   
> -- 
> 2.25.1
> 
