Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF467B47829
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B73510E41B;
	Sat,  6 Sep 2025 22:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="fXV2PKDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 05 Sep 2025 15:17:05 UTC
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com
 [45.254.49.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DC910E16D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 15:17:05 +0000 (UTC)
Received: from LAPTOP-N070L597.localdomain (unknown [221.228.238.82])
 by smtp.qiye.163.com (Hmail) with ESMTP id 21d9533d1;
 Fri, 5 Sep 2025 23:11:59 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
 Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] drm: Use kvmemdup/kvfree for EDID data
Date: Fri,  5 Sep 2025 15:11:56 +0000
Message-Id: <20250905151156.844758-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a991a6f34b303a1kunm694de830289b38
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQxlDVk0dTEhNSkJJGklOGVYeHw5VEwETFhoSFy
 QUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlLVUtVS1VLWQY+
DKIM-Signature: a=rsa-sha256;
 b=fXV2PKDTt7nk7QveGxHQ/I8dtVQPfO0B2eT4t57TeRbc/m0jZlYpkdxswpkD3dZgORr/WVNBJy/Pe7Abx/SrWi8LB4ZW63mQyT/UqiCav/jqk/UhjKhjIgQvvAlf6w+9pIotIvVgXS8adZDCTFJkNkUampzFE4NuSYfnJyGBnb8=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1; 
 bh=Rjrnbhz/j596PH/1yB3FKm4uksPxzdVSFHyF0AXryOg=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

The drm_edid_alloc() function uses kmemdup() to copy raw EDID data,
which can be loaded from firmware. A problem exists because the firmware
subsystem uses vfree() to release its data buffer. This implies the
buffer may be allocated with vmalloc() and can thus be larger than
kmalloc() typically supports. Since kmemdup() uses kmalloc() internally,
attempting to duplicate a large, vmalloc'd EDID buffer can lead to an
allocation failure.

To fix this mismatch and robustly handle EDID data of any size, this
patch replaces kmemdup() with kvmemdup(). The kvmemdup() function is
designed for this scenario, as it can safely handle a vmalloc'd source
and choose an appropriate allocator for the destination. The corresponding
free calls are therefore updated to kvfree().

Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/gpu/drm/drm_edid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e2e85345aa9a..97142bfc45ad 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2530,13 +2530,13 @@ const struct drm_edid *drm_edid_alloc(const void *edid, size_t size)
 	if (!edid || !size || size < EDID_LENGTH)
 		return NULL;
 
-	edid = kmemdup(edid, size, GFP_KERNEL);
+	edid = kvmemdup(edid, size, GFP_KERNEL);
 	if (!edid)
 		return NULL;
 
 	drm_edid = _drm_edid_alloc(edid, size);
 	if (!drm_edid)
-		kfree(edid);
+		kvfree(edid);
 
 	return drm_edid;
 }
@@ -2568,7 +2568,7 @@ void drm_edid_free(const struct drm_edid *drm_edid)
 	if (!drm_edid)
 		return;
 
-	kfree(drm_edid->edid);
+	kvfree(drm_edid->edid);
 	kfree(drm_edid);
 }
 EXPORT_SYMBOL(drm_edid_free);
-- 
2.34.1

