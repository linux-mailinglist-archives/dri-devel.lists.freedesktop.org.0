Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC175A5057
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573DB10F437;
	Mon, 29 Aug 2022 15:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9EC10F431
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:40:14 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661787612; x=1662046812;
 bh=cha+beTryRpee+9kSr6Vg/4ZXhBG88kHGkXtDTwBFBQ=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=TioAR0kKYr3W9jzBFDuJVnA511L58zyrnArqfJxkyrxZYmMWUzDQgi5xM9cBhkl3h
 7Ok3sIW6jjZitvCpVPEmXHMMfcSWlCYBK9gUeB/04KQ5cCbt9qkmjNNrZyH2ELhORY
 MlYZx3n4KGmWs8YFqiitSu4k+xrhou9jhEdQyQ8sLRStZyPoaFu99inR2UTHLuFDNC
 kuy/ZtNi7eU4uVYRu+j8xt9fVOh0tBFWG4oTq50RmKpMQjS1Svi0ixE15WkQqLgB3m
 HfvEp7Ru3RU4uSYXCmFIKqYQHhMEEVBvyiZvcLrH7vaiELCwnypM3kJ+A5FiMwBgDH
 NUYkMSyW8qFNQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: document uAPI page-flip flags
Message-ID: <20220829153957.153745-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document flags accepted by the page-flip and atomic IOCTLs.

v2 (Pekka):
- Mention DRM_EVENT_FLIP_COMPLETE in DRM_MODE_PAGE_FLIP_EVENT docs.
- Expand DRM_MODE_ATOMIC_NONBLOCK and DRM_MODE_ATOMIC_ALLOW_MODESET
  description.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 include/uapi/drm/drm_mode.h | 60 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index fa953309d9ce..fa26bda6ffb3 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -935,12 +935,31 @@ struct hdr_output_metadata {
 =09};
 };
=20
+/**
+ * DRM_MODE_PAGE_FLIP_EVENT
+ *
+ * Request that the kernel sends back a vblank event (see
+ * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when th=
e
+ * page-flip is done.
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
@@ -1034,11 +1053,50 @@ struct drm_mode_destroy_dumb {
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
+ * Do not block while applying the atomic commit. The &DRM_IOCTL_MODE_ATOM=
IC
+ * IOCTL returns immediately instead of waiting for the changes to be appl=
ied
+ * in hardware. Note, the driver will still check that the update can be
+ * applied before retuning.
+ */
 #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
+/**
+ * DRM_MODE_ATOMIC_ALLOW_MODESET
+ *
+ * Allow the update to result in temporary or transient visible artifacts =
while
+ * the update is being applied. Applying the update may also take signific=
antly
+ * more time than a page flip. The visual artifacts will not appear after =
the
+ * update is completed.
+ *
+ * This flag must be set when the KMS update might cause visible artifacts=
.
+ * Without this flag such KMS update will return a EINVAL error. What kind=
 of
+ * update may cause visible artifacts depends on the driver and the hardwa=
re.
+ * User-space that needs to know beforehand if an update might cause visib=
le
+ * artifacts can use &DRM_MODE_ATOMIC_TEST_ONLY without
+ * &DRM_MODE_ATOMIC_ALLOW_MODESET to see if it fails.
+ *
+ * Visual artifacts are guaranteed to not appear when this flag is not set=
.
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


