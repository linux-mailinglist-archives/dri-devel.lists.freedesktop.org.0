Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7438366B6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10010F320;
	Mon, 22 Jan 2024 15:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2F410F320;
 Mon, 22 Jan 2024 15:06:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C633ACE2B22;
 Mon, 22 Jan 2024 15:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D763C43399;
 Mon, 22 Jan 2024 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935998;
 bh=t4szPEH73ERPUcFP+yabDVdAL8MA+TsN97r2lOYwNvA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ljIxy1dN2RTA+h6A4CssR3L3btDn2i5Rsz6wXQ6zlGiS9p5cAVMRGmYa+qt1fmXw0
 4nndERyYapSlXPNADiGXcKOf5D8U0f9ZF9tLDZoAYoRgkFTM9AcPbhMd++j0pMaiI4
 5Rf/ArWI9Yov8KGmzgqzeliOosx8XTb5QkviSrxha9kYO0C5zKrL9fsKXZ+CIK0jMw
 gTnE9FI9/MmNViJ8sFXQkQ2owz3tUVHCaypmiEQ/ksuSM926Nqwe3qf4FArbcVyMg+
 p5aRacmFPbTlBY9B6sZRFJ4Uwye9OAx62gKd4gMZEA21q1HGsGczNPd4eYf14h/n8W
 XCzP/gimF1W9Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 45/73] drm/amdkfd: fix mes set shader debugger
 process management
Date: Mon, 22 Jan 2024 10:01:59 -0500
Message-ID: <20240122150432.992458-45-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
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
Cc: Sasha Levin <sashal@kernel.org>, Tim.Huang@amd.com, Jack.Xiao@amd.com,
 Jonathan Kim <jonathan.kim@amd.com>, guchun.chen@amd.com,
 shashank.sharma@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Alice Wong <shiwei.wong@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Eric Huang <jinhuieric.huang@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com, shaoyun.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Kim <jonathan.kim@amd.com>

[ Upstream commit bd33bb1409b494558a2935f7bbc7842def957fcd ]

MES provides the driver a call to explicitly flush stale process memory
within the MES to avoid a race condition that results in a fatal
memory violation.

When SET_SHADER_DEBUGGER is called, the driver passes a memory address
that represents a process context address MES uses to keep track of
future per-process calls.

Normally, MES will purge its process context list when the last queue
has been removed.  The driver, however, can call SET_SHADER_DEBUGGER
regardless of whether a queue has been added or not.

If SET_SHADER_DEBUGGER has been called with no queues as the last call
prior to process termination, the passed process context address will
still reside within MES.

On a new process call to SET_SHADER_DEBUGGER, the driver may end up
passing an identical process context address value (based on per-process
gpu memory address) to MES but is now pointing to a new allocated buffer
object during KFD process creation.  Since the MES is unaware of this,
access of the passed address points to the stale object within MES and
triggers a fatal memory violation.

The solution is for KFD to explicitly flush the process context address
from MES on process termination.

Note that the flush call and the MES debugger calls use the same MES
interface but are separated as KFD calls to avoid conflicting with each
other.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Tested-by: Alice Wong <shiwei.wong@amd.com>
Reviewed-by: Eric Huang <jinhuieric.huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       | 31 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       | 10 +++---
 .../amd/amdkfd/kfd_process_queue_manager.c    |  1 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h |  3 +-
 4 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 6aa75052309f..15c67fa404ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -885,6 +885,11 @@ int amdgpu_mes_set_shader_debugger(struct amdgpu_device *adev,
 	op_input.op = MES_MISC_OP_SET_SHADER_DEBUGGER;
 	op_input.set_shader_debugger.process_context_addr = process_context_addr;
 	op_input.set_shader_debugger.flags.u32all = flags;
+
+	/* use amdgpu mes_flush_shader_debugger instead */
+	if (op_input.set_shader_debugger.flags.process_ctx_flush)
+		return -EINVAL;
+
 	op_input.set_shader_debugger.spi_gdbg_per_vmid_cntl = spi_gdbg_per_vmid_cntl;
 	memcpy(op_input.set_shader_debugger.tcp_watch_cntl, tcp_watch_cntl,
 			sizeof(op_input.set_shader_debugger.tcp_watch_cntl));
@@ -904,6 +909,32 @@ int amdgpu_mes_set_shader_debugger(struct amdgpu_device *adev,
 	return r;
 }
 
+int amdgpu_mes_flush_shader_debugger(struct amdgpu_device *adev,
+				     uint64_t process_context_addr)
+{
+	struct mes_misc_op_input op_input = {0};
+	int r;
+
+	if (!adev->mes.funcs->misc_op) {
+		DRM_ERROR("mes flush shader debugger is not supported!\n");
+		return -EINVAL;
+	}
+
+	op_input.op = MES_MISC_OP_SET_SHADER_DEBUGGER;
+	op_input.set_shader_debugger.process_context_addr = process_context_addr;
+	op_input.set_shader_debugger.flags.process_ctx_flush = true;
+
+	amdgpu_mes_lock(&adev->mes);
+
+	r = adev->mes.funcs->misc_op(&adev->mes, &op_input);
+	if (r)
+		DRM_ERROR("failed to set_shader_debugger\n");
+
+	amdgpu_mes_unlock(&adev->mes);
+
+	return r;
+}
+
 static void
 amdgpu_mes_ring_to_queue_props(struct amdgpu_device *adev,
 			       struct amdgpu_ring *ring,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
index a27b424ffe00..c2c88b772361 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
@@ -291,9 +291,10 @@ struct mes_misc_op_input {
 			uint64_t process_context_addr;
 			union {
 				struct {
-					uint64_t single_memop : 1;
-					uint64_t single_alu_op : 1;
-					uint64_t reserved: 30;
+					uint32_t single_memop : 1;
+					uint32_t single_alu_op : 1;
+					uint32_t reserved: 29;
+					uint32_t process_ctx_flush: 1;
 				};
 				uint32_t u32all;
 			} flags;
@@ -369,7 +370,8 @@ int amdgpu_mes_set_shader_debugger(struct amdgpu_device *adev,
 				const uint32_t *tcp_watch_cntl,
 				uint32_t flags,
 				bool trap_en);
-
+int amdgpu_mes_flush_shader_debugger(struct amdgpu_device *adev,
+				uint64_t process_context_addr);
 int amdgpu_mes_add_ring(struct amdgpu_device *adev, int gang_id,
 			int queue_type, int idx,
 			struct amdgpu_mes_ctx_data *ctx_data,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 77649392e233..7f5aab1fb8f5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -87,6 +87,7 @@ void kfd_process_dequeue_from_device(struct kfd_process_device *pdd)
 		return;
 
 	dev->dqm->ops.process_termination(dev->dqm, &pdd->qpd);
+	amdgpu_mes_flush_shader_debugger(dev->adev, pdd->proc_ctx_gpu_addr);
 	pdd->already_dequeued = true;
 }
 
diff --git a/drivers/gpu/drm/amd/include/mes_v11_api_def.h b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
index b1db2b190187..e07e93167a82 100644
--- a/drivers/gpu/drm/amd/include/mes_v11_api_def.h
+++ b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
@@ -571,7 +571,8 @@ struct SET_SHADER_DEBUGGER {
 		struct {
 			uint32_t single_memop : 1;  /* SQ_DEBUG.single_memop */
 			uint32_t single_alu_op : 1; /* SQ_DEBUG.single_alu_op */
-			uint32_t reserved : 30;
+			uint32_t reserved : 29;
+			uint32_t process_ctx_flush : 1;
 		};
 		uint32_t u32all;
 	} flags;
-- 
2.43.0

