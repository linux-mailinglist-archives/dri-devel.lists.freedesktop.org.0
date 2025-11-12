Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC5C514EC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 10:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03DF10E00E;
	Wed, 12 Nov 2025 09:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K4jXFHSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DC610E00E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 09:19:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6696A43B61;
 Wed, 12 Nov 2025 09:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70027C2BC9E;
 Wed, 12 Nov 2025 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762939164;
 bh=TUBMdqXZtBxlRTi5nLhrFDdltLTrJzBC9flXUcPYToM=;
 h=From:To:Cc:Subject:Date:From;
 b=K4jXFHSfp/JHxBeWG/JwKzJ7dsy5723jKztLydy1AOzcFcQwwWx4mRw2rIBiUNjYs
 ug81FRU4bs38vYu0iEktCXUfRmYCwSG6nlYWoQON0WoPfHn/zsN1w7fwKBuC9a92ts
 iv7IWYJkNvKyFWTfBvKfDVf+cs2n3N91vWQ3ky4gJL01SvIY2Oun/hgJ2V/XYnnX7V
 PnDcc7aWpVEHxyUbMVWd38xLnDvDn55ZlRIt1ba5r61QB6s8g2fkj/mB+AbsjMBaWa
 6BkttLqM9OvuEg+MNTpW3uOauwxUJegsCc8ZOT4tFJZmvoGeD3Y3HjXIJ+QQ6i6ses
 KH0p1iR5Qiu+A==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/sched: Don't crash kernel on wrong params
Date: Wed, 12 Nov 2025 10:18:53 +0100
Message-ID: <20251112091851.104443-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

drm_sched_job_arm() just panics the kernel with BUG_ON() in case of an
entity being NULL. If the entity is NULL, subsequent accesses will crash
the particular CPU anyways with a NULL pointer exception backtrace.

Remove the BUG_ON().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Drop BUG_ON() instead of replacing it. (Tvrtko)
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1d4f1b822e7b..05eb50d4cf08 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -857,7 +857,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_entity *entity = job->entity;
 
-	BUG_ON(!entity);
 	drm_sched_entity_select_rq(entity);
 	sched = entity->rq->sched;
 
-- 
2.49.0

