Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43146836791
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B4810F363;
	Mon, 22 Jan 2024 15:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E3E10F363;
 Mon, 22 Jan 2024 15:16:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD67F61516;
 Mon, 22 Jan 2024 15:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4186AC433F1;
 Mon, 22 Jan 2024 15:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936595;
 bh=cxPDjimgUngRHIeDEPESfgetGWsk2vnEtf4FJ4JMjoY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=boIM30v6tAQ7MeIzG2CGNYePoEK0sM2pcfrjlFUHhfNyBhMnIoIL6wflsQa7bP1mb
 YnvaOkfUZFl28SXoRXJbkzaXAe7fZspcORZDcEOkZ6CqYYRTLgu8wJQt4Lj4QP9o2b
 TvIp6oVnEPYWmqMyU9h22foW2GrNmLWCjxI6OeLI+HXW00ucMgtE0sJhQN5nCd/xXg
 pfsQcMfY20i3VSssUgRspPfZf7mwFljT1V4F/R2NuazOsfB+10WXbnGXDJP2rL8RBf
 CxMg7+e79+Bm5QipNznBLCyU1gEBkD1vepiYSVzosR2R+Dbs/UBHWr00fEXhzuGZs3
 myzYX3HxLhLGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 27/28] drm/amdgpu: Let KFD sync with VM fences
Date: Mon, 22 Jan 2024 10:14:53 -0500
Message-ID: <20240122151521.996443-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122151521.996443-1-sashal@kernel.org>
References: <20240122151521.996443-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.208
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Felix Kuehling <Felix.Kuehling@amd.com>

[ Upstream commit ec9ba4821fa52b5efdbc4cdf0a77497990655231 ]

Change the rules for amdgpu_sync_resv to let KFD synchronize with VM
fences on page table reservations. This fixes intermittent memory
corruption after evictions when using amdgpu_vm_handle_moved to update
page tables for VM mappings managed through render nodes.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 8ea6c49529e7..6a22bc41c205 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -241,7 +241,8 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 
 		/* Never sync to VM updates either. */
 		if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
-		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
+		    owner != AMDGPU_FENCE_OWNER_UNDEFINED &&
+	    owner != AMDGPU_FENCE_OWNER_KFD)
 			continue;
 
 		/* Ignore fences depending on the sync mode */
-- 
2.43.0

