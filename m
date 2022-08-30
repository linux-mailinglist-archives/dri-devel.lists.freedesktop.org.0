Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2295A6A87
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254F110E2F4;
	Tue, 30 Aug 2022 17:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D5710E2DF;
 Tue, 30 Aug 2022 17:29:44 +0000 (UTC)
Date: Tue, 30 Aug 2022 17:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661880582; x=1662139782;
 bh=M8NfD2uq58breoK5Hd++cGSYtHWu4nkvuou6UU+ov7A=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=XFumuaGjAffx+txSn2LWGHDuVca3FmPwLe1iaKt+c4z+Xu+xwamgbDvLQT936d5Xu
 4B7ShFC5LmuE0nVvcBo5Ii2oIQsIx37HWH+0IwHnRAnJsnK5Ubgs+VlTsuCnhBqsoA
 q5r9Mz2R/KH5ibGvVe3TBC4fUrkeZyz4w+kV6Y2hVSaEZHwhQWUpMMenSB1CToDru6
 bnsotOa6ZVAZRIRAJ4iqK6Vcc95SW0AZEbitM1dWt+HTP+NSNk4SjCJrMls5UX55Uc
 2zoBzzx0KKNj2GrPISBlOMQbB3Z0uJdgWNgB9tbn5I6D/J9kQY+zQjk6ddVsd4d1DS
 eHBigEiDwOOJw==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 4/6] drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
Message-ID: <20220830172851.269402-5-contact@emersion.fr>
In-Reply-To: <20220830172851.269402-1-contact@emersion.fr>
References: <20220830172851.269402-1-contact@emersion.fr>
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

Signed-off-by: Simon Ser <contact@emersion.fr>
Co-developed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 28 +++++++++++++++++++++++++---
 include/uapi/drm/drm_mode.h       |  4 ++++
 2 files changed, 29 insertions(+), 3 deletions(-)

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
index 86a292c3185a..cce1a1bea645 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -942,6 +942,10 @@ struct hdr_output_metadata {
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
  */
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
--=20
2.37.2


