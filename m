Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B114253DF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 15:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AA76F47C;
	Thu,  7 Oct 2021 13:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374466F474
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 13:15:36 +0000 (UTC)
Date: Thu, 07 Oct 2021 13:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633612533;
 bh=PxksXyJDTuUBsBiusFRmCcnpceYMwN5fgqC5/xKEMuk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=TAh064++tD7atYlUAqSb+mmTgrfs6BhAC50Qo5Adj3cLfac9TFC0BYDQ1UPMERagS
 46cTIp0Q2dIgb9hNgVC8bJ67o5M14uOD7L5N0oYaI/Emg+nc9PpBOVccGhkMHiyLLA
 HgM/6yna8BuvGyGn+CH+FN1aIISgk6gp33YL6opRR3dtSWrc9ltYpRyHIgBw/7grJX
 jEvSEpU7ZpCYDjOWPRO0NTmDiP0+2zjAzM7t9WzgB1ZYZuIhpRfrN+FtzloCWLB9ct
 bbpXwfmvJD7Zp9g7W3UUO2pEbderRGE/K7l36WSsrIZufnCb6oPxkwx7+DYwks61WQ
 bFvs1Q6IQOMvQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Hans de Goede <hdegoede@redhat.com>, Dennis Filder <d.filder@web.de>,
 Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH RFC 2/2] drm: introduce CLOSEFB IOCTL
Message-ID: <20211007131507.149734-2-contact@emersion.fr>
In-Reply-To: <20211007131507.149734-1-contact@emersion.fr>
References: <20211007131507.149734-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new IOCTL allows callers to close a framebuffer without
disabling planes or CRTCs. This takes inspiration from Rob Clark's
unref_fb IOCTL [1] and DRM_MODE_FB_PERSIST [2].

[1]: https://lore.kernel.org/dri-devel/20170509153654.23464-1-robdclark@gma=
il.com/
[2]: https://lore.kernel.org/dri-devel/20211006151921.312714-1-contact@emer=
sion.fr/

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Dennis Filder <d.filder@web.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_crtc_internal.h |  2 ++
 drivers/gpu/drm/drm_framebuffer.c   | 19 +++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c         |  1 +
 include/uapi/drm/drm.h              | 19 +++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc=
_internal.h
index 63279e984342..c6377b9ba981 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -221,6 +221,8 @@ int drm_mode_addfb2_ioctl(struct drm_device *dev,
 =09=09=09  void *data, struct drm_file *file_priv);
 int drm_mode_rmfb_ioctl(struct drm_device *dev,
 =09=09=09void *data, struct drm_file *file_priv);
+int drm_mode_closefb_ioctl(struct drm_device *dev,
+=09=09=09   void *data, struct drm_file *file_priv);
 int drm_mode_getfb(struct drm_device *dev,
 =09=09   void *data, struct drm_file *file_priv);
 int drm_mode_getfb2_ioctl(struct drm_device *dev,
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_frameb=
uffer.c
index 2352972ba6ac..15f7c22dbd4a 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -500,6 +500,25 @@ int drm_mode_rmfb_ioctl(struct drm_device *dev,
 =09return drm_mode_rmfb(dev, *fb_id, file_priv);
 }
=20
+int drm_mode_closefb_ioctl(struct drm_device *dev,
+=09=09=09   void *data, struct drm_file *file_priv)
+{
+=09uint32_t *fb_id =3D data;
+=09struct drm_framebuffer *fb;
+=09int ret;
+
+=09if (!drm_core_check_feature(dev, DRIVER_MODESET))
+=09=09return -EOPNOTSUPP;
+
+=09fb =3D drm_framebuffer_lookup(dev, file_priv, *fb_id);
+=09if (!fb)
+=09=09return -ENOENT;
+
+=09ret =3D drm_mode_closefb(fb, file_priv);
+=09drm_framebuffer_put(fb);
+=09return ret;
+}
+
 /**
  * drm_mode_getfb - get FB info
  * @dev: drm device for the ioctl
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8b8744dcf691..545762bc16d0 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -670,6 +670,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
 =09DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB, drm_mode_addfb_ioctl, 0),
 =09DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB2, drm_mode_addfb2_ioctl, 0),
 =09DRM_IOCTL_DEF(DRM_IOCTL_MODE_RMFB, drm_mode_rmfb_ioctl, 0),
+=09DRM_IOCTL_DEF(DRM_IOCTL_MODE_CLOSEFB, drm_mode_closefb_ioctl, 0),
 =09DRM_IOCTL_DEF(DRM_IOCTL_MODE_PAGE_FLIP, drm_mode_page_flip_ioctl, DRM_M=
ASTER),
 =09DRM_IOCTL_DEF(DRM_IOCTL_MODE_DIRTYFB, drm_mode_dirtyfb_ioctl, DRM_MASTE=
R),
 =09DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_DUMB, drm_mode_create_dumb_ioctl, 0=
),
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 3b810b53ba8b..8726f003f382 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1097,6 +1097,25 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=09DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
=20
 #define DRM_IOCTL_MODE_GETFB2=09=09DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
+/**
+ * DRM_IOCTL_MODE_CLOSEFB - Close a framebuffer.
+ *
+ * This closes a framebuffer previously added via ADDFB/ADDFB2. The IOCTL
+ * argument is a framebuffer object ID.
+ *
+ * This IOCTL is similar to &DRM_IOCTL_MODE_RMFB, except it doesn't disabl=
e
+ * planes and CRTCs. As long as the framebuffer is used by a plane, it's k=
ept
+ * alive. When the plane no longer uses the framebuffer (because the
+ * framebuffer is replaced with another one, or the plane is disabled), th=
e
+ * framebuffer is cleaned up.
+ *
+ * This is useful to implement flicker-free transitions between two proces=
ses.
+ *
+ * Depending on the threat model, user-space may want to ensure that the
+ * framebuffer doesn't expose any sensitive user information: closed
+ * framebuffers attached to a plane can be read back by the next DRM maste=
r.
+ */
+#define DRM_IOCTL_MODE_CLOSEFB=09=09DRM_IOWR(0xCF, unsigned int)
=20
 /*
  * Device specific ioctls should only be in their respective headers
--=20
2.33.0


