Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8D669B0B8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 17:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD97610F061;
	Fri, 17 Feb 2023 16:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC5A10F05D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 16:22:13 +0000 (UTC)
Date: Fri, 17 Feb 2023 16:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676650931; x=1676910131;
 bh=IFxSjriDiCm3kl6CFlRpFbn/XjBsK6G8evlhpoG6FbE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=P0GFp+KHVJC5BXEJVnqEK6BaWg5Yi/0ASnGMx0oVQaKSf3R1/XElXORTZOAJ4j9HO
 +uO1c3Hfz31W45TnYvz4ye5GV/kHRVPepTxqY9p/2q3lo/dxl9zE6/yB6hJfX9U3MX
 NrZ70ya+A5hjhJu4iQXaEVMi6WSsNwzQkOB6UfrmspezEHDyD1u2jv7xtV/LctID6b
 UpXVtnEEgB3oFDJxlPOpHV8FoDIgUKcFZgyyxLBt1Ca2fwBoeFiMN/YVfj0EowfXZN
 I9q4cVgDb4FAVN00uGuE4egg6xviWV1FqZobXi5u6s17OxQQLLtOYTo+YeFYQRnlAQ
 7voWiyrvIXy9Q==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 2/2] drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and
 PRIME_FD_TO_HANDLE
Message-ID: <20230217162151.59996-2-contact@emersion.fr>
In-Reply-To: <20230217162151.59996-1-contact@emersion.fr>
References: <20230217162151.59996-1-contact@emersion.fr>
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

v2: mention caps, note that the IOCTLs might fail, document that
user-space needs a data structure to keep track of the
handles (Daniel V.)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Daniel Stone <daniel@fooishbar.org>
---
 include/uapi/drm/drm.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 292e4778a2f4..a87bbbbca2d4 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1025,7 +1025,37 @@ extern "C" {
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
+ *
+ * The export can fail for any driver-specific reason, e.g. because export=
 is
+ * not supported for this specific GEM handle (but might be for others).
+ *
+ * Support for exporting DMA-BUFs is advertised via &DRM_PRIME_CAP_EXPORT.
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
+ * that GEM handle is returned. Therefore user-space which needs to handle
+ * arbitrary DMA-BUFs must have a user-space lookup data structure to manu=
ally
+ * reference-count duplicated GEM handles. For more information see
+ * &DRM_IOCTL_GEM_CLOSE.
+ *
+ * The import can fail for any driver-specific reason, e.g. because import=
 is
+ * only supported for DMA-BUFs allocated on this DRM device.
+ *
+ * Support for importing DMA-BUFs is advertised via &DRM_PRIME_CAP_IMPORT.
+ */
 #define DRM_IOCTL_PRIME_FD_TO_HANDLE    DRM_IOWR(0x2e, struct drm_prime_ha=
ndle)
=20
 #define DRM_IOCTL_AGP_ACQUIRE=09=09DRM_IO(  0x30)
--=20
2.39.2


