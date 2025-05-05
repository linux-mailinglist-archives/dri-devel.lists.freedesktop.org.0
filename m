Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34769AAA1CD
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7829A10E567;
	Mon,  5 May 2025 22:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hhTAXk/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ADB10E564;
 Mon,  5 May 2025 22:52:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AC49D5C3478;
 Mon,  5 May 2025 22:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6685BC4CEEE;
 Mon,  5 May 2025 22:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485526;
 bh=jYdGDVam+OJmLiRGsR9CWE9SnmZCxqmKRO8I+z9Lg8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hhTAXk/AlZ+u9z+5/BufavFXIb2nK7JkJjHVq/ucQJpAS7HuKkXCL9+JmANU5aXlp
 uugNLcSnGO7TTMQkYUeGEIzphjc5fPyi+G8aG6OiqzNck0xcO17uZ0OZZb3HKXMy2g
 RIQQcsKTEDT+wyK1oDTTxnffRAMjalgNHSg9KdU5fvZ5ldqu6txuaKQ3ETS4PW5b/d
 5cVcbOoAP1GTK/T/jjpugWZzJGTo35SPrZSXjkTKm54xs1J58UzCUf6hC2VFkwGEkS
 FgYgJnVRCf5HFXgO+herO72IjOik3ZJm5TFB1RabV7C/FZ50Y438TPFLzV4iujsYrJ
 uOGcqw8rxxYcQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, airlied@gmail.com, simona@ffwll.ch,
 Jack.Xiao@amd.com, sunil.khatri@amd.com, Hawking.Zhang@amd.com,
 shaoyun.liu@amd.com, Jiadong.Zhu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 360/486] drm/amdgpu/mes11: fix set_hw_resources_1
 calculation
Date: Mon,  5 May 2025 18:37:16 -0400
Message-Id: <20250505223922.2682012-360-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 1350dd3691b5f757a948e5b9895d62c422baeb90 ]

It's GPU page size not CPU page size.  In most cases they
are the same, but not always.  This can lead to overallocation
on systems with larger pages.

Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 7a773fcd7752c..49113df8baefd 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -690,7 +690,7 @@ static int mes_v11_0_set_hw_resources(struct amdgpu_mes *mes)
 
 static int mes_v11_0_set_hw_resources_1(struct amdgpu_mes *mes)
 {
-	int size = 128 * PAGE_SIZE;
+	int size = 128 * AMDGPU_GPU_PAGE_SIZE;
 	int ret = 0;
 	struct amdgpu_device *adev = mes->adev;
 	union MESAPI_SET_HW_RESOURCES_1 mes_set_hw_res_pkt;
-- 
2.39.5

