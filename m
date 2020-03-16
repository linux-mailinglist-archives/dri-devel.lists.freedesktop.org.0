Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E137E18704B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 17:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2745B89DB7;
	Mon, 16 Mar 2020 16:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B44789DB7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 16:43:01 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by andre.telenet-ops.be with bizsmtp
 id F4iy220025USYZQ014iyfh; Mon, 16 Mar 2020 17:42:59 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jDspN-000463-V5; Mon, 16 Mar 2020 17:42:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jDspN-0001dK-Sc; Mon, 16 Mar 2020 17:42:57 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/mipi-dbi: Make mipi_dbi_command_stackbuf() data parameter
 const
Date: Mon, 16 Mar 2020 17:42:49 +0100
Message-Id: <20200316164249.6234-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mipi_dbi_command_stackbuf() copies the passed buffer data, so it can be
const.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 3 ++-
 include/drm/drm_mipi_dbi.h     | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 558baf989f5a8432..89e911ccea06cf99 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -169,7 +169,8 @@ int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len)
 EXPORT_SYMBOL(mipi_dbi_command_buf);
 
 /* This should only be used by mipi_dbi_command() */
-int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len)
+int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, const u8 *data,
+			      size_t len)
 {
 	u8 *buf;
 	int ret;
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 33f325f5af2b921f..9333b9086c30bd3c 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -170,7 +170,8 @@ int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
 
 int mipi_dbi_command_read(struct mipi_dbi *dbi, u8 cmd, u8 *val);
 int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len);
-int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len);
+int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, const u8 *data,
+			      size_t len);
 int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		      struct drm_rect *clip, bool swap);
 /**
@@ -187,7 +188,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
  */
 #define mipi_dbi_command(dbi, cmd, seq...) \
 ({ \
-	u8 d[] = { seq }; \
+	const u8 d[] = { seq }; \
 	mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
 })
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
