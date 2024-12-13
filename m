Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230499F1535
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 19:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CCA10E338;
	Fri, 13 Dec 2024 18:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HJIKD8B/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9213210E338
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 18:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734115642;
 bh=2ej6OjppBuybqhCkJa0WSyYDApzYDf5lniXmhKynmQg=;
 h=From:To:Cc:Subject:Date:From;
 b=HJIKD8B/F6CALDgv5zwaAY7n66b6grrT8rC1FA4hBvbLtLJ/3rpkwL74st1yOvrkn
 ELDRT9Kt0myXod4DhP7Vm5Ur9Ks4p/YqWOfPeLpzAK+Bz1Cuw0FSMil1XtuvwT+3hm
 V/3KLNpgw+PSFdGwJ7JMw6MxT48oMDiUmIX2aGgjDPWnRGFMK9Gz96uY7p4qt/aXxR
 BvWkS0AWGZxUFaI3HfeBnkGj1UNlPIC1lra9TLeK40eqZAZhSeG4A2iEfdmFCxpXfm
 4zFTCXuNWjdyy2GnXbYtphaYwReFwkjeR3eLjp9yNJimVf3+2SG60WboWh5iQNhXsb
 dcnckRUcVd5ng==
Received: from ericsmith-collabora.localnet
 (hlfxns017vw-47-55-142-63.dhcp-dynamic.fibreop.ns.bellaliant.net
 [47.55.142.63])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ericsmith)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E287E17E37DC;
 Fri, 13 Dec 2024 19:47:20 +0100 (CET)
From: eric.smith@collabora.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, "Eric R. Smith" <eric.smith@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: add modifiers for MediaTek tiled formats
Date: Fri, 13 Dec 2024 14:47:05 -0400
Message-Id: <20241213184705.317138-1-eric.smith@collabora.com>
X-Mailer: git-send-email 2.39.5
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

From: "Eric R. Smith" <eric.smith@collabora.com>

MediaTek (MTK) uses some unique tiled memory formats
for video decoding. Add these to the uapi drm_fourcc.h
so that we can use them in Mesa, GStreamer, and other
tools/libraries.

Signed-off-by: Eric R. Smith <eric.smith@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 70f3b00b0681..22a27cdd6484 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -421,6 +421,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_MTK     0x0b
 
 /* add more to the end as needed */
 
@@ -1453,6 +1454,36 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  */
 #define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
 
+/* MediaTek layouts */
+
+/*
+ * MediaTek Tiled Modifier
+ * This is a tiled layout using tiles of 16x32 pixels in a row-major layout.
+ * For chroma planes this becomes 16x16 tiles.
+ */
+#define DRM_FORMAT_MOD_MTK_16L_32S_TILE  fourcc_mod_code(MTK, (1ULL << 0))
+
+/*
+ * MediaTek Compressed Modifier
+ * Indicates the planes are compressed.
+ * Implementation may be platform and base-format specific.
+ */
+#define DRM_FORMAT_MOD_MTK_COMPRESSED  fourcc_mod_code(MTK, (1ULL << 1))
+
+/*
+ * MediaTek 10-bit Modifier
+ * Indicates that the 2 LSBs of the 10 bit pixels are stored
+ * separately and tiled.
+ */
+#define DRM_FORMAT_MOD_MTK_LSBTILED    fourcc_mod_code(MTK, (1ULL << 2))
+
+/*
+ * MediaTek 10-bit Modifier
+ * Indicates that the 2 LSBs of 10 bit pixels are stored
+ * separately in raster order.
+ */
+#define DRM_FORMAT_MOD_MTK_LSBRASTER   fourcc_mod_code(MTK, (1ULL << 3))
+
 /*
  * AMD modifiers
  *

base-commit: 3a8e60188b55f7aff76c1d3707ebcbf98e68cc13
-- 
2.39.5

