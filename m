Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D24DB90F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 20:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AF410EA43;
	Wed, 16 Mar 2022 19:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEE710EA43
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 19:50:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 237E61F42B7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647460250;
 bh=2X9h3nK80lcnPb4NphKM5EwYM/7VFhDpWrcrESua5VM=;
 h=From:To:Cc:Subject:Date:From;
 b=ZC6yeoP0u5YljDKXBUmjhxMwqmEBdz/dwjVonSXoti8So2CArj1FC7/edEN2RaPaB
 3hl8lpKvTdcwzHyfr+eQaMcXIl2vtxsVuMBG9WKHUY/gyiapr9QjEpphtS+yiRPX8W
 nQri+T0ePsWuGCh3B1/2HX9zL8RzdqAQ1rYYF8TPWHcAujwhBHMj2V7wlOYxd2LuwN
 6wvLb+TjFm3QZNMwXliu+c8izhMjGjL9KZcZozlyxOY/5rhSHroylr+pOachUguNfh
 HRmwRjpzENPc9JDKc31k2ozTID8brXVm2HkA0dYA0jDQhTD7LHen5xs8CcfSZewgtt
 n3l0FfYyb+N1w==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ttm: fix uninit ptr deref in range manager alloc error
 path
Date: Wed, 16 Mar 2022 19:50:34 +0000
Message-Id: <20220316195034.3821108-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_range_man_alloc would try to ttm_resource_fini the res pointer
before it is allocated.

Fixes: de3688e469b0 (drm/ttm: add ttm_resource_fini v2)

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 5662627bb933..1b4d8ca52f68 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -89,7 +89,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
-		ttm_resource_fini(man, *res);
+		ttm_resource_fini(man, &node->base);
 		kfree(node);
 		return ret;
 	}
-- 
2.25.1

