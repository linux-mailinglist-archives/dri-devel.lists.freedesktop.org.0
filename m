Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C722C25E6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6E288FA0;
	Tue, 24 Nov 2020 12:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CE088FA0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:46:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjpkP031892;
 Tue, 24 Nov 2020 06:45:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606221951;
 bh=TT8YASwPELXiyV8xi9fiFKDVzl1wLbwLNawJTODqvTE=;
 h=From:To:CC:Subject:Date;
 b=uRH661zJ7GLfxaLswR1a2Yz1QGK5V7mhLaqY9p4Ct4aVqX/mSs9jv5GLQ4fte8hrQ
 QUnF1jt9NETDCpVQanVDtJXuu08se9wOvQb3v3KjZXujJD/gZdRozOmTBSdlqIW0N6
 4hEVbEXtVDjUzwbPk1iSTmaPm4KZJTGZy0q8vO/0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCjp7s104985
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:45:51 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:45:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:45:51 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmon040922;
 Tue, 24 Nov 2020 06:45:49 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 00/80] Convert DSI code to use drm_mipi_dsi and drm_panel
Date: Tue, 24 Nov 2020 14:44:18 +0200
Message-ID: <20201124124538.660710-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

v4 of the omapdrm DSI series. Link to v3:

https://www.spinics.net/lists/linux-omap/msg157082.html

There are a lot of changes since v3, but most of them should be in new
patches on top. The main problem has been video mode panels, which are
still not quite working with this series. However, I have pinpointed the
issues quite well (I think), and I have a few small hacks which gets a
video mode panel working (the single one I have).

The problem is with the sequence the dsi host and the panel are
initialized, and I did not figure out how to solve that without adding a
new bridge callback (post_enable). However, the issue could also be
panel specific, omap dsi driver bug, or panel driver bug. This needs
more study and work, but as we don't have any video mode users in
upstream, I think the work can be done on top of this series.

This series, and the hacks (along with a few other hacks) can be found
from:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git 5.11/dsi

Tested with OMAP4 SDP (command mode panel) and OMAP5 uEVM with a custom
video mode panel setup (with a broken cable which only works in certain
position and when the planets are aligned).

Changes in v4:
- Resolved the comments received in v3, and added the tags

- Lots of new patches continuing the cleanup work. Most of these do not
  help with the video mode as such, but as the issues have been very
  difficult to debug, I've been doing cleanups along the way so that I
  can find the problems more easily.

- Dropped ULPS. Complex feature, doesn't work, would give little
  benefit.

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

Tomi Valkeinen (31):
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
  drm/omap: dsi: cleanup channel usages
  drm/omap: dsi: skip dsi_vc_enable_hs when already in correct mode
  drm/omap: dsi: set LP/HS before update
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
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 1905 +++++++----------
 drivers/gpu/drm/omapdrm/dss/dsi.h             |  450 ++++
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
 drivers/gpu/drm/panel/panel-dsi-cm.c          |  670 ++++++
 37 files changed, 2249 insertions(+), 3940 deletions(-)
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
