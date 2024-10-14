Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5314C99C03A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 08:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB4710E13E;
	Mon, 14 Oct 2024 06:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="iqP6dHtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C85210E28E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1728888447; x=1760424447;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=04XYqrmnQ48BCQSPqaTd5Q1NXgx8uEeVrzQkfizNtcM=;
 b=iqP6dHtUBtrsmZps8CVoBX6LgZuKOoJ/Zwjs4fzvCL4YHQdRwTpvDRtH
 /zDYLEarunQqIlw6fgzdWaHUGjm1BuAa4ESsb+23wJ6HwFIbU8bxXh7TA
 d+vHNRIaISX7WUB3Tk8aKixMkr6wnUPHVZ5bseCbFS2HxUCTYn5pGG1hM
 anznH5mV56vH0Hlj7b1bOyrT+HIHwWlUSmXfeTH5Kp8jpEKpz4K/DJpqm
 cw8YKPMYIViRnR/nEVsVrs/1nqo8a0qgS1vymZzQni/1ZiRyAO+Biv7dy
 SdCqoLExaHgACwxjfMJYFqxJiDa0b8kT6eaqittS/QF9aRRGS8FYB+OxE g==;
X-CSE-ConnectionGUID: 4xBlmyQHTkm/61W9c+bOkQ==
X-CSE-MsgGUID: nU2/czUjSwu/VSmxBYrk6Q==
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="32772256"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2024 23:47:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 13 Oct 2024 23:46:54 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 13 Oct 2024 23:46:49 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH] drm: atmel-hlcdc: update the LCDC_ATTRE register in plane
 atomic_disable
Date: Mon, 14 Oct 2024 12:16:44 +0530
Message-ID: <20241014064644.292943-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

update the LCDC_ATTRE register in drm plane atomic_disable to handle
the configuration changes of each layer when a plane is disabled.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h    |  3 ++-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 17 ++++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index e1a0bb24b511..53d47f01db0b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -378,7 +378,8 @@ struct atmel_lcdc_dc_ops {
 	void (*lcdc_update_buffers)(struct atmel_hlcdc_plane *plane,
 				    struct atmel_hlcdc_plane_state *state,
 				    u32 sr, int i);
-	void (*lcdc_atomic_disable)(struct atmel_hlcdc_plane *plane);
+	void (*lcdc_atomic_disable)(struct atmel_hlcdc_plane *plane,
+				    struct atmel_hlcdc_dc *dc);
 	void (*lcdc_update_general_settings)(struct atmel_hlcdc_plane *plane,
 					     struct atmel_hlcdc_plane_state *state);
 	void (*lcdc_atomic_update)(struct atmel_hlcdc_plane *plane,
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 4a7ba0918eca..4bcaf2cd7672 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -816,7 +816,8 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	return 0;
 }
 
-static void atmel_hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
+static void atmel_hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane,
+				       struct atmel_hlcdc_dc *dc)
 {
 	/* Disable interrupts */
 	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IDR,
@@ -832,7 +833,8 @@ static void atmel_hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
 	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
 }
 
-static void atmel_xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
+static void atmel_xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane,
+				       struct atmel_hlcdc_dc *dc)
 {
 	/* Disable interrupts */
 	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_IDR,
@@ -842,6 +844,15 @@ static void atmel_xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
 	atmel_hlcdc_layer_write_reg(&plane->layer,
 				    ATMEL_XLCDC_LAYER_ENR, 0);
 
+	/*
+	 * Updating XLCDC_xxxCFGx, XLCDC_xxxFBA and XLCDC_xxxEN,
+	 * (where xxx indicates each layer) requires writing one to the
+	 * Update Attribute field for each layer in LCDC_ATTRE register for SAM9X7.
+	 */
+	regmap_write(dc->hlcdc->regmap, ATMEL_XLCDC_ATTRE, ATMEL_XLCDC_BASE_UPDATE |
+		     ATMEL_XLCDC_OVR1_UPDATE | ATMEL_XLCDC_OVR3_UPDATE |
+		     ATMEL_XLCDC_HEO_UPDATE);
+
 	/* Clear all pending interrupts */
 	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
 }
@@ -852,7 +863,7 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
 	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
 
-	dc->desc->ops->lcdc_atomic_disable(plane);
+	dc->desc->ops->lcdc_atomic_disable(plane, dc);
 }
 
 static void atmel_hlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
-- 
2.25.1

