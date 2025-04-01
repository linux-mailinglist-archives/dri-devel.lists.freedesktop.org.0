Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5EA775C0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 09:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF9410E03E;
	Tue,  1 Apr 2025 07:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hK5HCxH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB3810E509
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743494235;
 bh=OKFZdqeQq6hBjg7dyZWhat15VRZAsjtAPIGumsh+dcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hK5HCxH2VvFk1IWcj8esrttm0yui3lZe6Ef3eag+x9BJyOVe7YPsxBolA5EEtjCRA
 U6ec8VFJlKDfmkGE65HGlCy5xayOJPZh387ewFJ+Kf/Ee1AG6TKy4khw3nw2FTrQ5m
 Ye2h8keM5+keGBwId36qt1HxNdS3yE1I7ftKh5t9sN0bqCiQpxOIo6Ki2kGUMOBu23
 mQrAfDEPBbWcy71Azr8ribP0kqm7kv1E3QzUhyrbtFhVQ/OOEkZoRNiJzAIXsJZ+ks
 PTIfK2zZSBlBZMkib4nm0CYCPXBmtiKgxKksF8ZxVcfhOGt1wxmO0o7k1UO9hH4P/Z
 FLXuAapsHFuBg==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E46717E0FCC;
 Tue,  1 Apr 2025 09:57:15 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 3/3] drm/panthor: Let IRQ handlers clear the interrupts
 themselves
Date: Tue,  1 Apr 2025 09:57:10 +0200
Message-ID: <20250401075710.2638950-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401075710.2638950-1-boris.brezillon@collabora.com>
References: <20250401075710.2638950-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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

MMU handler needs to be in control of the job interrupt clears because
clearing the interrupt also unblocks the writer/reader that triggered
the fault, and we don't want it to be unblocked until we've had a chance
to process the IRQ.

Since clearing the clearing is just one line, let's make it explicit
instead of doing it in the generic code path.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 2 --
 drivers/gpu/drm/panthor/panthor_fw.c     | 2 ++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 2 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..4c27b6d85f46 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -383,8 +383,6 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 		if (!status)									\
 			break;									\
 												\
-		gpu_write(ptdev, __reg_prefix ## _INT_CLEAR, status);				\
-												\
 		__handler(ptdev, status);							\
 		ret = IRQ_HANDLED;								\
 	}											\
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0f52766a3120..446bb377b953 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1008,6 +1008,8 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 
 static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
 {
+	gpu_write(ptdev, JOB_INT_CLEAR, status);
+
 	if (!ptdev->fw->booted && (status & JOB_INT_GLOBAL_IF))
 		ptdev->fw->booted = true;
 
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 671049020afa..32d678a0114e 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -150,6 +150,8 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
+	gpu_write(ptdev, GPU_INT_CLEAR, status);
+
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
 		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 7cca97d298ea..1ecb20bfbc92 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1669,6 +1669,8 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	bool has_unhandled_faults = false;
 
+	gpu_write(ptdev, MMU_INT_CLEAR, status);
+
 	status = panthor_mmu_fault_mask(ptdev, status);
 	while (status) {
 		u32 as = ffs(status | (status >> 16)) - 1;
-- 
2.48.1

