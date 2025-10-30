Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF581C1F9BC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 11:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA9A10E8E1;
	Thu, 30 Oct 2025 10:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VXQu60U0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755CE10E8E1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 10:42:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B486416B4;
 Thu, 30 Oct 2025 10:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C382FC4CEFD;
 Thu, 30 Oct 2025 10:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761820973;
 bh=F/f+RWP9fwyYDOn+3d4o1ZB3ZqbyAoBpoxM/PzubWPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VXQu60U0nG3c8cO44lOHxE7TcPKEwP6oEC+fULdsoDahypPowOlaKDtGgI9Ya2t2g
 XjYYSKt+TotIhfLPlj8AfBxg0SYhum+YkS8+xNvKy5hwiaVdB41W50Iz5vbVyE3FwZ
 s0lEtvuy41Dj8ypR6B4c68K0dOLT/+4Ngv/GEpwDd75npu64yogxo7sf7pBQu5eqH/
 CTD2ekWuV6xpX8oN3SkRnMoskVMtUm3f0UqdUBnHWCUhWnFpS+5cACEjtUK3kEZjCm
 SRa1SoZvii+B6pHGXjnTxwYWl5VcuOTkpNVnB4uFInqv2blm4/+QBU+yEDkM10i7gb
 jHgrqBYAmFdpw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Melissa Wen <mwen@igalia.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH 2/2] drm/sched: Use proper locks for drm_sched_job_init()
Date: Thu, 30 Oct 2025 11:42:20 +0100
Message-ID: <20251030104219.181704-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251030104219.181704-2-phasta@kernel.org>
References: <20251030104219.181704-2-phasta@kernel.org>
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

drm_sched_job_init() is just racing when checking an entity's runqueue, without
taking the proper spinlock.

Add the lock.

Cc: stable@vger.kernel.org # 6.7+
Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7f938f491b6f..30028054385f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -799,7 +799,12 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       u32 credits, void *owner,
 		       uint64_t drm_client_id)
 {
-	if (!entity->rq) {
+	struct drm_sched_rq *rq;
+
+	spin_lock(&entity->lock);
+	rq = entity->rq;
+	spin_unlock(&entity->lock);
+	if (!rq) {
 		/* This will most likely be followed by missing frames
 		 * or worse--a blank screen--leave a trail in the
 		 * logs, so this can be debugged easier.
-- 
2.49.0

