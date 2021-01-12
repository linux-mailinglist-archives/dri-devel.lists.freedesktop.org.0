Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C400C2F2F74
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 13:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDF76E1F7;
	Tue, 12 Jan 2021 12:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553989740;
 Tue, 12 Jan 2021 12:56:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA1023333;
 Tue, 12 Jan 2021 12:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456190;
 bh=Y0s+VaqXDL8DvN9FddpkCa98zsrkK/PYMkRYZ9XQmC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I9D8yXXLC1WGl9HYMiyKmu6zc3X5XmKfMOD+ozH7/HTiyII1uP//ST6o/5XxJAR0m
 BbcjQqtsisAnGdwX8azRVdxAhmEfF4x1xUg1R1bkmubiI+U81oOXbi4xlRGHET4JlM
 ha5Lr9b7kwQ4rs+U4exNzPDijbQmrwjrKMWDN9A4a2cIm+EGyNg0CiSFkcyzkHeCWl
 jJyB4sWQ2m3LS7IGpalFPmic2EDI9WWAnbnQWT5+/livYkK1unPEdA3RSzAgcMlFwU
 +AiNLGQy8DZE7r+96cjncfsfdOjeWK9gpwhLcxnDnIpGdJu2NtN/WnaWclAjnSYsCK
 JzxuN07nK5YSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 42/51] drm/amdgpu: fix a GPU hang issue when
 remove device
Date: Tue, 12 Jan 2021 07:55:24 -0500
Message-Id: <20210112125534.70280-42-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125534.70280-1-sashal@kernel.org>
References: <20210112125534.70280-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dennis Li <Dennis.Li@amd.com>

[ Upstream commit 88e21af1b3f887d217f2fb14fc7e7d3cd87ebf57 ]

When GFXOFF is enabled and GPU is idle, driver will fail to access some
registers. Therefore change to disable power gating before all access
registers with MMIO.

Dmesg log is as following:
amdgpu 0000:03:00.0: amdgpu: amdgpu: finishing device.
amdgpu: cp queue pipe 4 queue 0 preemption failed
amdgpu 0000:03:00.0: amdgpu: failed to write reg 2890 wait reg 28a2
amdgpu 0000:03:00.0: amdgpu: failed to write reg 1a6f4 wait reg 1a706
amdgpu 0000:03:00.0: amdgpu: failed to write reg 2890 wait reg 28a2
amdgpu 0000:03:00.0: amdgpu: failed to write reg 1a6f4 wait reg 1a706

Signed-off-by: Dennis Li <Dennis.Li@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 026789b466db9..30c9d60c9b515 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2524,11 +2524,11 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
 	if (adev->gmc.xgmi.num_physical_nodes > 1)
 		amdgpu_xgmi_remove_device(adev);
 
-	amdgpu_amdkfd_device_fini(adev);
-
 	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
 	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
 
+	amdgpu_amdkfd_device_fini(adev);
+
 	/* need to disable SMC first */
 	for (i = 0; i < adev->num_ip_blocks; i++) {
 		if (!adev->ip_blocks[i].status.hw)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
