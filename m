Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661538BF03F
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77608112FBF;
	Tue,  7 May 2024 23:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ejiwwGE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BED0112FBA;
 Tue,  7 May 2024 23:01:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9DEFA61882;
 Tue,  7 May 2024 23:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C84DC2BBFC;
 Tue,  7 May 2024 23:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715122863;
 bh=B/GZDjaew3eFAUQrGbv/TKwXyHTUiAo67mAVzMwgEYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ejiwwGE3xKDa3hdyx5l6U8JRxim6N8EQIy2MsH/Punfh5mvv+Z73y0kfwCZDFeqJB
 qhzWvr9Cl/IIBq+WvDFKrF8Sg74C3Yr8pFl3/Li7YHVYjaaFlivGDuFjsdgM+rGUrk
 Bqd/BDvu38Q0o6DorKIQLITMByvaskRQm3iY/5JfJDmAHCWtOsmHH0zn15iCzRTAvK
 lZn8uMI6lEWXZ8b4H2a6Hx12URij7DP9l3xYpp5EkqrKDjvEWyarJRbvGOa+pJAVqx
 yLscHiVlGwk2HxN4dGmMwyEGBILKxOvlbw6jy/D6kLOvLd2VElV1hF/ufZPTjBnT5P
 V80sE5b0TlEaA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jack Xiao <Jack.Xiao@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Felix.Kuehling@amd.com, shaoyun.liu@amd.com, jonathan.kim@amd.com,
 guchun.chen@amd.com, shashank.sharma@amd.com, Tim.Huang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 09/12] drm/amdgpu/mes: fix use-after-free issue
Date: Tue,  7 May 2024 19:00:11 -0400
Message-ID: <20240507230031.391436-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230031.391436-1-sashal@kernel.org>
References: <20240507230031.391436-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.90
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

From: Jack Xiao <Jack.Xiao@amd.com>

[ Upstream commit 948255282074d9367e01908b3f5dcf8c10fc9c3d ]

Delete fence fallback timer to fix the ramdom
use-after-free issue.

v2: move to amdgpu_mes.c

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Acked-by: Lijo Lazar <lijo.lazar@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index bebd136ed5444..9a4cbfbd5d9e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1083,6 +1083,7 @@ void amdgpu_mes_remove_ring(struct amdgpu_device *adev,
 		return;
 
 	amdgpu_mes_remove_hw_queue(adev, ring->hw_queue_id);
+	del_timer_sync(&ring->fence_drv.fallback_timer);
 	amdgpu_ring_fini(ring);
 	kfree(ring);
 }
-- 
2.43.0

