Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A156BE96
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF33010EBB3;
	Fri,  8 Jul 2022 18:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBAB10EAEB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:10 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id siM72700Q4C55Sk06iM7fm; Fri, 08 Jul 2022 20:21:08 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbD-002fGc-0Q; Fri, 08 Jul 2022 20:21:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbC-00BtJ7-8Y; Fri, 08 Jul 2022 20:21:06 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 01/10] drm/fourcc: Add drm_format_info_bpp() helper
Date: Fri,  8 Jul 2022 20:20:46 +0200
Message-Id: <1cae5ebc28513ec1c91c66b00647ce3ca23bfba7.1657294931.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657294931.git.geert@linux-m68k.org>
References: <cover.1657294931.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper to retrieve the actual number of bits per pixel for a
plane, taking into account the number of characters and pixels per
block for tiled formats.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
v3:
  - Add Reviewed-by,

v2:
  - Move up.
---
 drivers/gpu/drm/drm_fourcc.c | 19 +++++++++++++++++++
 include/drm/drm_fourcc.h     |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 07741b678798b0f1..cf48ea0b2cb70ba8 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -370,6 +370,25 @@ unsigned int drm_format_info_block_height(const struct drm_format_info *info,
 }
 EXPORT_SYMBOL(drm_format_info_block_height);
 
+/**
+ * drm_format_info_bpp - number of bits per pixel
+ * @info: pixel format info
+ * @plane: plane index
+ *
+ * Returns:
+ * The actual number of bits per pixel, depending on the plane index.
+ */
+unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
+{
+	if (!info || plane < 0 || plane >= info->num_planes)
+		return 0;
+
+	return info->char_per_block[plane] * 8 /
+	       (drm_format_info_block_width(info, plane) *
+		drm_format_info_block_height(info, plane));
+}
+EXPORT_SYMBOL(drm_format_info_bpp);
+
 /**
  * drm_format_info_min_pitch - computes the minimum required pitch in bytes
  * @info: pixel format info
diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 22aa64d07c7905e2..3800a7ad7f0cda7a 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -313,6 +313,7 @@ unsigned int drm_format_info_block_width(const struct drm_format_info *info,
 					 int plane);
 unsigned int drm_format_info_block_height(const struct drm_format_info *info,
 					  int plane);
+unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane);
 uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
 				   int plane, unsigned int buffer_width);
 
-- 
2.25.1

