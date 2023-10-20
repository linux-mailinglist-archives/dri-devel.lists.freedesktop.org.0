Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8787D0CFD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811AD10E0F8;
	Fri, 20 Oct 2023 10:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C9410E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1697797189; x=1698056389;
 bh=H/114vozHdgaGxmhwIjjkaKahZrnJRNprOX2kKbdNhs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Z1YKd9Tc728Qaou60j8UJwabxF3gcehu5r2uyjnqv2hy1eb8Q51kls95GEEkt1tPh
 FY2Fs8atvYhToRWiSeUOnKQ1Qlu/PLwprsjPYoHvu6elvJsUOtL4k8XL3kmQR3Fhyl
 uzatN4Vd3rDXiAffd0rSndtltrOIIdDRBZhJ0pVAs4JqesZn0U83WmUxDfVgqbOHg5
 sOUxog3LqftB4d8jxREwv1hnEHcF0u57+wVCVbXSDRRUmRRZVLC7DMh29itDMEagtk
 0hCuvNc8C4RAn6nttDJctgYZJJ/J3cWwgHPbKQWbg8Kth2OZ5n77pyF8YapW/64m5C
 h6IOUcIyJJPmw==
Date: Fri, 20 Oct 2023 10:19:45 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 2/2] drm: introduce CLOSEFB IOCTL
Message-ID: <20231020101926.145327-2-contact@emersion.fr>
In-Reply-To: <20231020101926.145327-1-contact@emersion.fr>
References: <20231020101926.145327-1-contact@emersion.fr>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Hans de Goede <hdegoede@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Dennis Filder <d.filder@web.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new IOCTL allows callers to close a framebuffer without
disabling planes or CRTCs. This takes inspiration from Rob Clark's
unref_fb IOCTL [1] and DRM_MODE_FB_PERSIST [2].

User-space patch for wlroots available at [3]. IGT test available
at [4].

v2: add an extra pad field just in case we want to extend this IOCTL
in the future (Pekka, Sima).

[1]: https://lore.kernel.org/dri-devel/20170509153654.23464-1-robdclark@gma=
il.com/
[2]: https://lore.kernel.org/dri-devel/20211006151921.312714-1-contact@emer=
sion.fr/
[3]: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4394
[4]: https://lists.freedesktop.org/archives/igt-dev/2023-October/063294.htm=
l

Signed-off-by: Simon Ser <contact@emersion.fr>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Dennis Filder <d.filder@web.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/drm_crtc_internal.h |  2 ++
 drivers/gpu/drm/drm_framebuffer.c   | 22 ++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c         |  1 +
 include/uapi/drm/drm.h              | 20 ++++++++++++++++++++
 include/uapi/drm/drm_mode.h         | 10 ++++++++++
 5 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc=
_internal.h
index 8556c3b3ff88..6b646e0783be 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -222,6 +222,8 @@ int drm_mode_addfb2_ioctl(struct drm_device *dev,
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
index 62306196808c..3fb3e29d4087 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -482,6 +482,28 @@ int drm_mode_rmfb_ioctl(struct drm_device *dev,
 =09return drm_mode_rmfb(dev, *fb_id, file_priv);
 }
=20
+int drm_mode_closefb_ioctl(struct drm_device *dev,
+=09=09=09   void *data, struct drm_file *file_priv)
+{
+=09struct drm_mode_closefb *r =3D data;
+=09struct drm_framebuffer *fb;
+=09int ret;
+
+=09if (!drm_core_check_feature(dev, DRIVER_MODESET))
+=09=09return -EOPNOTSUPP;
+
+=09if (r->pad)
+=09=09return -EINVAL;
+
+=09fb =3D drm_framebuffer_lookup(dev, file_priv, r->fb_id);
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
index 77590b0f38fa..44fda68c28ae 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -675,6 +675,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
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
index 794c1d857677..731c8f598882 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1198,6 +1198,26 @@ extern "C" {
=20
 #define DRM_IOCTL_SYNCOBJ_EVENTFD=09DRM_IOWR(0xCF, struct drm_syncobj_even=
tfd)
=20
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
+#define DRM_IOCTL_MODE_CLOSEFB=09=09DRM_IOWR(0xD0, struct drm_mode_closefb=
)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index ea1b639bcb28..f23397877a80 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1311,6 +1311,16 @@ struct drm_mode_rect {
 =09__s32 y2;
 };
=20
+/**
+ * struct drm_mode_closefb
+ * @fb_id: Framebuffer ID.
+ * @pad: Must be zero.
+ */
+struct drm_mode_closefb {
+=09__u32 fb_id;
+=09__u32 pad;
+};
+
 #if defined(__cplusplus)
 }
 #endif
--=20
2.42.0


