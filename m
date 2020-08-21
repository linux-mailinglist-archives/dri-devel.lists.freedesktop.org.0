Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C724D9BA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 18:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E786EADB;
	Fri, 21 Aug 2020 16:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955646EB08;
 Fri, 21 Aug 2020 16:15:52 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A61B2063A;
 Fri, 21 Aug 2020 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026552;
 bh=iAVDoijhRVMr+7fAJMTi0vz8YjdzK7xutKC2AZ3bmjE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bspemOsENRqdLD1Ss7xiofHujMPqeD3myR6z04R2dBcmRrg464CjiWPBG0cfb7t6O
 DE36FumiwKYj8mCZk8wJbugUs0Uhr+bYaRCOTi37cqRZOY5/zBQcvhilqf7fFvAV+V
 Zs70W/DVZmm+GtNmsGJqXICjpmjWsqTHncQCus+s=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 05/61] drm/amdgpu: fix RAS memory leak in error
 case
Date: Fri, 21 Aug 2020 12:14:49 -0400
Message-Id: <20200821161545.347622-5-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161545.347622-1-sashal@kernel.org>
References: <20200821161545.347622-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Guchun Chen <guchun.chen@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit 5e91160ac0b5cfbbaeb62cbff8b069262095f744 ]

RAS context memory needs to freed in failure case.

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index cd18596b47d33..78b378867b97a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1843,9 +1843,8 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
 	amdgpu_ras_check_supported(adev, &con->hw_supported,
 			&con->supported);
 	if (!con->hw_supported) {
-		amdgpu_ras_set_context(adev, NULL);
-		kfree(con);
-		return 0;
+		r = 0;
+		goto err_out;
 	}
 
 	con->features = 0;
@@ -1856,29 +1855,31 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
 	if (adev->nbio.funcs->init_ras_controller_interrupt) {
 		r = adev->nbio.funcs->init_ras_controller_interrupt(adev);
 		if (r)
-			return r;
+			goto err_out;
 	}
 
 	if (adev->nbio.funcs->init_ras_err_event_athub_interrupt) {
 		r = adev->nbio.funcs->init_ras_err_event_athub_interrupt(adev);
 		if (r)
-			return r;
+			goto err_out;
 	}
 
 	amdgpu_ras_mask &= AMDGPU_RAS_BLOCK_MASK;
 
-	if (amdgpu_ras_fs_init(adev))
-		goto fs_out;
+	if (amdgpu_ras_fs_init(adev)) {
+		r = -EINVAL;
+		goto err_out;
+	}
 
 	DRM_INFO("RAS INFO: ras initialized successfully, "
 			"hardware ability[%x] ras_mask[%x]\n",
 			con->hw_supported, con->supported);
 	return 0;
-fs_out:
+err_out:
 	amdgpu_ras_set_context(adev, NULL);
 	kfree(con);
 
-	return -EINVAL;
+	return r;
 }
 
 /* helper function to handle common stuff in ip late init phase */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
