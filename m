Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB1097E9F9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97B210E3D4;
	Mon, 23 Sep 2024 10:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5433C10E3D4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 10:34:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67A1BFEC;
 Mon, 23 Sep 2024 03:34:59 -0700 (PDT)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50CF23F71A;
 Mon, 23 Sep 2024 03:34:29 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panthor: Fix race when converting group handle to group
 object
Date: Mon, 23 Sep 2024 11:34:06 +0100
Message-Id: <20240923103406.2509906-1-steven.price@arm.com>
X-Mailer: git-send-email 2.39.5
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

XArray provides it's own internal lock which protects the internal array
when entries are being simultaneously added and removed. However there
is still a race between retrieving the pointer from the XArray and
incrementing the reference count.

To avoid this race simply hold the internal XArray lock when
incrementing the reference count, this ensures there cannot be a racing
call to xa_erase().

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 42afdf0ddb7e..0dbeebcf23b4 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3242,6 +3242,18 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 	return 0;
 }
 
+static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
+					       u32 group_handle)
+{
+	struct panthor_group *group;
+
+	xa_lock(&pool->xa);
+	group = group_get(xa_load(&pool->xa, group_handle));
+	xa_unlock(&pool->xa);
+
+	return group;
+}
+
 int panthor_group_get_state(struct panthor_file *pfile,
 			    struct drm_panthor_group_get_state *get_state)
 {
@@ -3253,7 +3265,7 @@ int panthor_group_get_state(struct panthor_file *pfile,
 	if (get_state->pad)
 		return -EINVAL;
 
-	group = group_get(xa_load(&gpool->xa, get_state->group_handle));
+	group = group_from_handle(gpool, get_state->group_handle);
 	if (!group)
 		return -EINVAL;
 
@@ -3384,7 +3396,7 @@ panthor_job_create(struct panthor_file *pfile,
 	job->call_info.latest_flush = qsubmit->latest_flush;
 	INIT_LIST_HEAD(&job->node);
 
-	job->group = group_get(xa_load(&gpool->xa, group_handle));
+	job->group = group_from_handle(gpool, group_handle);
 	if (!job->group) {
 		ret = -EINVAL;
 		goto err_put_job;
-- 
2.39.5

