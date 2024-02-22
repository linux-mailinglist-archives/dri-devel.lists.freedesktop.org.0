Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDAD85EEA2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 02:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1F810E76F;
	Thu, 22 Feb 2024 01:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZYHtQU7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E8D10E021;
 Thu, 22 Feb 2024 01:22:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6532861636;
 Thu, 22 Feb 2024 01:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48717C433F1;
 Thu, 22 Feb 2024 01:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708564951;
 bh=8Gg4bD6vnGa/ihYXZ1047KooWejaE+1erFa2VYXuF9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZYHtQU7Mv/GCNI0yL8RMHsMF/ZegGIuZqV+ymww3V9s7XwbHQuKONVFzVA7hoonpI
 Jt/gLGnHD0CvJdG+Mqw5AEFnU3GgV+xkqlrOT1l0JhTkj7p18G0ZQABJIZgph8HBDR
 Icuv+0JngsPayepXdzwql7ysTCIyE76+qJ4WOsxO2zmeIbt/oeTFqsp0rYZALvzCp6
 P9PsjhAD3oAD/mHFbJWY/ff0T++CL8XzhNPiqQXo1Z2O5CCm/IWQAAVS+0hoDZf9Cb
 wOOW7BfGDgkfbVPYL+8oRxyzeW8H/tSTwnRSD62aMFLrF8KrRaWpdAqCpl1woHNF9X
 gLuN5sqBp2c7Q==
Date: Wed, 21 Feb 2024 19:22:27 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
Message-ID: <j3t72nmsbhe6jdbnvmdsqmosokth65cpbtzoyr7rcddb5xzioa@nu5le67dpyod>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217150228.5788-2-johan+linaro@kernel.org>
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

On Sat, Feb 17, 2024 at 04:02:23PM +0100, Johan Hovold wrote:
> The two device node references taken during allocation need to be
> dropped when the auxiliary device is freed.
> 
> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index bb55f697a181..9e71daf95bde 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -25,6 +25,7 @@ static void drm_aux_hpd_bridge_release(struct device *dev)
>  	ida_free(&drm_aux_hpd_bridge_ida, adev->id);
>  
>  	of_node_put(adev->dev.platform_data);
> +	of_node_put(adev->dev.of_node);
>  
>  	kfree(adev);
>  }
> @@ -74,6 +75,8 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
>  
>  	ret = auxiliary_device_init(adev);
>  	if (ret) {
> +		of_node_put(adev->dev.platform_data);
> +		of_node_put(adev->dev.of_node);
>  		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
>  		kfree(adev);
>  		return ERR_PTR(ret);
> -- 
> 2.43.0
> 
