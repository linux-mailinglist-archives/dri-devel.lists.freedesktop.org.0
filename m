Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF245F28C3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 08:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3158C10E20A;
	Mon,  3 Oct 2022 06:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623AA10E20A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 06:52:49 +0000 (UTC)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D696C440;
 Mon,  3 Oct 2022 08:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664779967;
 bh=WSm2lNA2hd35oorfaRNimpwxUWCIfKlJOXYQy9pzF+E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gM0MZAIRGNlo3H9Ukn/2BtamGe6diu+eKBSIjCbkgy5+qu6cjSbtYsCBEUdnjqXOH
 5fmIX9qa1PY+UCCX+Bhnjqg4tkgCrXU+wSnD2nJ4Qxi4yMD1ELO15iTH6vq3yAYc3V
 5m73kJVukSu8wAdvc9eSe3bFPnHR7i70S8SgjjHo=
Message-ID: <b1425f66-29cf-ce13-fe29-895cd2140c77@ideasonboard.com>
Date: Mon, 3 Oct 2022 09:52:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and
 RCAR_MIPI_DSI
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 02/10/2022 01:03, Laurent Pinchart wrote:
> When the R-Car MIPI DSI driver was added, it was a standalone encoder
> driver without any dependency to or from the R-Car DU driver. Commit
> 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
> added a direct call from the DU driver to the MIPI DSI driver, without
> updating Kconfig to take the new dependency into account. Fix it the
> same way that the LVDS encoder is handled.
> 
> Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/Kconfig | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index c959e8c6be7d..fd2c2eaee26b 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
>   	select OF_FLATTREE
>   	select OF_OVERLAY
>   
> +config DRM_RCAR_USE_MIPI_DSI
> +	bool "R-Car DU MIPI DSI Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	default DRM_RCAR_DU
> +	help
> +	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> +
>   config DRM_RCAR_MIPI_DSI
> -	tristate "R-Car DU MIPI DSI Encoder Support"
> -	depends on DRM && DRM_BRIDGE && OF
> +	def_tristate DRM_RCAR_DU
> +	depends on DRM_RCAR_USE_MIPI_DSI
>   	select DRM_MIPI_DSI
> -	help
> -	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>   
>   config DRM_RCAR_VSP
>   	bool "R-Car DU VSP Compositor Support" if ARM
> 
> base-commit: 7860d720a84c74b2761c6b7995392a798ab0a3cb

Interesting dependency issue. Took me a while to understand it =).

But is there a reason to not have "depends on DRM_RCAR_DU" for 
DRM_RCAR_USE_MIPI_DSI and DRM_RCAR_USE_LVDS? Now the menu items are 
available even if RCAR_DU is n. That's also the case for 
DRM_RCAR_DW_HDMI, but I'm not sure if that's supposed to be usable even 
without RCAR_DU.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
