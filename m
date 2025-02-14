Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B10A35CA7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 12:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4F110EC55;
	Fri, 14 Feb 2025 11:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=sdore.me header.i=@sdore.me header.b="L7ew2HQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sdore.me (unknown [95.165.1.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562FE10EC55
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 11:36:28 +0000 (UTC)
Received: by sdore.me (Postfix, from userid 1000)
 id E192BEEA01BF7; Fri, 14 Feb 2025 14:36:26 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sdore.me; s=SERV;
 t=1739532986; bh=2RRFJdZSLxB0chJqJ8QRDckIZFkpyeAvXlKfsB6hWVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=L7ew2HQOQPkneLx8nfuW2OKCPwzxH5o12m79PompgYwmaym1g3bNCwhJNq/EHMKg1
 opqUC8/94hU0Ck8dOgwVLCWPfJkVDGqbw1soNyF4CoTq7MmPbg7cZT+ld0BBQvuLu9
 mzhTVTzkM1UP4SADBZzllCEoECnjxSgyR7wYWgSg=
From: Egor Vorontsov <sdoregor@sdore.me>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Egor Vorontsov <sdoregor@sdore.me>
Subject: [PATCH v3 2/2] drm/edid: Refactor DisplayID timing block structs
Date: Fri, 14 Feb 2025 14:06:42 +0300
Message-ID: <20250214110643.506740-2-sdoregor@sdore.me>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250214110643.506740-1-sdoregor@sdore.me>
References: <20250214110643.506740-1-sdoregor@sdore.me>
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

Using le16 instead of u8[2].

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>
---
 drivers/gpu/drm/drm_displayid_internal.h | 18 +++++++--------
 drivers/gpu/drm/drm_edid.c               | 28 ++++++++++++------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index 84831ecfdb6e..957dd0619f5c 100644
--- a/drivers/gpu/drm/drm_displayid_internal.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -115,20 +115,20 @@ struct displayid_tiled_block {
 struct displayid_detailed_timings_1 {
 	u8 pixel_clock[3];
 	u8 flags;
-	u8 hactive[2];
-	u8 hblank[2];
-	u8 hsync[2];
-	u8 hsw[2];
-	u8 vactive[2];
-	u8 vblank[2];
-	u8 vsync[2];
-	u8 vsw[2];
+	__le16 hactive;
+	__le16 hblank;
+	__le16 hsync;
+	__le16 hsw;
+	__le16 vactive;
+	__le16 vblank;
+	__le16 vsync;
+	__le16 vsw;
 } __packed;
 
 struct displayid_detailed_timing_block {
 	struct displayid_block base;
 	struct displayid_detailed_timings_1 timings[];
-};
+} __packed;
 
 struct displayid_formula_timings_9 {
 	u8 flags;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 03edf0e1598e..32807cefc819 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6760,23 +6760,23 @@ static void update_display_info(struct drm_connector *connector,
 }
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
-							    struct displayid_detailed_timings_1 *timings,
+							    const struct displayid_detailed_timings_1 *timings,
 							    bool type_7)
 {
 	struct drm_display_mode *mode;
-	unsigned pixel_clock = (timings->pixel_clock[0] |
-				(timings->pixel_clock[1] << 8) |
-				(timings->pixel_clock[2] << 16)) + 1;
-	unsigned hactive = (timings->hactive[0] | timings->hactive[1] << 8) + 1;
-	unsigned hblank = (timings->hblank[0] | timings->hblank[1] << 8) + 1;
-	unsigned hsync = (timings->hsync[0] | (timings->hsync[1] & 0x7f) << 8) + 1;
-	unsigned hsync_width = (timings->hsw[0] | timings->hsw[1] << 8) + 1;
-	unsigned vactive = (timings->vactive[0] | timings->vactive[1] << 8) + 1;
-	unsigned vblank = (timings->vblank[0] | timings->vblank[1] << 8) + 1;
-	unsigned vsync = (timings->vsync[0] | (timings->vsync[1] & 0x7f) << 8) + 1;
-	unsigned vsync_width = (timings->vsw[0] | timings->vsw[1] << 8) + 1;
-	bool hsync_positive = (timings->hsync[1] >> 7) & 0x1;
-	bool vsync_positive = (timings->vsync[1] >> 7) & 0x1;
+	unsigned int pixel_clock = (timings->pixel_clock[0] |
+				    (timings->pixel_clock[1] << 8) |
+				    (timings->pixel_clock[2] << 16)) + 1;
+	unsigned int hactive = le16_to_cpu(timings->hactive) + 1;
+	unsigned int hblank = le16_to_cpu(timings->hblank) + 1;
+	unsigned int hsync = (le16_to_cpu(timings->hsync) & 0x7fff) + 1;
+	unsigned int hsync_width = le16_to_cpu(timings->hsw) + 1;
+	unsigned int vactive = le16_to_cpu(timings->vactive) + 1;
+	unsigned int vblank = le16_to_cpu(timings->vblank) + 1;
+	unsigned int vsync = (le16_to_cpu(timings->vsync) & 0x7fff) + 1;
+	unsigned int vsync_width = le16_to_cpu(timings->vsw) + 1;
+	bool hsync_positive = le16_to_cpu(timings->hsync) & (1 << 15);
+	bool vsync_positive = le16_to_cpu(timings->vsync) & (1 << 15);
 
 	mode = drm_mode_create(dev);
 	if (!mode)
-- 
2.48.0

