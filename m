Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627915A0ACD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB48710E059;
	Thu, 25 Aug 2022 07:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65FE89BA1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 07:54:48 +0000 (UTC)
Date: Wed, 24 Aug 2022 17:45:06 +0000
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="LixCG1BT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661363118; x=1661622318;
 bh=v9q/XJucA/ji/vxkH/Dv+6XWJzS5lpAnA1GWu2XYgpI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=LixCG1BTqiUSR0mXoMSi6ZeaxjqIAsGzOUDWm1OnsSwQZUAHFDeyegkZWwbTr5uZX
 cc0AEODFg3OoUYsVotekRAA+OTcAeRkt+Wi7phDVTlXPl6XgSFfApxkfakcxUA9BHd
 XVzBaXDwgWTP0jOcyKyw9tkYbaEXt5CfYXkTOzsLQr6Io5Z9iK7TKYre5my2myVyEZ
 QLW+V+ok5CCY8koZzHVkQMe6SoHCFH1wdC2E9yOy6z7my0kzI/kesg08DVWKiC9S1f
 09UmSBRLfd0Bkm/BEihntIx39N/BicEbnVWHOWTaPlGddUerT5WmS1QGI3mAXkhgfv
 0MRAIt9CdVd5g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document uAPI page-flip flags
Message-ID: <20220824174459.441976-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document flags accepted by the page-flip and atomic IOCTLs.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/uapi/drm/drm_mode.h | 44 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index fa953309d9ce..e1b04ffd54c3 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -935,12 +935,30 @@ struct hdr_output_metadata {
 =09};
 };
=20
+/**
+ * DRM_MODE_PAGE_FLIP_EVENT
+ *
+ * Request that the kernel sends back a vblank event (see
+ * struct drm_event_vblank) when the page-flip is done.
+ */
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
+/**
+ * DRM_MODE_PAGE_FLIP_ASYNC
+ *
+ * Request that the page-flip is performed as soon as possible, ie. with n=
o
+ * delay due to waiting for vblank. This may cause tearing to be visible o=
n
+ * the screen.
+ */
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
 #define DRM_MODE_PAGE_FLIP_TARGET_RELATIVE 0x8
 #define DRM_MODE_PAGE_FLIP_TARGET (DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE | \
 =09=09=09=09   DRM_MODE_PAGE_FLIP_TARGET_RELATIVE)
+/**
+ * DRM_MODE_PAGE_FLIP_FLAGS
+ *
+ * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags.
+ */
 #define DRM_MODE_PAGE_FLIP_FLAGS (DRM_MODE_PAGE_FLIP_EVENT | \
 =09=09=09=09  DRM_MODE_PAGE_FLIP_ASYNC | \
 =09=09=09=09  DRM_MODE_PAGE_FLIP_TARGET)
@@ -1034,11 +1052,35 @@ struct drm_mode_destroy_dumb {
 =09__u32 handle;
 };
=20
-/* page-flip flags are valid, plus: */
+/**
+ * DRM_MODE_ATOMIC_TEST_ONLY
+ *
+ * Do not apply the atomic commit, instead check whether the hardware supp=
orts
+ * this configuration.
+ *
+ * See drm_mode_config_funcs.atomic_check for more details on test-only
+ * commits.
+ */
 #define DRM_MODE_ATOMIC_TEST_ONLY 0x0100
+/**
+ * DRM_MODE_ATOMIC_NONBLOCK
+ *
+ * Do not block while applying the atomic commit.
+ */
 #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
+/**
+ * DRM_MODE_ATOMIC_ALLOW_MODESET
+ *
+ * Allow the update to result in visible artifacts such as a black screen.
+ */
 #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
=20
+/**
+ * DRM_MODE_ATOMIC_FLAGS
+ *
+ * Bitfield of flags accepted by the &DRM_IOCTL_MODE_ATOMIC IOCTL in
+ * &drm_mode_atomic.flags.
+ */
 #define DRM_MODE_ATOMIC_FLAGS (\
 =09=09DRM_MODE_PAGE_FLIP_EVENT |\
 =09=09DRM_MODE_PAGE_FLIP_ASYNC |\
--=20
2.37.2


