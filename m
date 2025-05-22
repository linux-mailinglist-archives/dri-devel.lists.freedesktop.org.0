Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C5EAC0E67
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DD610EA8A;
	Thu, 22 May 2025 14:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="kmMxV6h8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD0710EA8A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
 :From:subject:date:message-id:reply-to;
 bh=37ltNrDm/SQxtBtReU+dzvAvwRTeydEOy/6HO4fUSEY=; b=kmMxV6h8CX6wWpsfmwF5Jl1o/c
 my7Q40vkqUzyx2Wcq+t0inyd950IfjagSp1WVY2a6c7z+42N9KDxfzn1elwidC2jI9uLj1LRnQUvx
 HyCSpoOG39SOw0aTDjVCCo0kAU9OVM0/LwQM94MqxkvQ1i/3ygMNiFiY66ipIi62sXOY=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:33178
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uI74x-0006Gk-RM; Thu, 22 May 2025 10:39:28 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: biju.das.jz@bp.renesas.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, hugo@hugovil.com,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Chris Brandt <chris.brandt@renesas.com>
Date: Thu, 22 May 2025 10:39:11 -0400
Message-Id: <20250522143911.138077-3-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522143911.138077-1-hugo@hugovil.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.2
Subject: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet size
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
index a048d473db00b..745aae63af9d8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -549,6 +549,7 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
+	u32 value;
 	int ret;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
@@ -561,6 +562,15 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 
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
index 0e432b04188d0..26d8a37ee6351 100644
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

