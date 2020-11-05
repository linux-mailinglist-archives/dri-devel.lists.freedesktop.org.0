Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D012A7DBF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE86689B70;
	Thu,  5 Nov 2020 12:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC78989B70
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:04:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3ukv069854;
 Thu, 5 Nov 2020 06:03:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604577836;
 bh=lkuchJnBvjrlVU0Qm6Cyaf5OFBWDOBRWuJ9DC4eU6dQ=;
 h=From:To:CC:Subject:Date;
 b=hSWVf9IOjDK3ZJCxW3So8ZjYnnUjB5BBb0LbmhSoxJ1HlZrDzFHR2MFb9hf4xa+Q0
 M80aK17GCNEOdOJhDIfCyDTk0Gfw68yyOkYNXGWeiCsYsfcoJnyHFWJgsfa+6tHz7z
 T1/1zw5pfYEqiBLQuUjn36uMjqawDghYdwxdWKRs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C3uBd070988
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 06:03:56 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:03:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:03:55 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rew039111;
 Thu, 5 Nov 2020 06:03:53 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and drm_panel
Date: Thu, 5 Nov 2020 14:02:37 +0200
Message-ID: <20201105120333.947408-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is third version of the series sent by Sebastian in February:

https://www.spinics.net/lists/linux-omap/msg153465.html

I took the patches from his git tree, and rebased on 5.10-rc2. There
were some conflicts and compilation errors, and one bug that made dsi to
not work (videomode variable was not initialized to 0).

I then fixed the few checkpatch and sparse issues. Overall, Sebastian's
patches are pretty much as they were previously. I did drop Laurent's
reviewed-bys, as it's been a long time since the previous series, and
the patches are not identical anyway.

The topmost 5 patches are new ones, cleanups enabled by the DSI
conversion. They could be handled separately, but it's such a nice
cleanup, and I've been waiting for years to get this done, so here they
are. That said, there are still a _lot_ of cleanups to do.

Almost all of the patches are omapdrm changes. The two non-omapdrm
changes are:
- After converting panel-dsi-cm to common DRM panel model, it is moved
  to drm's panel directory.
- Add MIPI_DSI_MODE_ULPS_IDLE flag

I have tested these with OMAP4 SDP, AM5 EVM and OMAP4 Panda. SDP has
command mode panel, and I don't have any videomode panels.

Sebastian, I hope you're ok with all this? I did send you an email, but
didn't get a reply yet, so I thought to just proceed. If you want to
handle this in some other way, or don't want your
authorship/signed-off-by in some of the commits, just tell.

 Tomi

Sebastian Reichel (51):
  drm/dsi: add MIPI_DSI_MODE_ULPS_IDLE
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
  drm/omap: drop empty omap_encoder helper functions
  drm/omap: drop DSS ops_flags
  drm/omap: drop dssdev display field
  drm/omap: simplify DSI manual update code
  drm/omap: dsi: simplify pin config
  ARM: omap2plus_defconfig: Update for moved DSI command mode panel

Tomi Valkeinen (5):
  drm/omap: squash omapdrm sub-modules into one
  drm/omap: remove unused display.c
  drm/omap: drop unused owner field
  drm/omap: remove dispc_ops
  drm/omap: remove dss_mgr_ops

 arch/arm/configs/omap2plus_defconfig          |    2 +-
 drivers/gpu/drm/omapdrm/Kconfig               |  120 +-
 drivers/gpu/drm/omapdrm/Makefile              |   19 +-
 drivers/gpu/drm/omapdrm/displays/Kconfig      |   10 -
 drivers/gpu/drm/omapdrm/displays/Makefile     |    2 -
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 1385 -----------------
 drivers/gpu/drm/omapdrm/dss/Kconfig           |  135 --
 drivers/gpu/drm/omapdrm/dss/Makefile          |   20 -
 drivers/gpu/drm/omapdrm/dss/base.c            |   87 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c           |  101 +-
 drivers/gpu/drm/omapdrm/dss/display.c         |   60 -
 drivers/gpu/drm/omapdrm/dss/dpi.c             |    1 -
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 1069 ++++++++-----
 drivers/gpu/drm/omapdrm/dss/dss.c             |   28 +-
 drivers/gpu/drm/omapdrm/dss/dss.h             |   72 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           |    1 -
 drivers/gpu/drm/omapdrm/dss/hdmi5.c           |    1 -
 .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |  229 ---
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  278 +---
 drivers/gpu/drm/omapdrm/dss/output.c          |   57 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c             |    1 -
 drivers/gpu/drm/omapdrm/dss/venc.c            |    2 -
 drivers/gpu/drm/omapdrm/omap_connector.c      |  157 --
 drivers/gpu/drm/omapdrm/omap_connector.h      |   28 -
 drivers/gpu/drm/omapdrm/omap_crtc.c           |  103 +-
 drivers/gpu/drm/omapdrm/omap_crtc.h           |    2 -
 drivers/gpu/drm/omapdrm/omap_drv.c            |   65 +-
 drivers/gpu/drm/omapdrm/omap_drv.h            |    3 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c        |   59 +-
 drivers/gpu/drm/omapdrm/omap_irq.c            |   34 +-
 drivers/gpu/drm/omapdrm/omap_plane.c          |   12 +-
 drivers/gpu/drm/panel/Kconfig                 |    9 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-dsi-cm.c          |  647 ++++++++
 include/drm/drm_mipi_dsi.h                    |    2 +
 35 files changed, 1718 insertions(+), 3084 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/Kconfig
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/Makefile
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/Kconfig
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/Makefile
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/display.c
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
