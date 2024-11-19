Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB2B9D2E2E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 19:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688CB10E6A1;
	Tue, 19 Nov 2024 18:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95D4810E2CB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 18:44:40 +0000 (UTC)
X-CSE-ConnectionGUID: idwUfOZJT7uxvCdOwL4tpA==
X-CSE-MsgGUID: vFEUuC8iQzyHWPp6+Nyqlw==
X-IronPort-AV: E=Sophos;i="6.12,166,1728918000"; d="scan'208";a="225334498"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 20 Nov 2024 03:44:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 86947400752D;
 Wed, 20 Nov 2024 03:44:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
Date: Tue, 19 Nov 2024 18:44:13 +0000
Message-ID: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

This patch series aims to fix 2 bugs in the ADV7535 driver

1) use-after-free bug in adv7533_attach_dsi()
2) Drop unsupported single lane.

Changes in v6:
 - Fixed memory leak by adding goto stattement in error path of
   adv7511_init_regulators().
 - Added Rb tag from Adam for patch#3.
Changes in v5:
 - Updated commit description for patch#1.
 - restored host_node in struct adv7511.
 - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
   in error path of probe() and also in the remove().
Changes in v4:
 - Updated commit description for patch#1.
 - Dropped host_node from struct adv7511 and instead used a local pointer
   in probe(). Also freeing of host_node pointer after use is done in
   probe().
 - Added link to ADV7533 data sheet.
 - Collected tags
Changes in v3:
 - Replace __free construct with readable of_node_put().
 - Dropped single lane support from bindings and driver.
changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped invalid Mail address Archit Taneja <architt@codeaurora.org>.

Biju Das (3):
  drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
  dt-bindings: display: adi,adv7533: Drop single lane support
  drm: adv7511: Drop dsi single lane support

 .../bindings/display/bridge/adi,adv7533.yaml         |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c         | 12 ++++++++++--
 drivers/gpu/drm/bridge/adv7511/adv7533.c             |  4 +---
 3 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.43.0

