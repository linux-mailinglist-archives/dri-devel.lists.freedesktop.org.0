Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF6A72DF9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4A610E304;
	Thu, 27 Mar 2025 10:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fi6Lb0xt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366210E2CB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743072186;
 bh=iTgb0cAaWoIHoTFxneTAPVeXLTxFIueFnnUYVEAPAgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fi6Lb0xtNEM3BeAP9Wx1gjU4ycNCr+dTA0OdB4MGFdI8C/XLb0k0U/E76GDNcDaxB
 jR8HnR6lZB5nzFLYGXwU3vT7wjgH+1oi3ZrQZ9EmJO/HZCSOgyb66F2L+zAOp0w2hS
 N17R34TJSXJMqT3VdDzbc+3ZwXHlUxJh40Hg7cZKVaQcHhEws4BukD+y/QjfGLtun9
 Vyq5xQFLh3/wu+xCh16SNOuNHaRnbU89xRqn9U2EbkGqqQqvrw3zpWrg/GxzEDxtmX
 2W0AP84NFLpvx44qvGwgjJjyMZQi2HBVciUilRtsyf+2MMWrRey61N8i0+kCnrEIgn
 u/lBlihF2MiCg==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4755517E0FCE;
 Thu, 27 Mar 2025 11:43:06 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Min Ma <min.ma@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 3/3] accel/amdxdna:
 s/drm_gem_v[un]map_unlocked/drm_gem_v[un]map/
Date: Thu, 27 Mar 2025 11:43:00 +0100
Message-ID: <20250327104300.1982058-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250327104300.1982058-1-boris.brezillon@collabora.com>
References: <20250327104300.1982058-1-boris.brezillon@collabora.com>
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

Commit 8f5c4871a014 ("drm/gem: Change locked/unlocked postfix of
drm_gem_v/unmap() function names") dropped the _unlocked suffix,
but accel drivers were left behind.

Fixes: 8f5c4871a014 ("drm/gem: Change locked/unlocked postfix of drm_gem_v/unmap() function names")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Min Ma <min.ma@amd.com>
Cc: Lizhi Hou <lizhi.hou@amd.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/accel/amdxdna/amdxdna_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 606433d73236..d9691dca12d1 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -81,7 +81,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 	if (abo->type == AMDXDNA_BO_DEV_HEAP)
 		drm_mm_takedown(&abo->mm);
 
-	drm_gem_vunmap_unlocked(gobj, &map);
+	drm_gem_vunmap(gobj, &map);
 	mutex_destroy(&abo->lock);
 	drm_gem_shmem_free(&abo->base);
 }
@@ -417,7 +417,7 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 	abo->type = AMDXDNA_BO_CMD;
 	abo->client = filp->driver_priv;
 
-	ret = drm_gem_vmap_unlocked(to_gobj(abo), &map);
+	ret = drm_gem_vmap(to_gobj(abo), &map);
 	if (ret) {
 		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
 		goto release_obj;
-- 
2.48.1

