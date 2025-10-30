Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D647C1F009
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEACE10E897;
	Thu, 30 Oct 2025 08:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l0zNwIi0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD2810E897
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761813296;
 bh=peljNprcvxi6XRk4kC8LDnOTbjB1tFfz4WmUw7O5TDM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l0zNwIi0mCCFh3UE5+9zkg2ouoVvRWRM0JCNpjbFGkUVuII1l7wWbTL6dO5cCrrXW
 lSxwXoPFSuZpivq1luJlFlvhNwAl18RppZpR9XGqEAwg4YBu0rft8r1i4ZNOCeLDel
 qNufArjWhwT5H9KnygSZdG0pAxTRnybM0vLTOW9GgYs/upAyt27k11W3jtyNaNz8s3
 VRlf6rpbJOSF05xBYX8A3KcNZ1Dk5mMXOg6TeZFhLJoqU6nD41p1lNDfBHJPda4Rvm
 pnQ4sQRtlIA8kUXtQfxq2zOQ4oTsSky8BvWd4UneVa+4I7Y56Etdthih57CQUNjSEE
 y4gqJeh5ih/2w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 27BA117E0154;
 Thu, 30 Oct 2025 09:34:56 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 2/2] drm/panthor: Fix group_free_queue() for partially
 initialized queues
Date: Thu, 30 Oct 2025 09:34:46 +0100
Message-ID: <20251030083446.162990-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030083446.162990-1-boris.brezillon@collabora.com>
References: <20251030083446.162990-1-boris.brezillon@collabora.com>
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

group_free_queue() can be called on a partially initialized queue
object if something fails group_create_queue(). Make sure we don't
call drm_sched_entity_destroy() on a entity that hasn't been
initialized.

Fixes: 7d9c3442b02a ("drm/panthor: Defer scheduler entitiy destruction to queue release")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a0a31aa6c6bc..552542f70cab 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -886,7 +886,8 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 	if (IS_ERR_OR_NULL(queue))
 		return;
 
-	drm_sched_entity_destroy(&queue->entity);
+	if (queue->entity.fence_context)
+		drm_sched_entity_destroy(&queue->entity);
 
 	if (queue->scheduler.ops)
 		drm_sched_fini(&queue->scheduler);
-- 
2.51.0

