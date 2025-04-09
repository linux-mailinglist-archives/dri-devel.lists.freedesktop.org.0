Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C3A82B74
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9BA10E025;
	Wed,  9 Apr 2025 15:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hesGYYwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD2810E025
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yQbxOoSLTwxzL4wS/MBYOfE+a3MJPq00D/vrLwQ1d0U=; b=hesGYYwS5F3GcAqA8A5Dwd96If
 ho2h/ZHeScwGuPj/FxvbV1XCnchR/uN6Int5rk6tTEVuzhoLXoPhGnNj1CNt2/W2H1Ewvcct4bM7f
 wlSBjENpWPE9KXMTID7vO2c96ZVIFh6bIS5v7wUCo/YPCZykfeBnI+/I0KE9PIUWYI7KfVIA472q1
 bWCMxJUz+/asmu697KrTJPDGfHY0g16uAKMoh5XaZnyS9bwInZBjDo+Ca94VM+LKia6romo6VfYWq
 VM2PdtpQ2EeL5DlUJ3VnXxg87X6bhe/zfH9SN/5/YkQ/9WuuUjVITlCWEqkFRLWQF98XJlA3dQmA2
 BKNxhe8g==;
Received: from [77.26.4.178] (helo=edoras.jupiter)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2XnG-00ECwp-RJ; Wed, 09 Apr 2025 17:56:50 +0200
From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Emma Anholt <emma@anholt.net>
Cc: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/v3d: fix client obtained from axi_ids on V3D 4.1
Date: Wed,  9 Apr 2025 17:55:03 +0200
Message-ID: <20250409155504.1093400-2-jmcasanova@igalia.com>
X-Mailer: git-send-email 2.49.0
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

The client that causes an MMU error is expected to be reported.
But in the case of MMU TFU errors, a non existing client
was being reported. This happened because  because the client
calculation was taking into account more than the bits 0-7
from the axi_id that were representing the client.

This patch masks the proper bits to do the calculation and
limits the returned clients to the expected axi_id ranges that
V3D 4.1 and 4.2 use.

Fixes: 38c2c7917adc ("drm/v3d: Fix and extend MMU error handling.")
Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_irq.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 29f63f572d35..1810743ea7b8 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -186,24 +186,33 @@ v3d_hub_irq(int irq, void *arg)
 		u32 axi_id = V3D_READ(V3D_MMU_VIO_ID);
 		u64 vio_addr = ((u64)V3D_READ(V3D_MMU_VIO_ADDR) <<
 				(v3d->va_width - 32));
-		static const char *const v3d41_axi_ids[] = {
-			"L2T",
-			"PTB",
-			"PSE",
-			"TLB",
-			"CLE",
-			"TFU",
-			"MMU",
-			"GMP",
+		static const struct {
+			u32 begin;
+			u32 end;
+			const char *client;
+		} v3d41_axi_ids[] = {
+			{0x00, 0x20, "L2T"},
+			{0x20, 0x21, "PTB"},
+			{0x40, 0x41, "PSE"},
+			{0x60, 0x80, "TLB"},
+			{0x80, 0x88, "CLE"},
+			{0xA0, 0xA1, "TFU"},
+			{0xC0, 0xE0, "MMU"},
+			{0xE0, 0xE1, "GMP"},
 		};
 		const char *client = "?";
 
 		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
 
 		if (v3d->ver >= V3D_GEN_41) {
-			axi_id = axi_id >> 5;
-			if (axi_id < ARRAY_SIZE(v3d41_axi_ids))
-				client = v3d41_axi_ids[axi_id];
+			axi_id = axi_id & 0xFF;
+			for (size_t i = 0; i < ARRAY_SIZE(v3d41_axi_ids); i++) {
+				if (axi_id >= v3d41_axi_ids[i].begin &&
+				    axi_id < v3d41_axi_ids[i].end) {
+					client = v3d41_axi_ids[i].client;
+					break;
+				}
+			}
 		}
 
 		dev_err(v3d->drm.dev, "MMU error from client %s (%d) at 0x%llx%s%s%s\n",
-- 
2.49.0

