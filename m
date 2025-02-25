Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25BA4404F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE7010E166;
	Tue, 25 Feb 2025 13:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CuF6w+6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF1F10E166
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:14:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1EDC25C6C2E;
 Tue, 25 Feb 2025 13:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0CBC4CEE6;
 Tue, 25 Feb 2025 13:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740489255;
 bh=Bhp6PbDhhFe8mAEBp5rNuHjMn4cQ68XhArMiM1W9hj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CuF6w+6qjVigVJZkDmwvBn+Sx0iSbeYdO3MCwdWUTqRqVnmB/Sa73RJxdyOAGddx6
 7MaoMF9M6pCNdUMUTp8DN13Hr+8r5/lyD3JQzUB5b5hZzk6lx99S709IlWHBU/PEtb
 dQA0X66Sa2KZVPtqaelKrLSaSWk2l6IeIA7FtFD4gmTq9dOlRlf2Zy3kd/LTw5IuDQ
 hFl8mOkROADnvSQ28J26FI0NjHGRGfsgpOY5HmIKDUEOP9LPrdJP51L3EsEK52+olv
 mM4HybygvF33tv3gCLBjEuGrZc60hvIrFoEFjwx11lp5udtrNK2bM5n8DeapERGV+P
 oBn0EXSCcgtCg==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/sched: Remove kthread header
Date: Tue, 25 Feb 2025 14:13:34 +0100
Message-ID: <20250225131332.83415-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225131332.83415-2-phasta@kernel.org>
References: <20250225131332.83415-2-phasta@kernel.org>
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

The kthread header doesn't need to be included anymore. It's a relict
from the days when the scheduler was still using a kthread instead of
workqueues.

Remove the unneeded includes.

Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
I'm not sure whether we should Cc the stable kernel. It's inconvenient
and makes build times slower, but isn't really a bug.
---
 drivers/gpu/drm/scheduler/sched_entity.c | 1 -
 drivers/gpu/drm/scheduler/sched_fence.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f9811420c787..e55b98af8a50 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -21,7 +21,6 @@
  *
  */
 
-#include <linux/kthread.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
 
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index e971528504a5..d6239e015b66 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -21,7 +21,6 @@
  *
  */
 
-#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-- 
2.48.1

