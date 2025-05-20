Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2D0ABE1AA
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 19:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2086E10E566;
	Tue, 20 May 2025 17:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="Qsc/zdOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C775E10E566
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 17:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
 :From:subject:date:message-id:reply-to;
 bh=Ieq2Wz/Zz1m9gW3I+kKA7VwI/4KkrbIWMKaDUyLGGyY=; b=Qsc/zdOwpGec4e2LH2vL2hqvwG
 U/k827si4LJ/wh5L0b3HNvUxil9pnHQ5vO1JukmetMZJCvclDwgCjEyTtBSIS1nNboFj/10ZHPkgo
 Q4NNd8RTHlIDUsI18aLZfs+UE0ClTTWPZZr1DAVtgwR2+9zcjYrwHo2eM93kDPPCPmBA=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:34022
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uHQYf-0006dx-D8; Tue, 20 May 2025 13:15:17 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: biju.das.jz@bp.renesas.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, hugo@hugovil.com,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Chris Brandt <chris.brandt@renesas.com>
Date: Tue, 20 May 2025 13:15:10 -0400
Message-Id: <20250520171510.3524216-3-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.2
Subject: [PATCH 2/2] drm: rcar-du: rzg2l_mipi_dsi: Set DCS maximum return
 packet size
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

The default value of 1 will result in long read commands payload not being
saved to memory.

Fix by setting this value to the DMA buffer size.

Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 77d3a31ff8e35..bfff17e55d126 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -547,6 +547,7 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
+	u32 value;
 	int ret;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
@@ -559,6 +560,15 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 
 	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
 
+	/*
+	 * The default value of 1 will result in long read commands payload
+	 * not being saved to memory. Set to the DMA buffer size.
+	 */
+	value = rzg2l_mipi_dsi_link_read(dsi, DSISETR);
+	value &= ~DSISETR_MRPSZ;
+	value |= FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
+	rzg2l_mipi_dsi_link_write(dsi, DSISETR, value);
+
 	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
 		goto err_stop;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 33cd669bc74b1..0a783d1ea8fe1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -81,6 +81,10 @@
 #define RSTSR_SWRSTLP			(1 << 1)
 #define RSTSR_SWRSTHS			(1 << 0)
 
+/* DSI Set Register */
+#define DSISETR				0x120
+#define DSISETR_MRPSZ			GENMASK(15, 0)
+
 /* Rx Result Save Slot 0 Register */
 #define RXRSS0R				0x240
 #define RXRSS0R_RXPKTDFAIL		BIT(28)
-- 
2.39.5

