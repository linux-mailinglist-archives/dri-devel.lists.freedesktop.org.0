Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A0B493154
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 00:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D7E10E2D5;
	Tue, 18 Jan 2022 23:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 391 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jan 2022 22:06:53 UTC
Received: from forward105p.mail.yandex.net (forward105p.mail.yandex.net
 [77.88.28.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35D910E295
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 22:06:53 +0000 (UTC)
Received: from myt5-bc23fd5efdaf.qloud-c.yandex.net
 (myt5-bc23fd5efdaf.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3ca5:0:640:bc23:fd5e])
 by forward105p.mail.yandex.net (Yandex) with ESMTP id 43EF12FD90E3;
 Wed, 19 Jan 2022 01:00:18 +0300 (MSK)
Received: from myt5-aad1beefab42.qloud-c.yandex.net
 (myt5-aad1beefab42.qloud-c.yandex.net [2a02:6b8:c12:128:0:640:aad1:beef])
 by myt5-bc23fd5efdaf.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 bKW5jXpdf8-0HfuKpqi; Wed, 19 Jan 2022 01:00:18 +0300
Authentication-Results: myt5-bc23fd5efdaf.qloud-c.yandex.net; dkim=pass
Received: by myt5-aad1beefab42.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id feV44VOHqO-0FQCUuPl; Wed, 19 Jan 2022 01:00:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Yaroslav Bolyukin <iam@lach.pw>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Support type 7 timings
Date: Wed, 19 Jan 2022 00:59:56 +0300
Message-Id: <20220118215956.17229-1-iam@lach.pw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Jan 2022 23:17:04 +0000
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
Cc: Yaroslav Bolyukin <iam@lach.pw>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per VESA DisplayID Standard v2.0: Type VII Timing – Detailed Timing Data

Definitions were already provided as type I, but not used

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_edid.c  | 26 +++++++++++++++++---------
 include/drm/drm_displayid.h |  6 +++---
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be..5fcefd9b5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5404,13 +5404,17 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 	return quirks;
 }
 
-static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
-							    struct displayid_detailed_timings_1 *timings)
+static struct drm_display_mode *drm_mode_displayid_detailed_1_7(struct drm_device *dev,
+								struct displayid_detailed_timings_1_7 *timings,
+								bool type_7)
 {
 	struct drm_display_mode *mode;
 	unsigned pixel_clock = (timings->pixel_clock[0] |
 				(timings->pixel_clock[1] << 8) |
 				(timings->pixel_clock[2] << 16)) + 1;
+	// type 7 allows higher precision pixel clock
+	if (!type_7)
+		pixel_clock *= 10;
 	unsigned hactive = (timings->hactive[0] | timings->hactive[1] << 8) + 1;
 	unsigned hblank = (timings->hblank[0] | timings->hblank[1] << 8) + 1;
 	unsigned hsync = (timings->hsync[0] | (timings->hsync[1] & 0x7f) << 8) + 1;
@@ -5426,7 +5430,7 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
 	if (!mode)
 		return NULL;
 
-	mode->clock = pixel_clock * 10;
+	mode->clock = pixel_clock;
 	mode->hdisplay = hactive;
 	mode->hsync_start = mode->hdisplay + hsync;
 	mode->hsync_end = mode->hsync_start + hsync_width;
@@ -5449,10 +5453,12 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
 	return mode;
 }
 
-static int add_displayid_detailed_1_modes(struct drm_connector *connector,
-					  const struct displayid_block *block)
+static int add_displayid_detailed_1_7_modes(struct drm_connector *connector,
+					    const struct displayid_block *block,
+					    bool type_7)
 {
-	struct displayid_detailed_timing_block *det = (struct displayid_detailed_timing_block *)block;
+	struct displayid_detailed_timing_1_7_block *det =
+		(struct displayid_detailed_timing_1_7_block *)block;
 	int i;
 	int num_timings;
 	struct drm_display_mode *newmode;
@@ -5463,9 +5469,9 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 
 	num_timings = block->num_bytes / 20;
 	for (i = 0; i < num_timings; i++) {
-		struct displayid_detailed_timings_1 *timings = &det->timings[i];
+		struct displayid_detailed_timings_1_7 *timings = &det->timings[i];
 
-		newmode = drm_mode_displayid_detailed(connector->dev, timings);
+		newmode = drm_mode_displayid_detailed_1_7(connector->dev, timings, type_7);
 		if (!newmode)
 			continue;
 
@@ -5485,7 +5491,9 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	displayid_iter_edid_begin(edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING)
-			num_modes += add_displayid_detailed_1_modes(connector, block);
+			num_modes += add_displayid_detailed_1_7_modes(connector, block, false);
+		else if (block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
+			num_modes += add_displayid_detailed_1_7_modes(connector, block, true);
 	}
 	displayid_iter_end(&iter);
 
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 7ffbd9f7b..268ff5e1f 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -111,7 +111,7 @@ struct displayid_tiled_block {
 	u8 topology_id[8];
 } __packed;
 
-struct displayid_detailed_timings_1 {
+struct displayid_detailed_timings_1_7 {
 	u8 pixel_clock[3];
 	u8 flags;
 	u8 hactive[2];
@@ -124,9 +124,9 @@ struct displayid_detailed_timings_1 {
 	u8 vsw[2];
 } __packed;
 
-struct displayid_detailed_timing_block {
+struct displayid_detailed_timing_1_7_block {
 	struct displayid_block base;
-	struct displayid_detailed_timings_1 timings[];
+	struct displayid_detailed_timings_1_7 timings[];
 };
 
 #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)

base-commit: 99613159ad749543621da8238acf1a122880144e
-- 
2.34.1

