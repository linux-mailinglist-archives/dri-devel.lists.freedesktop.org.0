Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64BB95BDF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 13:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7444410E5FF;
	Tue, 23 Sep 2025 11:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WP1egfIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C813D10E5FF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:52:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 65E60346;
 Tue, 23 Sep 2025 13:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1758628281;
 bh=O8hBfkLdAyjg1EPS2VYk+Lhj9c9w4A3WYvzYMETnyio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WP1egfIl56qh9w7ZkHbkB/RVst2O2RBst9aX0vjgQJO+QDrwiTAmnHhYiafDCs4+s
 TeXikE8COPoyVG8OEO3Zz/ic9n8WT3bOROd4xszfj7EOchvsUfUJHGq/TFLonv/iWO
 oFeUjCqfGBYpNVbLsgJNCf0XOaM2niW9FTQcwQBY=
Date: Tue, 23 Sep 2025 14:52:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/9] drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
Message-ID: <20250923115212.GF20765@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-6-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922185740.153759-6-marek.vasut+renesas@mailbox.org>
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

On Mon, Sep 22, 2025 at 08:55:01PM +0200, Marek Vasut wrote:
> Introduce TXVMPSPHSETR_DT_MASK macro and use FIELD_PREP() to generate
> appropriate bitfield from mask and value without bitshift.
> 
> Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
> consisten with the current style. Conversion to BIT() and GENMASK()
> macros is done at the very end of this series in the last two patches.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> NOTE: No functional change expected, this is a preparatory patch which
> partly removes macros which evaluate to zeroes from rcar_mipi_dsi_regs.h .
> The other patches in this series proceed with that job, piece by piece,
> to make it all reviewable.
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 17 ++++++++++-------
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h    | 11 ++++++-----
>  2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 2374cbe3768f2..1591837ff472c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -458,13 +458,16 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>  	u32 vprmset4r;
>  
>  	/* Configuration for Pixel Stream and Packet Header */
> -	if (dsibpp == 24)
> -		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
> -	else if (dsibpp == 18)
> -		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
> -	else if (dsibpp == 16)
> -		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
> -	else {
> +	if (dsibpp == 24) {
> +		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
> +				    FIELD_PREP(TXVMPSPHSETR_DT_MASK, TXVMPSPHSETR_DT_RGB24));
> +	} else if (dsibpp == 18) {
> +		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
> +				    FIELD_PREP(TXVMPSPHSETR_DT_MASK, TXVMPSPHSETR_DT_RGB18));
> +	} else if (dsibpp == 16) {
> +		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
> +				    FIELD_PREP(TXVMPSPHSETR_DT_MASK, TXVMPSPHSETR_DT_RGB16));
> +	} else {
>  		dev_warn(dsi->dev, "unsupported format");
>  		return;
>  	}
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index 808861aaf3bfe..1a8d377ea85fc 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -167,11 +167,12 @@
>  #define TXVMSCR_STR			(1 << 16)
>  
>  #define TXVMPSPHSETR			0x1c0
> -#define TXVMPSPHSETR_DT_RGB16		(0x0e << 16)
> -#define TXVMPSPHSETR_DT_RGB18		(0x1e << 16)
> -#define TXVMPSPHSETR_DT_RGB18_LS	(0x2e << 16)
> -#define TXVMPSPHSETR_DT_RGB24		(0x3e << 16)
> -#define TXVMPSPHSETR_DT_YCBCR16		(0x2c << 16)
> +#define TXVMPSPHSETR_DT_MASK		(0x3f << 16)
> +#define TXVMPSPHSETR_DT_RGB16		0x0e
> +#define TXVMPSPHSETR_DT_RGB18		0x1e
> +#define TXVMPSPHSETR_DT_RGB18_LS	0x2e
> +#define TXVMPSPHSETR_DT_RGB24		0x3e
> +#define TXVMPSPHSETR_DT_YCBCR16		0x2c

As commented on 3/9, I'm really not thrilled, sorry. I think this
decreased readability in the .c file without any other advantage. If
it's the shift that bothers you you could use FIELD_PREP() in the macro
itself, but I wouldn't do that.

>  
>  #define TXVMVPRMSET0R			0x1d0
>  #define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)

-- 
Regards,

Laurent Pinchart
