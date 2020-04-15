Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11DA1AB00C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 19:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0DD6EA4C;
	Wed, 15 Apr 2020 17:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B2C6EA4B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 17:48:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E51802D1;
 Wed, 15 Apr 2020 19:48:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586972931;
 bh=xIRX6G8MPMzVE7tjXbBjuWGgq9zLKM2OkNZ09OL5Xm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OOw0p460Ce9jFAY15cEC3t0BdFA6nUpJbt4v5rywt+Hpvgd153mZXF9SWYHCq0hRo
 kYlb7TnHmA6nRO8miWF9zAKO0GbmxYfvUMmHHiHgeVMfYXj3Xs05hPBEchdCb734f8
 BVd6D9cXGjnnqoPSvN9fRLtpUzwL6hs7azzCs728=
Date: Wed, 15 Apr 2020 20:48:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/bridge: Move mhl.h into driver directory
Message-ID: <20200415174806.GL4758@pendragon.ideasonboard.com>
References: <20200415173833.312706-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415173833.312706-1-daniel.vetter@ffwll.ch>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>, Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thank you for the patch.

On Wed, Apr 15, 2020 at 07:38:33PM +0200, Daniel Vetter wrote:
> include/drm/bridge is a bit a mistake, drivers are supposed to find
> their bridges using one of the standard of_* functions the drm_bridge
> core provides.

I'm confused, I don't really see how that's related to mhl.h. The header
defines constants and structures related to the MHL (Mobile
High-Definition Link) protocol, which is an industry standard. If you
want to move it out of include/drm/bridge/ to eventually remove that
directory, I think it should be renamted to include/drm/drm_mhl.h.

> dw-hdmi and analogix-dp are the only, historically
> grown exception that we haven't managed to get rid of yet.

The reason why we have shared headers for those is because they're IP
cores integrated with different glue layers in different SoCs. There's
one driver for the IP core itself, and SoC-specific glue drivers that
need to provide the IP core drivers with data and callbacks, defined in
shared headers. Granted, there's also data in those headers that are
only internal to the IP core drivers, and that should be moved out, but
for the interface header, include/drm/bridge/ doesn't seem to be a bad
location to me.

> Make sure that at least no new ones grow by moving hardware header
> files into the correct driver directory.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Kate Stewart <kstewart@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Allison Randal <allison@lohutok.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> ---
>  {include => drivers/gpu}/drm/bridge/mhl.h | 0
>  drivers/gpu/drm/bridge/sii9234.c          | 3 ++-
>  drivers/gpu/drm/bridge/sil-sii8620.c      | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>  rename {include => drivers/gpu}/drm/bridge/mhl.h (100%)
> 
> diff --git a/include/drm/bridge/mhl.h b/drivers/gpu/drm/bridge/mhl.h
> similarity index 100%
> rename from include/drm/bridge/mhl.h
> rename to drivers/gpu/drm/bridge/mhl.h
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index b1258f0ed205..4c862c3af038 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -12,7 +12,6 @@
>   *    Shankar Bandal <shankar.b@samsung.com>
>   *    Dharam Kumar <dharam.kr@samsung.com>
>   */
> -#include <drm/bridge/mhl.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
> @@ -29,6 +28,8 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  
> +#include "mhl.h"
> +
>  #define CBUS_DEVCAP_OFFSET		0x80
>  
>  #define SII9234_MHL_VERSION		0x11
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index 92acd336aa89..017dbb67404e 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -8,7 +8,6 @@
>  
>  #include <asm/unaligned.h>
>  
> -#include <drm/bridge/mhl.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
> @@ -31,6 +30,7 @@
>  
>  #include <media/rc-core.h>
>  
> +#include "mhl.h"
>  #include "sil-sii8620.h"
>  
>  #define SII8620_BURST_BUF_LEN 288

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
