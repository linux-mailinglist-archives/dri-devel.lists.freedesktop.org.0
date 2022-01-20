Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190F494E31
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 13:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EE910E43B;
	Thu, 20 Jan 2022 12:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6590710E335
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 12:48:32 +0000 (UTC)
Date: Thu, 20 Jan 2022 12:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1642682909;
 bh=nvCOK0Xxl+hjz8dWOxhtYf9QF01jtOdXrnXHJBpYsgU=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
 b=AFQ+bSsiHxzDmsNK/CcZTyLo2haEr+geuOMtq3IrE9OXFd0DSRZv8hPGQpS1xbJi1
 HE4YAlxj2rFIGrtK1DmyhJlsn/CZT/+CKXO2JS1SLVjxQ6/42ZIvz7Pgst42TXtA5V
 X3YEx9mrJIzANAwG00V2k/qwVmioQ8tJwS5JtbCAZl8rR4o3x+GFRkZ3Y8SK1MXMOV
 tGZgp7iR0O+ezwCMNHWRwqs20spP1B2in0eM285yDy++MTyIIgzRTLst4waGQekhp3
 S9sxHjLaVQmLYXW7rFVKfCf6AIkXbLSsIQIJde66LUJj5yZ3P3UgYDFewkyBFH829H
 l4A183Xo28aaQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document struct drm_mode_fb_cmd2
Message-ID: <20220120124416.82202-1-contact@emersion.fr>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow-up for the DRM_IOCTL_MODE_GETFB2 docs.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Stone <daniels@collabora.com>
---
 include/uapi/drm/drm_mode.h | 83 ++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 28 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index e1e351682872..5dbbe1393bff 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -663,41 +663,68 @@ struct drm_mode_fb_cmd {
 #define DRM_MODE_FB_INTERLACED=09(1<<0) /* for interlaced framebuffers */
 #define DRM_MODE_FB_MODIFIERS=09(1<<1) /* enables ->modifer[] */
=20
+/**
+ * struct drm_mode_fb_cmd2 - Frame-buffer metadata.
+ *
+ * This struct holds frame-buffer metadata. There are two ways to use it:
+ *
+ * - User-space can fill this struct and perform an &DRM_IOCTL_MODE_ADDFB2
+ *   ioctl to register a new frame-buffer. The new frame-buffer object ID =
will
+ *   be set by the kernel in @fb_id.
+ * - User-space can set @fb_id and perform a &DRM_IOCTL_MODE_GETFB2 ioctl =
to
+ *   fetch metadata about an existing frame-buffer.
+ *
+ * In case of planar formats, this struct allows up to 4 buffer objects wi=
th
+ * offsets and pitches per plane. The pitch and offset order is dictated b=
y the
+ * fourcc, e.g. NV12 (https://fourcc.org/yuv.php#NV12) is described as:
+ *
+ *     YUV 4:2:0 image with a plane of 8 bit Y samples followed by an
+ *     interleaved U/V plane containing 8 bit 2x2 subsampled colour differ=
ence
+ *     samples.
+ *
+ * So it would consist of Y as ``offsets[0]`` and UV as ``offsets[1]``. No=
te
+ * that ``offsets[0]`` will generally be 0 (but this is not required).
+ *
+ * To accommodate tiled, compressed, etc formats, a modifier can be specif=
ied.
+ * For more information see the "Format Modifiers" section. Note that even
+ * though it looks like we have a modifier per-plane, we in fact do not. T=
he
+ * modifier for each plane must be identical. Thus all combinations of
+ * different data layouts for multi-plane formats must be enumerated as
+ * separate modifiers.
+ */
 struct drm_mode_fb_cmd2 {
+=09/** @fb_id: Object ID of the frame-buffer. */
 =09__u32 fb_id;
+=09/** @width: Width of the frame-buffer. */
 =09__u32 width;
+=09/** @height: Height of the frame-buffer. */
 =09__u32 height;
-=09__u32 pixel_format; /* fourcc code from drm_fourcc.h */
-=09__u32 flags; /* see above flags */
+=09/**
+=09 * @pixel_format: FourCC format code, see ``DRM_FORMAT_*`` constants in
+=09 * ``drm_fourcc.h``.
+=09 */
+=09__u32 pixel_format;
+=09/**
+=09 * @flags: Frame-buffer flags (see &DRM_MODE_FB_INTERLACED and
+=09 * &DRM_MODE_FB_MODIFIERS).
+=09 */
+=09__u32 flags;
=20
-=09/*
-=09 * In case of planar formats, this ioctl allows up to 4
-=09 * buffer objects with offsets and pitches per plane.
-=09 * The pitch and offset order is dictated by the fourcc,
-=09 * e.g. NV12 (https://fourcc.org/yuv.php#NV12) is described as:
-=09 *
-=09 *   YUV 4:2:0 image with a plane of 8 bit Y samples
-=09 *   followed by an interleaved U/V plane containing
-=09 *   8 bit 2x2 subsampled colour difference samples.
-=09 *
-=09 * So it would consist of Y as offsets[0] and UV as
-=09 * offsets[1].  Note that offsets[0] will generally
-=09 * be 0 (but this is not required).
-=09 *
-=09 * To accommodate tiled, compressed, etc formats, a
-=09 * modifier can be specified.  The default value of zero
-=09 * indicates "native" format as specified by the fourcc.
-=09 * Vendor specific modifier token.  Note that even though
-=09 * it looks like we have a modifier per-plane, we in fact
-=09 * do not. The modifier for each plane must be identical.
-=09 * Thus all combinations of different data layouts for
-=09 * multi plane formats must be enumerated as separate
-=09 * modifiers.
+=09/**
+=09 * @handles: GEM buffer handle, one per plane. Set to 0 if the plane is
+=09 * unused.
 =09 */
 =09__u32 handles[4];
-=09__u32 pitches[4]; /* pitch for each plane */
-=09__u32 offsets[4]; /* offset of each plane */
-=09__u64 modifier[4]; /* ie, tiling, compress */
+=09/** @pitches: Pitch (aka. stride), one per plane. */
+=09__u32 pitches[4];
+=09/** @offsets: Offset into the buffer, one per plane. */
+=09__u32 offsets[4];
+=09/**
+=09 * @modifier: Format modifier, one per plane. See ``DRM_FORMAT_MOD_*``
+=09 * constants in ``drm_fourcc.h``. All planes must use the same
+=09 * modifier. Ignored unless &DRM_MODE_FB_MODIFIERS is set in @flags.
+=09 */
+=09__u64 modifier[4];
 };
=20
 #define DRM_MODE_FB_DIRTY_ANNOTATE_COPY 0x01

base-commit: 37e0321ab2569b44f8a94339bf47653493ac864e
--=20
2.34.1


