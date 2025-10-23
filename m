Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186D1C01C5F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4A910E902;
	Thu, 23 Oct 2025 14:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jxQNZnH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C89C10E902
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:30:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E918F4AED9;
 Thu, 23 Oct 2025 14:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FF1C116D0;
 Thu, 23 Oct 2025 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761229850;
 bh=LbOep4u6dGmMx3E06SFB+2sU4wVXqcLPOLAVpCN4zb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jxQNZnH1Iuq3NQom6PZ+X6LwQYE4XRNMIYyz/q4+d+zNT29CuV0rtNMiE7kJGLTSp
 58GHiiXK8Dyw74JqZpPaGVsAzD8SReMcho77UlDJ3AmggupP63+XBuUCFGja1pIouk
 qFbzWbAcnbzagGrd1XNtCbdR2pAAyP+YEe7HHIOAR+FfLCArmDC9aaEOYrqz2XBqZY
 1r/8FUTqCjUYqhkjIIBRC2pvALZRoQAfcj4QyDo9XUHHgAvRnmQxQY4R0LeAM46uqK
 weFuvTqGxYrV8QXS9jylqEQ8veBwmtWYX0TUm6SzdN8TGjXvGp1LjblqHmzrWyBO2I
 ci9Qk5MX8T5WQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 4/4] drm/sched: Add TODO entry for missing runqueue locks
Date: Thu, 23 Oct 2025 16:30:31 +0200
Message-ID: <20251023143031.149496-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023143031.149496-2-phasta@kernel.org>
References: <20251023143031.149496-2-phasta@kernel.org>
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

struct drm_sched_rq is not being locked at many places throughout the
scheduler, at least for readers. This was documented in a FIXME added
in:

commit 981b04d96856 ("drm/sched: improve docs around drm_sched_entity")

Add a TODO entry for that problem.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/TODO | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/TODO b/drivers/gpu/drm/scheduler/TODO
index 713dd62c58da..263ce2deb69a 100644
--- a/drivers/gpu/drm/scheduler/TODO
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -36,3 +36,16 @@
 	3. Port a driver as first user.
 	3. Document the new alternative in the docu of deprecated
 	   drm_sched_resubmit_jobs().
+
+* Unlocked readers for runqueues
+  - Difficulty: medium
+  - Contact: Philipp Stanner <phasta@kernel.org>
+  - Description:
+    There is an old FIXME by Sima in include/drm/gpu_scheduler.h. It details
+    that struct drm_sched_rq is read at many places without any locks, not even
+    with a READ_ONCE. At XDC 2025 no one could really tell why that is the case,
+    whether locks are needed and whether they could be added. (But for real,
+    that should probably be locked!).
+  - Tasks:
+	1. Check whether locks for runqueue readers can be added.
+	2. If yes, add the locks.
-- 
2.49.0

