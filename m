Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5255EFD49
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0566B10EC16;
	Thu, 29 Sep 2022 18:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80AA10EC13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:44:04 +0000 (UTC)
Date: Thu, 29 Sep 2022 18:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664477043; x=1664736243;
 bh=u81DvRmQOuKFxaQOQLsv4Mo6IkbG9f9rdXd+uQfj8Ag=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=RHjo+zx4SC6dMiVOlM0WboQo5cU/uhktRM0QTO04V6o9YNRRRxkW3YASekKewatG0
 6DuCdnw10eoAIRjVXWsw/3G/QJ02lazXh3VJFSiVM+En+J+AAL8fYeQqX7V/3JG8PT
 oUW/ZjJnWcX420hjtU8mAhKjQ/OOBavI/S5Mj5Zft97Uf5IwKgun1uhrDdpRno24kk
 VcYmS0xh8FPWNMgpOEio+qYwMA44KZxfxUkDHGs9ZP5GJYEhROdcjEjvHk7DqQxmJf
 Ii/InhUWnKW3FRZd9wpKPndZSbTmwAPJhFrisBgga7K+cNdkcZ3GyOxAs51cz2STJM
 Qea3oWIF+70jg==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 4/6] drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
Message-ID: <20220929184307.258331-5-contact@emersion.fr>
In-Reply-To: <20220929184307.258331-1-contact@emersion.fr>
References: <20220929184307.258331-1-contact@emersion.fr>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch, mwen@igalia.com,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the driver supports it, allow user-space to supply the
DRM_MODE_PAGE_FLIP_ASYNC flag to request an async page-flip.
Set drm_crtc_state.async_flip accordingly.

Document that drivers will reject atomic commits if an async
flip isn't possible. This allows user-space to fall back to
something else. For instance, Xorg falls back to a blit.
Another option is to wait as close to the next vblank as
possible before performing the page-flip to reduce latency.

v2: document new uAPI

v3: add comment about Intel hardware which needs one last
sync page-flip before being able to switch to async (Ville, Pekka)

Signed-off-by: Simon Ser <contact@emersion.fr>
Co-developed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 28 +++++++++++++++++++++++++---
 include/uapi/drm/drm_mode.h       |  9 +++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 79730fa1dd8e..ee24ed7e2edb 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1278,6 +1278,18 @@ static void complete_signaling(struct drm_device *de=
v,
 =09kfree(fence_state);
 }
=20
+static void
+set_async_flip(struct drm_atomic_state *state)
+{
+=09struct drm_crtc *crtc;
+=09struct drm_crtc_state *crtc_state;
+=09int i;
+
+=09for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+=09=09crtc_state->async_flip =3D true;
+=09}
+}
+
 int drm_mode_atomic_ioctl(struct drm_device *dev,
 =09=09=09  void *data, struct drm_file *file_priv)
 {
@@ -1318,9 +1330,16 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 =09}
=20
 =09if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
-=09=09drm_dbg_atomic(dev,
-=09=09=09       "commit failed: invalid flag DRM_MODE_PAGE_FLIP_ASYNC\n");
-=09=09return -EINVAL;
+=09=09if (!dev->mode_config.async_page_flip) {
+=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\=
n");
+=09=09=09return -EINVAL;
+=09=09}
+=09=09if (dev->mode_config.atomic_async_page_flip_not_supported) {
+=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported =
with atomic\n");
+=09=09=09return -EINVAL;
+=09=09}
 =09}
=20
 =09/* can't test and expect an event at the same time. */
@@ -1418,6 +1437,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 =09if (ret)
 =09=09goto out;
=20
+=09if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC)
+=09=09set_async_flip(state);
+
 =09if (arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) {
 =09=09ret =3D drm_atomic_check_only(state);
 =09} else if (arg->flags & DRM_MODE_ATOMIC_NONBLOCK) {
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 86a292c3185a..b39e78117b18 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -942,6 +942,15 @@ struct hdr_output_metadata {
  * Request that the page-flip is performed as soon as possible, ie. with n=
o
  * delay due to waiting for vblank. This may cause tearing to be visible o=
n
  * the screen.
+ *
+ * When used with atomic uAPI, the driver will return an error if the hard=
ware
+ * doesn't support performing an asynchronous page-flip for this update.
+ * User-space should handle this, e.g. by falling back to a regular page-f=
lip.
+ *
+ * Note, some hardware might need to perform one last synchronous page-fli=
p
+ * before being able to switch to asynchronous page-flips. As an exception=
,
+ * the driver will return success even though that first page-flip is not
+ * asynchronous.
  */
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
--=20
2.37.3


