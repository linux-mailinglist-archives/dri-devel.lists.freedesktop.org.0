Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB0A1BF94
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 01:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A5A10EA51;
	Sat, 25 Jan 2025 00:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="JCfzbSE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0245E10EA51
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 00:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=oFFewMnk6fTHWBBBWcMsV8qqSYZRkpwup/pzPrdMACk=; b=JCfzbSE+U5Do8rq7
 OuM6CBEhxiGeVQiRaDzTztYTRg/4pPI5rRC6N2ZpQ5W3U9rIHGyn3Iq/7JGj0S4OYAuFI1jzGghry
 R2E6MIpeZ/wbxAPuOzMT9Xx+WSfkLmUAqkmDGTcMS7+bvi2ubGaZPriZk0VkNJvgBPFopcE4m46oD
 OYNGmCw9XZu0hN5xe/DwQ0Yp9b4lrqo5H+kGbfK2VaRa5quFm4iKRFelKYxQ4rHnryFbGz4xtrxka
 c+VPGx33FCMxpGjqyhSHQQEU0KiJz35JGb2o7rl2GjqX0FeC7f/9VFAzHT/PHycI16tlTGykcfW3L
 0gG7Axon0uk/DPTXKw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tbToA-00BwkG-0J;
 Sat, 25 Jan 2025 00:13:54 +0000
From: linux@treblig.org
To: anitha.chrisanthus@intel.com, edmund.j.dea@intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/kmb: Remove unused const and defines
Date: Sat, 25 Jan 2025 00:13:53 +0000
Message-ID: <20250125001353.223974-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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

layer_irqs[] was added in 2020 as part of
commit 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
but isn't used.

Remove it.

It was the only user of the LCD_INT_VL0, LCD_INT_VL1, LCD_INT_GL0
and LCD_INT_GL1 defines.

Remove them.

commit c026565fe9be ("drm/kmb: Enable alpha blended second plane")
added a second copy of the POSSIBLE_CRTCS define.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 7 -------
 drivers/gpu/drm/kmb/kmb_plane.h | 5 -----
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb..5a8c7cbf27b0 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -17,13 +17,6 @@
 #include "kmb_plane.h"
 #include "kmb_regs.h"
 
-const u32 layer_irqs[] = {
-	LCD_INT_VL0,
-	LCD_INT_VL1,
-	LCD_INT_GL0,
-	LCD_INT_GL1
-};
-
 /* Conversion (yuv->rgb) matrix from myriadx */
 static const u32 csc_coef_lcd[] = {
 	1024, 0, 1436,
diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
index b51144044fe8..ad8b9a67c57f 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -25,14 +25,9 @@
 
 #define LCD_INT_GL0_ERR (LAYER2_DMA_FIFO_OVERFLOW | LAYER2_DMA_FIFO_UNDERFLOW)
 #define LCD_INT_GL1_ERR (LAYER3_DMA_FIFO_OVERFLOW | LAYER3_DMA_FIFO_UNDERFLOW)
-#define LCD_INT_VL0 (LAYER0_DMA_DONE | LAYER0_DMA_IDLE | LCD_INT_VL0_ERR)
-#define LCD_INT_VL1 (LAYER1_DMA_DONE | LAYER1_DMA_IDLE | LCD_INT_VL1_ERR)
-#define LCD_INT_GL0 (LAYER2_DMA_DONE | LAYER2_DMA_IDLE | LCD_INT_GL0_ERR)
-#define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE | LCD_INT_GL1_ERR)
 #define LCD_INT_DMA_ERR (LCD_INT_VL0_ERR | LCD_INT_VL1_ERR \
 		| LCD_INT_GL0_ERR | LCD_INT_GL1_ERR)
 
-#define POSSIBLE_CRTCS 1
 #define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
 
 #define POSSIBLE_CRTCS		1
-- 
2.48.1

