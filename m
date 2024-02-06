Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EF284AE89
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 07:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06881129DD;
	Tue,  6 Feb 2024 06:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9AB1129DC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 06:57:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 85D50CE1299;
 Tue,  6 Feb 2024 06:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526AEC43390;
 Tue,  6 Feb 2024 06:57:47 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jingfeng Sui <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Huacai Chen <chenhuacai@loongson.cn>,
 Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH V3] drm/loongson: Error out if no VRAM detected
Date: Tue,  6 Feb 2024 14:57:18 +0800
Message-ID: <20240206065718.2951108-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.0
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

If there is no VRAM (it can be true if there is a discreted card, this
is probably a hardware configuration issue in BIOS but it is observed in
GDC-1401 laptop, L71 laptop and some Loongson-3C5000L based servers), we
get such an error and Xorg fails to start:

[  136.401131] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  137.444342] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  138.871166] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  140.444078] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  142.403993] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  143.970625] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
[  145.862013] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed

So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM is less
than 1MB which is also an unusable case) detected.

Tested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Update commit message.
V3: Return -ENOSPC rather than -ENODEV.

 drivers/gpu/drm/loongson/lsdc_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index 89ccc0c43169..d8ff60b46abe 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -184,7 +184,7 @@ static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
 	drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
 		 (u64)base, (u32)(size >> 20));
 
-	return 0;
+	return (size > SZ_1M) ? 0 : -ENOSPC;
 }
 
 static struct lsdc_device *
-- 
2.43.0

