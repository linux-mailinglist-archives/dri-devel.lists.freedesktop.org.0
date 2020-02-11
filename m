Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B82159A6B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 21:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF026E2BD;
	Tue, 11 Feb 2020 20:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AAB6E2BD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 20:19:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 12:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="251667339"
Received: from jhli-desk1.jf.intel.com ([10.54.74.178])
 by orsmga002.jf.intel.com with ESMTP; 11 Feb 2020 12:19:33 -0800
From: Juston Li <juston.li@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 libdrm 2/2] Add drmModeGetFB2
Date: Tue, 11 Feb 2020 12:19:16 -0800
Message-Id: <20200211201916.3734-2-juston.li@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200211201916.3734-1-juston.li@intel.com>
References: <20200211201916.3734-1-juston.li@intel.com>
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
Cc: daniel.vetter@ffwll.ch, eric@engestrom.ch, Juston Li <juston.li@intel.com>,
 daniels@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Stone <daniels@collabora.com>

Add a wrapper around the getfb2 ioctl, which returns extended
framebuffer information mirroring addfb2, including multiple planes and
modifiers.

Changes since v7:
 - add new symbols to core-symbol.txt (Eric Engestrom)

Changes since v5:
 - style change

Changes since v4:
 - Set fb_id at init instead of memclear() and set (Eric Engestrom)

Changes since v3:
 - remove unnecessary null check in drmModeFreeFB2 (Daniel Stone)

Changes since v2:
 - getfb2 ioctl has been merged upstream
 - sync include/drm/drm.h in a seperate patch

Changes since v1:
 - functions should be drm_public
 - modifier should be 64 bits
 - update ioctl number

Signed-off-by: Juston Li <juston.li@intel.com>
Signed-off-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Eric Engestrom <eric@engestrom.ch>
---
 core-symbols.txt |  2 ++
 xf86drmMode.c    | 35 +++++++++++++++++++++++++++++++++++
 xf86drmMode.h    | 15 +++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/core-symbols.txt b/core-symbols.txt
index a62e01a069d3..1ff4ecaaf6ab 100644
--- a/core-symbols.txt
+++ b/core-symbols.txt
@@ -112,6 +112,7 @@ drmModeFreeConnector
 drmModeFreeCrtc
 drmModeFreeEncoder
 drmModeFreeFB
+drmModeFreeFB2
 drmModeFreeModeInfo
 drmModeFreeObjectProperties
 drmModeFreePlane
@@ -124,6 +125,7 @@ drmModeGetConnectorCurrent
 drmModeGetCrtc
 drmModeGetEncoder
 drmModeGetFB
+drmModeGetFB2
 drmModeGetLease
 drmModeGetPlane
 drmModeGetPlaneResources
diff --git a/xf86drmMode.c b/xf86drmMode.c
index 0cf7992c6e9a..2399e8ecea6f 100644
--- a/xf86drmMode.c
+++ b/xf86drmMode.c
@@ -1594,3 +1594,38 @@ drmModeRevokeLease(int fd, uint32_t lessee_id)
 		return 0;
 	return -errno;
 }
+
+drm_public drmModeFB2Ptr
+drmModeGetFB2(int fd, uint32_t fb_id)
+{
+	struct drm_mode_fb_cmd2 get = {
+		.fb_id = fb_id,
+	};
+	drmModeFB2Ptr ret;
+	int err;
+
+	err = DRM_IOCTL(fd, DRM_IOCTL_MODE_GETFB2, &get);
+	if (err != 0)
+		return NULL;
+
+	ret = drmMalloc(sizeof(drmModeFB2));
+	if (!ret)
+		return NULL;
+
+	ret->fb_id = fb_id;
+	ret->width = get.width;
+	ret->height = get.height;
+	ret->pixel_format = get.pixel_format;
+	ret->flags = get.flags;
+	ret->modifier = get.modifier[0];
+	memcpy(ret->handles, get.handles, sizeof(uint32_t) * 4);
+	memcpy(ret->pitches, get.pitches, sizeof(uint32_t) * 4);
+	memcpy(ret->offsets, get.offsets, sizeof(uint32_t) * 4);
+
+	return ret;
+}
+
+drm_public void drmModeFreeFB2(drmModeFB2Ptr ptr)
+{
+	drmFree(ptr);
+}
diff --git a/xf86drmMode.h b/xf86drmMode.h
index 159a39937240..fc0bbd8dcb67 100644
--- a/xf86drmMode.h
+++ b/xf86drmMode.h
@@ -225,6 +225,19 @@ typedef struct _drmModeFB {
 	uint32_t handle;
 } drmModeFB, *drmModeFBPtr;
 
+typedef struct _drmModeFB2 {
+	uint32_t fb_id;
+	uint32_t width, height;
+	uint32_t pixel_format; /* fourcc code from drm_fourcc.h */
+	uint64_t modifier; /* applies to all buffers */
+	uint32_t flags;
+
+	/* per-plane GEM handle; may be duplicate entries for multiple planes */
+	uint32_t handles[4];
+	uint32_t pitches[4]; /* bytes */
+	uint32_t offsets[4]; /* bytes */
+} drmModeFB2, *drmModeFB2Ptr;
+
 typedef struct drm_clip_rect drmModeClip, *drmModeClipPtr;
 
 typedef struct _drmModePropertyBlob {
@@ -343,6 +356,7 @@ typedef struct _drmModePlaneRes {
 extern void drmModeFreeModeInfo( drmModeModeInfoPtr ptr );
 extern void drmModeFreeResources( drmModeResPtr ptr );
 extern void drmModeFreeFB( drmModeFBPtr ptr );
+extern void drmModeFreeFB2( drmModeFB2Ptr ptr );
 extern void drmModeFreeCrtc( drmModeCrtcPtr ptr );
 extern void drmModeFreeConnector( drmModeConnectorPtr ptr );
 extern void drmModeFreeEncoder( drmModeEncoderPtr ptr );
@@ -362,6 +376,7 @@ extern drmModeResPtr drmModeGetResources(int fd);
  * Retrieve information about framebuffer bufferId
  */
 extern drmModeFBPtr drmModeGetFB(int fd, uint32_t bufferId);
+extern drmModeFB2Ptr drmModeGetFB2(int fd, uint32_t bufferId);
 
 /**
  * Creates a new framebuffer with an buffer object as its scanout buffer.
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
