Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A829BBDD0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 20:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B73310E3F8;
	Mon,  4 Nov 2024 19:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Fwaadoqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215E410E3F7;
 Mon,  4 Nov 2024 19:14:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjhB0005210;
 Mon, 4 Nov 2024 19:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PQ3afCaiuQvlRFSZynJOm+joZ9Z2v4N/aCEb5qLkRjw=; b=FwaadoqwbP9lTleJ
 w81v46T/hdV8DX8lAGNpwPY3hWV0A/+Y/t51eE/nIlcbHh1CGQMWwVbI4lABaiVY
 R+FNk/U4k2Y8wu06ETL5xbS4PknVgkjsioetlq0r3vsGuuyWMQvewMkTipUO1fzt
 CIPrySRvHuRTq0yonOfKgqgDvzIoNg3jBQM6JHpvtA2Vdbtv6nCg9P/LDIkWBlEk
 mw1lxILdU9W0i5PicjgCz77mjU39rFwqBFK+dmzJuNFqdHKQSGAYM0uf49Y2Rhfg
 XFVEYtmNVG0Vut1xNxbF2bV5XBQV9dCwmePmuoyFYzGZ92FbrTDzhuGxaUozBXL3
 Ci1Akw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2s5928-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Nov 2024 19:14:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4JE9WH014497
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Nov 2024 19:14:09 GMT
Received: from [10.110.96.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 11:14:06 -0800
Message-ID: <3052ea5b-5226-4c0b-a4c3-1d4185ae9726@quicinc.com>
Date: Mon, 4 Nov 2024 11:14:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>, Phong LE <ple@baylibre.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20241104190636.274926-1-robh@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241104190636.274926-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ll936qEETZvQHfpUSt8tw8iNQ9tUEa5I
X-Proofpoint-GUID: ll936qEETZvQHfpUSt8tw8iNQ9tUEa5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxlogscore=943 clxscore=1011 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411040157
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



On 11/4/2024 11:06 AM, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>   drivers/gpu/drm/bridge/sii902x.c     | 2 +-
>   drivers/gpu/drm/drm_panel.c          | 2 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c   | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 

For MSM part,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
