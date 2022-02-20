Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81A4BCB93
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 02:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2159910E1E5;
	Sun, 20 Feb 2022 01:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8874110E1E5;
 Sun, 20 Feb 2022 01:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645321684; x=1676857684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6qHJiwLEB5wZW6ryG81zNYT+YwHCSQt+VMxOomwt5wM=;
 b=jNh9+djaxy8bgNN5Sgkw+TAuSJiTLzIqOWMAV3qLQeTLid7/BHkehq/L
 9GRkr+JNr4GvIdpEFQ+Ncoz4eUo9PHva9UMh1bcP4m64Gz3QNTEo/EADV
 UDw4v0PjhASP/AiY+mhc3EBttN5uX6T/rau8WGcun/VYYOkq1utAkn4ha
 Xi72O01s+fZjeJiSc8I8YGNKXrexRJzd5hdg1rgsSvq7vv1AHB+ePjZH6
 sxuBZqkD6Zb+VM/gxHaCGPZp7TtfGT+qEnDc30/t3ijFA+58/5eDhw5DK
 YFbnJBhE6p8uwrOmQ6uUY8E2lk/HXmjqZMgqwB1SxRVCgZbHykekGtWf7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10263"; a="231306877"
X-IronPort-AV: E=Sophos;i="5.88,382,1635231600"; d="scan'208";a="231306877"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 17:48:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,382,1635231600"; d="scan'208";a="531392487"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 17:48:01 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/mm: Ensure that the entry is not NULL before
 extracting rb_node
Date: Sat, 19 Feb 2022 17:31:25 -0800
Message-Id: <20220220013127.962336-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220013127.962336-1-vivek.kasireddy@intel.com>
References: <20220220013127.962336-1-vivek.kasireddy@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While looking for next holes suitable for an allocation, although,
it is highly unlikely, make sure that the DECLARE_NEXT_HOLE_ADDR
macro is using a valid node before it extracts the rb_node from it.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/drm_mm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8257f9d4f619..499d8874e4ed 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -389,11 +389,12 @@ first_hole(struct drm_mm *mm,
 #define DECLARE_NEXT_HOLE_ADDR(name, first, last)			\
 static struct drm_mm_node *name(struct drm_mm_node *entry, u64 size)	\
 {									\
-	struct rb_node *parent, *node = &entry->rb_hole_addr;		\
+	struct rb_node *parent, *node;					\
 									\
-	if (!entry || RB_EMPTY_NODE(node))				\
+	if (!entry || RB_EMPTY_NODE(&entry->rb_hole_addr))		\
 		return NULL;						\
 									\
+	node = &entry->rb_hole_addr;					\
 	if (usable_hole_addr(node->first, size)) {			\
 		node = node->first;					\
 		while (usable_hole_addr(node->last, size))		\
-- 
2.34.1

