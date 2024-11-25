Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4239D8B73
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 18:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6974D10E035;
	Mon, 25 Nov 2024 17:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Fsd2DncC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B7810E035
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 17:40:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APEARXX000816;
 Mon, 25 Nov 2024 17:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C9FGLQqHxlNO1zBW1vy2SUad03hJc7TgPHXlsKcwQfk=; b=Fsd2DncCYvmO7j1W
 vcwBuesqrYfDu9pMv+6nNbueLQwB8ZLSVuWYcwMpD/cEH76UjKefLqcMnU3Xkm/a
 dYf/w1+M0aH23yECJGN3iV+57TgUxndOQC+W2pUb3TOW3tJQ2VzBN3bjUXqpakK8
 bTQ54P8spvNNkz/tfVt3R+8ZkZ/56RsNyfjAziWPCwxc39aZOxnDoDezQR/59irh
 eTXyJbDisfYj8W4i+kZsDd1Rw0xl5faeabyYQ4rq5fuYMypO6so4pTOCDvHnh52m
 JLfRCy1oKeEZyQGu2bBKxvpHOGKEJ4d2U7Gc92H2AbktTDkFUKs1Tw2I37KsiLMk
 EnAo4A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434ts1ghj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2024 17:40:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APHeFCR024602
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2024 17:40:15 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 09:40:15 -0800
Message-ID: <264fb0ff-d882-45ac-9589-635531c0659b@quicinc.com>
Date: Mon, 25 Nov 2024 09:39:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: st7701: Add prepare_prev_first flag to
 drm_panel
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
CC: Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>, 
 Hironori KIKUCHI <kikuchan98@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, <stable@vger.kernel.org>
References: <20241124224812.150263-1-marex@denx.de>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20241124224812.150263-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WnF6ZJrABNRkb-Xzw8tZwMy-GIQmqKzG
X-Proofpoint-ORIG-GUID: WnF6ZJrABNRkb-Xzw8tZwMy-GIQmqKzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250146
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



On 11/24/2024 2:48 PM, Marek Vasut wrote:
> The DSI host must be enabled for the panel to be initialized in
> prepare(). Set the prepare_prev_first flag to guarantee this.
> This fixes the panel operation on NXP i.MX8MP SoC / Samsung DSIM
> DSI host.

Hi Marek,

LGTM.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Fixes: 849b2e3ff969 ("drm/panel: Add Sitronix ST7701 panel driver")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Chris Morgan <macromorgan@hotmail.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Hironori KIKUCHI <kikuchan98@gmail.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: stable@vger.kernel.org # v6.2+
> ---
> Note that the prepare_prev_first flag was added in Linux 6.2.y commit
> 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel"),
> hence the CC stable v6.2+, even if the Fixes tag points to a commit
> in Linux 5.1.y .
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7701.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> index eef03d04e0cd2..1f72ef7ca74c9 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -1177,6 +1177,7 @@ static int st7701_probe(struct device *dev, int connector_type)
>   		return dev_err_probe(dev, ret, "Failed to get orientation\n");
>   
>   	drm_panel_init(&st7701->panel, dev, &st7701_funcs, connector_type);
> +	st7701->panel.prepare_prev_first = true;
>   
>   	/**
>   	 * Once sleep out has been issued, ST7701 IC required to wait 120ms
> -- 
> 2.45.2
> 

