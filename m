Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C52E0ADA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE2C6E30F;
	Tue, 22 Dec 2020 13:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CCD6E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:35:28 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A82BC20016;
 Tue, 22 Dec 2020 13:35:26 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/5] drm/doc: document the type plane property
Date: Tue, 22 Dec 2020 14:35:21 +0100
Message-Id: <20201222133524.160842-3-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201222133524.160842-1-contact@emersion.fr>
References: <20201222133524.160842-1-contact@emersion.fr>
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

v3: improve paragraph about mixing legacy IOCTLs with explicit usage,
not that a driver may support cursors without cursor planes (Daniel)

v4: fixing rebase gone wrong

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_plane.c | 58 ++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index b15b65e48555..9dce5be5780c 100644
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
  * Each CRTC must have a unique primary plane userspace can attach to enable
  * the CRTC. In other words, userspace must be able to attach a different
@@ -72,6 +70,58 @@
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
+ *         Primary planes are implicitly used by the kernel in the legacy
+ *         IOCTLs &DRM_IOCTL_MODE_SETCRTC and &DRM_IOCTL_MODE_PAGE_FLIP.
+ *         Therefore user-space must not mix explicit usage of any primary
+ *         plane (e.g. through an atomic commit) with these legacy IOCTLs.
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
+ *         Cursor planes are implicitly used by the kernel in the legacy
+ *         IOCTLs &DRM_IOCTL_MODE_CURSOR and &DRM_IOCTL_MODE_CURSOR2.
+ *         Therefore user-space must not mix explicit usage of any cursor
+ *         plane (e.g. through an atomic commit) with these legacy IOCTLs.
+ *
+ *         Some drivers may support cursors even if no cursor plane is exposed.
+ *         In this case, the legacy cursor IOCTLs can be used to configure the
+ *         cursor.
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
