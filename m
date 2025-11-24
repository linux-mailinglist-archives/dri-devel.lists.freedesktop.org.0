Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B264CC80ABE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 14:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307DD89D7C;
	Mon, 24 Nov 2025 13:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDB1589D7C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 13:10:28 +0000 (UTC)
X-CSE-ConnectionGUID: glT/dnI2QDCWiSCn5lOSMw==
X-CSE-MsgGUID: SleVyjPkQV2+R6LS6Hz/Cw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2025 22:10:26 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 93F404054E66;
 Mon, 24 Nov 2025 22:10:22 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v6 0/2] Remove hard coded values for MIPI-DSI
Date: Mon, 24 Nov 2025 08:10:01 -0500
Message-ID: <20251124131003.992554-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When the initial drivers were submitted, some of the timing was hard coded and
did not allow for any MIPI-DSI panel to be attached.
In general, panels or bridges can only be supported if MIPI-DSI lanes were 4.
If the number of lanes were 3,2,1, the math no longer works out.

A new API was created for the clock driver because the behaivior of the clock
driver depends on DPI vs MIPI, the bpp, and the number of MIPI lanes.


Testing:
* RZ/G2L SMARC  (MIPI-DSI to HDMI bridge, lanes = 4)
* RZ/G2L-SBC    (MIPI-DSI to LCD panel, lanes = 2)
* RZ/G2UL SMARC (DPI to HDMI bridge)
* Multiple monitors, multiple resolutions

* repo: git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
* branch: renesas-clk

base-commit: 5fb2f67341bd4b7c482f2bbda6b78244a51c3923

Depends-on:
"clk: renesas: rzg2l: Fix intin variable size"
	https://lore.kernel.org/all/20251114193711.3277912-1-chris.brandt@renesas.com

"clk: renesas: rzg2l: Select correct div round macro"
	https://lore.kernel.org/all/20251114194529.3304361-1-chris.brandt@renesas.com


Chris Brandt (2):
  clk: renesas: rzg2l: Remove DSI clock rate restrictions
  drm: renesas: rz-du: mipi_dsi: Set DSI divider

 drivers/clk/renesas/rzg2l-cpg.c               | 170 +++++++++++++++---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  17 +-
 include/linux/clk/renesas.h                   |  11 ++
 3 files changed, 168 insertions(+), 30 deletions(-)

--
2.50.1

