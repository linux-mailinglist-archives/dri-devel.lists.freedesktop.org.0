Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42B67D3B2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 19:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AF710E964;
	Thu, 26 Jan 2023 18:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ADF10E964
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 18:01:55 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E2FEB324AA7;
 Thu, 26 Jan 2023 18:01:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1674756114; bh=/ALgIIZoHGybIwkcyBMlhwxQfT+kQgtyX0QfTy6hKU0=;
 h=From:To:Cc:Subject:Date:From;
 b=D8ajO4m+pUZ6SbxKo6U5HSXaN5sHUdu9n+VxGzWFOEBEtTDsCKzCoqNcAGu+fP9kG
 SZwf4+Dl2lF5oql7nj/kcP5eJEm2e8metARk/aCdNwlNB+z7RVyjiEutVJxzL01p5Z
 IjpnX3yxF63+8WWSwqrWMwWIlKjKFs9gAZ08XmBkkWaCPs3ehzOPleVxWRa0VTFWm5
 Jb//dNczVvJQ2FIcEgzfu3R2xYYA+oX+idAlfWMXHTikjB8XVdMyM/PY9ePdtXm3jE
 oykvXWeJGBmGsgd7M73Iy9gLt3/OTBGzkAYG/mYc0Wru5cT04aZwLrmUQzxmlqNlq2
 iRfOsjEDW0njw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Fix a typo in iteration over swap-lists
Date: Thu, 26 Jan 2023 13:01:51 -0500
Message-Id: <20230126180151.605367-1-zack@kde.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: banackm@vmware.com, krastevm@vmware.com, "Roger . He" <Hongbo.He@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

On device fini all the lru's for different priorities are checked
for whether or not they were clean. The code used 0 instead of the
iteration variable, which results in continuously checking only the swap
list for priority 0.

Use the loop index to fix it.

Fixes: cf6c467d67d3 ("drm/ttm: add BO priorities for the LRUs")
Cc: Christian König <christian.koenig@amd.com>
Cc: Roger.He <Hongbo.He@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7147e304637..0feaa4feaad5 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -254,7 +254,7 @@ void ttm_device_fini(struct ttm_device *bdev)
 
 	spin_lock(&bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
-		if (list_empty(&man->lru[0]))
+		if (list_empty(&man->lru[i]))
 			pr_debug("Swap list %d was clean\n", i);
 	spin_unlock(&bdev->lru_lock);
 
-- 
2.38.1

