Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8872DD066
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 12:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE6B6E2E3;
	Thu, 17 Dec 2020 11:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC47F6E2B4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:32:25 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 44189C000B;
 Thu, 17 Dec 2020 11:32:24 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/doc: document the type plane property
Date: Thu, 17 Dec 2020 12:32:16 +0100
Message-Id: <20201217113220.102271-6-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217113220.102271-1-contact@emersion.fr>
References: <20201217113220.102271-1-contact@emersion.fr>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new entry for "type" in the section for standard plane properties.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_plane.c | 52 ++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 4a66374dc355..fef63bb7d293 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -49,10 +49,8 @@
  * &struct drm_plane (possibly as part of a larger structure) and registers it
  * with a call to drm_universal_plane_init().
  *
- * The type of a plane is exposed in the immutable "type" enumeration property,
- * which has one of the following values: "Overlay", "Primary", "Cursor" (see
- * enum drm_plane_type). A plane can be compatible with multiple CRTCs, see
- * &drm_plane.possible_crtcs.
+ * Each plane has a type, see enum drm_plane_type. A plane can be compatible
+ * with multiple CRTCs, see &drm_plane.possible_crtcs.
  *
  * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
  * relies on the driver to set the primary and optionally the cursor plane used
@@ -66,6 +64,52 @@
  *
  * DRM planes have a few standardized properties:
  *
+ * type:
+ *     Immutable property describing the type of the plane.
+ *
+ *     For user-space which has enabled the &DRM_CLIENT_CAP_UNIVERSAL_PLANES
+ *     capability, the plane type is just a hint and is mostly superseded by
+ *     atomic test-only commits. The type hint can still be used to come up
+ *     more easily with a plane configuration accepted by the driver. Note that
+ *     &DRM_CLIENT_CAP_UNIVERSAL_PLANES is implicitly enabled by
+ *     &DRM_CLIENT_CAP_ATOMIC.
+ *
+ *     The value of this property can be one of the following:
+ *
+ *     "Primary":
+ *         To light up a CRTC, attaching a primary plane is the most likely to
+ *         work if it covers the whole CRTC and doesn't have scaling or
+ *         cropping set up.
+ *
+ *         Drivers may support more features for the primary plane, user-space
+ *         can find out with test-only atomic commits.
+ *
+ *         User-space must not mix the legacy IOCTLs &DRM_IOCTL_MODE_SETCRTC or
+ *         &DRM_IOCTL_MODE_PAGE_FLIP with atomic commits involving a primary
+ *         plane.
+ *     "Cursor":
+ *         To enable this plane, using a framebuffer configured without scaling
+ *         or cropping and with the following properties is the most likely to
+ *         work:
+ *
+ *         - If the driver provides the capabilities &DRM_CAP_CURSOR_WIDTH and
+ *           &DRM_CAP_CURSOR_HEIGHT, create the framebuffer with this size.
+ *           Otherwise, create a framebuffer with the size 64x64.
+ *         - If the driver doesn't support modifiers, create a framebuffer with
+ *           a linear layout. Otherwise, use the IN_FORMATS plane property.
+ *
+ *         Drivers may support more features for the cursor plane, user-space
+ *         can find out with test-only atomic commits.
+ *
+ *         User-space must not mix the legacy IOCTLs &DRM_IOCTL_MODE_CURSOR or
+ *         &DRM_IOCTL_MODE_CURSOR2 with atomic commits involving a cursor
+ *         plane.
+ *     "Overlay":
+ *         Neither primary nor cursor.
+ *
+ *         Overlay planes are the only planes exposed when the
+ *         &DRM_CLIENT_CAP_UNIVERSAL_PLANES capability is disabled.
+ *
  * IN_FORMATS:
  *     Blob property which contains the set of buffer format and modifier
  *     pairs supported by this plane. The blob is a struct
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
