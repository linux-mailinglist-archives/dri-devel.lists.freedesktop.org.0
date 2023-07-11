Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F04F74F9D7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 23:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B9610E43E;
	Tue, 11 Jul 2023 21:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802ED10E43E;
 Tue, 11 Jul 2023 21:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WzTNgc8vMEis87Hj/iirVJV1cpCA51tiCMdAX2SlFNM=; b=SEXnvZaJfsA0QKs6gClIojECCK
 bvxgfKyKHkDq9dKFqCt7+1ZJ+W8nSv4DQPbeUDnyA2c/FtLmUVRh4/IKdGhR2zXSnjp8h7F/Lm9YL
 r2AywIcLF8Vw3PstpFkDK0LLf90vP3tSzHZqEfa01ZXVYNwZt8KIMt5TcpHEfWjVHxwdL3DMVNSzb
 6+6OSWuU5V8lG9KiodvyL0P+kRoBqx7nfgSsFQnrqDcpNIPzomIViwcQe6efExSRhneh4lui4kKMI
 /f3u4B0J/r1W9XG98j2AQ++gIdORNs1DnwGuNJ49VdLvzr9joTeGHAEv8LwopTzTBNF0+0Yxi9Tcd
 lH2DB2/w==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qJL1Y-00Cl0M-2x; Tue, 11 Jul 2023 23:35:56 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/amdgpu: Log IBs and ring name at coredump
Date: Tue, 11 Jul 2023 18:35:00 -0300
Message-ID: <20230711213501.526237-6-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711213501.526237-1-andrealmeid@igalia.com>
References: <20230711213501.526237-1-andrealmeid@igalia.com>
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

Log the IB addresses used by the hung job along with the stuck ring
name. Note that due to nested IBs, the one that caused the reset itself
may be in not listed address.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 31 +++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index e1cc83a89d46..cfeaf93934fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1086,6 +1086,9 @@ struct amdgpu_coredump_info {
 	struct amdgpu_task_info         reset_task_info;
 	struct timespec64               reset_time;
 	bool                            reset_vram_lost;
+	u64				*ibs;
+	u32				num_ibs;
+	char				ring_name[16];
 };
 #endif
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7449aead1e13..38d03ca7a9fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5008,12 +5008,24 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
 				   coredump->adev->reset_dump_reg_value[i]);
 	}
 
+	if (coredump->num_ibs) {
+		drm_printf(&p, "IBs:\n");
+		for (i = 0; i < coredump->num_ibs; i++)
+			drm_printf(&p, "\t[%d] 0x%llx\n", i, coredump->ibs[i]);
+	}
+
+	if (coredump->ring_name[0] != '\0')
+		drm_printf(&p, "ring name: %s\n", coredump->ring_name);
+
 	return count - iter.remain;
 }
 
 static void amdgpu_devcoredump_free(void *data)
 {
-	kfree(data);
+	struct amdgpu_coredump_info *coredump = data;
+
+	kfree(coredump->ibs);
+	kfree(coredump);
 }
 
 static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
@@ -5021,6 +5033,8 @@ static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
 {
 	struct amdgpu_coredump_info *coredump;
 	struct drm_device *dev = adev_to_drm(adev);
+	struct amdgpu_job *job = reset_context->job;
+	int i;
 
 	coredump = kmalloc(sizeof(*coredump), GFP_KERNEL);
 
@@ -5038,6 +5052,21 @@ static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
 
 	coredump->adev = adev;
 
+	if (job && job->num_ibs) {
+		struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
+		u32 num_ibs = job->num_ibs;
+
+		coredump->ibs = kmalloc_array(num_ibs, sizeof(coredump->ibs), GFP_KERNEL);
+		if (coredump->ibs)
+			coredump->num_ibs = num_ibs;
+
+		for (i = 0; i < coredump->num_ibs; i++)
+			coredump->ibs[i] = job->ibs[i].gpu_addr;
+
+		if (ring)
+			strncpy(coredump->ring_name, ring->name, 16);
+	}
+
 	ktime_get_ts64(&coredump->reset_time);
 
 	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
-- 
2.41.0

