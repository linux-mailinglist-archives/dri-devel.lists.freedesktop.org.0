Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F1B75233A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA92910E6D5;
	Thu, 13 Jul 2023 13:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CE110E6CD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:17:26 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6264:77e5:42e2:477d])
 by laurent.telenet-ops.be with bizsmtp
 id LdHN2A00V3wy6xv01dHNpc; Thu, 13 Jul 2023 15:17:23 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwC3-001Gr1-2r;
 Thu, 13 Jul 2023 15:17:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwCA-00GWyl-PB;
 Thu, 13 Jul 2023 15:17:22 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/8] drm/client: Convert drm_mode_create_dumb() to
 drm_mode_addfb2()
Date: Thu, 13 Jul 2023 15:17:13 +0200
Message-Id: <9090c1b423e0b56c8e906155fe53ff0841830a03.1689252746.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently drm_client_buffer_addfb() uses the legacy drm_mode_addfb(),
which uses bpp and depth to guess the wanted buffer format.
However, drm_client_buffer_addfb() already knows the exact buffer
format, so there is no need to convert back and forth between buffer
format and bpp/depth, and the function can just call drm_mode_addfb2()
directly instead.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/drm_client.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index f6292ba0e6fc3783..de660a25ad7c6f06 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -374,19 +374,16 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
 				   u32 handle)
 {
 	struct drm_client_dev *client = buffer->client;
-	struct drm_mode_fb_cmd fb_req = { };
-	const struct drm_format_info *info;
+	struct drm_mode_fb_cmd2 fb_req = { };
 	int ret;
 
-	info = drm_format_info(format);
-	fb_req.bpp = drm_format_info_bpp(info, 0);
-	fb_req.depth = info->depth;
 	fb_req.width = width;
 	fb_req.height = height;
-	fb_req.handle = handle;
-	fb_req.pitch = buffer->pitch;
+	fb_req.pixel_format = format;
+	fb_req.handles[0] = handle;
+	fb_req.pitches[0] = buffer->pitch;
 
-	ret = drm_mode_addfb(client->dev, &fb_req, client->file);
+	ret = drm_mode_addfb2(client->dev, &fb_req, client->file);
 	if (ret)
 		return ret;
 
-- 
2.34.1

