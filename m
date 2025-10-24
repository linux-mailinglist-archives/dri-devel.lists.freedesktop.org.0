Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C387C080EF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF2810EB3C;
	Fri, 24 Oct 2025 20:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="QqwrA7/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EDD10EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761337688; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SEArvOlfH74vbjfMVG1sMPtbC93q5M1zvlCuU2xI0VJgmLY6aMI1AYvVBIj98RnkZU+WOFV9hFzb+uTGmZBGDA2vt7VAx3K+WhGbYTV3n+h+xTikesZtPOkl6z/8VZUphMxnIT0kfHsFgxJjRKKee2Y+8T4T7A17VCfS+NghSyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761337688;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vOr8Rrr+mnTgf6ee9RR/hGBWYF0gos8pVivXS5bthXk=; 
 b=e/yWhpTf2ghOdv+R0yhXNxrmu4PZ0YDPf9t1/YlklAawpyi9fa2/UbbrcSz0PC8Ik3jyf1kbcOFI0A8nq4MxLb7V9I+YvJbP4TRMa9H7hJzwmfZZaytCKeLFnqR6IlGEXPs/VOng0q1nD+g1pHz9hK+iDkVyzMnrnlGT0Ixt0dA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761337688; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vOr8Rrr+mnTgf6ee9RR/hGBWYF0gos8pVivXS5bthXk=;
 b=QqwrA7/+ngNK0OlEGLSZVwKegylTw5G5SwQBuhL6vhvuPu2OtdKmcWcSTag4gY5R
 FZiYfRrdTFyhIRZq0Ivlj5yClWpjbnhy+/ROBgCYEr2Rs1OnvNKD6ROVVwxzmfM4xHf
 VbFtapebmfdacOZCa0lAfgIy1LGY/rCN2dAfwX/c=
Received: by mx.zohomail.com with SMTPS id 1761337687432824.4758348720163;
 Fri, 24 Oct 2025 13:28:07 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, greenjustin@chromium.org,
 sjoerd@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM driver
Date: Fri, 24 Oct 2025 17:27:56 -0300
Message-ID: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Commit c410fa9b07c32 ("drm/mediatek: Add AFBC support to Mediatek DRM
driver") added AFBC support to Mediatek DRM and enabled the
32x8/split/sparse modifier.

However, this is currently broken on Mediatek MT8188 (Genio 700 EVK
platform); tested using upstream Kernel and Mesa (v25.2.1), AFBC is used by
default since Mesa v25.0.

Kernel trace reports vblank timeouts constantly, and the render is garbled:

```
[CRTC:62:crtc-0] vblank wait timed out
WARNING: CPU: 7 PID: 70 at drivers/gpu/drm/drm_atomic_helper.c:1835 drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
[...]
Hardware name: MediaTek Genio-700 EVK (DT)
Workqueue: events_unbound commit_work
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
lr : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
sp : ffff80008337bca0
x29: ffff80008337bcd0 x28: 0000000000000061 x27: 0000000000000000
x26: 0000000000000001 x25: 0000000000000000 x24: ffff0000c9dcc000
x23: 0000000000000001 x22: 0000000000000000 x21: ffff0000c66f2f80
x20: ffff0000c0d7d880 x19: 0000000000000000 x18: 000000000000000a
x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
x14: 0000000000000000 x13: 74756f2064656d69 x12: 742074696177206b
x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800082396a70
x8 : 0000000000057fa8 x7 : 0000000000000cce x6 : ffff8000823eea70
x5 : ffff0001fef5f408 x4 : ffff80017ccee000 x3 : ffff0000c12cb480
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c12cb480
Call trace:
 drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c (P)
 drm_atomic_helper_commit_tail_rpm+0x64/0x80
 commit_tail+0xa4/0x1a4
 commit_work+0x14/0x20
 process_one_work+0x150/0x290
 worker_thread+0x2d0/0x3ec
 kthread+0x12c/0x210
 ret_from_fork+0x10/0x20
---[ end trace 0000000000000000 ]---
```

Until this gets fixed upstream, disable AFBC support on this platform, as
it's currently broken with upstream Mesa.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 02349bd440017..788b52c1d10c5 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -21,9 +21,6 @@
 
 static const u64 modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
-	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
-				AFBC_FORMAT_MOD_SPLIT |
-				AFBC_FORMAT_MOD_SPARSE),
 	DRM_FORMAT_MOD_INVALID,
 };
 
@@ -71,26 +68,7 @@ static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
 					   uint32_t format,
 					   uint64_t modifier)
 {
-	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		return true;
-
-	if (modifier != DRM_FORMAT_MOD_ARM_AFBC(
-				AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
-				AFBC_FORMAT_MOD_SPLIT |
-				AFBC_FORMAT_MOD_SPARSE))
-		return false;
-
-	if (format != DRM_FORMAT_XRGB8888 &&
-	    format != DRM_FORMAT_ARGB8888 &&
-	    format != DRM_FORMAT_BGRX8888 &&
-	    format != DRM_FORMAT_BGRA8888 &&
-	    format != DRM_FORMAT_ABGR8888 &&
-	    format != DRM_FORMAT_XBGR8888 &&
-	    format != DRM_FORMAT_RGB888 &&
-	    format != DRM_FORMAT_BGR888)
-		return false;
-
-	return true;
+	return modifier == DRM_FORMAT_MOD_LINEAR;
 }
 
 static void mtk_plane_destroy_state(struct drm_plane *plane,
