Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1057C1616E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081EE10E618;
	Tue, 28 Oct 2025 17:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SSZJVuch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689E510E618
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:15:54 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD07416A7;
 Tue, 28 Oct 2025 18:14:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761671644;
 bh=oV13qCNMhdQsYIt1US1XMzQqld9yzEtOiywD8jDHGh0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SSZJVuchdt6vwnuSuMLFyzO5Qy/zP0DL9YvgEMvLGxVJrenciauZGnIAAjRxHVN6I
 jwgW4AlHOg/FTUi60q9X6JUBw5aKByBgw9JHmPn5ArNHm7wFCwj6TADWMNxQDtaMs3
 CMx5qrKVbAFZdVQK5l6XoZeOaDwSf2IouhSjTbig=
Message-ID: <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
Date: Tue, 28 Oct 2025 19:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] drm/rcar-du: dsi: Clean up VCLKSET register
 macros
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <20251005030355.202242-6-marek.vasut+renesas@mailbox.org>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251005030355.202242-6-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 05/10/2025 06:02, Marek Vasut wrote:
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
> V2: Move FIELD_PREP() back into rcar_mipi_dsi_regs.h
> V3: Include linux/bitfield.h which contains the FIELD_PREP() macro
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      |  4 +++-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 12 ++++++------
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index e13249e0134b4..f6427476feb72 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2020 Renesas Electronics Corporation
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> @@ -624,6 +625,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	vclkset = VCLKSET_CKEN;
>  	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
>  
> +	/* Output is always RGB, never YCbCr */
>  	if (dsi_format == 24)
>  		vclkset |= VCLKSET_BPP_24;
>  	else if (dsi_format == 18)
> @@ -635,7 +637,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  		return -EINVAL;
>  	}
>  
> -	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
> +	vclkset |= VCLKSET_LANE(dsi->lanes - 1);
>  
>  	switch (dsi->info->model) {
>  	case RCAR_DSI_V3U:
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index 90e8e3de3e580..468f84cd1325e 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -246,14 +246,14 @@
>  
>  #define VCLKSET				0x100c
>  #define VCLKSET_CKEN			(1 << 16)
> -#define VCLKSET_COLOR_RGB		(0 << 8)
> -#define VCLKSET_COLOR_YCC		(1 << 8)
> +#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
>  #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
>  #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
> -#define VCLKSET_BPP_16			(0 << 2)
> -#define VCLKSET_BPP_18			(1 << 2)
> -#define VCLKSET_BPP_18L			(2 << 2)
> -#define VCLKSET_BPP_24			(3 << 2)
> +#define VCLKSET_BPP_MASK		(3 << 2)
> +#define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
> +#define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
> +#define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
> +#define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
>  #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
It probably doesn't matter, but just wanted to mention: here FIELD_PREP
is used with, e.g., (3 << 2). GENMASK returns an unsigned value, whereas
(3 << 2) is signed.

 Tomi

