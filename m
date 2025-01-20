Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D22A16C79
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 13:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E5C10E3D8;
	Mon, 20 Jan 2025 12:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="U+Xt0EzW";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bus6D5zv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FF210E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 12:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1737376961; x=1768912961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BFbLO2cWEj/ewd8T0a5o19kMyH/UgRwpUTORKD2vQPE=;
 b=U+Xt0EzWtStxINCUyUdIAt+5h8wc8iTAlbb/JFAmQoTzF8zAN6i4Q8Ef
 qzYZE//E+WXJYsMThlXdE+xEog/l6cHeOhSOqECYJPCCoUGlEDZZGrMEw
 0+4wFJnsb5N6y1XSuzUrVdQhLzdSEqt0uL+mV/wplGZzzvDPR+ZVl/+7U
 jOESmcIvO5Jkoed5XAIDR0vkk2pgCKeGwWr198lzGOBGGg38HLgJmfAhr
 e18waaQv4cXb0BCsovcg7SQxkR3fXy/QbV36fN5DOzOgJ2PMjsh4b0lfu
 X9Plpx4YfWgcoqV3DdXFrLoSer+xE7H50tEZ2xqPAUE8rei220fAiKxEP w==;
X-CSE-ConnectionGUID: COd6TbPtS0Wo8zLnhXP/Jw==
X-CSE-MsgGUID: 0SI4MExNTE+WT2b711KhVg==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; d="scan'208";a="41176678"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 20 Jan 2025 13:42:39 +0100
X-CheckPoint: {678E44BF-19-1D00F64B-E6C57517}
X-MAIL-CPID: 56D54D38078A618C932D445764D7CD5B_3
X-Control-Analysis: str=0001.0A682F24.678E44BF.0074, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 71AA71613E2; Mon, 20 Jan 2025 13:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1737376954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFbLO2cWEj/ewd8T0a5o19kMyH/UgRwpUTORKD2vQPE=;
 b=bus6D5zvDFjT4oG9qlrEpb55JO3o+gMJDdVZDdtUQb3nSOcE0snBY3LtRAp0HgavLujZjz
 XBCEQopghZPuRcc0JL7tcvzCPNoOhAM6aa3RXCubSX+oQqjK1g8QTVJYbcqhzLH2+sfKrV
 80iyYN0FoeGCkZc9KEdSIl56jsL25WPTEkfaTYaAvW3FGnkaehlOkmpOd40Ay6kRHXP1zQ
 ZfVQRKNfVhj++N/PltKnWbIPygfsjQtBmn2XtzfSf8fUk9WWh7C9SbCcf6tkmcjjWBwv8d
 W5afYqerakW7t/Ac2VPVYNZTCKbgHC4lwHT5DzN6/pw9XWeyQqa0oZYqp3ur9A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Esben Haabendal <esben@geanix.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Esben Haabendal <esben@geanix.com>
Subject: Re: drm/bridge: nwl-dsi: Use vsync/hsync polarity from display mode
Date: Mon, 20 Jan 2025 13:42:30 +0100
Message-ID: <4658759.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240814-nwl-dsi-sync-polarity-v1-1-ee198e369196@geanix.com>
References: <20240814-nwl-dsi-sync-polarity-v1-1-ee198e369196@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

I'm sorry I'm late to the party.

Am Mittwoch, 14. August 2024, 12:37:26 CET schrieb Esben Haabendal:
> Using the correct bit helps. The documentation specifies bit 0 in both
> registers to be controlling polarity of dpi_vsync_input and
> dpi_hsync_input polarity. Bit 1 is reserved, and should therefore not be
> set.
>=20
> Tested with panel that requires active high vsync and hsync.
>=20
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I just noticed this commit causes a regression on my platform TQMa8Mx/MBa8M=
x.
DT overlay: arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070j=
vhg33.dtso
My bridges are configured as follow:
> $ cat /sys/kernel/debug/dri/30320000.lcd-controller/encoder-0/bridges
> bridge[0]: nwl_dsi_bridge_funcs [nwl_dsi]
>=20
>         type: [0] Unknown
>         OF: /soc@0/bus@30800000/dsi@30a00000:fsl,imx8mq-nwl-dsi
>         ops: [0x0]
>=20
> bridge[1]: sn65dsi83_funcs [ti_sn65dsi83]
>=20
>         type: [0] Unknown
>         OF: /soc@0/bus@30800000/i2c@30a40000/bridge@2d:ti,sn65dsi84
>         ops: [0x0]
>=20
> bridge[2]: panel_bridge_bridge_funcs
>=20
>         type: [7] LVDS
>         OF: /panel-lvds:tianma,tm070jvhg33
>         ops: [0x8] modes

The display needs active-low sync signals, otherwise the image is shifted
by the amount of sync pulse.
The patch itself looks good. But there is also nwl_dsi_bridge_atomic_check()
unconditionally enabling DRM_MODE_FLAG_PHSYNC and DRM_MODE_FLAG_PVSYNC.

Reverting the patch immediately restores the display image correctly.

Best regards,
Alexander
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 8 ++++----
>  drivers/gpu/drm/bridge/nwl-dsi.h | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
>=20
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240814-nwl-dsi-sync-polarity-ddc58435a4c4
>=20
> Best regards,
>=20
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nw=
l-dsi.c
> index 8d54091ec66e..5f05647a3bea 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -289,13 +289,13 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
> =20
>  	nwl_dsi_write(dsi, NWL_DSI_INTERFACE_COLOR_CODING, NWL_DSI_DPI_24_BIT);
>  	nwl_dsi_write(dsi, NWL_DSI_PIXEL_FORMAT, color_format);
> -	/*
> -	 * Adjusting input polarity based on the video mode results in
> -	 * a black screen so always pick active low:
> -	 */
>  	nwl_dsi_write(dsi, NWL_DSI_VSYNC_POLARITY,
> +		      dsi->mode.flags & DRM_MODE_FLAG_PVSYNC ?
> +		      NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH :
>  		      NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW);
>  	nwl_dsi_write(dsi, NWL_DSI_HSYNC_POLARITY,
> +		      dsi->mode.flags & DRM_MODE_FLAG_PHSYNC ?
> +		      NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH :
>  		      NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW);
> =20
>  	burst_mode =3D (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.h b/drivers/gpu/drm/bridge/nw=
l-dsi.h
> index a247a8a11c7c..61e7d65cb1eb 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.h
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.h
> @@ -30,11 +30,11 @@
>  #define NWL_DSI_PIXEL_FORMAT			0x20c
>  #define NWL_DSI_VSYNC_POLARITY			0x210
>  #define NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW	0
> -#define NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
> +#define NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH	BIT(0)
> =20
>  #define NWL_DSI_HSYNC_POLARITY			0x214
>  #define NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW	0
> -#define NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
> +#define NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH	BIT(0)
> =20
>  #define NWL_DSI_VIDEO_MODE			0x218
>  #define NWL_DSI_HFP				0x21c
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


