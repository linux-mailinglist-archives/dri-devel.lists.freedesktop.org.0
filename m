Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6BB153AE4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 23:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A3D6E260;
	Wed,  5 Feb 2020 22:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDC06E262
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 22:23:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 14:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,407,1574150400"; d="scan'208";a="430307341"
Received: from jhli-desk1.jf.intel.com ([10.54.74.161])
 by fmsmga005.fm.intel.com with ESMTP; 05 Feb 2020 14:23:02 -0800
From: Juston Li <juston.li@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 libdrm 2/2] Add drmModeGetFB2
Date: Wed,  5 Feb 2020 14:22:25 -0800
Message-Id: <20200205222225.5015-2-juston.li@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200205222225.5015-1-juston.li@intel.com>
References: <20200205222225.5015-1-juston.li@intel.com>
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
---
 xf86drmMode.c | 33 +++++++++++++++++++++++++++++++++
 xf86drmMode.h | 15 +++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/xf86drmMode.c b/xf86drmMode.c
index 0cf7992c6e9a..2eb7b765cce8 100644
--- a/xf86drmMode.c
+++ b/xf86drmMode.c
@@ -1594,3 +1594,36 @@ drmModeRevokeLease(int fd, uint32_t lessee_id)
 		return 0;
 	return -errno;
 }
+
+drm_public drmModeFB2Ptr
+drmModeGetFB2(int fd, uint32_t fb_id)
+{
+	struct drm_mode_fb_cmd2 get = { .fb_id = fb_id, };
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
