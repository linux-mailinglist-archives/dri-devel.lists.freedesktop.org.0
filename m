Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F796652DE4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A4310E427;
	Wed, 21 Dec 2022 08:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6B610E3ED
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:17:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671567421; cv=none; d=zohomail.in; s=zohoarc; 
 b=ZZ3Cn1LzWaB2b2g9EzB96b3U+p+HkUtUoCidMJwmZfNzMqqMwwNhyYPaVdcicFA0jXk4L008AgQ3U/AD1OxEoEymw2ADuFvPVaB9rAGo4sIdke+713JwTgA8UoMpEpcPOpKgRAIb+Chu456RxqC23fWym27vYMZAONMo5liYs9A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671567421;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=SOPWJE5d02Vzl8zylY3TQdJgvgPJ1agqESFAbzCxsWc=; 
 b=IN0ArUvUu+fYhn6xTtELAF508aNe5TwmG0iZ6EEtafZfiGVc7BPNNRqXMTPVD6nfUCgSPoP8TIFAdLhKPcpz+sC2BB6PmoClKa9SMoLh07Cq8yT3j3fB0bVl1e4m5DqTdm0X18rKdtD7J4Y+3RrMDwqn7ZiO1QJ2lIMs3Yx0F1E=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671567421; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=SOPWJE5d02Vzl8zylY3TQdJgvgPJ1agqESFAbzCxsWc=;
 b=lgnTQRGwmsBUMMMnk5ePbGgupJvv767sqDRTZZUloEeojdEhLwK05LLeJRrdjEmr
 XgkUtvql+Oawe8lUl3omshzt/OUfaKyjfsGw2VpjBTIul3uoFDDaMGOtbPIcNyb/LPv
 y5UvkOrMz2JIJwqPy7K2GQQPjlYRn0iBKCR/dYEw=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1671567420947873.7402382604851;
 Wed, 21 Dec 2022 01:47:00 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <3ebf0d61ad5e82875a4493108602e62429306b14.1671566741.git.code@siddh.me>
Subject: [PATCH 04/10] drm/print: Fix support for NULL as first argument of
 drm_dbg_*
Date: Wed, 21 Dec 2022 01:46:39 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1671566741.git.code@siddh.me>
References: <cover.1671566741.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 21 Dec 2022 08:29:21 +0000
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

Thus, fix them by casting input drm to a temporary struct ptr,
with the same convention as in __DRM_DEFINE_DBG_RATELIMITED.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 include/drm/drm_print.h | 89 ++++++++++++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 20 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a44fb7ef257f..53702d830291 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -486,26 +486,75 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct=
 device *dev,
 =09__drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
=20
=20
-#define drm_dbg_core(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg_driver(drm, fmt, ...)=09=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS_=
_)
-#define drm_dbg_kms(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
-#define drm_dbg_prime(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__=
)
-#define drm_dbg_atomic(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS_=
_)
-#define drm_dbg_vbl(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
-#define drm_dbg_state(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__=
)
-#define drm_dbg_lease(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__=
)
-#define drm_dbg_dp(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
-#define drm_dbg_drmres(drm, fmt, ...)=09=09=09=09=09\
-=09drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS_=
_)
+#define drm_dbg_core(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_CORE,=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
+
+#define drm_dbg_driver(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_DRIVER,=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
+
+#define drm_dbg_kms(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_KMS,=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
+
+#define drm_dbg_prime(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_PRIME,=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
+
+#define drm_dbg_atomic(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_ATOMIC,=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
+
+#define drm_dbg_vbl(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_VBL,=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
+
+#define drm_dbg_state(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_STATE,=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
+
+#define drm_dbg_lease(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_LEASE,=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
+
+#define drm_dbg_dp(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_DP,=09=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
+
+#define drm_dbg_drmres(drm, fmt, ...)=09=09=09=09\
+({=09=09=09=09=09=09=09=09\
+=09const struct drm_device *drm_ =3D (drm);=09=09=09\
+=09drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_DRMRES,=09\
+=09=09    fmt, ##__VA_ARGS__);=09=09=09\
+})
=20
 #define drm_dbg(drm, fmt, ...)=09drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
=20
--=20
2.35.1


