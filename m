Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862238C3231
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 17:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E72710E2A7;
	Sat, 11 May 2024 15:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="NUHlM+Le";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C120610E1E9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 15:39:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BFUrIa024638;
 Sat, 11 May 2024 10:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715441453;
 bh=fgSiUiyv+xpJe+wBVVFMUseyZYSFfR7/ITsPxN9R9DI=;
 h=From:To:CC:Subject:Date;
 b=NUHlM+LeTfbGoqpC5jccAxMyGXILJhzrA4BCxQYnkpw8eiTw+0itb/gfyg3E7SrFa
 QNCMm7qGfd/JhF6KGO3zYZPHms+Y2LTnNO62uxQRa/c/+GwEY70vgSiTL7hjfVNVBm
 lmwZttqUSx6S0hg6iZfRUjOYcen2tT/LunIZcprU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BFUrcp017845
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 11 May 2024 10:30:53 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 10:30:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 10:30:52 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BFUqUO074704;
 Sat, 11 May 2024 10:30:52 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Thierry
 Reding <treding@nvidia.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary
 <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>, Aradhya Bhatia
 <a-bhatia1@ti.com>
Subject: [PATCH 0/7] drm/bridge: cdns-dsi: Fix the color-shift issue
Date: Sat, 11 May 2024 21:00:44 +0530
Message-ID: <20240511153051.1355825-1-a-bhatia1@ti.com>
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

This series provides some crucial fixes and improvements for the Cadence's DSI
TX (cdns-dsi) controller found commonly in Texas Instruments' J7 family of SoCs
as well as in AM62P.

The cdns-dsi bridge consumes the crtc_* timing parameters for programming the
timing parameters. A patch has been added in tidss to make sure the crtc_*
timings get populated.

It further adds support for "early_enable" and "late_disable" DRM bridge hooks.
These hooks are same as the existing "(pre_)enable" and "(post_)disable" hooks,
except that the early_enable hook gets called before the CRTC is even enabled in
the display pipeline and the late_disable hook gets called after the CRTC is
disabled.
The cdns-dsi controller requires to be enabled before the previous entity
enables its stream[0]. It's a strict requirement which, if not followed, causes
the colors to "shift" on the display. Since the previous entity is TIDSS in this
case, which gets enabled via the tidss_crtc hooks, early_enable/late_disable API
in the cdns-dsi bridge is the way to solve the issue.
The early_enable/late_disable APIs also help with the OLDI TXes available on the
AM62/AM62P SoCs, which will be a part of separate series.

This spec also requires the Clock and Data Lanes be ready before the DSI TX
enables its stream[0]. A patch has been added to make the code wait for that to
happen. Going ahead with further DSI (and DSS configuration), while the lanes
are not ready, has been found as another reason for shift in colors.

All these patches have been tested on TI's vendor tree kernel with more devices,
but for the mainline, these patches have been tested with J721E based
BeagleboneAI64 along with a RaspberryPi 7" DSI panel. The extra patches can be
found in the "next_dsi_finals-v1-test_rpi" branch of my github fork[1] for
anyone who would like to test them.

Thanks,
Aradhya


[0]: Section 12.6.5.7.3: Start-up Procesure [For DSI TX controller]
     in TDA4VM Technical Reference Manual https://www.ti.com/lit/zip/spruil1

[1]: https://github.com/aradhya07/linux-ab/tree/next_dsi_finals-v1-test_rpi


Aradhya Bhatia (7):
  drm/tidss: Add CRTC mode_fixup
  drm/bridge: cdns-dsi: Fix minor bugs
  drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
  drm/bridge: cdns-dsi: Reset the DCS write FIFO
  drm/bridge: cdns-dsi: Support atomic bridge APIs
  drm/bridge: Introduce early_enable and late disable
  drm/bridge: cdns-dsi: Implement early_enable and late_disable

 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 91 ++++++++++++++-----
 drivers/gpu/drm/drm_atomic_helper.c           | 67 ++++++++++++++
 drivers/gpu/drm/drm_bridge.c                  | 84 +++++++++++++++++
 drivers/gpu/drm/tidss/tidss_crtc.c            | 11 +++
 include/drm/drm_bridge.h                      | 73 +++++++++++++++
 5 files changed, 303 insertions(+), 23 deletions(-)


base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
-- 
2.34.1
