Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC36A301B52
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 12:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E82789E1D;
	Sun, 24 Jan 2021 11:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4E66E04B
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 08:56:20 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 2/4] drm/simple_kms_helper: Add macro
 drmm_plain_simple_encoder_alloc()
Date: Sun, 24 Jan 2021 08:55:50 +0000
Message-Id: <20210124085552.29146-3-paul@crapouillou.net>
In-Reply-To: <20210124085552.29146-1-paul@crapouillou.net>
References: <20210124085552.29146-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 24 Jan 2021 11:04:21 +0000
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This performs the same operation as drmm_simple_encoder_alloc(), but
only allocates and returns a struct drm_encoder instance.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/drm/drm_simple_kms_helper.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index e6dbf3161c2f..f07e70303cfb 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -209,4 +209,21 @@ void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 					     offsetof(type, member), \
 					     encoder_type))
 
+/**
+ * drmm_plain_simple_encoder_alloc - Allocate and initialize a drm_encoder
+ *                                   struct with basic functionality.
+ * @dev: drm device
+ * @encoder_type: user visible type of the encoder
+ *
+ * This performs the same operation as drmm_simple_encoder_alloc(), but
+ * only allocates and returns a struct drm_encoder instance.
+ *
+ * Returns:
+ * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
+ */
+#define drmm_plain_simple_encoder_alloc(dev, encoder_type) \
+	((struct drm_encoder *) \
+	 __drmm_simple_encoder_alloc(dev, sizeof(struct drm_encoder), \
+				     0, encoder_type))
+
 #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
