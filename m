Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE2983A86
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 01:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DCE10E4B8;
	Mon, 23 Sep 2024 23:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="JC+ko8oq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2024 23:56:18 UTC
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F310E4B8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 23:56:18 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1727135377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rDdO/5vF6ykhIVNsYXGYgfmGlQo19Ylf96enkGpatXQ=;
 b=JC+ko8oqNj0vJCSlFt89UXWkK5Pfq5t5GaRASiIYpZVa4vyF8eFbq1SGhsqbFVSWGtK8xQ
 Us4tzF4750mvUT4fh0L7PbjJv0kYYc1nNhtVo1xZQJ44dCOIOVgD7ko9C2PBqWMjnvTu0G
 ZZNM+kk+DgX1dAwIrZlq3sLaAQG31qo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Remove unnecessary NULL checks before kvfree()
Date: Tue, 24 Sep 2024 01:46:41 +0200
Message-ID: <20240923234638.236319-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Since kvfree() already checks if its argument is NULL, an additional
check before calling kvfree() is unnecessary and can be removed.

Remove both and the following Coccinelle/coccicheck warnings reported by
ifnullfree.cocci:

  WARNING: NULL check before some freeing functions is not needed
  WARNING: NULL check before some freeing functions is not needed

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 890a66a2361f..64bd7d74854e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -635,10 +635,8 @@ int vmw_bo_cpu_blit(struct vmw_bo *vmw_dst,
 		kunmap_atomic(d.src_addr);
 	if (d.dst_addr)
 		kunmap_atomic(d.dst_addr);
-	if (src_pages)
-		kvfree(src_pages);
-	if (dst_pages)
-		kvfree(dst_pages);
+	kvfree(src_pages);
+	kvfree(dst_pages);
 
 	return ret;
 }
-- 
2.46.1

