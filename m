Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE97B38665
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCDA10E859;
	Wed, 27 Aug 2025 15:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="rleOE3sD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD24E10E859;
 Wed, 27 Aug 2025 15:21:19 +0000 (UTC)
Received: from debian.intra.ispras.ru (unknown [10.10.165.10])
 by mail.ispras.ru (Postfix) with ESMTPSA id 08015406C3E0;
 Wed, 27 Aug 2025 15:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 08015406C3E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1756308078;
 bh=hMndCnBPEkldaJ0RX8/Zz8eRCVkdzIYmV+68H1w9mS0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rleOE3sDwRZzedim40Pfv50uN1MFzfG/uT906yFJQb/JYpfnHMgDJgEnwlMBM8Xpq
 RscmmdgdDiX6xNditQmB3QG53IzB+FSH+5n8qTGtxyg1zEAUy98z68hy5Zn0bBXaKU
 Uq7wvE9HcGwAJlQUZJ9bXyR8o+GZRh7+zivN31l8=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Alex Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hansg@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH v3 1/2] drm/modes: export drm_mode_remove() helper
Date: Wed, 27 Aug 2025 18:21:04 +0300
Message-ID: <20250827152107.785477-2-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827152107.785477-1-pchelkin@ispras.ru>
References: <20250827152107.785477-1-pchelkin@ispras.ru>
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

This functionality may be helpful in drivers so export it for reusability.

Found by Linux Verification Center (linuxtesting.org).

Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/gpu/drm/drm_connector.c |  8 +-------
 drivers/gpu/drm/drm_modes.c     | 15 +++++++++++++++
 include/drm/drm_modes.h         |  1 +
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..0a3933b6ceec 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -27,6 +27,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_consumer.h>
@@ -696,13 +697,6 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_connector_has_possible_encoder);
 
-static void drm_mode_remove(struct drm_connector *connector,
-			    struct drm_display_mode *mode)
-{
-	list_del(&mode->head);
-	drm_mode_destroy(connector->dev, mode);
-}
-
 /**
  * drm_connector_cec_phys_addr_invalidate - invalidate CEC physical address
  * @connector: connector undergoing CEC operation
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index e72f855fc495..6e021328f9c2 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -117,6 +117,21 @@ void drm_mode_probed_add(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_mode_probed_add);
 
+/**
+ * drm_mode_remove - remove a mode from the associated list and destroy it
+ * @connector: connector of the mode
+ * @mode: mode data
+ *
+ * Remove @mode from the associated list, then free @mode object itself.
+ */
+void drm_mode_remove(struct drm_connector *connector,
+		     struct drm_display_mode *mode)
+{
+	list_del(&mode->head);
+	drm_mode_destroy(connector->dev, mode);
+}
+EXPORT_SYMBOL(drm_mode_remove);
+
 enum drm_mode_analog {
 	DRM_MODE_ANALOG_NTSC, /* 525 lines, 60Hz */
 	DRM_MODE_ANALOG_PAL, /* 625 lines, 50Hz */
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index b9bb92e4b029..d7b66321f60d 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -460,6 +460,7 @@ int drm_mode_convert_umode(struct drm_device *dev,
 			   struct drm_display_mode *out,
 			   const struct drm_mode_modeinfo *in);
 void drm_mode_probed_add(struct drm_connector *connector, struct drm_display_mode *mode);
+void drm_mode_remove(struct drm_connector *connector, struct drm_display_mode *mode);
 void drm_mode_debug_printmodeline(const struct drm_display_mode *mode);
 bool drm_mode_is_420_only(const struct drm_display_info *display,
 			  const struct drm_display_mode *mode);
-- 
2.50.1

