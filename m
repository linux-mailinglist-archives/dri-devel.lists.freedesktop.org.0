Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2681B95BBB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 13:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB61910E5FA;
	Tue, 23 Sep 2025 11:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ls92GY7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C917510E5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:50:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 375B9346;
 Tue, 23 Sep 2025 13:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1758628143;
 bh=UB3TN90rActZ9Wj06hzs7IkzVP75N6SiQc2gYIYHz+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ls92GY7HR+xgcakY0ytSKRr5XLvcF+vHAdUqO6Syu0V0IuRszVEzuoXT6RbqswbAD
 N1O4tA0XhZUgv8VnWCITv4lw+XD7trqIXU1JhaIj6nQJsWM8hETpjSdLi0ebq6NpHw
 We1Kr1T3N6ttX9SHUwXnG3GReBxpo2qGT67/QSzg=
Date: Tue, 23 Sep 2025 14:49:54 +0300
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
Subject: Re: [PATCH 3/9] drm/rcar-du: dsi: Clean up VCLKSET register macros
Message-ID: <20250923114954.GE20765@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-4-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922185740.153759-4-marek.vasut+renesas@mailbox.org>
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

Hi Marek,

Thank you for the patch.

On Mon, Sep 22, 2025 at 08:54:59PM +0200, Marek Vasut wrote:
> Introduce VCLKSET_BPP_MASK macro and use FIELD_PREP() to generate
> appropriate bitfield from mask and value without bitshift. Remove
> VCLKSET_COLOR_RGB which is never used, replace it with code comment.
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
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      |  9 +++++----
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 12 ++++++------
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index a550bda6debbe..2374cbe3768f2 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -621,18 +621,19 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	vclkset = VCLKSET_CKEN;
>  	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
>  
> +	/* Output is always RGB, never YCbCr */
>  	if (dsi_format == 24)
> -		vclkset |= VCLKSET_BPP_24;
> +		vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_24);
>  	else if (dsi_format == 18)
> -		vclkset |= VCLKSET_BPP_18;
> +		vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_18);
>  	else if (dsi_format == 16)
> -		vclkset |= VCLKSET_BPP_16;
> +		vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_16);

I personally find this less readable.

>  	else {
>  		dev_warn(dsi->dev, "unsupported format");
>  		return -EINVAL;
>  	}
>  
> -	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
> +	vclkset |= VCLKSET_LANE(dsi->lanes - 1);
>  
>  	switch (dsi->info->model) {
>  	case RCAR_DSI_V3U:
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index dd871e17dcf53..c2cb06ef144ed 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -245,14 +245,14 @@
>  
>  #define VCLKSET				0x100c
>  #define VCLKSET_CKEN			(1 << 16)
> -#define VCLKSET_COLOR_RGB		(0 << 8)
> -#define VCLKSET_COLOR_YCC		(1 << 8)
> +#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */

This I like.

>  #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
>  #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
> -#define VCLKSET_BPP_16			(0 << 2)
> -#define VCLKSET_BPP_18			(1 << 2)
> -#define VCLKSET_BPP_18L			(2 << 2)
> -#define VCLKSET_BPP_24			(3 << 2)
> +#define VCLKSET_BPP_MASK		(3 << 2)
> +#define VCLKSET_BPP_16			0
> +#define VCLKSET_BPP_18			1
> +#define VCLKSET_BPP_18L			2
> +#define VCLKSET_BPP_24			3

If you'd rather get rid of the shifts, why not

#define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
#define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
#define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
#define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)

without touching the users ? Personally I'd keep the shifts though.

>  #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
>  
>  #define VCLKEN				0x1010

-- 
Regards,

Laurent Pinchart
