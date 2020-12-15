Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08392DAB0D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D81E6E1A8;
	Tue, 15 Dec 2020 10:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E055A6E19B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAl02q123774
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029220;
 bh=2hfIpuljLaUNZZGsYA+3Gv8DMZcC/H4ACUmtxzp+VDo=;
 h=From:To:CC:Subject:Date;
 b=v56U+a++prcmxddGdIUnfSaKEb7vAUXUPHZBUl2wpvDAtr4RPj6Mpzsiws6P/ZPlC
 Lz59oQ7p8Q7yShJ0cFkfCKAyHXJqd5byRA2hmJaVPFDnuDRFnOpzwaDH9Hk4R6ZkP0
 6a+SyitJa+Y2v1zS53R95qbXVDMa4TIRg82V9qhc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAl0Nu100630
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:00 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:46:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:46:59 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwZk046467;
 Tue, 15 Dec 2020 04:46:58 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 00/84] Convert DSI code to use drm_mipi_dsi and drm_panel
Date: Tue, 15 Dec 2020 12:45:33 +0200
Message-ID: <20201215104657.802264-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the sixth and hopefully last version of the OMAP DSI conversion
series. The previous version is here:

https://www.spinics.net/lists/linux-omap/msg157795.html

This version has only cosmetic changes and added reviewed-bys, and I'm
mainly sending this so that I'm able to dim apply it. because of that,
and the amount of patches in the series, I'm not cc'ing anyone in this
one to avoid needless spamming.

 Tomi

Sebastian Reichel (49):
  Revert "drm/omap: dss: Remove unused omap_dss_device operations"
  drm/omap: drop unused dsi.configure_pins
  drm/omap: dsi: use MIPI_DSI_FMT_* instead of OMAP_DSS_DSI_FMT_*
  drm/omap: constify write buffers
  drm/omap: dsi: add generic transfer function
  drm/omap: panel-dsi-cm: convert to transfer API
  drm/omap: dsi: unexport specific data transfer functions
  drm/omap: dsi: drop virtual channel logic
  drm/omap: dsi: simplify write function
  drm/omap: dsi: simplify read functions
  drm/omap: dsi: switch dsi_vc_send_long/short to mipi_dsi_msg
  drm/omap: dsi: introduce mipi_dsi_host
  drm/omap: panel-dsi-cm: use DSI helpers
  drm/omap: dsi: request VC via mipi_dsi_attach
  drm/omap: panel-dsi-cm: drop hardcoded VC
  drm/omap: panel-dsi-cm: use common MIPI DCS 1.3 defines
  drm/omap: dsi: drop unused memory_read()
  drm/omap: dsi: drop unused get_te()
  drm/omap: dsi: drop unused enable_te()
  drm/omap: dsi: drop useless sync()
  drm/omap: dsi: use pixel-format and mode from attach
  drm/omap: panel-dsi-cm: use bulk regulator API
  drm/omap: dsi: lp/hs switching support for transfer()
  drm/omap: dsi: move TE GPIO handling into core
  drm/omap: dsi: drop custom enable_te() API
  drm/omap: dsi: do bus locking in host driver
  drm/omap: dsi: untangle ulps ops from enable/disable
  drm/omap: dsi: do ULPS in host driver
  drm/omap: dsi: move panel refresh function to host
  drm/omap: dsi: Reverse direction of the DSS device enable/disable
    operations
  drm/omap: dsi: drop custom panel capability support
  drm/omap: dsi: convert to drm_panel
  drm/omap: drop omapdss-boot-init
  drm/omap: dsi: implement check timings
  drm/omap: panel-dsi-cm: use DEVICE_ATTR_RO
  drm/omap: panel-dsi-cm: support unbinding
  drm/omap: panel-dsi-cm: fix remove()
  drm/omap: remove global dss_device variable
  drm/panel: Move OMAP's DSI command mode panel driver
  drm/omap: dsi: Register a drm_bridge
  drm/omap: remove legacy DSS device operations
  drm/omap: remove unused omap_connector
  drm/omap: simplify omap_display_id
  drm/omap: drop unused DSS next pointer
  drm/omap: drop DSS ops_flags
  drm/omap: drop dssdev display field
  drm/omap: simplify DSI manual update code
  drm/omap: dsi: simplify pin config
  ARM: omap2plus_defconfig: Update for moved DSI command mode panel

