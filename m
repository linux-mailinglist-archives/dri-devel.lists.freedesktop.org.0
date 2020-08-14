Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A0B245D33
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6165D6E4AB;
	Mon, 17 Aug 2020 07:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661A16E2DA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 08:30:31 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.125])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id C2A404826D4;
 Fri, 14 Aug 2020 16:30:27 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/via: reduce no need mutex_lock area
Date: Fri, 14 Aug 2020 01:30:19 -0700
Message-Id: <20200814083021.8962-1-bernard@vivo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZT0JNTh1KTRhLSkNLVkpOQkxIQkhDSUxCT0JVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mhw6Sjo5KT8dCjosSQEOEx4t
 DjIKCxNVSlVKTkJMSEJIQ0lDTklMVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSkNPSjcG
X-HM-Tid: 0a73ec17783893bakuwsc2a404826d4
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function via_mem_alloc`s error branch, DRM_ERROR is protected
in the mutex_lock(&dev->struct_mutex) area.
From the code, we see that DRM_ERROR is just an error log print
without any struct element, there is no need to protect this.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/via/via_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/via/via_mm.c b/drivers/gpu/drm/via/via_mm.c
index 45cc9e900260..dae1bacd86c1 100644
--- a/drivers/gpu/drm/via/via_mm.c
+++ b/drivers/gpu/drm/via/via_mm.c
@@ -129,9 +129,9 @@ int via_mem_alloc(struct drm_device *dev, void *data,
 	mutex_lock(&dev->struct_mutex);
 	if (0 == ((mem->type == VIA_MEM_VIDEO) ? dev_priv->vram_initialized :
 		      dev_priv->agp_initialized)) {
+		mutex_unlock(&dev->struct_mutex);
 		DRM_ERROR
 		    ("Attempt to allocate from uninitialized memory manager.\n");
-		mutex_unlock(&dev->struct_mutex);
 		return -EINVAL;
 	}
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
