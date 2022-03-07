Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95C4D08DF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A21B10E24E;
	Mon,  7 Mar 2022 20:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E53110E24E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:53:34 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by laurent.telenet-ops.be with bizsmtp
 id 3YtW2700C1Yj8bA01YtW0X; Mon, 07 Mar 2022 21:53:34 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKLZ-0036Qg-DF; Mon, 07 Mar 2022 21:52:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKLX-0034ha-Uq; Mon, 07 Mar 2022 21:52:47 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 04/10] drm/framebuffer: Use actual bpp for
 DRM_IOCTL_MODE_GETFB
Date: Mon,  7 Mar 2022 21:52:39 +0100
Message-Id: <d87068fd1e2cc6f772a64ba9306350a31baeae58.1646683502.git.geert@linux-m68k.org>
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

When userspace queries the properties of a frame buffer, the number of
bits per pixel is derived from the deprecated drm_format_info.cpp[]
field, which does not take into account block sizes.

Fix this by using the actual number of bits per pixel instead.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - No changes.
---
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 07f5abc875e97b96..4b9d7b01cb99c03d 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -530,7 +530,7 @@ int drm_mode_getfb(struct drm_device *dev,
 	r->height = fb->height;
 	r->width = fb->width;
 	r->depth = fb->format->depth;
-	r->bpp = fb->format->cpp[0] * 8;
+	r->bpp = drm_format_info_bpp(fb->format, 0);
 	r->pitch = fb->pitches[0];
 
 	/* GET_FB() is an unprivileged ioctl so we must not return a
-- 
2.25.1

