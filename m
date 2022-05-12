Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC7524F18
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F238E10F865;
	Thu, 12 May 2022 13:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3306C10F865;
 Thu, 12 May 2022 13:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652363995; x=1683899995;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8vo+iUkl8KwV3TsvAlzOYyffo163sCqaEuIUNOAtzw4=;
 b=InDRJEQ7KezWN097z0GnLpnyjLsoK8cTeGGx6GPtpg5oRdLF3fvSe4dW
 S0WjhME5i6Tqv0KrbAXGU8THaq6ta77yXg2CLpAWcC3WY0npM3gtGZHqe
 bIGPZMJNC29ixY1dXBqa7/hNsu53aIL00C9se7kIQ40fPYEEM3vt8ZktD 4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 12 May 2022 06:59:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 06:59:54 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 12 May 2022 06:59:53 -0700
Received: from [10.216.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 06:59:49 -0700
Message-ID: <e73e7ea8-137d-f204-c267-4bc1e63e7f6a@quicinc.com>
Date: Thu, 12 May 2022 19:29:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm/a6xx: Fix refcount leak in a6xx_gpu_init
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Jonathan Marek <jonathan@marek.ca>, "Jordan
 Crouse" <jordan@cosmicpenguin.net>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20220512121955.56937-1-linmq006@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220512121955.56937-1-linmq006@gmail.com>
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

On 5/12/2022 5:49 PM, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
>
> a6xx_gmu_init() passes the node to of_find_device_by_node()
> and of_dma_configure(), of_find_device_by_node() will takes its
> reference, of_dma_configure() doesn't need the node after usage.
>
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ccc4fcf7a630..a8f6d73197b1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1919,6 +1919,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   	BUG_ON(!node);
>   
>   	ret = a6xx_gmu_init(a6xx_gpu, node);
> +	of_node_put(node);
>   	if (ret) {
>   		a6xx_destroy(&(a6xx_gpu->base.base));
>   		return ERR_PTR(ret);

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil.
