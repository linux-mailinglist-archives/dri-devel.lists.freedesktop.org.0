Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D1691E4B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521A210ECED;
	Fri, 10 Feb 2023 11:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2893010E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 11:31:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQRcp-00060J-3o; Fri, 10 Feb 2023 12:31:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQRcm-003xHG-Vj; Fri, 10 Feb 2023 12:31:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQRcn-002OQt-1t; Fri, 10 Feb 2023 12:31:29 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Danilo Krummrich <dakr@redhat.com>, Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v4 0/2] drm/imx/lcdc: Implement DRM driver for imx25
Date: Fri, 10 Feb 2023 12:31:14 +0100
Message-Id: <20230210113116.404773-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Ez5XmZpZkVJKS/bmsGXsqscoKBsbRCxcShNhvoPQzu0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj5irlTqOv8W/RcSuOKpWDBAsjc2zeHIL5VeTwWGMW
 LuM7EQCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+Yq5QAKCRDB/BR4rcrsCWV1B/
 9Lz6RzBl/liixdm3dLaopbdbYwCZRyn6+o8+h4/cNn/otLUTLvUtwLqDkLVeZi/3a3HBVrQeG0sRZx
 qLF5TgqTUgaR6lF2EKKOHMwQQDPBwQ/T1B0HnEpTxLfRzqbwa/wyrazfQMq7O9AxhigLgjDYH0OOx0
 ShiPrAMGrdw2SbpYIWEwU+MLt0J5RuuiUumNeoML7xC4Q0Jl77b133BU1Jhfuq7Rs/AcwQGtyoXec+
 UWUClz92559clfd7KCP7eDtrH8OzqtZQZV55IWZOs/2egD74CiVMUTI/ZXZAJySwjEsOS4jMB08oCr
 pDhSTY2LpfCQWW2Pa6kG9Cu1Nlm/+V
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Changes since v3:

 - Don't use drm_of_find_panel_or_bridge, rely on panel-bridges instead (Sam)
 - Add support for XRGB8888 (Sam)
 - Make sure Kconfig + Makefile are added to the patch (*sigh*) (Philipp)
 - Rebase on a newer tree (which involves among others changes for 8ab59da26bc0
   ("drm/fb-helper: Move generic fbdev emulation into separate source file")
   and 00b5497d642b ("drm/simple-kms: Remove
   drm_gem_simple_display_pipe_prepare_fb()"). (Philipp)
 - Whitespace cleanup (Philipp)

A big thanks to Philipp who explained the necessary changes to drop
drm_of_find_panel_or_bridge and even implemented a part of it himself.

Patch 1 depends on patch "dt-bindings: display: Convert fsl,imx-fb.txt
to dt-schema" which currently sits in Rob's tree as
93266da2409b1709474be00f1becbbdaddb2b706. Patch 2 bases on "drm/imx:
move IPUv3 driver into separate subdirectory" which currentlich sits in
drm-misc-next-2023-01-03 as 4b6cb2b67da883bc5095ee6d77f951f1cd7a1c24.

Unchanged since v3 is that the binding is using a different compatible. This is
a bit ugly, but a drm driver needs a considerably different binding anyhow and
this is the chance to pick a better name: The legacy binding uses "imx25-fb"
(and similar for other SoCs), but the hardware unit is called LCDC and so I
picked "imx25-lcdc" as new name. The idea is to deprecate imx25-fb (et al) and
convert the imx25.dtsi to imx25-lcdc. (So I don't plan to have both variants in
the dtsi file which Rob considered ugly.)

Marian Cichy (1):
  drm/imx/lcdc: Implement DRM driver for imx25

Uwe Kleine-König (1):
  dt-bindings: display: imx: Describe drm binding for fsl,imx-lcdc

 .../bindings/display/imx/fsl,imx-lcdc.yaml    |  46 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/lcdc/Kconfig              |   7 +
 drivers/gpu/drm/imx/lcdc/Makefile             |   1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           | 555 ++++++++++++++++++
 6 files changed, 610 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/lcdc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/lcdc/Makefile
 create mode 100644 drivers/gpu/drm/imx/lcdc/imx-lcdc.c

base-commit: 2591939e881cf728b6ac45971eeec2f58051c101
prerequisite-patch-id: c3ef3de02516b5c159e76b40d2b4348a5ce0fe51
-- 
2.39.0

