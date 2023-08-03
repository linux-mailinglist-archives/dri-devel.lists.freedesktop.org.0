Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA7376E529
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 12:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5BE10E1EC;
	Thu,  3 Aug 2023 10:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86CC10E1EC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 10:00:57 +0000 (UTC)
Date: Thu, 03 Aug 2023 10:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1691056855; x=1691316055;
 bh=Hdh/Bqt+51KexXaKf0kDJwkPb5E1pWzqPB5wYpJIKh8=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=lBYtYJ/TpVU7VIJdd7Wis8eoF7NLxKZwDFaqei7gra6TppFsRx93pMpszcIhF6J63
 t21eCWA3sn4qYhqqji4evt9hcMiUWSTSyzfJLv/ijZNIZASzpECr+xXVkIo+uLgX29
 5HQfKYGXSv7EtL+DtnxxqM+dV0JYxlJq5kcBY3uvVgi8F2nRjdDIW07f7dSTEdZ7YU
 zZYzUKwvyPdGoGIT1pfw8hSPQURzOnFCBwa4Gzx/dhZ9nLeexYzwzsB9QKfr+P7juP
 08eOoGtZVO9fHo1ZayS1qvFW93/kVXn7oiwMr3fcy5Yy8DpdT/TNAMBLkgE/F1mNWG
 +nE+kImOTbImA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/doc: document DRM_IOCTL_MODE_CREATE_DUMB
Message-ID: <20230803100041.387404-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main motivation is to repeat that dumb buffers should not be
abused for anything else than basic software rendering with KMS.
User-space devs are more likely to look at the IOCTL docs than to
actively search for the driver-oriented "Dumb Buffer Objects"
section.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 Documentation/gpu/drm-kms.rst |  2 ++
 include/uapi/drm/drm.h        | 15 +++++++++++++++
 include/uapi/drm/drm_mode.h   | 16 ++++++++++++++--
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index c92d425cb2dd..ca9210e47266 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -360,6 +360,8 @@ Format Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
    :export:
=20
+.. _kms_dumb_buffer_objects:
+
 Dumb Buffer Objects
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 863e47200911..625dba7ddbfe 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1128,6 +1128,21 @@ extern "C" {
 #define DRM_IOCTL_MODE_PAGE_FLIP=09DRM_IOWR(0xB0, struct drm_mode_crtc_pag=
e_flip)
 #define DRM_IOCTL_MODE_DIRTYFB=09=09DRM_IOWR(0xB1, struct drm_mode_fb_dirt=
y_cmd)
=20
+/**
+ * DRM_IOCTL_MODE_CREATE_DUMB - Create a new dumb buffer object.
+ *
+ * KMS dumb buffers provide a very primitive way to allocate a buffer obje=
ct
+ * suitable for scanout and map it for software rendering. KMS dumb buffer=
s are
+ * not suitable for hardware-accelerated rendering nor video decoding. KMS=
 dumb
+ * buffers are not suitable to be displayed without KMS. Also see
+ * :ref:`kms_dumb_buffer_objects`.
+ *
+ * The IOCTL argument is a struct drm_mode_create_dumb.
+ *
+ * User-space is expected to create a KMS dumb buffer via this IOCTL, then=
 add
+ * it as a KMS framebuffer via &DRM_IOCTL_MODE_ADDFB and map it via
+ * &DRM_IOCTL_MODE_MAP_DUMB.
+ */
 #define DRM_IOCTL_MODE_CREATE_DUMB DRM_IOWR(0xB2, struct drm_mode_create_d=
umb)
 #define DRM_IOCTL_MODE_MAP_DUMB    DRM_IOWR(0xB3, struct drm_mode_map_dumb=
)
 #define DRM_IOCTL_MODE_DESTROY_DUMB    DRM_IOWR(0xB4, struct drm_mode_dest=
roy_dumb)
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 92d96a2b6763..8a7e747f0564 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1029,13 +1029,25 @@ struct drm_mode_crtc_page_flip_target {
 =09__u64 user_data;
 };
=20
-/* create a dumb scanout buffer */
+/**
+ * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
+ * @height: buffer height in pixels
+ * @width: buffer width in pixels
+ * @bpp: bits per pixel
+ * @flags: must be zero
+ * @handle: buffer object handle
+ * @pitch: number of bytes between two consecutive lines
+ * @size: size of the whole buffer in bytes
+ *
+ * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeed=
s,
+ * the kernel fills @handle, @pitch and @size.
+ */
 struct drm_mode_create_dumb {
 =09__u32 height;
 =09__u32 width;
 =09__u32 bpp;
 =09__u32 flags;
-=09/* handle, pitch, size will be returned */
+
 =09__u32 handle;
 =09__u32 pitch;
 =09__u64 size;
--=20
2.41.0


