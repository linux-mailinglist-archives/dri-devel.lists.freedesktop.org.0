Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341E164EB8C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 13:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1529710E5C4;
	Fri, 16 Dec 2022 12:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A3510E5C4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 12:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1671194509; x=1702730509;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=pikPuKrToRkzNeBUEXlUPGDHdgZLhXcBd7Ep3d+eRHg=;
 b=CfTev/AQS6NwYPL2M2DZjsu1DuCKrvmkyNmz7Wq2Xntq232WIvxRD8m1
 V1eZahIIYIt++hdop031bDgKWzuhNIr0sB6jS/9F3qg6Bgh2EC+Po2rJT
 JkLZV/WGJByFZauB3BDwlFCa+7dsxiJ4z5ddI9lXb5AgHWor5zBsNIg6O
 7+vfqKlrr58Galj5jwoX59+5JaKZ2BFZzgVgMpIqLLqDVxYx++q/SZxA0
 mqa2/ybZ5W1x74pySaDw22eVpnrMCKkk2xEwVLx28VGBox6oZhcIHh7Xz
 UWFwawqe/2PQ9fF6w9n5uB+Lq0++qh6T62l0Q+GLQ9VVDUsxTqQFsD/zs Q==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; d="scan'208";a="28000107"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 16 Dec 2022 13:41:45 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 16 Dec 2022 13:41:45 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 16 Dec 2022 13:41:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1671194505; x=1702730505;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=pikPuKrToRkzNeBUEXlUPGDHdgZLhXcBd7Ep3d+eRHg=;
 b=a+CrgECBCHriFdAby2Mi/A8gcsdoXqm/qAVsggxo/obEdDLIrYLarY77
 IcF3F/+R9dkQYWHnXeleOasouDYFfNUDi1sQDAmdm7EN3h+9T3RjGJB2z
 MAVsZNqlm5Y2Q/Z1dHvhcd2E477aUzTZE5sEZQQ64ZHw2KerUe5N9ZjZC
 tUy/eePf4KlYeUHh0OGhO+41zEzxkaiC0HfWJqBKvuS7tbNkjsdkoiN2z
 AuB3fzizT+s8lfdbjOZLYN+c1P3w3b35E7l6yNSllxpgAzaicM6gtiTTr
 gygDPvYammvGylRRbl2qC+3WM6eZVyJdwWvqTR/eF/WSoWtjnBB9EkmDu Q==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; d="scan'208";a="28000106"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Dec 2022 13:41:44 +0100
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id C8123280071;
 Fri, 16 Dec 2022 13:41:44 +0100 (CET)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Fri, 16 Dec 2022 13:41:44
 +0100
Subject: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
From: "Alexander Stein" <Alexander.Stein@ew.tq-group.com>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>,
 Joonyoung
 Shim <jy0922.shim@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>, "Fancy Fang" <chen.fang@nxp.com>, Tim
 Harvey <tharvey@gateworks.com>, "Michael Nazzareno Trimarchi"
 <michael@amarulasolutions.com>, "Adam Ford" <aford173@gmail.com>, Neil
 Armstrong <narmstrong@linaro.org>, "Robert Foss" <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Tommaso Merciai"
 <tommaso.merciai@amarulasolutions.com>, "Marek Vasut" <marex@denx.de>, 
 =?us-ascii?Q?dri-devel=40lists=2Efreedesktop=2Eorg?=
 <dri-devel@lists.freedesktop.org>
Date: Fri, 16 Dec 2022 12:41:44 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.M8v6u+rKTzSz7sYJ8gOMcw.APTbwEsR2QE@vtuxmail01.tq-net.de>
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
Cc: =?us-ascii?Q?linux-samsung-soc=40vger=2Ekernel=2Eorg?=
 <linux-samsung-soc@vger.kernel.org>, Matteo Lisi <matteo.lisi@engicam.com>,
 =?us-ascii?Q?dri-devel=40lists=2Efreedeskto?= =?us-ascii?Q?p=2Eorg?=
 <dri-devel@lists.freedesktop.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 =?us-ascii?Q?linux-arm-kernel=40lists=2Einfradead=2Eorg?=
 <linux-arm-kernel@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thanks for the new update.

Am Mittwoch, 14. Dezember 2022, 13:58:49 CET schrieb Jagan Teki:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>=20
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>=20
> Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge
>=20
> Patch 0005 - 0006: optional PHY, PMS_P offset
>=20
> Patch 0007       : introduce hw_type
>=20
> Patch 0008=09 : fixing host init
>=20
> Patch 0009=09 : atomic_check
>=20
> Patch 0010=09 : input_bus_flags
>=20
> Patch 0011=09 : atomic_get_input_bus_fmts
>=20
> Patch 0012 - 0013: component vs bridge
>=20
> Patch 0014=09 : DSIM bridge
>=20
> Patch 0015 - 0016: i.MX8M Mini/Nano
>=20
> Patch 0017 - 0018: i.MX8M Plus

