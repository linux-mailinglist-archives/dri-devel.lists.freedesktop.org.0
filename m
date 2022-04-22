Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F750BCB4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 18:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EB910E16C;
	Fri, 22 Apr 2022 16:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E500B10E077
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 16:13:45 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 5056B28BE8C;
 Fri, 22 Apr 2022 17:13:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1650644023; bh=5y6e6FrYbaP8i9fJT6muy4ZLGQvLmci6CNt4QKR+zoo=;
 h=From:To:Cc:Subject:Date:From;
 b=jnu1pWGMD7dcjKfg2Fsx0CNbhwGWd+DB95t7z7elQOghd7Jk4TuCu4th5/AjGXDdt
 VJF4XJ7lQ91NnQzy2nS+34qwxGAW/Iwv05CbwamaOCQugNYoRc4ShP3SyrpZFu353U
 10LsTKIwEgS2dMMpuHXCW1uf5CKvRP2OHoJrgwQSALSXUhQQQH1bkQpengGwPkh8a5
 5dvZfHiqF3Mj+gYlwmIpnw1TXAebc3EiVdk6A8Gucx7vngCAqozTagioYdvvUCaSnI
 yiZvEovze8kBdkSQtaWWauthLMKDZ9cwUyIV0dF7N2QwkS+ao8/a5qm2YmKwJwx13C
 1tIr+/M7O1cLA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Reserve fence slots on buffer objects in cotables
Date: Fri, 22 Apr 2022 12:13:42 -0400
Message-Id: <20220422161342.1142584-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

The buffer objects created by cotables were missing fence reservations.
They are created from vmw_validation_res_validate which makes them miss
the ttm_eu_reserve_buffers which is called from vmw_validation_bo_reserve.

Cotables are the only resources which create a buffer object in the
create callback so make sure the code also reserves the slots.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: c8d4c18bfbc4 ("dma-buf/drivers: make reserving a shared slot mandatory v4")
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index 16f986b6cbea..79b30dc9d825 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -478,6 +478,10 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 	vmw_bo_unreference(&old_buf);
 	res->id = vcotbl->type;
 
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
+	if (unlikely(ret))
+		goto out_wait;
+
 	/* Release the pin acquired in vmw_bo_init */
 	ttm_bo_unpin(bo);
 
-- 
2.32.0

