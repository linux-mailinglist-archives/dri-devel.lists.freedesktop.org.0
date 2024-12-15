Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A08A9F2666
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6FA10E079;
	Sun, 15 Dec 2024 22:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="n0zL26eG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 747 seconds by postgrey-1.36 at gabe;
 Sun, 15 Dec 2024 22:00:22 UTC
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CB310E079
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=j25qHSApzncyRr3fV7n8eHJV1JPDpKKPKVP7ZGcHdZE=; b=n0zL26eGyIFWHeWs
 Nzie2G75r64ALTSe/EIglaUawMZ9iQfVzz6G0tbnvkoKJWosuvPgNx8X4oL0HTbNC2ouRQ9HYwCq7
 5+GQbtIPXjKkPP6eJcXYokAvuOcJZ/6uMqG3u4RByOkjb8FHqQ+8ON9/ncZrBxmJ9YY9nfLjRFVx9
 xXlhaPlu48KDpdPJi3QBZMCziAtgkXyc45gyXq/KygNP0TM7KgV+/hkYvg/dThu1t0YvZwoaxnpT0
 Q8Kx33FSH2fKUGhVMC46p9nvaCBcA4HJdKTLD0Dt1QjfhG/mNLyzg2qEgLPpJDVza2knj4fihWd3a
 5ef6yaeYT8LcOTWn5g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tMwes-005V34-2K;
 Sun, 15 Dec 2024 22:00:14 +0000
From: linux@treblig.org
To: hdegoede@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/vboxvideo: Remove unused hgsmi_cursor_position
Date: Sun, 15 Dec 2024 22:00:14 +0000
Message-ID: <20241215220014.452537-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

hgsmi_cursor_position() has been unused since 2018's
commit 35f3288c453e ("staging: vboxvideo: Atomic phase 1: convert cursor to
universal plane")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/vboxvideo/hgsmi_base.c      | 37 ---------------------
 drivers/gpu/drm/vboxvideo/vboxvideo_guest.h |  2 --
 2 files changed, 39 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/hgsmi_base.c b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
index 87dccaecc3e5..db994aeaa0f9 100644
--- a/drivers/gpu/drm/vboxvideo/hgsmi_base.c
+++ b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
@@ -181,40 +181,3 @@ int hgsmi_update_pointer_shape(struct gen_pool *ctx, u32 flags,
 
 	return rc;
 }
-
-/**
- * hgsmi_cursor_position - Report the guest cursor position.  The host may
- *                         wish to use this information to re-position its
- *                         own cursor (though this is currently unlikely).
- *                         The current host cursor position is returned.
- * Return: 0 or negative errno value.
- * @ctx:              The context containing the heap used.
- * @report_position:  Are we reporting a position?
- * @x:                Guest cursor X position.
- * @y:                Guest cursor Y position.
- * @x_host:           Host cursor X position is stored here.  Optional.
- * @y_host:           Host cursor Y position is stored here.  Optional.
- */
-int hgsmi_cursor_position(struct gen_pool *ctx, bool report_position,
-			  u32 x, u32 y, u32 *x_host, u32 *y_host)
-{
-	struct vbva_cursor_position *p;
-
-	p = hgsmi_buffer_alloc(ctx, sizeof(*p), HGSMI_CH_VBVA,
-			       VBVA_CURSOR_POSITION);
-	if (!p)
-		return -ENOMEM;
-
-	p->report_position = report_position;
-	p->x = x;
-	p->y = y;
-
-	hgsmi_buffer_submit(ctx, p);
-
-	*x_host = p->x;
-	*y_host = p->y;
-
-	hgsmi_buffer_free(ctx, p);
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h b/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h
index 55fcee3a6470..643c4448bdcb 100644
--- a/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h
+++ b/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h
@@ -34,8 +34,6 @@ int hgsmi_query_conf(struct gen_pool *ctx, u32 index, u32 *value_ret);
 int hgsmi_update_pointer_shape(struct gen_pool *ctx, u32 flags,
 			       u32 hot_x, u32 hot_y, u32 width, u32 height,
 			       u8 *pixels, u32 len);
-int hgsmi_cursor_position(struct gen_pool *ctx, bool report_position,
-			  u32 x, u32 y, u32 *x_host, u32 *y_host);
 
 bool vbva_enable(struct vbva_buf_ctx *vbva_ctx, struct gen_pool *ctx,
 		 struct vbva_buffer *vbva, s32 screen);
-- 
2.47.1

