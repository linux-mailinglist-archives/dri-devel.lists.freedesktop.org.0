Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35044FCA46
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4701910FB19;
	Tue, 12 Apr 2022 00:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706AB10FB17;
 Tue, 12 Apr 2022 00:51:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1462EB819BC;
 Tue, 12 Apr 2022 00:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5E7C385A3;
 Tue, 12 Apr 2022 00:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724664;
 bh=kqCp4Kd1Dcil/DNJrkrnFjYds6a3mXSl6nnJmBPCzWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fRQendN9B1E8LPmQhM3hZ13VdYxFA/G8FIrLLKkIwAULF2IIrvdB4bhCzsKCOjJzu
 6JpTA2a51CV0/fun8aqZfyqNBIemHI3ZpGSjgOBiYRYOE/yyQnfXsAyH04feAglobM
 4Eh6XozLbhE/3brKktYojK1q8ndHwyWkAiZj+IWTp4gIY4VY23NyfYWrSg0H9U59Tz
 vvK5HQRNwfNYWkew1tdtzHGt7KAMXv4RaCLHGYiUHiuEIHvrTQcKBR82GDATkdigyG
 jRMFWxZr7CScErr95d+bnqIFcgdGa1ZceV02OBeQoHUROkwRCwWO6rOlWaq5ilYx9A
 2gpUFq3mx+DUw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 04/21] drm/amdkfd: Fix Incorrect VMIDs passed to
 HWS
Date: Mon, 11 Apr 2022 20:50:23 -0400
Message-Id: <20220412005042.351105-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412005042.351105-1-sashal@kernel.org>
References: <20220412005042.351105-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, solomon.chiu@amd.com,
 Tushar Patel <tushar.patel@amd.com>, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tushar Patel <tushar.patel@amd.com>

[ Upstream commit b7dfbd2e601f3fee545bc158feceba4f340fe7cf ]

Compute-only GPUs have more than 8 VMIDs allocated to KFD. Fix
this by passing correct number of VMIDs to HWS

v2: squash in warning fix (Alex)

Signed-off-by: Tushar Patel <tushar.patel@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 11 +++--------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e8e172010416..ffd754713522 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -633,7 +633,7 @@ MODULE_PARM_DESC(sched_policy,
  * Maximum number of processes that HWS can schedule concurrently. The maximum is the
  * number of VMIDs assigned to the HWS, which is also the default.
  */
-int hws_max_conc_proc = 8;
+int hws_max_conc_proc = -1;
 module_param(hws_max_conc_proc, int, 0444);
 MODULE_PARM_DESC(hws_max_conc_proc,
 	"Max # processes HWS can execute concurrently when sched_policy=0 (0 = no concurrency, #VMIDs for KFD = Maximum(default))");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index ad9483b9eea3..60ee1a832112 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -609,15 +609,10 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 			- kfd->vm_info.first_vmid_kfd + 1;
 
 	/* Verify module parameters regarding mapped process number*/
-	if ((hws_max_conc_proc < 0)
-			|| (hws_max_conc_proc > kfd->vm_info.vmid_num_kfd)) {
-		dev_err(kfd_device,
-			"hws_max_conc_proc %d must be between 0 and %d, use %d instead\n",
-			hws_max_conc_proc, kfd->vm_info.vmid_num_kfd,
-			kfd->vm_info.vmid_num_kfd);
+	if (hws_max_conc_proc >= 0)
+		kfd->max_proc_per_quantum = min((u32)hws_max_conc_proc, kfd->vm_info.vmid_num_kfd);
+	else
 		kfd->max_proc_per_quantum = kfd->vm_info.vmid_num_kfd;
-	} else
-		kfd->max_proc_per_quantum = hws_max_conc_proc;
 
 	/* Allocate global GWS that is shared by all KFD processes */
 	if (hws_gws_support && amdgpu_amdkfd_alloc_gws(kfd->kgd,
-- 
2.35.1

