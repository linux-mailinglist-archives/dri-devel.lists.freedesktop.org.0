Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336E6A82B77
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9796A10E127;
	Wed,  9 Apr 2025 15:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aRkaHkll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958C510E025
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pq+avEanNTE2ylz89cC98GhRgY4JbA8jvhBnU/hKhDg=; b=aRkaHkll0OvdZRwkWzxq6DOO0T
 XH/MzIcIcYv+GXrVOrvwq2FuyAVdtVPInUe5JNqDqpGTGjycY6NaEhixHFV0pwX0wbhjVKicJr3ks
 ogEN8MKFhxFNxhFxD/y9jkzztkej8cN+g6ceDJsSwUi0KmWoK8qLg/Q8/fvuumVQwVQuiYs7mgL+c
 MDUAEy0vyYUK3CSQyFxV5OJybrQMKlcW8/hX8G4JwndjicUUik+ZR7XEkwuTB+fy7APE9XAV6bw8v
 Bmo0BdBdOJkSX01Mm0VCsjVDVJK2FqayhXkkU2aZA4C0yiKlTZByGhgWLrC7Ks0vJfaedmVgVIZKi
 Tk8U6hnA==;
Received: from [77.26.4.178] (helo=edoras.jupiter)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2XnP-00ECwp-4e; Wed, 09 Apr 2025 17:56:59 +0200
From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/v3d: client ranges from axi_ids are different with
 V3D 7.1
Date: Wed,  9 Apr 2025 17:55:04 +0200
Message-ID: <20250409155504.1093400-3-jmcasanova@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409155504.1093400-2-jmcasanova@igalia.com>
References: <20250409155504.1093400-2-jmcasanova@igalia.com>
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

The client mask has been reduced from 8 bits on V3D 4.1 to 7 bits
on V3d 7.1, so the ranges for each client are not compatible.

A new CSD client can now report MMU errors on 7.1

Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_irq.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 1810743ea7b8..0cc1c7e5b412 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -199,12 +199,31 @@ v3d_hub_irq(int irq, void *arg)
 			{0xA0, 0xA1, "TFU"},
 			{0xC0, 0xE0, "MMU"},
 			{0xE0, 0xE1, "GMP"},
+		}, v3d71_axi_ids[] = {
+			{0x00, 0x30, "L2T"},
+			{0x30, 0x38, "CLE"},
+			{0x38, 0x39, "PTB"},
+			{0x39, 0x3A, "PSE"},
+			{0x3A, 0x3B, "CSD"},
+			{0x40, 0x60, "TLB"},
+			{0x60, 0x70, "MMU"},
+			{0x7C, 0x7E, "TFU"},
+			{0x7F, 0x80, "GMP"},
 		};
 		const char *client = "?";
 
 		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
 
-		if (v3d->ver >= V3D_GEN_41) {
+		if (v3d->ver >= V3D_GEN_71) {
+			axi_id = axi_id & 0x7F;
+			for (size_t i = 0; i < ARRAY_SIZE(v3d71_axi_ids); i++) {
+				if (axi_id >= v3d71_axi_ids[i].begin &&
+				    axi_id < v3d71_axi_ids[i].end) {
+					client = v3d71_axi_ids[i].client;
+					break;
+				}
+			}
+		} else if (v3d->ver >= V3D_GEN_41) {
 			axi_id = axi_id & 0xFF;
 			for (size_t i = 0; i < ARRAY_SIZE(v3d41_axi_ids); i++) {
 				if (axi_id >= v3d41_axi_ids[i].begin &&
-- 
2.49.0

