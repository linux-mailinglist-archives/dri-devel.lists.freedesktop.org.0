Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453EA4916FF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1541128F9;
	Tue, 18 Jan 2022 02:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8F31128F7;
 Tue, 18 Jan 2022 02:37:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96E2DB81132;
 Tue, 18 Jan 2022 02:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153E8C36AE3;
 Tue, 18 Jan 2022 02:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473450;
 bh=LSCFijlqwDVH3dQEdv7hVOW/AfBT0FrxVmDG8/uNt/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BGpJz0F5FZTcld4v89CCiHmtg8fNx4IYGUl/BzGahDGp2jm/0rbXxjtXWXO8UIZYz
 COuLszTnsMl5OZZIcWLUbNt9Gd5Firxbi45uOGeU160/qst7YCvPnXbLUmBK8CMWCj
 ai1C3cfBQwy8tn0aZfgoePwIdCPbapW+dqnic88GlmX4rc3I+mmKwc44VLIznRjHd8
 j6q9cGVGX5+5PQJVTZknqOuYr96z++YW8A8hbqeGlnL83oFVtNJYmsvArizBmDmY4r
 fT3yR2Ik2hkmlrPqU0pQX8qYD/tA7toAI/V3mna6wWCAh9sqPibi6s8Rt6Rd/rYrhv
 O9wdrjJBGuT0w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 120/188] drm/amd/amdgpu: fix gmc bo pin count
 leak in SRIOV
Date: Mon, 17 Jan 2022 21:30:44 -0500
Message-Id: <20220118023152.1948105-120-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: alex.sierra@amd.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Xiaomeng.Hou@amd.com, PengJu.Zhou@amd.com, victor.skvortsov@amd.com,
 Sasha Levin <sashal@kernel.org>, Horace Chen <horace.chen@amd.com>,
 Oak.Zeng@amd.com, aaron.liu@amd.com, amd-gfx@lists.freedesktop.org,
 Yuliang.Shi@amd.com, Philip.Yang@amd.com, Felix.Kuehling@amd.com,
 John.Clements@amd.com, Jack.Gui@amd.com, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Xinhui.Pan@amd.com, ray.huang@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jingwen Chen <Jingwen.Chen2@amd.com>

[ Upstream commit 948e7ce01413b71395723aaf846015062aea3a43 ]

[Why]
gmc bo will be pinned during loading amdgpu and reset in SRIOV while
only unpinned in unload amdgpu

[How]
add amdgpu_in_reset and sriov judgement to skip pin bo

v2: fix wrong judgement

Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
Reviewed-by: Horace Chen <horace.chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index e47104a1f5596..3c01be6610144 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -1021,10 +1021,14 @@ static int gmc_v10_0_gart_enable(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
+	if (amdgpu_sriov_vf(adev) && amdgpu_in_reset(adev))
+		goto skip_pin_bo;
+
 	r = amdgpu_gart_table_vram_pin(adev);
 	if (r)
 		return r;
 
+skip_pin_bo:
 	r = adev->gfxhub.funcs->gart_enable(adev);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 5551359d5dfdc..b5d93247237b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1708,10 +1708,14 @@ static int gmc_v9_0_gart_enable(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
+	if (amdgpu_sriov_vf(adev) && amdgpu_in_reset(adev))
+		goto skip_pin_bo;
+
 	r = amdgpu_gart_table_vram_pin(adev);
 	if (r)
 		return r;
 
+skip_pin_bo:
 	r = adev->gfxhub.funcs->gart_enable(adev);
 	if (r)
 		return r;
-- 
2.34.1

