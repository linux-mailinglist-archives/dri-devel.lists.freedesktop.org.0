Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17134B9A8A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F9D10E9A8;
	Thu, 17 Feb 2022 08:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DA610E9A4;
 Thu, 17 Feb 2022 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645085202; x=1676621202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6qHJiwLEB5wZW6ryG81zNYT+YwHCSQt+VMxOomwt5wM=;
 b=e1b1j3IzmenzwqW2R3ezzFM+OLJY/n4PNaZqN/BkEEYM3U4cqIsz3njJ
 EqtDv0ALR5mg10/YjfSduGcNHclwsnWXQsZVUad/5vVY5aW4yF/9ONWA1
 AsyrDUzcIO7NMBjc3XE1P/+Gzx1K6EN9uWX6JgZ9YW54DA9vgyy/R0k+G
 XHHdm2Y/u2BvBVCm4s7D3FthY04vOxkYekQKHi73oluX1pvt9zI7JaEGX
 RXEzqhqxL1SQYyRkV1vSpt918vHc4QrnMdjpNZv8CN7U31OaV9VAMi5zG
 SByO+4nrPXDsBTv7znRnMYkRPTz4F9jddaAX3DEKHHxGGUb0VGDSd1rYT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="314088975"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="314088975"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 00:06:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="501531643"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 00:06:41 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/mm: Ensure that the entry is not NULL before
 extracting rb_node
Date: Wed, 16 Feb 2022 23:50:12 -0800
Message-Id: <20220217075014.922605-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217075014.922605-1-vivek.kasireddy@intel.com>
References: <20220217075014.922605-1-vivek.kasireddy@intel.com>
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

