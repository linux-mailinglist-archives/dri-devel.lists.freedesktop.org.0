Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9044D08CF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350A210E216;
	Mon,  7 Mar 2022 20:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E1510E216
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:52:56 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by xavier.telenet-ops.be with bizsmtp
 id 3Ysq2700J1Yj8bA01Ysq8m; Mon, 07 Mar 2022 21:52:54 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKLY-0036Qf-Bk; Mon, 07 Mar 2022 21:52:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKLX-0034hT-Tz; Mon, 07 Mar 2022 21:52:47 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 03/10] drm/client: Use actual bpp when allocating frame
 buffers
Date: Mon,  7 Mar 2022 21:52:38 +0100
Message-Id: <8f29a983d42d9d68bd8cae2f9481d3c139f8750a.1646683502.git.geert@linux-m68k.org>
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

When allocating a frame buffer, the number of bits per pixel needed is
derived from the deprecated drm_format_info.cpp[] field.  While this
works for formats using less than 8 bits per pixel, it does lead to a
large overallocation.

Reduce memory consumption by using the actual number of bits per pixel
instead.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
v2:
  - Add Acked-by.
---
 drivers/gpu/drm/drm_client.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index ce45e380f4a2028f..c6a279e3de95591a 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -264,7 +264,7 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
 
 	dumb_args.width = width;
 	dumb_args.height = height;
-	dumb_args.bpp = info->cpp[0] * 8;
+	dumb_args.bpp = drm_format_info_bpp(info, 0);
 	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
 	if (ret)
 		goto err_delete;
@@ -372,7 +372,7 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
 	int ret;
 
 	info = drm_format_info(format);
-	fb_req.bpp = info->cpp[0] * 8;
+	fb_req.bpp = drm_format_info_bpp(info, 0);
 	fb_req.depth = info->depth;
 	fb_req.width = width;
 	fb_req.height = height;
-- 
2.25.1

