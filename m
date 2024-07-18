Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D202935104
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 19:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9B410EA63;
	Thu, 18 Jul 2024 17:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H3remL7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2C310EA4F;
 Thu, 18 Jul 2024 17:00:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9766361BA6;
 Thu, 18 Jul 2024 17:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA39EC4AF0A;
 Thu, 18 Jul 2024 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721322015;
 bh=EPLPHzWrGEOLeJuNaGjh5LgxCTKpZ6gyK3S1PTRsKbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H3remL7rPxu8MSAAL358JFVnirA2jauibLaDz/JK2cK2DXNDsnSRDrkY+mCk0cIny
 HLUGidoIJB3Tr+apsQkh6YNGcYEFzJXv2JyFxGKCxBm6kZcjW3RD3/XOqpf6tyfCZX
 G44p1Cf48xlKlv8VxvKxI2DegZmbowBjV3zR0gfCrmFPTUXk8LBnhsB2q4qhhfIMAs
 KeCuKOnzhqRLVLkkSSkS0Wvs+zdeds0vK/E2Dr3aY3TnoZXX9TnLal5y1ASgN/85wF
 IRT2TD3MgF8Jj+NzoMk3JFDKWCk5/7qMRkfYX8HMBUmOCqKZ+8ui/aeyOpkpOc9KBi
 CiXYpaRZnR7MQ==
From: Danilo Krummrich <dakr@kernel.org>
To: lyude@redhat.com,
	airlied@redhat.com,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/3] drm/nouveau: bo: remove unused functions
Date: Thu, 18 Jul 2024 18:58:47 +0200
Message-ID: <20240718165959.3983-3-dakr@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718165959.3983-1-dakr@kernel.org>
References: <20240718165959.3983-1-dakr@kernel.org>
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

nouveau_bo_new_pin_map() and nouveau_bo_unmap_unpin_unref() are unused,
hence remove them.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.h | 29 ----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 4e891752c255..3b8dfbb621da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -115,35 +115,6 @@ nvbo_kmap_obj_iovirtual(struct nouveau_bo *nvbo)
 	return ioptr;
 }
 
-static inline void
-nouveau_bo_unmap_unpin_unref(struct nouveau_bo **pnvbo)
-{
-	if (*pnvbo) {
-		nouveau_bo_unmap(*pnvbo);
-		nouveau_bo_unpin(*pnvbo);
-		nouveau_bo_ref(NULL, pnvbo);
-	}
-}
-
-static inline int
-nouveau_bo_new_pin_map(struct nouveau_cli *cli, u64 size, int align, u32 domain,
-		       struct nouveau_bo **pnvbo)
-{
-	int ret = nouveau_bo_new(cli, size, align, domain,
-				 0, 0, NULL, NULL, pnvbo);
-	if (ret == 0) {
-		ret = nouveau_bo_pin(*pnvbo, domain, true);
-		if (ret == 0) {
-			ret = nouveau_bo_map(*pnvbo);
-			if (ret == 0)
-				return ret;
-			nouveau_bo_unpin(*pnvbo);
-		}
-		nouveau_bo_ref(NULL, pnvbo);
-	}
-	return ret;
-}
-
 int nv04_bo_move_init(struct nouveau_channel *, u32);
 int nv04_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
 		      struct ttm_resource *, struct ttm_resource *);
-- 
2.45.2

