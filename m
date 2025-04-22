Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4661A95AF1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 04:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EA310E4C8;
	Tue, 22 Apr 2025 02:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k3iJo5uw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4025810E144;
 Tue, 22 Apr 2025 02:16:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 384E15C5A70;
 Tue, 22 Apr 2025 02:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7408AC4CEE4;
 Tue, 22 Apr 2025 02:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745288197;
 bh=167VzBc/6G/IIdA/VUKDCBRnVuwCe9wGIn4ON4F9ugs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k3iJo5uwwzRX07gtly7MleKIElv2iN0h21x/vD+Sz20PvsODw/61qmAXJjAHgLL+T
 fUH2wqMfmXFQB1lP139u6Cfb4MGk464Jvae5sqzfB5/SuXqIlxeh292OXXyhJzOzE5
 PyMwnyLD7mkIDqrrbB/XtJsFvAX4BiRVOSQUgxFVV9QDtK5kO9CIdp7Tjwdb3i8AuP
 4yJcEKtv9XQPbXLTzyBWbmx+LMEDNjrKSiTyQRjwUobAK/AZRPnwphJNopUx0KWfV4
 JHtQk3szPKzsAq/oXLJ5MnNEBMEbetRY4p+JZvUNdvlGxKQ6Krqiqi5rOPURn73U1Y
 zTFBytpYONnzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 airlied@gmail.com, simona@ffwll.ch, Hawking.Zhang@amd.com,
 lijo.lazar@amd.com, Jack.Xiao@amd.com, Jesse.zhang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 25/30] drm/amdgpu: use a dummy owner for sysfs
 triggered cleaner shaders v4
Date: Mon, 21 Apr 2025 22:15:45 -0400
Message-Id: <20250422021550.1940809-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021550.1940809-1-sashal@kernel.org>
References: <20250422021550.1940809-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.3
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

From: Christian König <christian.koenig@amd.com>

[ Upstream commit 447fab30955cf7dba7dd563f42b67c02284860c8 ]

Otherwise triggering sysfs multiple times without other submissions in
between only runs the shader once.

v2: add some comment
v3: re-add missing cast
v4: squash in semicolon fix

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 8b2ae7d492675e8af8902f103364bef59382b935)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index c1f35ded684e8..506786784e32d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -1411,9 +1411,11 @@ static int amdgpu_gfx_run_cleaner_shader_job(struct amdgpu_ring *ring)
 	struct amdgpu_device *adev = ring->adev;
 	struct drm_gpu_scheduler *sched = &ring->sched;
 	struct drm_sched_entity entity;
+	static atomic_t counter;
 	struct dma_fence *f;
 	struct amdgpu_job *job;
 	struct amdgpu_ib *ib;
+	void *owner;
 	int i, r;
 
 	/* Initialize the scheduler entity */
@@ -1424,9 +1426,15 @@ static int amdgpu_gfx_run_cleaner_shader_job(struct amdgpu_ring *ring)
 		goto err;
 	}
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, &entity, NULL,
-				     64, 0,
-				     &job);
+	/*
+	 * Use some unique dummy value as the owner to make sure we execute
+	 * the cleaner shader on each submission. The value just need to change
+	 * for each submission and is otherwise meaningless.
+	 */
+	owner = (void *)(unsigned long)atomic_inc_return(&counter);
+
+	r = amdgpu_job_alloc_with_ib(ring->adev, &entity, owner,
+				     64, 0, &job);
 	if (r)
 		goto err;
 
-- 
2.39.5

