Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC47122F5B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48C26EA15;
	Tue, 17 Dec 2019 14:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF356E9FF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 35D5F2927AE
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 01/34] drm/core: Add afbc helper functions
Date: Tue, 17 Dec 2019 15:49:47 +0100
Message-Id: <20191217145020.14645-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add checking if a modifier is afbc and getting afbc block size.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_fourcc.c | 53 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_fourcc.h     |  4 +++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index b234bfaeda06..d14dd7c86020 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -29,6 +29,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 static char printable_char(int c)
 {
@@ -393,3 +394,55 @@ uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
 			    drm_format_info_block_height(info, plane));
 }
 EXPORT_SYMBOL(drm_format_info_min_pitch);
+
+/**
+ * drm_is_afbc - test if the modifier describes an afbc buffer
+ * @modifier - modifier to be tested
+ *
+ * Returns: true if the modifier describes an afbc buffer
+ */
+bool drm_is_afbc(u64 modifier)
+{
+	/* is it ARM AFBC? */
+	if ((modifier & DRM_FORMAT_MOD_ARM_AFBC(0)) == 0)
+		return false;
+
+	/* Block size must be known */
+	if ((modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) == 0)
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(drm_is_afbc);
+
+/**
+ * drm_afbc_get_superblock_wh - extract afbc block width/height from modifier
+ * @modifier: the modifier to be looked at
+ * @w: address of a place to store the block width
+ * @h: address of a place to store the block height
+ *
+ * Returns: true if the modifier describes a supported block size
+ */
+bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h)
+{
+	switch (modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_16x16:
+		*w = 16;
+		*h = 16;
+		break;
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8:
+		*w = 32;
+		*h = 8;
+		break;
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
+		/* fall through */
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
+		/* fall through */
+	default:
+		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
+			      modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
+		return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL_GPL(drm_afbc_get_superblock_wh);
diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 306d1efeb5e0..7eb23062bf45 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -320,4 +320,8 @@ uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
 				   int plane, unsigned int buffer_width);
 const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf);
 
+bool drm_is_afbc(u64 modifier);
+
+bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h);
+
 #endif /* __DRM_FOURCC_H__ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
