Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33409BCB5C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 12:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE0210E56F;
	Tue,  5 Nov 2024 11:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 97B6110E56F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 11:12:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.11,259,1725289200"; d="scan'208";a="227919685"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 05 Nov 2024 20:12:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.174])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id BD90041D0022;
 Tue,  5 Nov 2024 20:12:42 +0900 (JST)
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
 Archit Taneja <architt@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Hien Huynh <hien.huynh.px@renesas.com>
Subject: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in
 clock_div_by_lanes
Date: Tue,  5 Nov 2024 11:12:19 +0000
Message-ID: <20241105111228.112813-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
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

Fix out-of-bounds array in adv7511_dsi_config_timing_gen(),
when dsi lanes = 1.

Fixes: 78fa479d703c ("drm/bridge: adv7533: Use internal timing generator")
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped Archit Taneja invalid Mail address
---
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 3e57ba838e5e..0c2236e53af5 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -185,6 +185,9 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 	adv->use_timing_gen = !of_property_read_bool(np,
 						"adi,disable-timing-generator");
 
+	if (adv->use_timing_gen && num_lanes == 1)
+		return -EINVAL;
+
 	/* TODO: Check if these need to be parsed by DT or not */
 	adv->rgb = true;
 	adv->embedded_sync = false;
-- 
2.43.0

