Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8536AD23BE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 18:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A004810E42A;
	Mon,  9 Jun 2025 16:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C501010E42A;
 Mon,  9 Jun 2025 16:24:36 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tomasz Lis <tomasz.lis@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/3] drm/mm: Introduce address space shifting
Date: Mon,  9 Jun 2025 18:24:14 +0200
Message-ID: <20250609162417.841799-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

From: Tomasz Lis <tomasz.lis@intel.com>

Due to resource reprovisioning, sometimes a need arises to move
a living address space to a new area, preserving all the nodes
and holes stored within.

It is possible to do that by removing all nodes to a temporary list,
reiniting the drm_mm instance and re-adding everything while applying
a shift to each node. But that is a lot of extra work for a task
which could be done internally without any node shuffle operations.

This change introduces an interface which allows to shift the range
without pruning the whole drm_mm instance.

Having a drm_mm interface for such shift significantly simplifies
the code required to adjust a KMD for a change in base address
of a space managed by drm_mm instance.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Link: https://lore.kernel.org/r/20250204224136.3183710-2-tomasz.lis@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
 include/drm/drm_mm.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index ca254611b3823..ce3bd8b5e41f0 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -917,6 +917,30 @@ struct drm_mm_node *drm_mm_scan_color_evict(struct drm_mm_scan *scan)
 }
 EXPORT_SYMBOL(drm_mm_scan_color_evict);
 
+/**
+ * drm_mm_shift - move the range of addresses managed by this @mm
+ * @mm: the drm_mm structure instance to shift
+ * @shift: the shift value to be added to addresses of all nodes
+ *
+ * The function shifts all nodes by given offset, moving the address space
+ * range managed by this @mm.
+ */
+void drm_mm_shift(struct drm_mm *mm, s64 shift)
+{
+	struct drm_mm_node *node;
+
+	/*
+	 * Head node represents a hole, with negative size and start at the end
+	 * of addressable area. This means it is never present within nodes
+	 * list - needs to be shifted separately.
+	 */
+	mm->head_node.start += shift;
+
+	drm_mm_for_each_node(node, mm)
+		node->start += shift;
+}
+EXPORT_SYMBOL(drm_mm_shift);
+
 /**
  * drm_mm_init - initialize a drm-mm allocator
  * @mm: the drm_mm structure to initialize
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index f654874c4ce67..798e5a4f07add 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -465,6 +465,7 @@ static inline int drm_mm_insert_node(struct drm_mm *mm,
 void drm_mm_remove_node(struct drm_mm_node *node);
 void drm_mm_init(struct drm_mm *mm, u64 start, u64 size);
 void drm_mm_takedown(struct drm_mm *mm);
+void drm_mm_shift(struct drm_mm *mm, s64 shift);
 
 /**
  * drm_mm_clean - checks whether an allocator is clean
-- 
2.45.2

