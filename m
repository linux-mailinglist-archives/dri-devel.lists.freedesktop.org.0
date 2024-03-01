Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD086D857
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 01:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C8610E75F;
	Fri,  1 Mar 2024 00:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="g1cWBos1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A0B10E75F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 00:31:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41TNhi70001324; Fri, 1 Mar 2024 00:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=yqlbLy0YUnYJdLp+bH3E1Uw77dnQJkGWU9TfZrIfoUY=; b=g1
 cWBos1JZ5wvgGfzhRmwMTUf1a7/lfGDB6mTS8QOklWz2ILTJ2BXaphh8V/3isPxW
 QyJi0gplvJysTbOqMFc7iE7XBJZSHdKMwGmxHpqzXqhYBEjLeAePzfEXt9jmv7Rb
 OuhkyutyQFdkaR0VyouWDb36DeYC+eKnJpIwA4hEmMNhbvitK2UTjWLTV5dp95RE
 wTea5spozQa4aJoAXVnvukldE5a22BKUI8wMv6sPvKY1D34vm4w1TX4RBPIfct68
 bUtMSG/Yl5RVmgweQh77gbB9Fbt4nmkjzd3BQYNsGtj452b1Vg7H87zS2E1bYj4C
 PCpIwwGB+3BLACe5aFtw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wjupp1n5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Mar 2024 00:31:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4210V3BP019415
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Mar 2024 00:31:03 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 29 Feb
 2024 16:31:01 -0800
Message-ID: <c882a1da-e3a3-0ee1-9782-8c1e1caefcc1@quicinc.com>
Date: Thu, 29 Feb 2024 16:31:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 9/9] drm/panel: truly-nt35597: Don't log an error when
 DSI host can't be found
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 owen <qwt9588@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>, Adrien Grassein <adrien.grassein@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, "Bjorn Andersson" <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Vinay Simha BN
 <simhavcs@gmail.com>, Christopher Vollo <chris@renewoutreach.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>
CC: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
References: <20240229-anx7625-defer-log-no-dsi-host-v2-0-00506941049a@collabora.com>
 <20240229-anx7625-defer-log-no-dsi-host-v2-9-00506941049a@collabora.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240229-anx7625-defer-log-no-dsi-host-v2-9-00506941049a@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: y8pjSHe4I20K9_5qUELFXFufedqYesAg
X-Proofpoint-GUID: y8pjSHe4I20K9_5qUELFXFufedqYesAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_07,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403010002
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



On 2/29/2024 4:12 PM, Nícolas F. R. A. Prado wrote:
> Given that failing to find a DSI host causes the driver to defer probe,
> make use of dev_err_probe() to log the reason. This makes the defer
> probe reason available and avoids alerting userspace about something
> that is not necessarily an error.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/panel/panel-truly-nt35597.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
