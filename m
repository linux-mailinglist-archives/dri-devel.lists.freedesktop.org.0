Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0AA64FFE0
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C9710E20B;
	Sun, 18 Dec 2022 16:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE75D10E20B;
 Sun, 18 Dec 2022 16:06:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5489060DCA;
 Sun, 18 Dec 2022 16:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BBFC433D2;
 Sun, 18 Dec 2022 16:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379573;
 bh=1aIuIkEBkra234fdZs9njiL/A7ZhiKe0gzh1gZzzi3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GZ2aGppMPLLMRzkfWNB/JvBvNbNxChjYU1GzLHZvoHvLEo4Ja4ogcwWkdx9aH1LT/
 XJVQM57ghIqlr9qgffF1KCbt8rxmHvEElGTOtLeyOrYwwPH7PjTBTyT+qdQKOQZ+lj
 8LA+a1Wu5fBJ/0xVXu1vTgpFUThTaIDvTSzvMgBDOvHQEzxGm9OvLSHIB9ryajxcLk
 r2t8NPnIS3g16gAywn3eWNOtYGCvnUPw1ru2OqNPpFbUM+4c3n9l0HBne1Bp/fDXds
 vMGpDl6iKGHHtv8X+TiSw7+Dr4Vo8/g1lpBvOyZ5qQRn9ddQcdmcXLwIauKCu6TfeJ
 SUHfYt9IBN4MQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 64/85] drm/amdgpu: Fix potential double free and
 null pointer dereference
Date: Sun, 18 Dec 2022 11:01:21 -0500
Message-Id: <20221218160142.925394-64-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, andrey.grodzovsky@amd.com,
 Amaranath.Somalapuram@amd.com, Xinhui.Pan@amd.com, tao.zhou1@amd.com,
 amd-gfx@lists.freedesktop.org, YiPeng.Chai@amd.com, shaoyun.liu@amd.com,
 Luben Tuikov <luben.tuikov@amd.com>, yang.lee@linux.alibaba.com,
 dri-devel@lists.freedesktop.org, Bokun.Zhang@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 Liang He <windhl@126.com>, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Liang He <windhl@126.com>

[ Upstream commit dfd0287bd3920e132a8dae2a0ec3d92eaff5f2dd ]

In amdgpu_get_xgmi_hive(), we should not call kfree() after
kobject_put() as the PUT will call kfree().

In amdgpu_device_ip_init(), we need to check the returned *hive*
which can be NULL before we dereference it.

Signed-off-by: Liang He <windhl@126.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f1e9663b4051..00976e15b698 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2462,6 +2462,11 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 			if (!amdgpu_sriov_vf(adev)) {
 				struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
 
+				if (WARN_ON(!hive)) {
+					r = -ENOENT;
+					goto init_failed;
+				}
+
 				if (!hive->reset_domain ||
 				    !amdgpu_reset_get_reset_domain(hive->reset_domain)) {
 					r = -ENOENT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 47159e9a0884..4b9e7b050ccd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -386,7 +386,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	if (ret) {
 		dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
 		kobject_put(&hive->kobj);
-		kfree(hive);
 		hive = NULL;
 		goto pro_end;
 	}
@@ -410,7 +409,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
 				ret = -ENOMEM;
 				kobject_put(&hive->kobj);
-				kfree(hive);
 				hive = NULL;
 				goto pro_end;
 			}
-- 
2.35.1

