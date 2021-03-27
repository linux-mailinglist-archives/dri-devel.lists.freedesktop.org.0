Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E634B6EC
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 12:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC456E084;
	Sat, 27 Mar 2021 11:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBFC6E084
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 11:58:06 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 2/3] drm/encoder: Add macro drmm_plain_encoder_alloc()
Date: Sat, 27 Mar 2021 11:57:41 +0000
Message-Id: <20210327115742.18986-3-paul@crapouillou.net>
In-Reply-To: <20210327115742.18986-1-paul@crapouillou.net>
References: <20210327115742.18986-1-paul@crapouillou.net>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This performs the same operation as drmm_encoder_alloc(), but
only allocates and returns a struct drm_encoder instance.

v4: Rename macro drmm_plain_encoder_alloc() and move to
    <drm/drm_encoder.h>. Since it's not "simple" anymore it
    will now take funcs/name arguments as well.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/drm/drm_encoder.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 5bf78b5bcb2b..6e91a0280f31 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -224,6 +224,24 @@ void *__drmm_encoder_alloc(struct drm_device *dev,
 				      offsetof(type, member), funcs, \
 				      encoder_type, name, ##__VA_ARGS__))
 
+/**
+ * drmm_plain_encoder_alloc - Allocate and initialize an encoder
+ * @dev: drm device
+ * @funcs: callbacks for this encoder (optional)
+ * @encoder_type: user visible type of the encoder
+ * @name: printf style format string for the encoder name, or NULL for default name
+ *
+ * This is a simplified version of drmm_encoder_alloc(), which only allocates
+ * and returns a struct drm_encoder instance, with no subclassing.
+ *
+ * Returns:
+ * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
+ */
+#define drmm_plain_encoder_alloc(dev, funcs, encoder_type, name, ...) \
+	((struct drm_encoder *) \
+	 __drmm_encoder_alloc(dev, sizeof(struct drm_encoder), \
+			      0, funcs, encoder_type, name, ##__VA_ARGS__))
+
 /**
  * drm_encoder_index - find the index of a registered encoder
  * @encoder: encoder to find index for
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
