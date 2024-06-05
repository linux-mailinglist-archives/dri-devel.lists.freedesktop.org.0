Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A968FCBB1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633D010E796;
	Wed,  5 Jun 2024 12:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Iv6DeN51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1E710E796;
 Wed,  5 Jun 2024 12:04:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 296B861265;
 Wed,  5 Jun 2024 12:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F53C4AF09;
 Wed,  5 Jun 2024 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717589080;
 bh=Vjgiu0ILR3uskzK21Z0875GunoRwQmq+BkAqVYl9M+k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Iv6DeN51QEggnAkiZVE+/TVBGNJ8z/dhDsrdGN1VrJUGkQWgrzeJ6aQ0472Tgnf+V
 1/myHM4lIEneJ9IjoYaxVnOlC/lywW/ZgBUbXVBkhphiXOxe5euLNsQNQwQ7mei/Qe
 AkV0nveOyckT0/QZbl0EuQJEOnq6m6fVfrl7f9Jz0P6s/QfasWgyy39Rh7IAqHfhbo
 1oWrMCBxkqfBISsMBzuZP4akNgflmwbPh3eoj36SuXnSlvFU9KikMqypKkiMcIj7oX
 dDB9wS7LoUI8X3ExTDBTclCwRrBCHQ9BVKrbOfx1wwCjMers/o1p1Ca8UMnhPoLD4n
 ctUrt1xOm+XrQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Felix.Kuehling@amd.com, shashank.sharma@amd.com, Philip.Yang@amd.com,
 guchun.chen@amd.com, mukul.joshi@amd.com, xiaogang.chen@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 16/18] drm/amdgpu: fix dereference null return
 value for the function amdgpu_vm_pt_parent
Date: Wed,  5 Jun 2024 08:03:55 -0400
Message-ID: <20240605120409.2967044-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120409.2967044-1-sashal@kernel.org>
References: <20240605120409.2967044-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
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

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit a0cf36546cc24ae1c95d72253c7795d4d2fc77aa ]

The pointer parent may be NULLed by the function amdgpu_vm_pt_parent.
To make the code more robust, check the pointer parent.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index 0d51222f6f8eb..026a3db947298 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -766,11 +766,15 @@ int amdgpu_vm_pde_update(struct amdgpu_vm_update_params *params,
 			 struct amdgpu_vm_bo_base *entry)
 {
 	struct amdgpu_vm_bo_base *parent = amdgpu_vm_pt_parent(entry);
-	struct amdgpu_bo *bo = parent->bo, *pbo;
+	struct amdgpu_bo *bo, *pbo;
 	struct amdgpu_vm *vm = params->vm;
 	uint64_t pde, pt, flags;
 	unsigned int level;
 
+	if (WARN_ON(!parent))
+		return -EINVAL;
+
+	bo = parent->bo;
 	for (level = 0, pbo = bo->parent; pbo; ++level)
 		pbo = pbo->parent;
 
-- 
2.43.0

