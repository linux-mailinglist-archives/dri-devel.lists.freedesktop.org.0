Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72ED907C46
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E04D10EB80;
	Thu, 13 Jun 2024 19:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D5410EB7A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:18:10 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4W0XHh4sNCz4x1qn
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:18:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
 by laurent.telenet-ops.be with bizsmtp
 id b7J62C0073w30qz017J6YW; Thu, 13 Jun 2024 21:18:08 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHpwS-00Ax6j-CJ;
 Thu, 13 Jun 2024 21:18:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHpxW-00FL8T-CT;
 Thu, 13 Jun 2024 21:18:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/7] drm/panic: Fix uninitialized
 drm_scanout_buffer.set_pixel() crash
Date: Thu, 13 Jun 2024 21:17:59 +0200
Message-Id: <4c250d21880ca0b97e41da7b6a101bdf07e9d015.1718305355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718305355.git.geert+renesas@glider.be>
References: <cover.1718305355.git.geert+renesas@glider.be>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No implementations of drm_plane_helper_funcs.get_scanout_buffer() fill
in the optional drm_scanout_buffer.set_pixel() member.  Hence the member
may contain non-zero garbage, causing a crash when deferencing it during
drm panic.

Fix this by pre-initializing the drm_scanout_buffer object before
calling drm_plane_helper_funcs.get_scanout_buffer().

Fixes: 24d07f114e4ec760 ("drm/panic: Add a set_pixel() callback to drm_scanout_buffer")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 293d4dcbc80da7ba..fc04ed4e0b399f55 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -582,7 +582,7 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
 
 static void draw_panic_plane(struct drm_plane *plane)
 {
-	struct drm_scanout_buffer sb;
+	struct drm_scanout_buffer sb = { };
 	int ret;
 	unsigned long flags;
 
-- 
2.34.1

