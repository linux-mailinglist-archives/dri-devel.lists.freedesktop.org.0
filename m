Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFD64EC11
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 14:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE2F10E5C9;
	Fri, 16 Dec 2022 13:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EC010E5C9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1671197127; x=1702733127;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=2rOMZ+WqluKpGt9T2gsxd25x1tfiSnhzu7edlmN+S9g=;
 b=pPp/nmrY0nJTc4vGcFAJQOhqG4/gDt7IXHQYNcVAC4R2ER9SdPUdGlX7
 21MduhHuBz/6WpOYwfGjODaJE9UDkL5Y74D+Ga37yJsFAk3IdQFwQTTHh
 xBZ3xHlSUbfikK5fqHnX+7FdOq1LJwn/zRQibyjiaZTc17Hp48wgd1SF2
 OrV7GmiSscx5oNB/e3WEvp4cuDJUH3tKYHqCJCHwfMqE2pK40xseIhmna
 XSCGnuZ6HW0D5po9R9PW+/guF+RSltIkRPaTatFTe/bDGrEe2fF5mXhAk
 ctJoYiC+8RrAvzIwIHvLykJFE2TIv91TdxktSgnAwzVvT/aCRdh0wWpEA A==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; d="scan'208";a="28001487"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 16 Dec 2022 14:25:25 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 16 Dec 2022 14:25:25 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 16 Dec 2022 14:25:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1671197125; x=1702733125;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=2rOMZ+WqluKpGt9T2gsxd25x1tfiSnhzu7edlmN+S9g=;
 b=K7l5P3KCV1L0/MuHZKncEXqK6Zc/7mVtmy2HpJTwRljiQGrlrE6MRsvi
 ZiQ8sxHE0zPYs6oWnsCzXEpQdyELBGBYhw77IAKCoR5035znvnqVse/3u
 JgG5M+XnyvkGcSBmvcpMWZzqhyGHraZ8offJrpS+DyugkqPXTbO4he7pf
 MyL3xzWTWmquq/wy2dIexd+6enOgHB+dJUMAC3aUiSIxnLHIMoATx5AxJ
 Y2XCdJUjMg9/EbWjiK58JAmLSjZxiQmTVlKSsuq6yCm8PDjmocgzxfgWB
 jEGuwoAPZQBETFcLj9uk3/E/Gj4AlA9tkPnKo+XRpf1OzTUhETGCMgP5M w==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; d="scan'208";a="28001486"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Dec 2022 14:25:25 +0100
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id DFA1E280071;
 Fri, 16 Dec 2022 14:25:24 +0100 (CET)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Fri, 16 Dec 2022 14:25:24
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
 <tommaso.merciai@amarulasolutions.com>, =?us-ascii?Q?dri-devel=40lists?=
 =?us-ascii?Q?=2Efreedesktop=2Eorg?= <dri-devel@lists.freedesktop.org>, Marek
 Vasut <marex@denx.de>
