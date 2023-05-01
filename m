Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E16F366A
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F60B10E442;
	Mon,  1 May 2023 18:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BAE10E260;
 Mon,  1 May 2023 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YEdOtdbcHwlpnBf3DukWHazJczyGepCiUzsZWgTu7yE=; b=dWAH8Mkv/D7whegou8NnfURdnk
 QJuu/BFYkVD4SbytFwh1IaQoMvagK3hE3DXuJHX8saatNM6CHRWJdYLNp/NfkOC0SvOZtXzORZIhB
 E0FyrlEUTu56SqBT5LbpmUbcLPKeG5xrKsu2wV15l88dHCjCaer6gtkIS+/5FUnv6OUWHPDJ/DL3L
 GCU15JzlKbPUXT/S1E8YZkNmxccxdFYfKhfWJh5+75N3sopW2C51liYpQeQ3UjDrLrBrcGXK7gfiZ
 YIU36XGlYLRZDLVT0roSQeeB15+0hCVxEZ7cyNdG+VsDIlIyb33rJ3KeFJrhrTLnSQEPn/Fa0BQG+
 LUcxu2vA==;
Received: from [179.113.250.147] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ptYjS-00H3BT-1f; Mon, 01 May 2023 20:58:42 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] drm/amdgpu: Add interface to dump guilty IB on GPU
 hang
Date: Mon,  1 May 2023 15:57:47 -0300
Message-Id: <20230501185747.33519-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501185747.33519-1-andrealmeid@igalia.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an interface to point out to userspace the guilty indirect buffer
when a GPU reset happens, so the usermode driver can dump just the right
IB for debug investigation.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c  |  7 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c   | 29 ++++++++++++++++++++++++
 include/uapi/drm/amdgpu_drm.h            |  7 ++++++
 7 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 02b827785e39..89345e49ba20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1050,6 +1050,9 @@ struct amdgpu_device {
 
 	bool                            job_hang;
 	bool                            dc_enabled;
+
+	/* TODO: Maybe this should be a per-ring info */
+	struct drm_amdgpu_info_guilty_app	info;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b400d598b75a..818bcd2c9b5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -110,9 +110,10 @@
  *   3.52.0 - Add AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD, add device_info fields:
  *            tcp_cache_size, num_sqc_per_wgp, sqc_data_cache_size, sqc_inst_cache_size,
  *            gl1c_cache_size, gl2c_cache_size, mall_size, enabled_rb_pipes_mask_hi
+ *   3.53.0 - Add AMDGPU_INFO_GUILTY_APP IOCTL
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	52
+#define KMS_DRIVER_MINOR	53
 #define KMS_DRIVER_PATCHLEVEL	0
 
 unsigned int amdgpu_vram_limit = UINT_MAX;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c3d9d75143f4..a15162f8c812 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -48,6 +48,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		return DRM_GPU_SCHED_STAT_ENODEV;
 	}
 
+	if (ring->funcs->get_reset_data)
+		ring->funcs->get_reset_data(ring, job);
+
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 	adev->job_hang = true;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index a5bae7eb993a..dc6cc94b6847 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1149,6 +1149,13 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		return copy_to_user(out, max_ibs,
 				    min((size_t)size, sizeof(max_ibs))) ? -EFAULT : 0;
 	}
+	case AMDGPU_INFO_GUILTY_APP: {
+		struct drm_amdgpu_info_guilty_app info;
+		info.ib_addr = adev->info.ib_addr;
+		info.vmid = adev->info.vmid;
+		info.ib_size = adev->info.ib_size;
+		return copy_to_user(out, &info, min((size_t)size, sizeof(info))) ? -EFAULT : 0;
+	}
 	default:
 		DRM_DEBUG_KMS("Invalid request %d\n", info->query);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 8eca6532ed19..0993c7ec74c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -227,6 +227,7 @@ struct amdgpu_ring_funcs {
 	int (*preempt_ib)(struct amdgpu_ring *ring);
 	void (*emit_mem_sync)(struct amdgpu_ring *ring);
 	void (*emit_wave_limit)(struct amdgpu_ring *ring, bool enable);
+	void (*get_reset_data)(struct amdgpu_ring *ring, struct amdgpu_job *job);
 };
 
 struct amdgpu_ring {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 8bd07ff59671..12763ff8c83c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -9226,6 +9226,34 @@ static void gfx_v10_0_emit_mem_sync(struct amdgpu_ring *ring)
 	amdgpu_ring_write(ring, gcr_cntl); /* GCR_CNTL */
 }
 
+static void gfx_v10_0_get_reset_data(struct amdgpu_ring *ring,
+				     struct amdgpu_job *job)
+{
+	int i;
+
+	struct amdgpu_device *adev = ring->adev;
+	u64 ib_addr;
+	u32 ib_addr_lo;
+
+	ib_addr = RREG32_SOC15(GC, 0, mmCP_IB1_BASE_HI);
+	ib_addr = ib_addr << 32;
+	ib_addr_lo = RREG32_SOC15(GC, 0, mmCP_IB1_BASE_LO);
+	ib_addr += ib_addr_lo;
+
+	adev->info.ib_addr = ib_addr;
+	adev->info.vmid = job->vmid;
+
+	for (i = 0; i < job->num_ibs; i++) {
+		if (lower_32_bits(job->ibs[i].gpu_addr) == ib_addr_lo) {
+			adev->info.ib_size = job->ibs[i].length_dw;
+			break;
+		}
+	}
+
+	DRM_INFO("Guilty app info: IB addr 0x%llx IB size 0x%x VM id %u",
+		  adev->info.ib_addr, adev->info.ib_size, adev->info.vmid);
+}
+
 static const struct amd_ip_funcs gfx_v10_0_ip_funcs = {
 	.name = "gfx_v10_0",
 	.early_init = gfx_v10_0_early_init,
@@ -9297,6 +9325,7 @@ static const struct amdgpu_ring_funcs gfx_v10_0_ring_funcs_gfx = {
 	.emit_reg_write_reg_wait = gfx_v10_0_ring_emit_reg_write_reg_wait,
 	.soft_recovery = gfx_v10_0_ring_soft_recovery,
 	.emit_mem_sync = gfx_v10_0_emit_mem_sync,
+	.get_reset_data = gfx_v10_0_get_reset_data,
 };
 
 static const struct amdgpu_ring_funcs gfx_v10_0_ring_funcs_compute = {
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 6981e59a9401..4136d04bfb57 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -878,6 +878,7 @@ struct drm_amdgpu_cs_chunk_data {
 	#define AMDGPU_INFO_VIDEO_CAPS_ENCODE		1
 /* Query the max number of IBs per gang per submission */
 #define AMDGPU_INFO_MAX_IBS			0x22
+#define AMDGPU_INFO_GUILTY_APP			0x23
 
 #define AMDGPU_INFO_MMR_SE_INDEX_SHIFT	0
 #define AMDGPU_INFO_MMR_SE_INDEX_MASK	0xff
@@ -1195,6 +1196,12 @@ struct drm_amdgpu_info_video_caps {
 	struct drm_amdgpu_info_video_codec_info codec_info[AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_COUNT];
 };
 
+struct drm_amdgpu_info_guilty_app {
+	__u64 ib_addr;
+	__u32 ib_size;
+	__u32 vmid;
+};
+
 /*
  * Supported GPU families
  */
-- 
2.40.1

