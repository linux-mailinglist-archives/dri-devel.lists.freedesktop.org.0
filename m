Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A1AC8917C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB9810E593;
	Wed, 26 Nov 2025 09:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OmLzJXKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943B510E58C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764150639;
 bh=56y5FAyr8SGLf4Jo38H73C1qCbS10q9zQ2BBIEO/VKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OmLzJXKyCzY1F8niePcytlRkeMp1/5EKnCoCCyFoygtDi7TfwfrSEOY1ad8y+LJZK
 nZmdfN2eUYWgazYDXiRvja4gJlmpKHcTcK/NttLdQC1PhyvaeB+V5CaW9aFvfbC28A
 3On8TrFfVohbe6FI0h9+Qpr/GGXRMySqYvlmgf+/i5ga/PnGuRZdL2LLkRkKaEAZVJ
 moXqxpuATBAmcH/WsgVwpacuRRk1AVmzneR3HIy6CeZAwxlIoUSL85hZPmJgd31Dr7
 Undl3hf4LyECdPdZZIPg0SPQLGbaXV184N3tfBbmHFZIWqSiZj0TOMXa2Qojd1ec9b
 M3TnG3K83sVqQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DDDD417E12C5;
 Wed, 26 Nov 2025 10:50:38 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
Subject: [PATCH v3 1/6] drm/panthor: Always wait after sending a command to an
 AS
Date: Wed, 26 Nov 2025 10:50:24 +0100
Message-ID: <20251126095029.3579267-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126095029.3579267-1-boris.brezillon@collabora.com>
References: <20251126095029.3579267-1-boris.brezillon@collabora.com>
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

There's currently no situation where we want to issue a command to an
AS and not wait for this command to complete. The wait is either
explicitly done (LOCK, UNLOCK) or it's missing (UPDATE). So let's
turn write_cmd() into as_send_cmd_and_wait() that has the wait after
a command is sent.

v2:
- New patch

v3:
- Collect R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6a41dfd7aaf3..186048fc2c25 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -524,27 +524,29 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
 	return ret;
 }
 
-static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
+static int as_send_cmd_and_wait(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
 {
 	int status;
 
 	/* write AS_COMMAND when MMU is ready to accept another command */
 	status = wait_ready(ptdev, as_nr);
-	if (!status)
+	if (!status) {
 		gpu_write(ptdev, AS_COMMAND(as_nr), cmd);
+		status = wait_ready(ptdev, as_nr);
+	}
 
 	return status;
 }
 
-static void lock_region(struct panthor_device *ptdev, u32 as_nr,
-			u64 region_start, u64 size)
+static int lock_region(struct panthor_device *ptdev, u32 as_nr,
+		       u64 region_start, u64 size)
 {
 	u8 region_width;
 	u64 region;
 	u64 region_end = region_start + size;
 
 	if (!size)
-		return;
+		return 0;
 
 	/*
 	 * The locked region is a naturally aligned power of 2 block encoded as
@@ -567,7 +569,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 
 	/* Lock the region that needs to be updated */
 	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
-	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
+	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
@@ -600,9 +602,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	 * power it up
 	 */
 
-	lock_region(ptdev, as_nr, iova, size);
-
-	ret = wait_ready(ptdev, as_nr);
+	ret = lock_region(ptdev, as_nr, iova, size);
 	if (ret)
 		return ret;
 
@@ -615,10 +615,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	 * at the end of the GPU_CONTROL cache flush command, unlike
 	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
 	 */
-	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
-
-	/* Wait for the unlock command to complete */
-	return wait_ready(ptdev, as_nr);
+	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UNLOCK);
 }
 
 static int mmu_hw_do_operation(struct panthor_vm *vm,
@@ -647,7 +644,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
 	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
 
-	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
+	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
 
 static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
@@ -662,7 +659,7 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
 	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
-	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
+	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
 
 static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)
-- 
2.51.1