Date: Fri, 16 Dec 2022 13:25:24 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.rJtELH1tRkiK3DwrGM4cgg.ADqA2lER2QE@vtuxmail01.tq-net.de>
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
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 =?us-ascii?Q?linux-arm-kernel=40?= =?us-ascii?Q?lists=2Einfradead=2Eorg?=
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Am Freitag, 16. Dezember 2022, 13:58:13 CET schrieb Marek Vasut:
> On 12/16/22 13:41, Alexander Stein wrote:
> > Hi,
>=20
> Hi,
>=20
> > thanks for the new update.
> >=20
> > Am Mittwoch, 14. Dezember 2022, 13:58:49 CET schrieb Jagan Teki:
> >> This series supports common bridge support for Samsung MIPI DSIM
> >> which is used in Exynos and i.MX8MM SoC's.
> >>=20
> >> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> >>=20
> >> Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge
> >>=20
> >> Patch 0005 - 0006: optional PHY, PMS_P offset
> >>=20
> >> Patch 0007       : introduce hw_type
> >>=20
> >> Patch 0008=09 : fixing host init
> >>=20
> >> Patch 0009=09 : atomic_check
> >>=20
> >> Patch 0010=09 : input_bus_flags
> >>=20
> >> Patch 0011=09 : atomic_get_input_bus_fmts
> >>=20
> >> Patch 0012 - 0013: component vs bridge
> >>=20
> >> Patch 0014=09 : DSIM bridge
> >>=20
> >> Patch 0015 - 0016: i.MX8M Mini/Nano
> >>=20
> >> Patch 0017 - 0018: i.MX8M Plus
> >=20
> > Tested using LVDS bridges and works on:
> > * imx8mp-tqma8mpql-mba8mpxl (i.MX8M Plus)
> > * imx8mm-tqma8mqml-mba8mx (i.MX8M Mini)
> > * imx8mn-tqma8mqnl-mba8mx (i.MX8M Nano)
> >=20
> > But I noticed that tqma8mqml and tqma8mqnl only have a stable output if I
> > specify 'data-lanes =3D <0 1 2>' (not <0 1 2 3>!) on the DSI-LVDS-Bridge (TI
> > SN65DSI83) input endpoint, e.g.
> >=20
> > dsi_lvds_bridge: bridge@2d {
> >=20
> > =09compatible =3D "ti,sn65dsi83";
> > =09reg =3D <0x2d>;
> > =09enable-gpios =3D <&gpio_delays 0 130000 0>;
> > =09vcc-supply =3D <&reg_sn65dsi83_1v8>;
> > =09status =3D "okay";
> > =09ports {
> > =09
> > =09=09#address-cells =3D <1>;
> > =09=09#size-cells =3D <0>;
> > =09=09port@0 {
> > =09=09
> > =09=09=09reg =3D <0>;
> > =09=09=09lvds_bridge_in: endpoint {
> > =09=09=09
> > =09=09=09=09data-lanes =3D <0 1 2>;
> > =09=09=09=09remote-endpoint =3D <&mipi_dsi_out>;
> > =09=09=09
> > =09=09=09};
> > =09=09
> > =09=09};
> > =09=09port@2 {
> > =09=09
> > =09=09=09reg =3D <2>;
> > =09=09=09lvds_bridge_out: endpoint {
> > =09=09=09
> > =09=09=09=09remote-endpoint =3D <&panel_in_lvds0>;
> > =09=09=09
> > =09=09=09};
> > =09=09
> > =09=09};
> > =09
> > =09};
> >=20
> > };
> >=20
> > I have no idea if this is on the DSIM side or the DSI-LVDS bridge side.
> > Register 0xe5 on sn65dsi83 shows that CHA_LPP_ERR and CHA_SOT_BIT_ERR
> > error
> > bits are set, indicating there are low level protocol and SoT leader
> > sequence bit errors. I can't find any significant difference in sn65dsi83
> > driver compared to downstream-kernel, so I would assume something in DSIM
> > driver is different.
>=20
> Make sure the HS clock rate expected by the DSI83 bridge chip and the
> one generated by the DSIM bridge from PMS PLL match. There is currently
> no negotiation of this frequency and both sides divine it on their own.
>=20
> See sn65dsi83_get_dsi_range() and samsung_dsim_set_pll().

Oh, nice, thanks for the pointer. When setting
> samsung,burst-clock-frequency =3D <668250000>;
in imx8mm.dtsi
I get a non-flickering display using 4 lanes. Although admittedly this is just=20
random guessing. I'm not sure which clock exactly has to be in the range=20
CHA_DSI_CLK_RANGE is configured to. With 4 lanes SN65DSI84 is configured for=20
205-210 MHz (0x29), while I get these PLL PMS settings on DSIM:
> samsung-dsim 32e10000.dsi: PLL freq 668250000, (p 4, m 99, s 0)
> samsung-dsim 32e10000.dsi: hs_clk =3D 668250000, byte_clk =3D 83531250, esc_clk=20
=3D 16706250

AFAICS DSIM bridge is configurung hs_clk, byte_clk and esc_clk just from DT=20
properties, while SN65DSI84 is using display mode and number of lanes.

Is it expected that the DSIM PLL frequencies are set in DT for a specific=20
bridge/display setup=3F

Best regards,
Alexander

