Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA6725859
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79B510E485;
	Wed,  7 Jun 2023 08:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0FE10E332
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 11:00:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686048331; cv=none; d=zohomail.in; s=zohoarc; 
 b=SvO/l6jxRPFLDsZcCDqFIGgYFklKV1oX9Rw9fKXpMtIb5BsYIAVFpL4e0WjQu1qqVEq5q+aDHxrvwUbsOPkNIGB6m4HeerIqPjUl31CxMmWWnWgEKWHp4D62/2MWizPi9Gwf062F1YkllAq4lVdENaMaw5+ryuSmSeEhypFY4Bo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686048331;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=i4Fa1up9cwOcO1Yt+8hd91eqrmOFnaJLCoQTeXNK3jo=; 
 b=auAmY1q4tB7sAHtPZ7DgJTENYSi9NKZdO2F0xPl7ASfLXlf6RPJvcAPD83jbWW1LMnadCblpklNXu4czcPkmo9nEUxTG8nnZOghJVHTUP6lVl4TICKZVkGiocofluQkEiWDPNfkTEwyK3Ht+YPYbb8SNdWqFz47IqFYemzzvn7s=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686048331; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=i4Fa1up9cwOcO1Yt+8hd91eqrmOFnaJLCoQTeXNK3jo=;
 b=UD8L+D/kPnLiRikm8SEY3oDt+Hz04kvJNbAaBn5kDZ4YirOtxd9rORUMT75wfwtu
 lcr2mysysNVSuKFY8q9Errdp0list64vIadRepEiEORo//WIz8XSa0RJCJy6zDy14su
 OOXjqAtwA19djxFTiW9DQEhb3/W3Yz2a2v9R6/38=
Received: from kampyooter.. (122.176.141.156 [122.176.141.156]) by mx.zoho.in
 with SMTPS id 1686048328984432.71534248743194;
 Tue, 6 Jun 2023 16:15:28 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ae42791195a788bb77b3f9c2b87bca5d4e78cf83.1686047727.git.code@siddh.me>
Subject: [PATCH v9 2/8] drm/print: Fix and add support for NULL as first
 argument in drm_* macros
Date: Tue,  6 Jun 2023 16:15:16 +0530
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1686047727.git.code@siddh.me>
References: <cover.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Comments say macros DRM_DEBUG_* are deprecated in favor of
drm_dbg_*(NULL, ...), but they have broken support for it,
as the macro will result in `(NULL) ? (NULL)->dev : NULL`.

Thus, fix them by separating logic to get dev ptr in a new
function, which will return the dev ptr if arg is not NULL.
Use it in drm_dbg_*, and also in __DRM_DEFINE_DBG_RATELIMITED,
where a similar (but correct) NULL check was in place.

Also, add support for NULL in __drm_printk, so that all the
drm_* macros will hence support NULL as the first argument.
This also means that deprecation comments mentioning pr_()*
can now be changed to the drm equivalents.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 include/drm/drm_print.h | 79 +++++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 27 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a93a387f8a1a..4b8532cf2ae6 100644
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
@@ -451,9 +452,32 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct =
device *dev,
  * Prefer drm_device based logging over device or prink based logging.
  */
=20
+/* Helpers for struct drm_device based logging. */
+
+/**
+ * __drm_dev_ptr - Helper function to get drm->dev pointer.
+ * @drm: struct drm_device pointer.
+ *
+ * RETURNS:
+ * The struct device pointer (NULL if @drm is NULL).
+ */
+static inline struct device *__drm_dev_ptr(const struct drm_device *drm)
+{
+=09if (drm)
+=09=09return drm->dev;
+
+=09return NULL;
+}
+
 /* Helper for struct drm_device based logging. */
 #define __drm_printk(drm, level, type, fmt, ...)=09=09=09\
-=09dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
+({=09=09=09=09=09=09=09=09=09\
+=09struct device *__dev_ =3D __drm_dev_ptr(drm);=09=09=09\
+=09if (__dev_)=09=09=09=09=09=09=09\
+=09=09dev_##level##type(__dev_, "[drm] " fmt, ##__VA_ARGS__);=09\
+=09else=09=09=09=09=09=09=09=09\
+=09=09pr_##level##type("[drm] " fmt, ##__VA_ARGS__);=09=09\
+})
=20
=20
 #define drm_info(drm, fmt, ...)=09=09=09=09=09\
@@ -487,25 +511,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct=
 device *dev,
=20
=20
 #define drm_dbg_core(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg_driver(drm, fmt, ...)=09=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS_=
