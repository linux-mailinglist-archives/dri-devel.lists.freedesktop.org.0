Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C6896CFEB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046D010E6DE;
	Thu,  5 Sep 2024 07:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="krjleK9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD5310E6DE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725519716;
 bh=syvX4V+c10AskMVHidoesQ7sCEa7FdIr0AkxDRH1oL0=;
 h=From:To:Cc:Subject:Date:From;
 b=krjleK9nepRqeCsVgI8CL6+vIt0YPmRoLQF/wLEoLKV/eS1gxfQ2BPniZ2qb5xr7T
 LIJ9o9PtDDQuWfnU4GgMNHnVGUvQ4aJYdMPH4OgK317xvi2hUXrckPhWfOWp2xMLbG
 7jzcs5dQZ5ZPYj7JGcOLURhrEkUgu1mZ4Kl4vKVKKwwyzKdxxZjUPyMy/BlDcp5+XK
 x5Xe3xqkR62pMeF+8sTxFl+HbKHICQomqZmrWu6Pc78lcpVVPyDX1qLvmoZiRlXyuz
 3UY+7az5c2HC/Olz4YDJbHL3bVCFcuKohtizItu8fo/k9pYz9bZHpIleingVPWiWnf
 aMCbBLQl2S++w==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AF2317E0F8B;
 Thu,  5 Sep 2024 09:01:56 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, stable@vger.kernel.org
Subject: [PATCH] drm/panthor: Don't add write fences to the shared BOs
Date: Thu,  5 Sep 2024 09:01:54 +0200
Message-ID: <20240905070155.3254011-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.0
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

The only user (the mesa gallium driver) is already assuming explicit
synchronization and doing the export/import dance on shared BOs. The
only reason we were registering ourselves as writers on external BOs
is because Xe, which was the reference back when we developed Panthor,
was doing so. Turns out Xe was wrong, and we really want bookkeep on
all registered fences, so userspace can explicitly upgrade those to
read/write when needed.

Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 9a0ff48f7061..41260cf4beb8 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3423,13 +3423,8 @@ void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *sched
 {
 	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
 
-	/* Still not sure why we want USAGE_WRITE for external objects, since I
-	 * was assuming this would be handled through explicit syncs being imported
-	 * to external BOs with DMA_BUF_IOCTL_IMPORT_SYNC_FILE, but other drivers
-	 * seem to pass DMA_RESV_USAGE_WRITE, so there must be a good reason.
-	 */
 	panthor_vm_update_resvs(job->group->vm, exec, &sched_job->s_fence->finished,
-				DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
+				DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 void panthor_sched_unplug(struct panthor_device *ptdev)
-- 
2.46.0

