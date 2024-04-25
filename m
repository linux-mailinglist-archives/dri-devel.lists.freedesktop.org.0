Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD868B1BBA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A1010E6E2;
	Thu, 25 Apr 2024 07:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="k7q1HuEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D087B10E6E2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714029521;
 bh=Ig8jtL7MD7uV33lww1KWyPu6izlxIxSV3mRCEixswc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k7q1HuEchqsYp+gY3N8z0ufCCxZPYhs/CZcFDXMQC6tVTbSyin7wjEk2T7oxw4ZKp
 Dlh9SiVCPjh5oq9y3HeFSWWl45FYN7zD4KEJOjkUjcwY4fATEOAoRcHQI9WNM90Bpz
 vClxC3EDtwnBkIoaT3aU3xVQtqkc1JWkdVfI+edhUIBjYaYSWEuMyb/Z+D4+aqZxgy
 sPAZi4SgtduPB9ryd1lE3nVtGQLB/8/eavVLIsFwC57yNJ63RWnnhHa3lmEyCgdgrq
 1WUyBHUf+3wkkJn1ZenFlfho876avx2gd7fyfyExc0jRhK10wmuQp6pY40kHJ9meLR
 pre0aNmrtoDpw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E157C378215C;
 Thu, 25 Apr 2024 07:18:40 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 Antonino Maniscalco <antonino.maniscalco@collabora.com>,
 kernel@collabora.com
Subject: [PATCH 1/3] drm/panthor: Fix tiler OOM handling to allow incremental
 rendering
Date: Thu, 25 Apr 2024 09:18:35 +0200
Message-ID: <20240425071837.529039-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425071837.529039-1-boris.brezillon@collabora.com>
References: <20240425071837.529039-1-boris.brezillon@collabora.com>
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

From: Antonino Maniscalco <antonino.maniscalco@collabora.com>

If the kernel couldn't allocate memory because we reached the maximum
number of chunks but no render passes are in flight
(panthor_heap_grow() returning -ENOMEM), we should defer the OOM
handling to the FW by returning a NULL chunk. The FW will then call
the tiler OOM exception handler, which is supposed to implement
incremental rendering (execute an intermediate fragment job to flush
the pending primitives, release the tiler memory that was used to
store those primitives, and start over from where it stopped).

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Antonino Maniscalco <antonino.maniscalco@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b3a51a6de523..6de8c0c702cb 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1354,7 +1354,13 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
 					pending_frag_count, &new_chunk_va);
 	}
 
-	if (ret && ret != -EBUSY) {
+	/* If the kernel couldn't allocate memory because we reached the maximum
+	 * number of chunks (EBUSY if we have render passes in flight, ENOMEM
+	 * otherwise), we want to let the FW try to reclaim memory by waiting
+	 * for fragment jobs to land or by executing the tiler OOM exception
+	 * handler, which is supposed to implement incremental rendering.
+	 */
+	if (ret && ret != -EBUSY && ret != -ENOMEM) {
 		drm_warn(&ptdev->base, "Failed to extend the tiler heap\n");
 		group->fatal_queues |= BIT(cs_id);
 		sched_queue_delayed_work(sched, tick, 0);
-- 
2.44.0

