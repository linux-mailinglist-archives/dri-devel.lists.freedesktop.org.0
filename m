Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87537BE8FD0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91DF10EC38;
	Fri, 17 Oct 2025 13:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="exPbmHCl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7817A10EC38
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:47:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9AA2D63D5B;
 Fri, 17 Oct 2025 13:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108FBC4CEF9;
 Fri, 17 Oct 2025 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760708877;
 bh=lmMQtoUVkjlboGNHSh7UdnBd5C5+17GyMOAaWbzaAo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=exPbmHClsb3TSS2uax9m1RD+XQgcAB2hQDFpyM7lRsISUm9kcDFpXtl3M7s7avy2H
 p/a/UZ1Q0v7nW03rl85mmUVA/BpajMbVV3BZVxVa7ZlxMErGhPrMtsnRhsnKkuAdA7
 Hg12ICNNzLyOLlfld1uYq/pdGBC8JbDjqxm06Zrf0vIZBMZH1mIhtANQlx2OaZc16w
 3A8WSc2gGs7lu8ovCt/KhorlRO2XsPe1CaSILISNbzThlvJVdQqvKsCFCkcYXuUO97
 ozinWF0rJ4JDHmZO/nWe6afU4W7BOhLNL/2I5PKwr7uy3V3ZPmcH0PowftgsljstjB
 lmp9kVWCClG4w==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 3/3] drm/sched: Add TODO entry for missing runqueue locks
Date: Fri, 17 Oct 2025 15:47:03 +0200
Message-ID: <20251017134716.187723-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251017134716.187723-2-phasta@kernel.org>
References: <20251017134716.187723-2-phasta@kernel.org>
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
index 6a06e2858dd6..f4b5bee8e3eb 100644
--- a/drivers/gpu/drm/scheduler/TODO
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -25,3 +25,16 @@
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

