Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4ED89A38E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 19:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B6310ED50;
	Fri,  5 Apr 2024 17:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dNA1kOj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE1C10ED50;
 Fri,  5 Apr 2024 17:35:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435CAQEh013170; Fri, 5 Apr 2024 17:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=roi4iMBdJJpTdmEMnHc+zgFgLnN3WD/89uIp/RpT6Gk=; b=dN
 A1kOj9DiqVqRmDdAiX8r2df7N+eM9C2olSoCBancKGjGHBDaCRYmsd2SFzTS0CHh
 wlSI+kncR277rA+BW0KAXjqkmHpvB7uUezAmZVYb/GmnmnRioM0DELCONw8cO1Rz
 IdC4tk0BXpvGri/+0SF1juiZlG9Td+0N2zVmC7b1dvWqQe7C6X/HGhvx66FDPzAj
 q55rp1gii42t9Zpq4dq3l5COf3YuHkNkEp4/BbUjNbVBk3M0cpvKGq2AT8HPQ4ig
 laK9/yD38kJpcvI15hZQeX3nIfPkpYOTkL3V9AFF1vs9fWhe6R3hu4uSGd9OFSF1
 ENBSKi4XhvOJlbEw9tCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa1xaahww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 17:35:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435HZa8V029471
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Apr 2024 17:35:36 GMT
Received: from [10.110.24.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 10:35:35 -0700
Message-ID: <7cecab40-2711-4735-1eb2-45f3942982b1@quicinc.com>
Date: Fri, 5 Apr 2024 10:35:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/msm/dsi: move next bridge acquisition to dsi_bind
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-2-962ebdba82ed@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240309-fd-dsi-cleanup-bridges-v1-2-962ebdba82ed@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ucamd8ZNN8sZ4Bo_W0KBy8vwQboR8LKB
X-Proofpoint-ORIG-GUID: ucamd8ZNN8sZ4Bo_W0KBy8vwQboR8LKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_19,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050123
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



On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
> Currently the MSM DSI driver looks for the next bridge during
> msm_dsi_modeset_init(). If the bridge is not registered at that point,
> this might result in -EPROBE_DEFER, which can be problematic that late
> during the device probe process. Move next bridge acquisition to the
> dsi_bind state so that probe deferral is returned as early as possible.
> 

But msm_dsi_modeset)init() is also called during msm_drm_bind() only.

What issue are you suggesting will be fixed by moving this from 
msm_drm_bind() to dsi_bind()?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c         | 16 ++++++++++++++++
>   drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
>   drivers/gpu/drm/msm/dsi/dsi_manager.c |  8 +-------
>   3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 37c4c07005fe..38f10f7a10d3 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -120,6 +120,22 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
>   	struct msm_drm_private *priv = dev_get_drvdata(master);
>   	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
>   
> +	/*
> +	 * Next bridge doesn't exist for the secondary DSI host in a bonded
> +	 * pair.
> +	 */
> +	if (!msm_dsi_is_bonded_dsi(msm_dsi) ||
> +	    msm_dsi_is_master_dsi(msm_dsi)) {
> +		struct drm_bridge *ext_bridge;
> +
> +		ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
> +						    msm_dsi->pdev->dev.of_node, 1, 0);
> +		if (IS_ERR(ext_bridge))
> +			return PTR_ERR(ext_bridge);
> +
> +		msm_dsi->next_bridge = ext_bridge;
> +	}
> +
>   	priv->dsi[msm_dsi->id] = msm_dsi;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 2ad9a842c678..0adef65be1de 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -38,6 +38,8 @@ struct msm_dsi {
>   	struct mipi_dsi_host *host;
>   	struct msm_dsi_phy *phy;
>   
> +	struct drm_bridge *next_bridge;
> +
>   	struct device *phy_dev;
>   	bool phy_enabled;
>   
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index a7c7f85b73e4..b7c52b14c790 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -464,18 +464,12 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct drm_device *dev = msm_dsi->dev;
>   	struct drm_encoder *encoder;
> -	struct drm_bridge *ext_bridge;
>   	struct drm_connector *connector;
>   	int ret;
>   
> -	ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
> -					    msm_dsi->pdev->dev.of_node, 1, 0);
> -	if (IS_ERR(ext_bridge))
> -		return PTR_ERR(ext_bridge);
> -
>   	encoder = int_bridge->encoder;
>   
> -	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
> +	ret = drm_bridge_attach(encoder, msm_dsi->next_bridge, int_bridge,
>   			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (ret)
>   		return ret;
> 
