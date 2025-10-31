Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC45C25F9C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1A110EBDE;
	Fri, 31 Oct 2025 16:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HBCeAMuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CFA10EBDE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761926607;
 bh=veo2zlVCjfXFZK70fght+rqXshKNpLBjW0fqnBpC6W8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HBCeAMuQw+115yBs+1a3KTEbENLRLZr53jveNU7gjPdL6umQoD6y32+f09ez2+HpW
 M4UWI+ayHeJ+XC6il+LwcwjMcAwEoBJyQ8rHsDl0jlZmR74Tx+IfR53BqtpmUZQyGA
 o/u6N2f6nCYBKvtJ+V6Mv0KfhUQzVqK9rnZoHTuZKX3fagIAZrnLrUkQo4HPuVEsvE
 9pIJ/jJ6FX3jBES+j3m9PpCQYCOATtReTQ4+Uhl15WkotWSSUI+6nfiGfMLC9MXjIj
 /q6CVveUwMrtVlQRJMZqyAKN4Rs3W0BQu2nnRQDQG5OLm4hRsvD8fOQYakNByx79Ak
 iGpAXLdyAUdDg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A3B9717E139C;
 Fri, 31 Oct 2025 17:03:27 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 2/2] drm/panthor: Fix group_free_queue() for partially
 initialized queues
Date: Fri, 31 Oct 2025 17:03:18 +0100
Message-ID: <20251031160318.832427-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031160318.832427-1-boris.brezillon@collabora.com>
References: <20251031160318.832427-1-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

group_free_queue() can be called on a partially initialized queue
object if something fails in group_create_queue(). Make sure we don't
call drm_sched_entity_destroy() on an entity that hasn't been
initialized.

v2:
- Fix typos
- Add R-b

Fixes: 7d9c3442b02a ("drm/panthor: Defer scheduler entitiy destruction to queue release")
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 33e04208db31..e0f5b9171320 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -913,7 +913,8 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 	if (IS_ERR_OR_NULL(queue))
 		return;
 
-	drm_sched_entity_destroy(&queue->entity);
+	if (queue->entity.fence_context)
+		drm_sched_entity_destroy(&queue->entity);
 
 	if (queue->scheduler.ops)
 		drm_sched_fini(&queue->scheduler);
-- 
2.51.0

