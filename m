Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D09D90F6F2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 21:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCAA10E1D4;
	Wed, 19 Jun 2024 19:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jU6gyObo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A09D10E1D4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 19:29:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0299C18D;
 Wed, 19 Jun 2024 21:29:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718825353;
 bh=L3axFM2mjRFSCzxpqxFKEzUSKwF36hoJ2X9R2IX9j4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jU6gyOboPDfZPPxptCZyyqHKYvIMB0PyC4pMZrkRIsniA3+XPjnGFsfMS9ntLYNow
 TZGHK/LFey/xDiI0p6MPYUOhJ9bBzxoHJ2nKsgISwvGKEtWoMBT3GC8HBROTcx76S5
 zOkIYRgX/2lxHOG0TxgkGwTvisKSifsyqxyNtgTk=
Date: Wed, 19 Jun 2024 22:29:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>, 
 Takeshi Kihara <takeshi.kihara.df@renesas.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/4] drm: rcar-mipi-dsi: Fix CLOCKSET1_LOCK definition
Message-ID: <20240619192909.GB31507@pendragon.ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-2-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240619102219.138927-2-jacopo.mondi@ideasonboard.com>
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

Hi Jacopo,

Thank you for the patch.

CC'ing Tomi.

On Wed, Jun 19, 2024 at 12:22:15PM +0200, Jacopo Mondi wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Version 0.51 of the Renesas R-Car Gen4 TRM reports bit 16 of the
> CLOCKSET1 register of the DSI transmitter module to be a reserved
> field.
> 
> Fix this by correcting the CLOCKSET1_LOCK definition to match the TRM
> and remove the CLOCKSET1_LOCK_PHY definition, as the register is simply
> called "lock" in the datasheet.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index f8114d11f2d1..1bf9c4717d5a 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -141,8 +141,7 @@
>  #define PHYSETUP_RSTZ			(1 << 0)
>  
>  #define CLOCKSET1			0x101c
> -#define CLOCKSET1_LOCK_PHY		(1 << 17)
> -#define CLOCKSET1_LOCK			(1 << 16)
> +#define CLOCKSET1_LOCK			(1 << 17)

This matches the documentation, but we should get it tested on V4H to
make sure it doesn't cause a regression. Tomi, would you be able to test
the patch ?

>  #define CLOCKSET1_CLKSEL		(1 << 8)
>  #define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
>  #define CLOCKSET1_CLKINSEL_DIG		(1 << 2)

-- 
Regards,

Laurent Pinchart
