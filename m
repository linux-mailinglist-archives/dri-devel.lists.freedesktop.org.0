Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7300B78E96C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 11:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B456310E5DA;
	Thu, 31 Aug 2023 09:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269CB10E5DA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 09:31:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14A52223;
 Thu, 31 Aug 2023 11:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693474176;
 bh=KuTQdJ5OL0CxZyWRrXxMK+X9+ye8IsH5E2ej6cztE70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CbdKr9DD6cu4aYvBW9X1mzemtVVDIEbNReal1bAJcfO6A4VS0s4wzSxGFl7EebNp4
 hKG00Lko9bMkxDeccVr7kCWtPjGQ8GCMyJIzNUTsP2OudSHeBXufrC7/9J0uK1yJFZ
 pSOWH+41QqjuFr22LK0LMxlzyW8GKMW3Bo3d0UeQ=
Date: Thu, 31 Aug 2023 12:31:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v6 4/4] drm/bridge: panel: Drop CONFIG_OF conditional
 around  *_of_get_bridge()
Message-ID: <20230831093108.GF2698@pendragon.ideasonboard.com>
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
 <20230831080938.47454-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230831080938.47454-5-biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 09:09:38AM +0100, Biju Das wrote:
> Drop unnecessary CONFIG_OF conditional around devm_drm_of_get_bridge() and
> drmm_of_get_bridge() as it is guarded with #if..#else blocks in
> drm_bridge.h.

This will increase the kernel size on non-OF system, to add functions
that are not used. I don't think the #ifdef here is problematic.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6:
>  * New patch.
> ---
>  drivers/gpu/drm/bridge/panel.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 7f41525f7a6e..9220a1c23697 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -482,7 +482,6 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
>  }
>  EXPORT_SYMBOL(drm_panel_bridge_connector);
>  
> -#ifdef CONFIG_OF
>  /**
>   * devm_drm_of_get_bridge - Return next bridge in the chain
>   * @dev: device to tie the bridge lifetime to
> @@ -550,5 +549,3 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>  	return bridge;
>  }
>  EXPORT_SYMBOL(drmm_of_get_bridge);
> -
> -#endif

-- 
Regards,

Laurent Pinchart