Tomi Valkeinen (35):
  drm/omap: squash omapdrm sub-modules into one
  drm/omap: remove unused display.c
  drm/omap: drop unused owner field
  drm/omap: remove dispc_ops
  drm/omap: remove dss_mgr_ops
  drm/panel: panel-dsi-cm: use MIPI_DCS_GET_ERROR_COUNT_ON_DSI
  drm/panel: panel-dsi-cm: cleanup tear enable
  ARM: dts: omap5: add address-cells & size-cells to dsi
  drm/omap: pll: fix iteration loop check
  drm/omap: dsi: set trans_mode according to client mode_flags
  drm/panel: panel-dsi-cm: set column & page at setup
  drm/omap: dsi: send nop instead of page & column
  drm/omap: dsi: simplify VC handling
  drm/omap: dsi: drop useless channel checks
  drm/omap: dsi: cleanup dispc channel usage
  drm/omap: dsi: rename 'channel' to 'vc'
  drm/omap: dsi: pass vc and channel to various functions
  drm/omap: dsi: untangle vc & channel
  drm/omap: dsi: skip dsi_vc_enable_hs when already in correct mode
  drm/omap: dsi: enable HS before sending the frame
  drm/omap: dsi: use separate VCs for cmd and video
  drm/panel: panel-dsi-cm: remove extra 'if'
  drm/panel: panel-dsi-cm: add panel database to driver
  drm/panel: panel-dsi-cm: drop unneeded includes
  drm/omap: dsi: move structs & defines to dsi.h
  drm/omap: dsi: move enable/disable to bridge enable/disable
  drm/omap: dsi: display_enable cleanup
  drm/omap: dsi: display_disable cleanup
  drm/omap: dsi: rename dsi_display_* functions
  drm/omap: dsi: cleanup initial vc setup
  drm/omap: dsi: split video mode enable/disable into separate func
  drm/omap: dsi: fix and cleanup ddr_clk_always_on
  drm/omap: dsi: remove ulps support
  drm/omap: dsi: fix DCS_CMD_ENABLE
  drm/omap: dsi: allow DSI commands to be sent early

 arch/arm/boot/dts/omap5.dtsi                  |    6 +
 arch/arm/configs/omap2plus_defconfig          |    2 +-
 drivers/gpu/drm/omapdrm/Kconfig               |  120 +-
 drivers/gpu/drm/omapdrm/Makefile              |   19 +-
 drivers/gpu/drm/omapdrm/displays/Kconfig      |   10 -
 drivers/gpu/drm/omapdrm/displays/Makefile     |    2 -
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 1385 ------------
 drivers/gpu/drm/omapdrm/dss/Kconfig           |  135 --
 drivers/gpu/drm/omapdrm/dss/Makefile          |   20 -
 drivers/gpu/drm/omapdrm/dss/base.c            |   87 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c           |  101 +-
 drivers/gpu/drm/omapdrm/dss/display.c         |   60 -
 drivers/gpu/drm/omapdrm/dss/dpi.c             |    1 -
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 1949 +++++++----------
 drivers/gpu/drm/omapdrm/dss/dsi.h             |  456 ++++
 drivers/gpu/drm/omapdrm/dss/dss.c             |   28 +-
 drivers/gpu/drm/omapdrm/dss/dss.h             |   72 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           |    1 -
 drivers/gpu/drm/omapdrm/dss/hdmi5.c           |    1 -
 .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |  229 --
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  338 +--
 drivers/gpu/drm/omapdrm/dss/output.c          |   57 +-
 drivers/gpu/drm/omapdrm/dss/pll.c             |    6 +
 drivers/gpu/drm/omapdrm/dss/sdi.c             |    1 -
 drivers/gpu/drm/omapdrm/dss/venc.c            |    2 -
 drivers/gpu/drm/omapdrm/omap_connector.c      |  157 --
 drivers/gpu/drm/omapdrm/omap_connector.h      |   28 -
 drivers/gpu/drm/omapdrm/omap_crtc.c           |  103 +-
 drivers/gpu/drm/omapdrm/omap_crtc.h           |    2 -
 drivers/gpu/drm/omapdrm/omap_drv.c            |   73 +-
 drivers/gpu/drm/omapdrm/omap_drv.h            |    3 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c        |   59 +-
 drivers/gpu/drm/omapdrm/omap_irq.c            |   34 +-
 drivers/gpu/drm/omapdrm/omap_plane.c          |   12 +-
 drivers/gpu/drm/panel/Kconfig                 |    9 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-dsi-cm.c          |  665 ++++++
 37 files changed, 2294 insertions(+), 3940 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/Kconfig
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/Makefile
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/Kconfig
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/Makefile
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/display.c
 create mode 100644 drivers/gpu/drm/omapdrm/dss/dsi.h
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
 delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.c
 delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.h
 create mode 100644 drivers/gpu/drm/panel/panel-dsi-cm.c

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
