Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A48D2285
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 19:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEFA10E10D;
	Tue, 28 May 2024 17:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RXtwgXo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA71310E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 17:36:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SAfsCH006752;
 Tue, 28 May 2024 17:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oXVyVl2a5aDHRU+CCBAA0GXXBqDn6MOFdRg8YLMIyOA=; b=RXtwgXo064HX37dQ
 QNYL2XTA8QUOIUPe0FwBVb5fpGhal91QtUl2GMCEodXB/O2o8Y96/mRchA5N4L7Z
 RMn4bdwkK9dUWS4kgycu6qJazmNlxUld7HTugHriS/Qu7tXs6UcudE45JWbYifUX
 5h90KM+8GEyxAlTjL0Oyg0ha22YTwWAj+u7ESYRc0erPRRPWXny4QY23UdUyIM6R
 I4VeZh/fAun/qsBbCSl2FaJ6LAaQOlCGYyr9U80wsla7FXs1illjm2hVA32LTefI
 doeUYk9bkBjEoVyQa8eZlJoC/vz/E2saA0eMkKoww4UmtxF4mEdM0keO8lL0+npL
 5g2Glg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0x6sc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 17:36:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SHaLnH024183
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 17:36:21 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 10:36:21 -0700
Message-ID: <d10e14ce-b65f-4dbd-8686-bf8c1796ba06@quicinc.com>
Date: Tue, 28 May 2024 10:36:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/3] drm/panel: sitronix-st7789v: fix timing for
 jt240mhqs_hwt_ek_e3 panel
Content-Language: en-US
To: Gerald Loacker <gerald.loacker@wolfvision.net>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f8351d4a8d4b@wolfvision.net>
 <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-1-f8351d4a8d4b@wolfvision.net>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-1-f8351d4a8d4b@wolfvision.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: A01wDB9_wDa67KHTNj2WjqJtDFfiRPe6
X-Proofpoint-ORIG-GUID: A01wDB9_wDa67KHTNj2WjqJtDFfiRPe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405280131
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



On 5/28/2024 1:32 AM, Gerald Loacker wrote:
> Flickering was observed when using partial mode. Moving the vsync to the
> same position as used by the default sitronix-st7789v timing resolves this
> issue.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Hi Gerald,

Just wondering, are these new timing values taken from the panel specs? 
If the timing in the original patch was wrong, maybe we need a fixes tag.

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index 88e80fe98112..32e5c0348038 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -286,9 +286,9 @@ static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
>   	.hsync_end = 240 + 28 + 10,
>   	.htotal = 240 + 28 + 10 + 10,
>   	.vdisplay = 280,
> -	.vsync_start = 280 + 8,
> -	.vsync_end = 280 + 8 + 4,
> -	.vtotal = 280 + 8 + 4 + 4,
> +	.vsync_start = 280 + 48,
> +	.vsync_end = 280 + 48 + 4,
> +	.vtotal = 280 + 48 + 4 + 4,
>   	.width_mm = 43,
>   	.height_mm = 37,
>   	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> 
> -- 
> 2.37.2
> 
