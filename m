Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5556C8C3376
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 21:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ABD10E31C;
	Sat, 11 May 2024 19:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="SR1jCDf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7C310E3ED
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 19:31:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BJUvMn029411;
 Sat, 11 May 2024 14:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715455857;
 bh=xQZv/xzUy/h54vzFSq/qFJqi6KOEzJtq8ToI3N/K79s=;
 h=From:To:CC:Subject:Date;
 b=SR1jCDf+GyceuodFzTMVrltkawR8oZ1ORVkFcF/6Xj0VJRxNahuT35uRAGYuh3Zbo
 bGtz89p+xrafKUGSbs/YeTNSA8XnvhU2Kkuee5MrhkD4TwYbiCpjIcIaIg2X35Q7GM
 dVLIGXlft7HSbHsCaDDgrvXGPv8bi+6rQrt1cx8I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BJUvQq073051
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 11 May 2024 14:30:57 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 14:30:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 14:30:56 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BJUtgC091562;
 Sat, 11 May 2024 14:30:56 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>, Alexander
 Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH 0/4] drm/tidss: Add OLDI bridge support
Date: Sun, 12 May 2024 01:00:51 +0530
Message-ID: <20240511193055.1686149-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all,

This patch series add support for the dual OLDI TXes supported in Texas
Instruments' AM62x and AM62Px family of SoCs. The OLDI TXes support single-lvds,
lvds-clone, and dual-lvds modes. These have now been represented through DRM
bridges within TI-DSS.

The OLDI configuration should happen before the video-port configuration takes
place in tidss_crtc_atomic_enable hook. I have posted a patch allowing DRM
bridges to get enabled before the CRTC of that bridge is enabled[0]. The patch
4/4 of this series uses the bridge hooks introduced in [0], and hence will not
compile without [0].

This patch series is a complete re-vamp from the previously posted series[1] and
hence, the version index has been reset to v1. The OLDI support from that series
was dropped and only the base support for AM625 DSS was kept (and eventually
merged)[2].

These patches have been tested on AM625 based platforms, SK-AM625 EVM with a
Microptis dual-lvds panel (SK-LCD1), and Beagleplay with a Lincolntech dual-lvds
panel (LCD-185T). The patches with complete support including the expected
devicetree configuration of the OLDI TXes can be found in the
"next_oldi_finals-v1-tests" branch of my github fork[3].

Thanks,
Aradhya

[0]: Dependency Patch: Introduce early_enable / late_disable drm bridge APIs
https://lore.kernel.org/all/20240511153051.1355825-7-a-bhatia1@ti.com/

[1]: AM62 OLDI Series - v7
https://lore.kernel.org/all/20230125113529.13952-1-a-bhatia1@ti.com/

[2]: AM62 DSS Series - v9
https://lore.kernel.org/all/20230616150900.6617-1-a-bhatia1@ti.com/

[3]: GitHub Fork for OLDI tests
https://github.com/aradhya07/linux-ab/tree/next_oldi_finals-v1-tests


Aradhya Bhatia (4):
  dt-bindings: display: ti,am65x-dss: Minor Cleanup
  dt-bindings: display: ti: Add schema for AM625 OLDI Transmitter
  dt-bindings: display: ti,am65x-dss: Add OLDI properties for AM625 DSS
  drm/tidss: Add OLDI bridge support

 .../bindings/display/ti/ti,am625-oldi.yaml    | 153 +++++
 .../bindings/display/ti/ti,am65x-dss.yaml     | 178 +++++-
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/tidss/Makefile                |   3 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           |  11 +-
 drivers/gpu/drm/tidss/tidss_dispc.h           |   4 +
 drivers/gpu/drm/tidss/tidss_drv.c             |  13 +-
 drivers/gpu/drm/tidss/tidss_drv.h             |   4 +
 drivers/gpu/drm/tidss/tidss_oldi.c            | 568 ++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_oldi.h            |  73 +++
 10 files changed, 983 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h


base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
-- 
2.34.1

