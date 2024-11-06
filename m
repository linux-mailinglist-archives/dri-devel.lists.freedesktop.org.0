Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F69BEF2E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 14:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C85510E6EA;
	Wed,  6 Nov 2024 13:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jcGKYurY";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="Wp3z/iZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 415 seconds by postgrey-1.36 at gabe;
 Wed, 06 Nov 2024 13:37:08 UTC
Received: from a7-40.smtp-out.eu-west-1.amazonses.com
 (a7-40.smtp-out.eu-west-1.amazonses.com [54.240.7.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4D410E6E9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 13:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1730899811;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
 bh=JuJPylewezAPI7wSda7iVtJm+RTVZzYzft96qUfPDBM=;
 b=jcGKYurYf124PKWF4I14ez5MbPaSNFtW/88QhTUfBFr/PWe2G5uEvJ9IAfn+iv+d
 vwGlNH4JABfD7UIbm2MmiyOWsxrh45d1AyEAkBx6p9LOZ3E7AcfBph2inniDsm1EOMF
 hcQeF+s1JQgqnsiqPGEgj/4ckYoksym8izKBnVtTpZmHvuuwcDgEKDP1pMrRLKOoK/w
 gwpKqg84OlLesmdjpGtzIpBdOV+FeRnjKX/RV8TytbLr8eBMA8GFu3hZ0sEEM1eI55R
 hGR1U7cC0rINdAYbqABWjfBcOjBfaUEWGlWWer4A37Og0obt4SxP3CSbpkYtRC4tIZ1
 3qSr1Q6R1w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1730899811;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=JuJPylewezAPI7wSda7iVtJm+RTVZzYzft96qUfPDBM=;
 b=Wp3z/iZYE/gCiwA7eVXrW4AiKI1lsvJEToaCQFUM9T+J0UG2sPyuGD/cBBJ/fjLz
 ifSQW4M3YluLkb/lNX3OnmtKA2A8E/s477iaVYTBgemy9camlRTraAtr+OYTFYRCB06
 kBL2qPQz9tie7rVgmPqqFeeb//5Vp/SaunZSq228=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 laurentiu.palcu@nxp.com, aisheng.dong@nxp.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] drm/fourcc: Add modifier definition for describing
 Verisilicon video framebuffer
Date: Wed, 6 Nov 2024 13:30:11 +0000
Message-ID: <0102019301ab1b2d-5539e1c7-e026-47bc-8692-b3335f6f7584-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.11.06-54.240.7.40
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

Verisilicon hardware video decoders can produce tiled (8x4 or 4x4)
and compressed video framebuffers.
It considerably reduces memory bandwidth while writing and reading
frames in memory.

The underlying storage in NV12 (for 8-bit) or NV15 (for 10-bit).

Display controllers, like imx DCSS, could use these modifier definition
as input for overlay planes.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
The original code comes from:
https://github.com/nxp-imx/linux-imx/commit/ab01b7fe82d5a11dfb533cfbd08c4dfa140815de
I have port it and modify DRM_FORMAT_MOD_VENDOR_VSI value.

 include/uapi/drm/drm_fourcc.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 78abd819fd62..31d09a98d0d7 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -421,6 +421,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_VSI     0x0b
 
 /* add more to the end as needed */
 
@@ -1607,6 +1608,32 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_CLEAR(field) \
 	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
 
+/* Verisilicon framebuffer modifiers */
+
+/*
+ * Verisilicon 8x4 tiling layout
+ *
+ * This is G1 VPU tiled layout using tiles of 8x4 pixels in a row-major
+ * layout.
+ */
+#define DRM_FORMAT_MOD_VSI_G1_TILED fourcc_mod_code(VSI, 1)
+
+/*
+ * Verisilicon 4x4 tiling layout
+ *
+ * This is G2 VPU tiled layout using tiles of 4x4 pixels in a row-major
+ * layout.
+ */
+#define DRM_FORMAT_MOD_VSI_G2_TILED fourcc_mod_code(VSI, 2)
+
+/*
+ * Verisilicon 4x4 tiling with compression layout
+ *
+ * This is G2 VPU tiled layout using tiles of 4x4 pixels in a row-major
+ * layout with compression.
+ */
+#define DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED fourcc_mod_code(VSI, 3)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

