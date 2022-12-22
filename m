Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF0654DAD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244010E5FD;
	Fri, 23 Dec 2022 08:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F1A10E0AA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 15:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671723650; cv=none; d=zohomail.in; s=zohoarc; 
 b=VqvptbOUabuM1XNJN3E+8gBnGn7sCqG26D1Ws2ZYAfywGWAPwLDrNnVwC5/6dZBXcSfROHLfCyqJkV8Evm5qgSN5C/WRWCORKAF0fW+VbZs4p+WAF4X5/WQE6qLoWlCVZggVDXpD4OopQGPfpRuaXw9KzlwxPQne2RNsgO2ERCM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671723650;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=32++P+q6Vmnok5SXRBgj9sElDpHPxwJUSBDXcv+gGuA=; 
 b=TY3CzIcESJuLY6p128Ubg8sToU5g3bI99MQtg/PL3+AqBIuRkN0cjQMT6RbmQabtvl3Mnj7snqi9Z+yYs9omkvYt9iFCYncyLwFV1DPy81tQF+3C18KpzBY5zm8mjMaWq7wt0H/TwINKPIIzfp4bm6w7W5DjoG1pXckSKBiQRL4=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671723650; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=32++P+q6Vmnok5SXRBgj9sElDpHPxwJUSBDXcv+gGuA=;
 b=YJosYX+N3UI6pQO1AtjuwCz/NAevzV6UWbox/NlRJuB+DSxG44hHsXDy768ZGxIf
 Dt3X8DR+v9Vpt8uLpR9wp7nzpDEham7e/2fAIgVzoI/IfVAtgvzFq+csarRH7r8F/ah
 K3dTJZr1cD+6Q3nzeSSNcY6JPw8FEehHVouMSwcs=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1671723648363134.27341012227134;
 Thu, 22 Dec 2022 21:10:48 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
Message-ID: <cd397a877b94ec8062440e3ae6a6a4f1af82d854.1671723195.git.code@siddh.me>
Subject: [PATCH v2 3/9] drm/print: Fix support for NULL as first argument of
 drm_dbg_*
Date: Thu, 22 Dec 2022 21:10:37 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1671723195.git.code@siddh.me>
References: <cover.1671723195.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Comments say macros DRM_DEBUG_* are deprecated in favor of
drm_dbg_*(NULL, ...), but they have broken support for it,
as the macro will result in `(NULL) ? (NULL)->dev : NULL`.

Thus, fix them by separating logic to get dev ptr in a new
function, which will return the dev ptr if arg is not NULL.
Use it in drm_dbg_*, and also in __DRM_DEFINE_DBG_RATELIMITED,
where a similar (but correct) NULL check was in place.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 include/drm/drm_print.h | 42 ++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a44fb7ef257f..6d2d5c522e25 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -34,6 +34,7 @@
 #include <linux/dynamic_debug.h>
=20
 #include <drm/drm.h>
+#include <drm/drm_device.h>
=20
 /* Do *not* use outside of drm_print.[ch]! */
 extern unsigned long __drm_debug;
@@ -451,6 +452,22 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct =
device *dev,
  * Prefer drm_device based logging over device or prink based logging.
  */
=20
+/**
+ * __drm_get_dev_ptr - Helper function to get device type pointer even if =
NULL
+ *=09=09       is passed. Primarily for use in print macros, since they
+ *=09=09       need to handle NULL as the first argument passed.
+ * @drm: The *drm_device pointer, or NULL.
+ *
+ * RETURNS:
+ * The *device pointer, or NULL.
+ */
+static inline struct device *__drm_get_dev_ptr(const struct drm_device *dr=
m)
+{
+=09if (drm)
+=09=09return drm->dev;
+=09return NULL;
+}
+
 /* Helper for struct drm_device based logging. */
 #define __drm_printk(drm, level, type, fmt, ...)=09=09=09\
 =09dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
@@ -487,25 +504,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct=
 device *dev,
=20
=20
 #define drm_dbg_core(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg_driver(drm, fmt, ...)=09=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS_=
_)
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
+#define drm_dbg_driver(drm, fmt, ...)=09=09=09=09=09\
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
 #define drm_dbg_prime(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__=
)
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
 #define drm_dbg_atomic(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS_=
_)
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
 #define drm_dbg_vbl(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
 #define drm_dbg_state(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__=
)
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
 #define drm_dbg_lease(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__=
)
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
 #define drm_dbg_dp(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
 #define drm_dbg_drmres(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS_=
_)
+=09drm_dev_dbg(__drm_get_dev_ptr(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
=20
 #define drm_dbg(drm, fmt, ...)=09drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
=20
@@ -596,10 +613,9 @@ void __drm_err(const char *format, ...);
 #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)=09=09=09=09=
=09\
 ({=09=09=09=09=09=09=09=09=09=09=09=09\
 =09static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_=
RATELIMIT_BURST);\
-=09const struct drm_device *drm_ =3D (drm);=09=09=09=09=09=09=09\
 =09=09=09=09=09=09=09=09=09=09=09=09\
 =09if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))=09=09=
=09\
-=09=09drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARG=
S__);=09\
+=09=09drm_dev_printk(__drm_get_dev_ptr(drm), KERN_DEBUG, fmt, ## __VA_ARGS=
__);=09\
 })
=20
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
--=20
2.35.1


