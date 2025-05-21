Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7377AC0598
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AED29B12A;
	Thu, 22 May 2025 07:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 21 May 2025 14:29:24 UTC
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAE4410E71D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 14:29:24 +0000 (UTC)
X-CSE-ConnectionGUID: 5wPRrv4XQjSiuW0V4EBmQw==
X-CSE-MsgGUID: XuB/idF/Spm6c2PZylzecw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 21 May 2025 23:24:09 +0900
Received: from lenovo-p330.. (unknown [132.158.152.96])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0961342332AE;
 Wed, 21 May 2025 23:24:06 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Hugo Villeneuve <hugo@hugovil.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
Date: Wed, 21 May 2025 10:23:50 -0400
Message-Id: <20250521142350.2134431-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 May 2025 07:24:12 +0000
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

When drm_panel.prepare_prev_first is set to true in a panel driver, the
panel expects the MIPI DSI hardware to be already configured before the
panel's prepare function is called because it might need to send DCS
commands.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4550c6d84796..b31affddfc81 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -531,7 +531,7 @@ static int rzg2l_mipi_dsi_attach(struct drm_bridge *bridge,
 				 flags);
 }
 
-static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
+static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
 	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
@@ -549,6 +549,13 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
+}
+
+static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_atomic_state *state)
+{
+	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
+	int ret;
 
 	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
@@ -592,6 +599,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = rzg2l_mipi_dsi_atomic_pre_enable,
 	.atomic_enable = rzg2l_mipi_dsi_atomic_enable,
 	.atomic_disable = rzg2l_mipi_dsi_atomic_disable,
 	.mode_valid = rzg2l_mipi_dsi_bridge_mode_valid,
-- 
2.34.1