Tested using LVDS bridges and works on:
* imx8mp-tqma8mpql-mba8mpxl (i.MX8M Plus)
* imx8mm-tqma8mqml-mba8mx (i.MX8M Mini)
* imx8mn-tqma8mqnl-mba8mx (i.MX8M Nano)

But I noticed that tqma8mqml and tqma8mqnl only have a stable output if I=20
specify 'data-lanes =3D <0 1 2>' (not <0 1 2 3>!) on the DSI-LVDS-Bridge (TI=20
SN65DSI83) input endpoint, e.g.=20

dsi_lvds_bridge: bridge@2d {
=09compatible =3D "ti,sn65dsi83";
=09reg =3D <0x2d>;
=09enable-gpios =3D <&gpio_delays 0 130000 0>;
=09vcc-supply =3D <&reg_sn65dsi83_1v8>;
=09status =3D "okay";
=09ports {
=09=09#address-cells =3D <1>;
=09=09#size-cells =3D <0>;
=09=09port@0 {
=09=09=09reg =3D <0>;
=09=09=09lvds_bridge_in: endpoint {
=09=09=09=09data-lanes =3D <0 1 2>;
=09=09=09=09remote-endpoint =3D <&mipi_dsi_out>;
=09=09=09};
=09=09};
=09=09port@2 {
=09=09=09reg =3D <2>;
=09=09=09lvds_bridge_out: endpoint {
=09=09=09=09remote-endpoint =3D <&panel_in_lvds0>;
=09=09=09};
=09=09};
=09};
};

I have no idea if this is on the DSIM side or the DSI-LVDS bridge side.=20
Register 0xe5 on sn65dsi83 shows that CHA_LPP_ERR and CHA_SOT_BIT_ERR error=20
bits are set, indicating there are low level protocol and SoT leader sequence=20
bit errors. I can't find any significant difference in sn65dsi83 driver=20
compared to downstream-kernel, so I would assume something in DSIM driver is=20
different.

Best regards,
Alexander

> Changes for v10:
> - rebase on drm-misc-next
> - add drm_of_dsi_find_panel_or_bridge
> - add devm_drm_of_dsi_get_bridge
> - fix host initialization (Thanks to Marek Szyprowski)
> - rearrange the tiny patches for easy to review
> - update simple names for enum hw_type
> - add is_hw_exynos macro
> - rework on commit messages
>=20
> Changes for v9:
> - rebase on drm-misc-next
> - drop drm bridge attach fix for Exynos
> - added prepare_prev_first flag
> - added pre_enable_prev_first flag
> - fix bridge chain order for exynos
> - added fix for Exynos host init for first DSI transfer
> - added MEDIA_BUS_FMT_FIXED
> - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
>   list is unsupported.
> - added MEDIA_BUS_FMT_YUYV10_1X20
> - added MEDIA_BUS_FMT_YUYV12_1X24
>=20
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support
>=20
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
>=20
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge
>=20
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
>=20
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
>=20
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
>=20
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
>=20
> Tested in Engicam i.Core MX8M Mini SoM.
>=20
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>=20
> v9:
> https://lore.kernel.org/all/20221209152343.180139-1-jagan@amarulasolutions.c
> om/
>=20
> Any inputs=3F
> Jagan.
>=20
> Jagan Teki (16):
>   drm: of: Lookup if child node has DSI panel or bridge
>   drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
>   drm: exynos: dsi: Drop explicit call to bridge detach
>   drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
>   drm: exynos: dsi: Mark PHY as optional
>   drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
>   drm: exynos: dsi: Introduce hw_type platform data
>   drm: exynos: dsi: Add atomic check
>   drm: exynos: dsi: Add input_bus_flags
>   drm: exynos: dsi: Add atomic_get_input_bus_fmts
>   drm: exynos: dsi: Consolidate component and bridge
>   drm: exynos: dsi: Add Exynos based host irq hooks
>   drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
>   drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
>=20
> Marek Szyprowski (1):
>   drm: exynos: dsi: Handle proper host initialization
>=20
> Marek Vasut (1):
>   drm: bridge: samsung-dsim: Add i.MX8M Plus support
>=20
>  .../bindings/display/exynos/exynos_dsim.txt   |    2 +
>  MAINTAINERS                                   |    9 +
>  drivers/gpu/drm/bridge/Kconfig                |   12 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/panel.c                |   34 +
>  drivers/gpu/drm/bridge/samsung-dsim.c         | 1883 +++++++++++++++++
>  drivers/gpu/drm/drm_of.c                      |  113 +-
>  drivers/gpu/drm/exynos/Kconfig                |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1793 +---------------
>  include/drm/bridge/samsung-dsim.h             |  119 ++
>  include/drm/drm_bridge.h                      |    2 +
>  include/drm/drm_of.h                          |   12 +
>  12 files changed, 2285 insertions(+), 1696 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h

