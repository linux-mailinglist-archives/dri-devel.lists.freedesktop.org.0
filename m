Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37724757579
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 09:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF7B10E2F0;
	Tue, 18 Jul 2023 07:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E048610E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689665981; x=1721201981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJsIi3D4zDu0VjcUmmlsHRVnmLwOFqmIT/kb3xsdkMc=;
 b=kxuD5pY1zM3vf3/jL2ZdWUO++R1/AjqrALmOZRXFCXBrw310JaIPYD6Y
 cbBMKlG1pSW2ELUzNCM14RnPxqayXh/lhCo0Bz9uco2UzdYr0jZ/a2bXG
 KNvUmp7sdBI6Hh/Cm7wukjDYLSru68/Ne+XgQTAvZfLUNXwqkN4cnQ6Oc
 xBaIWvR19ZXAyIqgQhFVzVceTac6KqFyMChGO9pIQDafMTRKI+m+z32BM
 9BDrqunjpXeJc/6qE93zRsYeq/H0EGLt+cOLfeCi/H09nQ3G5bMGkwDhy
 rE2N75W1WD66VI//7MCnZ/Hp1Zb9nEK9nE/IbUQA5cBVW+QLpI52TWkOG g==;
X-IronPort-AV: E=Sophos;i="6.01,213,1684792800"; d="scan'208";a="31978588"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Jul 2023 09:39:37 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DA074280078;
 Tue, 18 Jul 2023 09:39:36 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Date: Tue, 18 Jul 2023 09:39:36 +0200
Message-ID: <3750806.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230717061831.1826878-1-victor.liu@nxp.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, jonas@kwiboo.se, Liu Ying <victor.liu@nxp.com>,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Montag, 17. Juli 2023, 08:18:22 CEST schrieb Liu Ying:
> Hi,
>=20
> This series aims to add MIPI DSI support for Freescale i.MX93 SoC.
>=20
> There is a Synopsys DesignWare MIPI DSI host controller and a Synopsys
> Designware MIPI DPHY embedded in i.MX93.  Some configurations and
> extensions to them are controlled by i.MX93 media blk-ctrl.
>=20
> Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> bridge helpers and implementing i.MX93 MIPI DSI specific extensions.
>=20
> Note that since this series touches the dw-mipi-dsi driver, tests are
> needed to be done for meson, rockchip and stm.
>=20
> Patch 1 ~ 7 do preparation work for adding i.MX93 MIPI DSI DRM bridge
> driver.
>=20
> Patch 8 adds DT-binding documentation for i.MX93 MIPI DSI.
>=20
> Patch 9 adds i.MX93 MIPI DSI DRM bridge.
>=20
> Liu Ying (9):
>   drm/bridge: synopsys: dw-mipi-dsi: Add dw_mipi_dsi_get_bridge() helper
>   drm/bridge: synopsys: dw-mipi-dsi: Add input bus format negotiation
>     support
>   drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
>   drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
>   drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate
>     lbcc
>   drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte clock cycles
>     for HSA and HBP
>   drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX timeout check
>   dt-bindings: display: bridge: Document Freescale i.MX93 MIPI DSI
>   drm/bridge: imx: Add i.MX93 MIPI DSI support
>=20
>  .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 115 +++
>  drivers/gpu/drm/bridge/imx/Kconfig            |  10 +
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   | 934 ++++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  91 +-
>  include/drm/bridge/dw_mipi_dsi.h              |  16 +
>  6 files changed, 1163 insertions(+), 4 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
> create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c

Thanks for posting this patch series. I was trying to use this driver on ou=
r=20
TQMa93xxLA platform where the DSI signals are connected to a TC9595 (driver=
=20
tc358767) DSI-to-DP bridge.
Unfortunately this bridge requires the DSI signals to be in LP-11 upon rese=
t=20
and while in idle, otherwise not even DP AUX channel is functional.
Apparently DSI is currently not in LP-11. But reading the RM I have no idea=
=20
how to configure the DSI host to achieve that. Do you have additional=20
information which might help me here?
Also could you provide your DT configuration?

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


