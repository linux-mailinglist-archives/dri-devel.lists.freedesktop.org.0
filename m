Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5713985940
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E1110E976;
	Wed, 25 Sep 2024 11:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZWN+jicr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA00110E976;
 Wed, 25 Sep 2024 11:51:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D8681A4401D;
 Wed, 25 Sep 2024 11:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE814C4CEC3;
 Wed, 25 Sep 2024 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265116;
 bh=ntd3Vca1hW/4kpwUxZ/lZ6Q9Nk7kOo/IuegIR/xbjN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZWN+jicr00gU82S1i19ew+TWpoamwb815JlfKQTlabid6ljZvA0l/18xXkkcxueU5
 XhmBw+RMeKCNHzxj/TBEtQUQhCgxWHKe5yw806/iX9bcW0hBZ3j/JkAhp6iQqZhAZx
 fbV1DJT1zTnGDnNIMD7T1bvVxWk/6ICNEwE7n0gxyHbIthsfFz2VuMzYiMjrM6J6B0
 WdRdlrF67OpV6YtEDa7C6h8GbJyoe8BGRE4PxWVrJBV6TXK4xQAuWlOtRtFbOXIW2n
 7eyc69nfPPJ58YqkT9pCqDLrxFRCZXISDAimv4ipvOOJtQzd8iP7tueMDc6P/3HTr1
 UKDtLIKVdsh/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Prike.Liang@amd.com, Tim.Huang@amd.com,
 liupeng01@kylinos.cn, kevinyang.wang@amd.com,
 pierre-eric.pelloux-prayer@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 209/244] drm/amdgpu: fix ptr check warning in
 gfx9 ip_dump
Date: Wed, 25 Sep 2024 07:27:10 -0400
Message-ID: <20240925113641.1297102-209-sashal@kernel.org>
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

[ Upstream commit 07f4f9c00ec545dfa6251a44a09d2c48a76e7ee5 ]

Change if (ptr == NULL) to if (!ptr) for a better
format and fix the warning.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 7d517c94c3efb..6f178bfb8f104 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2133,7 +2133,7 @@ static void gfx_v9_0_alloc_ip_dump(struct amdgpu_device *adev)
 	uint32_t inst;
 
 	ptr = kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
-	if (ptr == NULL) {
+	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for GFX IP Dump\n");
 		adev->gfx.ip_dump_core = NULL;
 	} else {
@@ -2146,7 +2146,7 @@ static void gfx_v9_0_alloc_ip_dump(struct amdgpu_device *adev)
 		adev->gfx.mec.num_queue_per_pipe;
 
 	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
-	if (ptr == NULL) {
+	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for Compute Queues IP Dump\n");
 		adev->gfx.ip_dump_compute_queues = NULL;
 	} else {
-- 
2.43.0

