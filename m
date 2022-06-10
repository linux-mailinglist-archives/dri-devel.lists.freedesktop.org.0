Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFBC546FF5
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 01:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC7211AF8B;
	Fri, 10 Jun 2022 23:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749D411AF89;
 Fri, 10 Jun 2022 23:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654903213; x=1686439213;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=9yAbVr8i+ycH3s6QgCiS4sWu5K/Nl73oEYUd3Goddgg=;
 b=V/Jl4KlizXftcHb+payH8uYJmarqVK9Djxn1+aYxyONRvf3nYRcyuTKv
 FrF9/FaHk51kAzk12O2DAKxIJ4JTUUwOL+1mLAlPhweybFN+uXNOExMz3
 3weZp1SZgT7fJpAKAxiPpScod0+pInwxtLAfub3XGf5XursnsmH1on2+Y s=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Jun 2022 16:20:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 16:20:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 16:20:11 -0700
Received: from [10.38.242.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 10 Jun
 2022 16:20:08 -0700
Message-ID: <059e0a81-3c0a-1c8f-90f0-a836da1204f5@quicinc.com>
Date: Fri, 10 Jun 2022 16:20:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Rob Clark <robdclark@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Sean Paul
 <sean@poorly.run>, "David Airlie" <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, David Heidelberg
 <david@ixit.cz>, Guo Zhengkui <guozhengkui@vivo.com>, Xu Wang
 <vulab@iscas.ac.cn>, Neil Armstrong <narmstrong@baylibre.com>, Rob Herring
 <robh@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20220607110841.53889-1-linmq006@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220607110841.53889-1-linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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



On 6/7/2022 4:08 AM, Miaoqian Lin wrote:
> of_graph_get_remote_node() returns remote device node pointer with
> refcount incremented, we should use of_node_put() on it
> when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 ++
>   1 file changed, 2 insertions(+)
> 

This patch itself looks fine and will cover the cases when there was an 
error and we did not release the refcount.

But, even in the normal cases I am not finding where we are releasing 
the refcount for the panel_node.

I dont see a of_node_put() on mdp4_lcdc_encoder->panel_node.

Am i missing something?

> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index fb48c8c19ec3..17cb1fc78379 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -216,6 +216,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>   		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
>   		if (IS_ERR(encoder)) {
>   			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> +			of_node_put(panel_node);
>   			return PTR_ERR(encoder);
>   		}
>   
> @@ -225,6 +226,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>   		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
>   		if (IS_ERR(connector)) {
>   			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> +			of_node_put(panel_node);
>   			return PTR_ERR(connector);
>   		}
>   
