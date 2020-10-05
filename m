Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF25283829
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0406089E39;
	Mon,  5 Oct 2020 14:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A5C89C6A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:45:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31E0720FC3;
 Mon,  5 Oct 2020 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601909114;
 bh=gUxbVMS/x0cJhI7glqQFw+WM6r1yoVPlmzJ68hUNnOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OgS4+cWYUZiUlNBSde2QvdU7VL8fylTNq5QZL9C8BnxUs0bvAeQfh2jpAhE90gdRO
 /WoGJJPFFIswkCj7gPVlk8Mw/M6/EXJ6LhlbdCOmKzESH5LZB7zf5UZB0Qrf5kB9nR
 M1uS3iSl3hOGKb3J6VOG8rjCnyHmsvXTbqC/yAGg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 10/12] drm/vmwgfx: Fix error handling in get_node
Date: Mon,  5 Oct 2020 10:44:58 -0400
Message-Id: <20201005144501.2527477-10-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201005144501.2527477-1-sashal@kernel.org>
References: <20201005144501.2527477-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

[ Upstream commit f54c4442893b8dfbd3aff8e903c54dfff1aef990 ]

ttm_mem_type_manager_func.get_node was changed to return -ENOSPC
instead of setting the node pointer to NULL. Unfortunately
vmwgfx still had two places where it was explicitly converting
-ENOSPC to 0 causing regressions. This fixes those spots by
allowing -ENOSPC to be returned. That seems to fix recent
regressions with vmwgfx.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Sigend-off-by: Roland Scheidegger <sroland@vmware.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 7da752ca1c34b..b93c558dd86e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -57,7 +57,7 @@ static int vmw_gmrid_man_get_node(struct ttm_mem_type_manager *man,
 
 	id = ida_alloc_max(&gman->gmr_ida, gman->max_gmr_ids - 1, GFP_KERNEL);
 	if (id < 0)
-		return (id != -ENOMEM ? 0 : id);
+		return id;
 
 	spin_lock(&gman->lock);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index b7c816ba71663..c8b9335bccd8d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -95,7 +95,7 @@ static int vmw_thp_get_node(struct ttm_mem_type_manager *man,
 		mem->start = node->start;
 	}
 
-	return 0;
+	return ret;
 }
 
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
