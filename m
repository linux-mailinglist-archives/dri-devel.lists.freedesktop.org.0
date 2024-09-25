Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF81985945
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6EA10E97A;
	Wed, 25 Sep 2024 11:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="diENaWK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6300810E979;
 Wed, 25 Sep 2024 11:52:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D99425C4A0E;
 Wed, 25 Sep 2024 11:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04827C4CEC3;
 Wed, 25 Sep 2024 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265120;
 bh=VEKGLNJ/0uJz4z0kCY7jCs4S5UPkM3+KRP7c8hmRn1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=diENaWK1m2EahLhgyIqg4BaO25dB5RluQ7nGpTHXraRRHB9rtG0vn6UT2ZhXZ1mr6
 tUzEPCRAR/e9p7+xLqHU1SWC36ZpPc3ceEM+9/KKccImYCGEIcNcwcJuBlHP54paVr
 AL6NUjAs+P3waLSZHm1ud8qgFQtFVGglzxhHWY4pzSI4vxzM1rAY3OAIf3p8Fmt6aw
 ckLZQCKTvfmNbxbvZIufKXeVF0+djzhiT0xbLVqD1HrF//4fB9E9mC2eIRkNrKUxA/
 IeB8OGLCnhT0yxqiVGIvGjlH9ZbyrZAMX4Np9Cn+vmj39EV2g6Xkq5oJqlGw0Iwj8F
 pkVXq9NFv2UEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, zhenguo.yin@amd.com, Jun.Ma2@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 210/244] drm/amdgpu: fix ptr check warning in
 gfx10 ip_dump
Date: Wed, 25 Sep 2024 07:27:11 -0400
Message-ID: <20240925113641.1297102-210-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Sunil Khatri <sunil.khatri@amd.com>

[ Upstream commit 98df5a7732e3b78bf8824d2938a8865a45cfc113 ]

Change condition, if (ptr == NULL) to if (!ptr)
for a better format and fix the warning.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index e444e621ddaa0..5b41c6a44068c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4649,7 +4649,7 @@ static void gfx_v10_0_alloc_ip_dump(struct amdgpu_device *adev)
 	uint32_t inst;
 
 	ptr = kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
-	if (ptr == NULL) {
+	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX IP Dump\n");
 		adev->gfx.ip_dump_core = NULL;
 	} else {
@@ -4662,7 +4662,7 @@ static void gfx_v10_0_alloc_ip_dump(struct amdgpu_device *adev)
 		adev->gfx.mec.num_queue_per_pipe;
 
 	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
-	if (ptr == NULL) {
+	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for Compute Queues IP Dump\n");
 		adev->gfx.ip_dump_compute_queues = NULL;
 	} else {
@@ -4675,7 +4675,7 @@ static void gfx_v10_0_alloc_ip_dump(struct amdgpu_device *adev)
 		adev->gfx.me.num_queue_per_pipe;
 
 	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
-	if (ptr == NULL) {
+	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX Queues IP Dump\n");
 		adev->gfx.ip_dump_gfx_queues = NULL;
 	} else {
-- 
2.43.0

