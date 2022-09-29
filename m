Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DADE5EFD4C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C3210EC20;
	Thu, 29 Sep 2022 18:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8EE10EC1E;
 Thu, 29 Sep 2022 18:44:09 +0000 (UTC)
Date: Thu, 29 Sep 2022 18:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664477047; x=1664736247;
 bh=XgGbJzAAQdRFYUgVXN6fiC90eG2tYlp0BWrk501WtpI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=kTMFZeODF//W+2pPrZflUory5Aj8zKQi5b+nq4ReQ+Ej2p/WYw5c+4J1YXadLbqQK
 MyhVoxZ5CBu6OGAmHgfpaE9ypfTNMN+kCr4+iRl/iOIrQYGED3ss5bi5/eVQGwg4a4
 H0s+9LZIXUPsMwTZFpei4sKybyL+zgsn5NTHG3Z1eWoLsMFP9GCfPkYv5uPwoluiFq
 LV7r/888B7BzGGGoRED4SJ0mQ6fwtx4tUFBIK0hCFXiUbnGnTJSlL8Q1JMJNKzTM+q
 Qs6c42D2SfqXiXcMhqN36KhmPFbrAjfv5m83fCM6zl5R2eS+tto7J/8/C7u7cyS9qK
 Nmar9ktMOW0fA==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 5/6] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Message-ID: <20220929184307.258331-6-contact@emersion.fr>
In-Reply-To: <20220929184307.258331-1-contact@emersion.fr>
References: <20220929184307.258331-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch, mwen@igalia.com,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new kernel capability indicates whether async page-flips are
supported via the atomic uAPI. DRM clients can use it to check
for support before feeding DRM_MODE_PAGE_FLIP_ASYNC to the kernel.

Make it clear that DRM_CAP_ASYNC_PAGE_FLIP is for legacy uAPI only.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_ioctl.c |  5 +++++
 include/uapi/drm/drm.h      | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ca2a6e6101dc..5b1591e2b46c 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -302,6 +302,11 @@ static int drm_getcap(struct drm_device *dev, void *da=
ta, struct drm_file *file_
 =09case DRM_CAP_CRTC_IN_VBLANK_EVENT:
 =09=09req->value =3D 1;
 =09=09break;
+=09case DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP:
+=09=09req->value =3D drm_core_check_feature(dev, DRIVER_ATOMIC) &&
+=09=09=09     dev->mode_config.async_page_flip &&
+=09=09=09     !dev->mode_config.atomic_async_page_flip_not_supported;
+=09=09break;
 =09default:
 =09=09return -EINVAL;
 =09}
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 642808520d92..b1962628ecda 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -706,7 +706,8 @@ struct drm_gem_open {
 /**
  * DRM_CAP_ASYNC_PAGE_FLIP
  *
- * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for legacy
+ * page-flips.
  */
 #define DRM_CAP_ASYNC_PAGE_FLIP=09=090x7
 /**
@@ -767,6 +768,13 @@ struct drm_gem_open {
  * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE=090x14
+/**
+ * DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
+ *
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for atomic
+ * commits.
+ */
+#define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP=090x15
=20
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
--=20
2.37.3


