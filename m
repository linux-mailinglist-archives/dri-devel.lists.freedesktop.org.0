Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA9B1ABA1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 01:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1F810E38C;
	Mon,  4 Aug 2025 23:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="snvGIcIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF60810E38C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 23:58:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BACD032FD;
 Tue,  5 Aug 2025 01:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754351876;
 bh=xvDuUlev+04p4U9jo1+uLE4n667zhbNiWstDokcyGiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=snvGIcICncsh5uVCmCcjSddnV5EIW67EBCKx81tkWqcHzhQlKKaRnbe3iFUFYVrcV
 GVaBDKrBLSi32U1/gki15Q7wxrRF4S1UDE5+2DhxYZ/W22lV9QuMNuh+5+djX5wm0i
 IIBIbNfQL3mI8lExPh7nkQ/F5CaqVgNr2U/zvmmc=
Date: Tue, 5 Aug 2025 02:58:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: display-connector: don't set OP_DETECT for
 DisplayPorts
Message-ID: <20250804235829.GC12087@pendragon.ideasonboard.com>
References: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>
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

Thank you for the patch.

On Sat, Aug 02, 2025 at 01:40:35PM +0300, Dmitry Baryshkov wrote:
> Detecting the monitor for DisplayPort targets is more complicated than
> just reading the HPD pin level: it requires reading the DPCD in order to
> check what kind of device is attached to the port and whether there is
> an actual display attached.
> 
> In order to let DRM framework handle such configurations, disable
> DRM_BRIDGE_OP_DETECT for dp-connector devices, letting the actual DP
> driver perform detection. This still keeps DRM_BRIDGE_OP_HPD enabled, so
> it is valid for the bridge to report HPD events.
> 
> Currently inside the kernel there are only two targets which list
> hpd-gpios for dp-connector devices: arm64/qcom/qcs6490-rb3gen2 and
> arm64/qcom/sa8295p-adp. Both should be fine with this change.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Makes sense.

Acked-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/display-connector.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index d7e1c2f8f53cad514ec502d58c1b94d348515b42..e9f16dbc953533c2a2d329ee8fd50c1923a78aac 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -373,7 +373,8 @@ static int display_connector_probe(struct platform_device *pdev)
>  	if (conn->bridge.ddc)
>  		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
>  				 |  DRM_BRIDGE_OP_DETECT;
> -	if (conn->hpd_gpio)
> +	/* Detecting the monitor requires reading DPCD */
> +	if (conn->hpd_gpio && type != DRM_MODE_CONNECTOR_DisplayPort)
>  		conn->bridge.ops |= DRM_BRIDGE_OP_DETECT;
>  	if (conn->hpd_irq >= 0)
>  		conn->bridge.ops |= DRM_BRIDGE_OP_HPD;
> 
> ---
> base-commit: 82928cc1c2b2be16ea6ee9e23799ca182e1cd37c
> change-id: 20250802-dp-conn-no-detect-b901893b5e3c

-- 
Regards,

Laurent Pinchart
