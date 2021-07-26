Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE743D549D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 09:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2E36E542;
	Mon, 26 Jul 2021 07:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED08A6E542
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 07:50:39 +0000 (UTC)
Date: Mon, 26 Jul 2021 07:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1627285838;
 bh=S88aH5G5JnXJmdqAnGnGiCATKWCX5DFpCTQM/bqt32Q=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Mxd8UAZlrJ6HXwUU+LT4Y+rlKW70afIJw9nltnb33iJYlddV2WELgG3h2d+x8ZYuP
 31q9xVSedLyeYsDpkZLuyHZUIPbUvmEmFFvQLt38YTM4ElAXL1m39qF53dXx47udTy
 v0hW80RT6q8oR4Z82dED6RQogDrckWEebRF+RtjNgoYlVccX273lJnmcYtwr+lvEqt
 OGux9GQOLfIZ1mUFFigxXGsxzmt4fQqc/+VeK0pGOO0/x00P39Pwe5rCrB4WygMvre
 peegnKlWKnhaZoQJZlBTMOjREW1v+UozrEM2x+YiOFOdKbmHWnw+EP3bGSqio1u17J
 U56DNKUiUmNgQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document DRM_IOCTL_MODE_RMFB
Message-ID: <ephVkof3uGu2RpOdBbrHE3qF98zBfIBRzXe4Vyoboh0@cp4-web-034.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since there's no struct to attach the docs to, document the IOCTL
definition.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 include/uapi/drm/drm.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index e1f49dd241f7..283d61d5a243 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1050,6 +1050,16 @@ extern "C" {
 #define DRM_IOCTL_MODE_GETPROPBLOB=09DRM_IOWR(0xAC, struct drm_mode_get_bl=
ob)
 #define DRM_IOCTL_MODE_GETFB=09=09DRM_IOWR(0xAD, struct drm_mode_fb_cmd)
 #define DRM_IOCTL_MODE_ADDFB=09=09DRM_IOWR(0xAE, struct drm_mode_fb_cmd)
+/**
+ * DRM_IOCTL_MODE_RMFB - Remove a framebuffer.
+ *
+ * This removes a framebuffer previously added via ADDFB/ADDFB2. The IOCTL
+ * argument is a framebuffer object ID.
+ *
+ * Warning: removing a framebuffer currently in-use on an enabled plane wi=
ll
+ * disable that plane. If the plane is primary, the CRTC may also be disab=
led
+ * (depending on driver capabilities).
+ */
 #define DRM_IOCTL_MODE_RMFB=09=09DRM_IOWR(0xAF, unsigned int)
 #define DRM_IOCTL_MODE_PAGE_FLIP=09DRM_IOWR(0xB0, struct drm_mode_crtc_pag=
e_flip)
 #define DRM_IOCTL_MODE_DIRTYFB=09=09DRM_IOWR(0xB1, struct drm_mode_fb_dirt=
y_cmd)
--=20
2.32.0


