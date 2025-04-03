Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B85DA7AAA4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5403E10EA9B;
	Thu,  3 Apr 2025 19:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NxcSm+jI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D93410EA95;
 Thu,  3 Apr 2025 19:14:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E1F6F5C6C67;
 Thu,  3 Apr 2025 19:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE75C4CEEB;
 Thu,  3 Apr 2025 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707681;
 bh=gy4JnBXx4PTmo+dmXKxVNJWbwi1sY36BSovfHvFqApw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NxcSm+jIpIsWzAffAWnsjSuEmpCufcEZ6LAozmhfMKgZeyXAcWtIPcYHL4RwA/jry
 PGR+vSZOnnn2E7kHNn8XYdipgutuyynT03bY6yh9a50mWAl8C+0XOVqR7J6yua9H0m
 EKGISzd6sJ6d6VA0pIhA2EXFhDInT8VQ1MIwyNGOBlOuEFL0j6HWz22ovyCZFa0PU9
 PKpd/W2myEmeyNEPDXqyJ+zbb0b5MirtcadEO0E0apKFuQjoEoySmM+giUyz2pE1Pc
 4W7NgXDlwjD32NMWKFW1fO4crVZXMw2cvd6cM9dv5rwBqBAxXRqjJrGz/qetSi6QYH
 z3NVL4nPdiZNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wentao Liang <vulab@iscas.ac.cn>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, kenneth.feng@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, boyuan.zhang@amd.com, Jun.Ma2@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 31/44] drm/amdgpu: handle
 amdgpu_cgs_create_device() errors in amd_powerplay_create()
Date: Thu,  3 Apr 2025 15:13:00 -0400
Message-Id: <20250403191313.2679091-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191313.2679091-1-sashal@kernel.org>
References: <20250403191313.2679091-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
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

From: Wentao Liang <vulab@iscas.ac.cn>

[ Upstream commit 1435e895d4fc967d64e9f5bf81e992ac32f5ac76 ]

Add error handling to propagate amdgpu_cgs_create_device() failures
to the caller. When amdgpu_cgs_create_device() fails, release hwmgr
and return -ENOMEM to prevent null pointer dereference.

[v1]->[v2]: Change error code from -EINVAL to -ENOMEM. Free hwmgr.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 686345f75f264..6cd327fecebbc 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -51,6 +51,11 @@ static int amd_powerplay_create(struct amdgpu_device *adev)
 	hwmgr->adev = adev;
 	hwmgr->not_vf = !amdgpu_sriov_vf(adev);
 	hwmgr->device = amdgpu_cgs_create_device(adev);
+	if (!hwmgr->device) {
+		kfree(hwmgr);
+		return -ENOMEM;
+	}
+
 	mutex_init(&hwmgr->msg_lock);
 	hwmgr->chip_family = adev->family;
 	hwmgr->chip_id = adev->asic_type;
-- 
2.39.5

