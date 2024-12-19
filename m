Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13409F826A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 18:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D248210ED7C;
	Thu, 19 Dec 2024 17:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qsee3oLJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0005510ED7C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734630591;
 bh=/ZyOfXVjt3BqXaC0KQRj/ibcTv/GriaUjnlk+zsYPe4=;
 h=From:To:Cc:Subject:Date:From;
 b=qsee3oLJRmpgSSY4ZY7TE9st8lG5+rAB/6owWWFEO+Y7QJh+5+jr7dSZfSKK7Q3fs
 y1myzDojknCmzT8ca1G52JbC3nuzeE9PAAyr2DPd5RLn/CGxw9M2n5huV48jEAKXed
 xrxKwApI+bVRA1hXsLXPHxaEb9Caa1QV2MifD9rwx97CkfjhO3hXbTHFFi5qgwFWIS
 ueF7XZFR7qnBpCUuh9GFyjJWcDBJQXHo9JuIkbkTkI8I+BhLZbPps9wtihWmQL4eCg
 NdWyitTwFFPs8rvts2oXlm5XugPIJSXryfU3+AEuzqSjBOEVEpq9RPRBHT6J1956Zv
 SJR6Hp3wlJk3w==
Received: from ericsmith-collabora.localnet
 (hlfxns017vw-47-55-142-63.dhcp-dynamic.fibreop.ns.bellaliant.net
 [47.55.142.63])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ericsmith)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6951517E37CF;
 Thu, 19 Dec 2024 18:49:50 +0100 (CET)
From: eric.smith@collabora.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: healych@amazon.com, "Eric R. Smith" <eric.smith@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: add modifiers for MediaTek tiled formats
Date: Thu, 19 Dec 2024 13:49:28 -0400
Message-Id: <20241219174929.126205-1-eric.smith@collabora.com>
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

v2:
- Classify the modifier bits into categories and provide
  room for expansion (Daniel S.)

Signed-off-by: Eric R. Smith <eric.smith@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 70f3b00b0681..768053a44295 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -421,6 +421,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_MTK     0x0b
 
 /* add more to the end as needed */
 
@@ -1453,6 +1454,46 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  */
 #define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
 
+/* MediaTek modifiers
+ * Bits  Parameter                Notes
+ * ----- ------------------------ ---------------------------------------------
+ *   7: 0 TILE LAYOUT              Values are MTK_FMT_MOD_TILE_*
+ *  15: 8 COMPRESSION              Values are MTK_FMT_MOD_COMPRESS_*
+ *  23:16 10 BIT LAYOUT            Values are MTK_FMT_MOD_10BIT_LAYOUT_*
+ *
+ */
+
+#define DRM_FORMAT_MOD_MTK(__flags)		fourcc_mod_code(MTK, __flags)
+
+/*
+ * MediaTek Tiled Modifier
+ * The lowest 8 bits of the modifier is used to specify the tiling
+ * layout. Only the 16L_32S tiling is used for now, but we define an
+ * "untiled" version and leave room for future expansion.
+ */
+#define MTK_FMT_MOD_TILE_MASK     0xf
+#define MTK_FMT_MOD_TILE_NONE     0x0
+#define MTK_FMT_MOD_TILE_16L32S   0x1
+
+/*
+ * Bits 8-15 specify compression options
+ */
+#define MTK_FMT_MOD_COMPRESS_MASK (0xf << 8)
+#define MTK_FMT_MOD_COMPRESS_NONE (0x0 << 8)
+#define MTK_FMT_MOD_COMPRESS_V1   (0x1 << 8)
+
+/*
+ * Bits 16-23 specify how the bits of 10 bit formats are
+ * stored out in memory
+ */
+#define MTK_FMT_MOD_10BIT_LAYOUT_MASK      (0xf << 16)
+#define MTK_FMT_MOD_10BIT_LAYOUT_PACKED    (0x0 << 16)
+#define MTK_FMT_MOD_10BIT_LAYOUT_LSBTILED  (0x1 << 16)
+#define MTK_FMT_MOD_10BIT_LAYOUT_LSBRASTER (0x2 << 16)
+
+/* alias for the most common tiling format */ 
+#define DRM_FORMAT_MOD_MTK_16L_32S_TILE  DRM_FORMAT_MOD_MTK(MTK_FMT_MOD_TILE_16L32S)
+
 /*
  * AMD modifiers
  *

base-commit: 3a8e60188b55f7aff76c1d3707ebcbf98e68cc13
-- 
2.39.5

