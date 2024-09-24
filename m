Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D99840C1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB0010E291;
	Tue, 24 Sep 2024 08:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="V4tYCko+";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iVAqqYQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC1010E291
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1727167293; x=1758703293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=94JhhSqRQRupCtsnu1jPyU8mbjFFU1ugSNyOVeLAgTU=;
 b=V4tYCko+RaXONTqR7idfL2jCllBwGt4C8WLWEEXJZaZQ9WWGCLMcgC/k
 V0O51V5KlaF0UsxJ71Ltvq3c5kwjid4YemQllYRVIGFoEddp3y9r/Qwh+
 2lxFrU2LoqyEoGY2cechCtZTBQZwiY6ygmBDmuOpKZJLacjMDE80LTsaJ
 b7sNt6EEydAvgSsz9cbTEdhT9mVeWRjoAEdwEWVShNwIzQOsj7MydMObg
 ss5ZCkeXADIB/AHwXkN3gz1Qirc5K/XCTkBXPPoiNrkkcgoCph6/sNQWe
 mv8znC0NGZw4iAqO4hLUFrDur2W5OCqeoP6UMRt0J6eHl7V5Qa/z3jTTC Q==;
X-CSE-ConnectionGUID: HYHhDl3FRLe2UDLHD2H8Eg==
X-CSE-MsgGUID: lh+Hh1IZSMWCk0QEHSASpw==
X-IronPort-AV: E=Sophos;i="6.10,254,1719871200"; d="scan'208";a="39088260"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Sep 2024 10:41:31 +0200
X-CheckPoint: {66F27B3B-6-B8661266-C8AC785A}
X-MAIL-CPID: ED0BAF8E49DE59BF9E9DC9356ED979B3_5
X-Control-Analysis: str=0001.0A682F1B.66F27B3B.011D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF5591634CC; Tue, 24 Sep 2024 10:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1727167286;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=94JhhSqRQRupCtsnu1jPyU8mbjFFU1ugSNyOVeLAgTU=;
 b=iVAqqYQyAW2GfXjszyBFCEiYNDxoY1nFVTFIhq6CqYbygQFwC3qMhMgPA5t+m5K55GhQKu
 XXi8eIcUlsvOhnTDmgzrrqeLcoQgVoObd/URVlSU7jiAYKljXWi58vypBIYYA83zBhHb7Y
 C0uyMVxWqSoIwflC3xnKrv3tJIsuw9Owb9Ep2xx4NPW7IhiPm8FxxFd8QSVdIyh1GdkJpx
 i5zu/GfQvZ0LnpQDTgPA7+S73mV3+8iCWKw8rAl5KpgImWw1nttPX6bqXu0GL56v510gy/
 5OQ6C787NJ9UdAbdeT3UQ+g10Oi5Ud+R9rPyzIHFxhc5cVAjmwW3XNHuc7FpaA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, mripard@kernel.org,
 Sandor Yu <Sandor.yu@nxp.com>
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, sam@ravnborg.org
Subject: Re: [PATCH v17 1/8] drm: bridge: Cadence: Create mhdp helper driver
Date: Tue, 24 Sep 2024 10:41:26 +0200
Message-ID: <2773403.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <6e2e4951aa4c69eed68af231c2b0b2ce302b2358.1727159906.git.Sandor.yu@nxp.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <6e2e4951aa4c69eed68af231c2b0b2ce302b2358.1727159906.git.Sandor.yu@nxp.com>
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

Hi Sandor,

Am Dienstag, 24. September 2024, 09:36:46 CEST schrieb Sandor Yu:
> MHDP8546 mailbox access functions will be share to other mhdp driver
> and Cadence HDP-TX HDMI/DP PHY drivers.
> Create a new mhdp helper driver and move all those functions into.
>=20
> cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(),
> because it use the DPTX command ID DPTX_WRITE_REGISTER.
>=20
> New cdns_mhdp_reg_write() is created with the general command ID
> GENERAL_REGISTER_WRITE.
>=20
> Rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
> use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
> same as the other mailbox access functions.
>=20
> Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
> to prevent race conditions in mailbox access by multi drivers.
>=20
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v16->v17:
> - Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mu=
tex
>=20
> v12->v16:
>  *No change.
>=20
> V11->v12:
> - Move status initialize out of mbox_mutex.
> - Reorder API functions in alphabetical.
> - Add notes for malibox access functions.
> - Add year 2024 to copyright.
>=20
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
>  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 307 +++++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 425 ++++--------------
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  47 +-
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  36 +-
>  include/drm/bridge/cdns-mhdp-helper.h         |  94 ++++
>  7 files changed, 507 insertions(+), 407 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
>  create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
>=20
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bri=
dge/cadence/Kconfig
> index cced81633ddcd..e0973339e9e33 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -21,6 +21,9 @@ config DRM_CDNS_DSI_J721E
>  	  the routing of the DSS DPI signal to the Cadence DSI.
>  endif
> =20
> +config CDNS_MHDP_HELPER
> +	tristate
> +
>  config DRM_CDNS_MHDP8546
>  	tristate "Cadence DPI/DP bridge"
>  	select DRM_DISPLAY_DP_HELPER
> @@ -28,6 +31,7 @@ config DRM_CDNS_MHDP8546
>  	select DRM_DISPLAY_HELPER
>  	select DRM_KMS_HELPER
>  	select DRM_PANEL_BRIDGE
> +	select CDNS_MHDP_HELPER
>  	depends on OF
>  	help
>  	  Support Cadence DPI to DP bridge. This is an internal
> diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/br=
idge/cadence/Makefile
> index c95fd5b81d137..087dc074820d7 100644
> --- a/drivers/gpu/drm/bridge/cadence/Makefile
> +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_DRM_CDNS_DSI) +=3D cdns-dsi.o
>  cdns-dsi-y :=3D cdns-dsi-core.o
>  cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) +=3D cdns-dsi-j721e.o
> +obj-$(CONFIG_CDNS_MHDP_HELPER) +=3D cdns-mhdp-helper.o
>  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
>  cdns-mhdp8546-y :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
>  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D cdns-mhdp8546-j721e=
=2Eo
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c b/drivers/=
gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> new file mode 100644
> index 0000000000000..c60a6b69a5343
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> @@ -0,0 +1,307 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023, 2024 NXP Semiconductor, Inc.
> + *
> + */
> +#include <drm/bridge/cdns-mhdp-helper.h>
> +#include <linux/dev_printk.h>
> +#include <linux/module.h>
> +
> +/* Protects mailbox communications with the firmware */
> +DEFINE_MUTEX(mhdp_mailbox_mutex);

This is not enough if the driver is built as a module:

> ERROR: modpost: "mhdp_mailbox_mutex"
> [drivers/gpu/drm/bridge/cadence/cdns-mhdp8546.ko] undefined! ERROR:
> modpost: "mhdp_mailbox_mutex"
> [drivers/gpu/drm/bridge/cadence/cdns-mhdp8501.ko] undefined!

Not sure if EXPORT_SYMBOL_GPL() on a mutex is considered good style.

Best regards,
Alexander

> [snip]
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


