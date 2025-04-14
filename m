Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D2BA87594
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 03:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F18610E244;
	Mon, 14 Apr 2025 01:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="hZM48Ykr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15567.qiye.163.com (unknown [101.71.155.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047BD10E244
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 01:50:55 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 11baf1e49;
 Mon, 14 Apr 2025 09:50:41 +0800 (GMT+08:00)
Message-ID: <a695d872-1d8a-435e-a98a-0b9d7c295ee9@rock-chips.com>
Date: Mon, 14 Apr 2025 09:50:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/bridge: analogic_dp: drop panel_lock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx4ZGFZCHR0fHUgYQxpOTRlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9631fdd92b03a3kunm11baf1e49
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBQ6STo6HjJIDi4oTFYcTzk6
 L1YKCThVSlVKTE9PTkJOT09ISEtOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISE9INwY+
DKIM-Signature: a=rsa-sha256;
 b=hZM48YkrB8Ve5CrdVqBTLWt5RAEegNDeu6fH8ccHoUHqOrLZicoZTXf9ORTqdFOvGdyf+x2Sub0dATIZbNA6CAyjX8g3yaX0ZuImia/O7eN0tAitO5jS9U8KrEjx7Z+jd414Zd9nhvO+lg6XUpNzt97xDcYx3VfBRbynVGZ1osU=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=fH14x6shYv7y9Vwa+DEpj3iHw+jF0WsahJviDDhfSns=;
 h=date:mime-version:subject:message-id:from;
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

Hi Dmitry,

On 2025/4/1 13:11, Dmitry Baryshkov wrote:
> The analogix_dp_prepare_panel() function is called from bridge's
> atomic_pre_enable() and atomic_post_disable() callbacks, which can not
> happen simultaneously. Drop the useless mutex.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 2 --
>   2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 704c6169116eb2601d2ad02dc7294455ceff5460..1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -974,14 +974,11 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   	if (!dp->plat_data->panel)
>   		return 0;
>   
> -	mutex_lock(&dp->panel_lock);
> -
>   	if (prepare)
>   		ret = drm_panel_prepare(dp->plat_data->panel);
>   	else
>   		ret = drm_panel_unprepare(dp->plat_data->panel);
>   
> -	mutex_unlock(&dp->panel_lock);
>   	return ret;
>   }
>   
> @@ -1523,8 +1520,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   	dp->dev = &pdev->dev;
>   	dp->dpms_mode = DRM_MODE_DPMS_OFF;
>   
> -	mutex_init(&dp->panel_lock);
> -
>   	/*
>   	 * platform dp driver need containor_of the plat_data to get
>   	 * the driver private data, so we need to store the point of
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index b679d5b71d276f458d905c936160f107225bc6c5..2b54120ba4a3ef55af518a0629a5c8469f275a0f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -169,8 +169,6 @@ struct analogix_dp_device {
>   	bool			fast_train_enable;
>   	bool			psr_supported;
>   
> -	struct mutex		panel_lock;
> -
>   	struct analogix_dp_plat_data *plat_data;
>   };
>   
> 

The patch has been verified with the eDP panel "lg,lp079qx1-sp0v" in 
RK3588S EVB1 board.

Tested-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

