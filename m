Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF656497503
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 20:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79F310E244;
	Sun, 23 Jan 2022 19:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward101o.mail.yandex.net (forward101o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E81010E233
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 19:20:31 +0000 (UTC)
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
 by forward101o.mail.yandex.net (Yandex) with ESMTP id 55EAF369C258;
 Sun, 23 Jan 2022 22:20:29 +0300 (MSK)
Received: from vla1-4e4ee944ff6b.qloud-c.yandex.net
 (vla1-4e4ee944ff6b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3192:0:640:4e4e:e944])
 by forward102q.mail.yandex.net (Yandex) with ESMTP id 51394BF00002;
 Sun, 23 Jan 2022 22:20:29 +0300 (MSK)
Received: from vla5-445dc1c4c112.qloud-c.yandex.net
 (vla5-445dc1c4c112.qloud-c.yandex.net [2a02:6b8:c18:3609:0:640:445d:c1c4])
 by vla1-4e4ee944ff6b.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 N586EWrcrw-KSfaudax; Sun, 23 Jan 2022 22:20:29 +0300
Authentication-Results: vla1-4e4ee944ff6b.qloud-c.yandex.net; dkim=pass
Received: by vla5-445dc1c4c112.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id TJMeNIfkIw-KQQKhsVM; Sun, 23 Jan 2022 22:20:27 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Yaroslav Bolyukin <iam@lach.pw>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/edid: Support type 7 timings
Date: Sun, 23 Jan 2022 22:19:55 +0300
Message-Id: <20220123191955.57994-1-iam@lach.pw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118215956.17229-1-iam@lach.pw>
References: <20220118215956.17229-1-iam@lach.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Yaroslav Bolyukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per VESA DisplayID Standard v2.0: Type VII Timing – Detailed Timing Data

Definitions were already provided as type I, but not used

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be..5f2ae5bfa 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5405,7 +5405,8 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 }
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
-							    struct displayid_detailed_timings_1 *timings)
+							    struct displayid_detailed_timings_1 *timings,
+							    bool type_7)
 {
 	struct drm_display_mode *mode;
 	unsigned pixel_clock = (timings->pixel_clock[0] |
@@ -5426,7 +5427,8 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
 	if (!mode)
 		return NULL;
 
-	mode->clock = pixel_clock * 10;
+	/* resolution is kHz for type VII, and 10 kHz for type I */
+	mode->clock = type_7 ? pixel_clock : pixel_clock * 10;
 	mode->hdisplay = hactive;
 	mode->hsync_start = mode->hdisplay + hsync;
 	mode->hsync_end = mode->hsync_start + hsync_width;
@@ -5457,6 +5459,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 	int num_timings;
 	struct drm_display_mode *newmode;
 	int num_modes = 0;
+	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
 	/* blocks must be multiple of 20 bytes length */
 	if (block->num_bytes % 20)
 		return 0;
@@ -5465,7 +5468,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 	for (i = 0; i < num_timings; i++) {
 		struct displayid_detailed_timings_1 *timings = &det->timings[i];
 
-		newmode = drm_mode_displayid_detailed(connector->dev, timings);
+		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7);
 		if (!newmode)
 			continue;
 
@@ -5484,7 +5487,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 
 	displayid_iter_edid_begin(edid, &iter);
 	displayid_iter_for_each(block, &iter) {
-		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING)
+		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
+		    block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
 			num_modes += add_displayid_detailed_1_modes(connector, block);
 	}
 	displayid_iter_end(&iter);

base-commit: 99613159ad749543621da8238acf1a122880144e
-- 
2.34.1

