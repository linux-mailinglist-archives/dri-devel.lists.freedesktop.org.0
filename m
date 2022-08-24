Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C049259FDE9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9DB14ADB7;
	Wed, 24 Aug 2022 15:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB17112605;
 Wed, 24 Aug 2022 15:09:07 +0000 (UTC)
Date: Wed, 24 Aug 2022 15:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661353745; x=1661612945;
 bh=UjQBv1SdopMPkk5/F0ApAU/Bg+2DMjxdHQzVsIdwxaU=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=XblFJYX6/Ifn3L1ORqZTXJotlBFiVhP3SbqDqsCVtt6drL3m0wIPlW4OqsVdqpO+Z
 suHYwbfmv+aTl7iLVBPYRDBm4e/S9qbMMr9b6GPaHxae+xAaf0pGMP5ru3u1K2lC8B
 1/1uH9mQv1zbikfBmYHPMTZLPo8cREPtuHoYkOauAyp3Fem9v/jOvOoVziJx6R9mXb
 k4gpVoPb541QGDoqDMspXHuBTgG4xyMPyzdorJxmJEM8Ad6S/ajSayMJY3U8/Hnpi7
 rVhuVl95P6tgYYZcBLYygFL+u/yxzr7VUSxB24+y6qfVApZSKrYg829xKdQaKBShQ5
 fi27SRV1JDlEA==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Message-ID: <20220824150834.427572-4-contact@emersion.fr>
In-Reply-To: <20220824150834.427572-1-contact@emersion.fr>
References: <20220824150834.427572-1-contact@emersion.fr>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: daniel.vetter@ffwll.ch, mwen@igalia.com, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new kernel capability indicates whether async page-flips are
supported via the atomic uAPI. DRM clients can use it to check
for support before feeding DRM_MODE_PAGE_FLIP_ASYNC to the kernel.

Make it clear that DRM_CAP_ASYNC_PAGE_FLIP is for legacy uAPI only.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
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
2.37.2


