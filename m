Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0F4699539
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 14:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7832510ED62;
	Thu, 16 Feb 2023 13:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AE810ED62
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:09:53 +0000 (UTC)
Date: Thu, 16 Feb 2023 13:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676552991; x=1676812191;
 bh=wF5yMg92jCvKyqlDfIs7N1AUSnqz4rID4c1lgvA3qoM=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=fuiQhxqXOvL6URoEl01RgTLYpoQ9KekLU9OOrr9vpNy18Dqf9casvMW8ytcYkUk2s
 1q0nc4vlbzk/traAPYj87TkMfQ+i5qznkyEmHOZHMCM9g06ooxEpVWwX8LZ6sS6ZVH
 6lhGPx4aFCIhD8o9/fFsiSW/vkGPxNwCUvMcYjAEbxmFmKcn+66e2elPz/rNmcs/41
 OgqtVJR8lSinjwENWFkm+1l19w0JARttW25B6ijUcI8cVjWIqPw6H/GDKIavchWDR6
 Y/fyWxfzVTDPyH7qcfn0mxENqujlgrOd5a+JqDqGx+nXW3aBUJLlJ71LZEVgzInCr/
 9saQQUYH7QmuA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/2] drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and
 PRIME_FD_TO_HANDLE
Message-ID: <20230216130934.156541-1-contact@emersion.fr>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Daniel Stone <daniel@fooishbar.org>
---
 include/uapi/drm/drm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 4cb956a52aee..54b2313c8332 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1012,7 +1012,24 @@ extern "C" {
 #define DRM_IOCTL_UNLOCK=09=09DRM_IOW( 0x2b, struct drm_lock)
 #define DRM_IOCTL_FINISH=09=09DRM_IOW( 0x2c, struct drm_lock)
=20
+/**
+ * DRM_IOCTL_PRIME_HANDLE_TO_FD - Convert a GEM handle to a DMA-BUF FD.
+ *
+ * User-space sets &drm_prime_handle.handle with the GEM handle to export =
and
+ * &drm_prime_handle.flags, and gets back a DMA-BUF file descriptor in
+ * &drm_prime_handle.fd.
+ */
 #define DRM_IOCTL_PRIME_HANDLE_TO_FD    DRM_IOWR(0x2d, struct drm_prime_ha=
ndle)
+/**
+ * DRM_IOCTL_PRIME_FD_TO_HANDLE - Convert a DMA-BUF FD to a GEM handle.
+ *
+ * User-space sets &drm_prime_handle.fd with a DMA-BUF file descriptor to
+ * import, and gets back a GEM handle in &drm_prime_handle.handle.
+ * &drm_prime_handle.flags is unused.
+ *
+ * If an existing GEM handle refers to the memory object backing the DMA-B=
UF,
+ * that GEM handle is returned.
+ */
 #define DRM_IOCTL_PRIME_FD_TO_HANDLE    DRM_IOWR(0x2e, struct drm_prime_ha=
ndle)
=20
 #define DRM_IOCTL_AGP_ACQUIRE=09=09DRM_IO(  0x30)
--=20
2.39.1