_)
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
+#define drm_dbg_driver(drm, fmt, ...)=09=09=09=09=09\
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
 #define drm_dbg_prime(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__=
)
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
 #define drm_dbg_atomic(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS_=
_)
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
 #define drm_dbg_vbl(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
 #define drm_dbg_state(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__=
)
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
 #define drm_dbg_lease(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__=
)
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
 #define drm_dbg_dp(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
 #define drm_dbg_drmres(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS_=
_)
+=09drm_dev_dbg(__drm_dev_ptr(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
=20
 #define drm_dbg(drm, fmt, ...)=09drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
=20
@@ -533,31 +557,31 @@ void __drm_err(const char *format, ...);
 #define _DRM_PRINTK(once, level, fmt, ...)=09=09=09=09\
 =09printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
=20
-/* NOTE: this is deprecated in favor of pr_info(). */
+/* NOTE: this is deprecated in favor of drm_info(NULL, ...). */
 #define DRM_INFO(fmt, ...)=09=09=09=09=09=09\
 =09_DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
-/* NOTE: this is deprecated in favor of pr_notice(). */
+/* NOTE: this is deprecated in favor of drm_notice(NULL, ...). */
 #define DRM_NOTE(fmt, ...)=09=09=09=09=09=09\
 =09_DRM_PRINTK(, NOTICE, fmt, ##__VA_ARGS__)
-/* NOTE: this is deprecated in favor of pr_warn(). */
+/* NOTE: this is deprecated in favor of drm_warn(NULL, ...). */
 #define DRM_WARN(fmt, ...)=09=09=09=09=09=09\
 =09_DRM_PRINTK(, WARNING, fmt, ##__VA_ARGS__)
=20
-/* NOTE: this is deprecated in favor of pr_info_once(). */
+/* NOTE: this is deprecated in favor of drm_info_once(NULL, ...). */
 #define DRM_INFO_ONCE(fmt, ...)=09=09=09=09=09=09\
 =09_DRM_PRINTK(_once, INFO, fmt, ##__VA_ARGS__)
-/* NOTE: this is deprecated in favor of pr_notice_once(). */
+/* NOTE: this is deprecated in favor of drm_notice_once(NULL, ...). */
 #define DRM_NOTE_ONCE(fmt, ...)=09=09=09=09=09=09\
 =09_DRM_PRINTK(_once, NOTICE, fmt, ##__VA_ARGS__)
-/* NOTE: this is deprecated in favor of pr_warn_once(). */
+/* NOTE: this is deprecated in favor of drm_warn_once(NULL, ...). */
 #define DRM_WARN_ONCE(fmt, ...)=09=09=09=09=09=09\
 =09_DRM_PRINTK(_once, WARNING, fmt, ##__VA_ARGS__)
=20
-/* NOTE: this is deprecated in favor of pr_err(). */
+/* NOTE: this is deprecated in favor of drm_err(NULL, ...). */
 #define DRM_ERROR(fmt, ...)=09=09=09=09=09=09\
 =09__drm_err(fmt, ##__VA_ARGS__)
=20
-/* NOTE: this is deprecated in favor of pr_err_ratelimited(). */
+/* NOTE: this is deprecated in favor of drm_err_ratelimited(NULL, ...). */
 #define DRM_ERROR_RATELIMITED(fmt, ...)=09=09=09=09=09\
 =09DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
=20
@@ -593,13 +617,14 @@ void __drm_err(const char *format, ...);
 #define DRM_DEBUG_DP(fmt, ...)=09=09=09=09=09=09\
 =09__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
=20
-#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)=09=09=09=09=
=09\
-({=09=09=09=09=09=09=09=09=09=09=09=09\
-=09static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_=
RATELIMIT_BURST);\
-=09const struct drm_device *drm_ =3D (drm);=09=09=09=09=09=09=09\
-=09=09=09=09=09=09=09=09=09=09=09=09\
-=09if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))=09=09=
=09\
-=09=09drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARG=
S__);=09\
+#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)=09=09\
+({=09=09=09=09=09=09=09=09=09\
+=09static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL,=09\
+=09=09=09=09      DEFAULT_RATELIMIT_BURST);=09=09\
+=09=09=09=09=09=09=09=09=09\
+=09if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))\
+=09=09drm_dev_printk(__drm_dev_ptr(drm), KERN_DEBUG,=09=09\
+=09=09=09       fmt, ## __VA_ARGS__);=09=09=09\
 })
=20
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
--=20
2.39.2


