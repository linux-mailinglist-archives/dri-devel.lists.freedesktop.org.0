Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958777873A8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB77410E585;
	Thu, 24 Aug 2023 15:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFE810E586
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:08:55 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3c6b:f703:5ab5:f36d])
 by michel.telenet-ops.be with bizsmtp
 id dT8t2A00701sfPQ06T8tSB; Thu, 24 Aug 2023 17:08:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qZBwx-001dh9-Ep;
 Thu, 24 Aug 2023 17:08:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qZBx7-000Vyn-44;
 Thu, 24 Aug 2023 17:08:53 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/8] drm/ssd130x: Fix screen clearing
Date: Thu, 24 Aug 2023 17:08:40 +0200
Message-Id: <c19cd5a57205597bb38a446c3871092993498f01.1692888745.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692888745.git.geert@linux-m68k.org>
References: <cover.1692888745.git.geert@linux-m68k.org>
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

Due to the reuse of buffers, ssd130x_clear_screen() no longers clears
the screen, but merely redraws the last image that is residing in the
intermediate buffer.

As there is no point in clearing the intermediate buffer and transposing
an all-black image, fix this by just clearing the HW format buffer, and
writing it to the panel.

Fixes: 49d7d581ceaf4cf8 ("drm/ssd130x: Don't allocate buffers on each plane update")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
ssd130x_clear_screen() is only called from
ssd130x_primary_plane_helper_atomic_disable(), but this never happens on
my system.

Tested by adding some extra calls to ssd130x_clear_screen() at regular
intervals.

v2:
  - New.
---
 drivers/gpu/drm/solomon/ssd130x.c | 47 +++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 5a80b228d18cae33..78272b1f9d5b167f 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -553,14 +553,45 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 static void ssd130x_clear_screen(struct ssd130x_device *ssd130x,
 				 struct ssd130x_plane_state *ssd130x_state)
 {
-	struct drm_rect fullscreen = {
-		.x1 = 0,
-		.x2 = ssd130x->width,
-		.y1 = 0,
-		.y2 = ssd130x->height,
-	};
-
-	ssd130x_update_rect(ssd130x, ssd130x_state, &fullscreen);
+	unsigned int page_height = ssd130x->device_info->page_height;
+	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	u8 *data_array = ssd130x_state->data_array;
+	unsigned int width = ssd130x->width;
+	int ret, i;
+
+	if (!ssd130x->page_address_mode) {
+		memset(data_array, 0, width * pages);
+
+		/* Set address range for horizontal addressing mode */
+		ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset, width);
+		if (ret < 0)
+			return;
+
+		ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset, pages);
+		if (ret < 0)
+			return;
+
+		/* Write out update in one go if we aren't using page addressing mode */
+		ssd130x_write_data(ssd130x, data_array, width * pages);
+	} else {
+		/*
+		 * In page addressing mode, the start address needs to be reset,
+		 * and each page then needs to be written out separately.
+		 */
+		memset(data_array, 0, width);
+
+		for (i = 0; i < pages; i++) {
+			ret = ssd130x_set_page_pos(ssd130x,
+						   ssd130x->page_offset + i,
+						   ssd130x->col_offset);
+			if (ret < 0)
+				return;
+
+			ret = ssd130x_write_data(ssd130x, data_array, width);
+			if (ret < 0)
+				return;
+		}
+	}
 }
 
 static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
-- 
2.34.1

