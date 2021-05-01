Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D7E3708DF
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 22:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB226E1B5;
	Sat,  1 May 2021 20:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CDB6E1B5
 for <dri-devel@lists.freedesktop.org>; Sat,  1 May 2021 20:01:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 5FA761F42C4E
Received: by earth.universe (Postfix, from userid 1000)
 id B252E3C0C96; Sat,  1 May 2021 22:01:15 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCHv1] drm/omap: get fbdev working for manually updated display
Date: Sat,  1 May 2021 22:00:50 +0200
Message-Id: <20210501200050.410704-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Running a legacy application, which directly uses /dev/fb0
currently results in display not being refreshed when the
application mmaps the memory instead of calling write().

Deferred IO support will also schedule dirty_work with the
damage collected from the mmap page writes and thus gets
some more legacy applications working.

Delay frequency settings have been taken over from
drm_fb_helper_generic_probe().

Reported-by: Carl Philipp Klemm <philipp@uvos.xyz>
Tested-by: Carl Philipp Klemm <philipp@uvos.xyz>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Hi,

I still need to fix my Droid 4, so I only compile tested this
myself.

-- Sebastian
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 42eac6ad12bd..fc3897d2d7cc 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -87,6 +87,11 @@ static const struct fb_ops omap_fb_ops = {
 	.fb_imageblit = drm_fb_helper_sys_imageblit,
 };
 
+static struct fb_deferred_io omap_fb_defio = {
+	.delay		= HZ / 20,
+	.deferred_io	= drm_fb_helper_deferred_io,
+};
+
 static int omap_fbdev_create(struct drm_fb_helper *helper,
 		struct drm_fb_helper_surface_size *sizes)
 {
@@ -176,6 +181,9 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 
 	drm_fb_helper_fill_info(fbi, helper, sizes);
 
+	fbi->fbdefio = &omap_fb_defio;
+	fb_deferred_io_init(fbi);
+
 	dev->mode_config.fb_base = dma_addr;
 
 	fbi->screen_buffer = omap_gem_vaddr(fbdev->bo);

base-commit: 152d32aa846835987966fd20ee1143b0e05036a0
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
