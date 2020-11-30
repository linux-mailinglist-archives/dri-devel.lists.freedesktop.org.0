Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAFF2C83C8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81C689DB2;
	Mon, 30 Nov 2020 12:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DFE89D66
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:04:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E84BFAE6D;
 Mon, 30 Nov 2020 12:04:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Subject: [PATCH 4/8] drm/ast: Use drm_gem_vram_vmap_unlocked() in
 ast_cursor_show()
Date: Mon, 30 Nov 2020 13:04:29 +0100
Message-Id: <20201130120433.7205-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>
References: <20201130120433.7205-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change avoids to pin the source BO when showing the cursor, and
instead acquires the BO's reservation lock. Prevents concurrent access
during the buffer update.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index c5892827b220..7a56838fb703 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -254,8 +254,8 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 	u8 jreg;
 	int ret;
 
-	ret = drm_gem_vram_vmap(gbo, &map);
-	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret))
+	ret = drm_gem_vram_vmap_unlocked(gbo, &map, NULL);
+	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap_unlocked() failed, ret=%d\n", ret))
 		return;
 	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
@@ -263,7 +263,7 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 	writel(x, sig + AST_HWC_SIGNATURE_X);
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
-	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_vunmap_unlocked(gbo, &map);
 
 	if (x < 0) {
 		x_offset = (-x) + offset_x;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
