Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD2C5ED957
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902A110E3A1;
	Wed, 28 Sep 2022 09:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF02710E3A1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 09:42:10 +0000 (UTC)
Date: Wed, 28 Sep 2022 09:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664358128; x=1664617328;
 bh=Zmr9sIX4L0m6oVidTFPh2AFyDk2tF/CySCn1DZ/ep+M=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=Q+hNdzlwpofv1yRQKQVw1uh6RAQ8MqNaVOu8ygCfvigBhISEUYoR+BOgbD80bo6+N
 08DE0RZyoemTr6ZeZIgRZpUTQhM6FqlgXgsKp5WpUPxx535+hawOlMtjzhLQFKCFf9
 ieUPQHRnCFViB0uvf7mjCpV2p42yurmNJW0eEBF5qeZuFvk4uVYfoyAICXMSV48NmF
 pORcsXydDe+eYXxK+cnfb2roRwG2tJK5wXk+hcIB8oW2b/6BExpjcmRK37hMPufot+
 v3//ODJ+QBH/2yIyaJjHOg/6dFqADHxzrydcYkh3grsl3YaefjWKEcHnIyC7a1Ueca
 W4S5hTJWv0jnA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3] drm: document uAPI page-flip flags
Message-ID: <20220928094149.118943-1-contact@emersion.fr>
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
 Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document flags accepted by the page-flip and atomic IOCTLs.

v2 (Pekka):
- Mention DRM_EVENT_FLIP_COMPLETE in DRM_MODE_PAGE_FLIP_EVENT docs.
- Expand DRM_MODE_ATOMIC_NONBLOCK and DRM_MODE_ATOMIC_ALLOW_MODESET
  description.
v3:
- Fix struct field ref syntax (Daniel)
- Clarify when artifacts are no longer displayed (Daniel)
- Add note about sinks deciding to show artifacts on their own (Pekka, Dani=
el)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 include/uapi/drm/drm_mode.h | 63 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index fa953309d9ce..9b10327b9d21 100644
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
@@ -1034,11 +1053,53 @@ struct drm_mode_destroy_dumb {
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
+ * See &drm_mode_config_funcs.atomic_check for more details on test-only
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
+ * more time than a page flip. All visual artifacts will disappear by the =
time
+ * the update is completed, as signalled throught the vblank event's times=
tamp
+ * (see struct drm_event_vblank).
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
+ * To the best of the driver's knowledge, visual artifacts are guaranteed =
to
+ * not appear when this flag is not set. Some sinks might display visual
+ * artifacts outside of the driver's control.
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
2.37.3


