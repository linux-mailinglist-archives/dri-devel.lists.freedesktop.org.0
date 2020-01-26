Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D2149F9E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6986EA2A;
	Mon, 27 Jan 2020 08:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs58.siol.net [185.57.226.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306F26E94C
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 06:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 9F43E522717;
 Sun, 26 Jan 2020 07:59:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id L66nzIyDXhLa; Sun, 26 Jan 2020 07:59:48 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 57D7F522718;
 Sun, 26 Jan 2020 07:59:48 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 6298F522717;
 Sun, 26 Jan 2020 07:59:46 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org,
	paul.kocialkowski@bootlin.com
Subject: [PATCH] Revert "drm/sun4i: drv: Allow framebuffer modifiers in mode
 config"
Date: Sun, 26 Jan 2020 07:59:37 +0100
Message-Id: <20200126065937.9564-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 9db9c0cf5895e4ddde2814360cae7bea9282edd2.

Setting mode_config.allow_fb_modifiers manually is completely
unnecessary. It is set automatically by drm_universal_plane_init() based
on the fact if modifier list is provided or not. Even more, it breaks
DE2 and DE3 as they don't support any modifiers beside linear. Modifiers
aware applications can be confused by provided empty modifier list - at
least linear modifier should be included, but it's not for DE2 and DE3.

Fixes: 9db9c0cf5895 ("drm/sun4i: drv: Allow framebuffer modifiers in mode config")
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 5ae67d526b1d..328272ff77d8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -85,7 +85,6 @@ static int sun4i_drv_bind(struct device *dev)
 	}
 
 	drm_mode_config_init(drm);
-	drm->mode_config.allow_fb_modifiers = true;
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret) {
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
