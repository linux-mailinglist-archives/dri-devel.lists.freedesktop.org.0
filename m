Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CC04D08D3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF18410E21B;
	Mon,  7 Mar 2022 20:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4AF10E232
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:53:13 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by andre.telenet-ops.be with bizsmtp
 id 3Yt92700L1Yj8bA01Yt9xl; Mon, 07 Mar 2022 21:53:12 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKLY-0036Qj-JD; Mon, 07 Mar 2022 21:52:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKLY-0034hv-1V; Mon, 07 Mar 2022 21:52:48 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 RFC 07/10] drm/gem-fb-helper: Use actual bpp for size
 calculations
Date: Mon,  7 Mar 2022 21:52:42 +0100
Message-Id: <842ab0a286ff743b625277e655d9bef505b630c1.1646683502.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646683502.git.geert@linux-m68k.org>
References: <cover.1646683502.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The AFBC helpers derive the number of bits per pixel from the deprecated
drm_format_info.cpp[] field, which does not take into account block
sizes.

Fix this by using the actual number of bits per pixel instead.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
RFC, as this code path was untested.

v2:
  - Replace FIXME by TODO comment.
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 746fd8c738451247..e5b8443378d2294b 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -492,6 +492,8 @@ void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_directi
 }
 EXPORT_SYMBOL(drm_gem_fb_end_cpu_access);
 
+// TODO Drop this function and replace by drm_format_info_bpp() once all
+// DRM_FORMAT_* provide proper block info in drivers/gpu/drm/drm_fourcc.c
 static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
 				  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
@@ -499,11 +501,6 @@ static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
 
 	info = drm_get_format_info(dev, mode_cmd);
 
-	/* use whatever a driver has set */
-	if (info->cpp[0])
-		return info->cpp[0] * 8;
-
-	/* guess otherwise */
 	switch (info->format) {
 	case DRM_FORMAT_YUV420_8BIT:
 		return 12;
@@ -512,11 +509,8 @@ static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
 	case DRM_FORMAT_VUY101010:
 		return 30;
 	default:
-		break;
+		return drm_format_info_bpp(info, 0);
 	}
-
-	/* all attempts failed */
-	return 0;
 }
 
 static int drm_gem_afbc_min_size(struct drm_device *dev,
-- 
2.25.1

