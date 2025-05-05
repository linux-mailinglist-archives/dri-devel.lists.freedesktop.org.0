Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A8AAA055
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0EA10E4D3;
	Mon,  5 May 2025 22:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kOEgn2QE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50B10E4D2;
 Mon,  5 May 2025 22:33:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A5E2A4CE36;
 Mon,  5 May 2025 22:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8495C4CEE4;
 Mon,  5 May 2025 22:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484426;
 bh=LQuPVeC3fJNuEY74H0m/1+/IkO53Xpzz+TKlzgBh4l4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kOEgn2QEpPusdi0/oFjwqL8e/DRbj1x9vkq44gcAy3sxV0Gh+lLO5WJUxPpRV2bdl
 AXtJbRyHImKOw5CLRsCcmpHvGlWFha2VDGxhhcU+zHWD4ZTw912NLqrIiAYUj+gzq+
 UQyCjBAxsN/CKYJlihg1Ev4FVaIT8w2dur/mS0pWGG2Xuame9QE3VIR3CUPpNQAYPh
 8+Tvv+JCZ+3NMOzuu2qeTwSipQpbR6H1mpa8rsGyAgBOvYUlCXbAsKYnOam1Qj4ddJ
 ws10PAVo4ZYmWwxnknib2SVtSRIEtdVwCmHWjalSCNAWNAZ0N0eyRwdPROh3VSQVxE
 PfalV0zpqKTiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiang Liu <gerry@linux.alibaba.com>,
 Shuo Liu <shuox.liu@linux.alibaba.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, lijo.lazar@amd.com, david.rosca@amd.com,
 Prike.Liang@amd.com, asad.kamal@amd.com, sonjiang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 475/642] amdgpu/soc15: enable asic reset for dGPU
 in case of suspend abort
Date: Mon,  5 May 2025 18:11:31 -0400
Message-Id: <20250505221419.2672473-475-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Jiang Liu <gerry@linux.alibaba.com>

[ Upstream commit 38e8ca3e4b6de1c6e49d0140264cfc8d314a5f70 ]

When GPU suspend is aborted, do the same for dGPU as APU to reset
soc15 asic. Otherwise it may cause following errors:
[  547.229463] amdgpu 0001:81:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_0.2.1.0 test failed (-110)

[  555.126827] amdgpu 0000:0a:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_0.2.1.0 test failed (-110)
[  555.126901] [drm:amdgpu_gfx_enable_kcq [amdgpu]] *ERROR* KCQ enable failed
[  555.126957] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of IP block <gfx_v9_4_3> failed -110
[  555.126959] amdgpu 0000:0a:00.0: amdgpu: amdgpu_device_ip_resume failed (-110).
[  555.126965] PM: dpm_run_callback(): pci_pm_resume+0x0/0xe0 returns -110
[  555.126966] PM: Device 0000:0a:00.0 failed to resume async: error -110

This fix has been tested on Mi308X.

Signed-off-by: Jiang Liu <gerry@linux.alibaba.com>
Tested-by: Shuo Liu <shuox.liu@linux.alibaba.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://lore.kernel.org/r/2462b4b12eb9d025e82525178d568cbaa4c223ff.1736739303.git.gerry@linux.alibaba.com
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index e98fb3fa36a88..6e09613de8cd2 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -604,12 +604,10 @@ soc15_asic_reset_method(struct amdgpu_device *adev)
 static bool soc15_need_reset_on_resume(struct amdgpu_device *adev)
 {
 	/* Will reset for the following suspend abort cases.
-	 * 1) Only reset on APU side, dGPU hasn't checked yet.
-	 * 2) S3 suspend aborted in the normal S3 suspend or
-	 *    performing pm core test.
+	 * 1) S3 suspend aborted in the normal S3 suspend
+	 * 2) S3 suspend aborted in performing pm core test.
 	 */
-	if (adev->flags & AMD_IS_APU && adev->in_s3 &&
-			!pm_resume_via_firmware())
+	if (adev->in_s3 && !pm_resume_via_firmware())
 		return true;
 	else
 		return false;
-- 
2.39.5

