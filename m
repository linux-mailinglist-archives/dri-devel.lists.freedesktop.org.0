Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OWQCV9ul2lSygIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:11:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78821623EF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2B310E747;
	Thu, 19 Feb 2026 20:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6tYgI21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DBE10E747;
 Thu, 19 Feb 2026 20:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771531865; x=1803067865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4I+eHL5DZpUGnDtZRl9/I6Rj52RUYIAgScj7qSGJh6I=;
 b=c6tYgI21BZJxf2w+4ASOmG2LsAFe6QgJJflKOd8aOMNQ9PH4oBB9Q+Wg
 6NOZRKc8REWKTAdneiv8uW61Vwn5MxJSdDJ4ZQslRiAobJtKIyCKWIN0+
 993pfUemoO6z/4lr6t4i453a6vFiNGtxuyMjIlMhQyBkBPdvVeKxylVmv
 M8zZVsItrEp8vJmmBDo4Gp8ALcH0Gag3GfKFDTpXd8Z/a7J49TL0pJCpG
 BggPHQXGvbVJHcRe5K+HKxM9qzZc0AaTmyFNy08tT1T234+irAT8EUF+Q
 IBPZ6BSFD0VwsU5tmdtP/6uYFJ1Crizy3u6zmYOFImJW1wrUg1vRhJqD/ g==;
X-CSE-ConnectionGUID: Z0VAsYe2SM67mBL6idjypg==
X-CSE-MsgGUID: bbDTDD9pTpGGYFqDYV+5zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71654294"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="71654294"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:11:04 -0800
X-CSE-ConnectionGUID: 8pmg3S8OSJSPfYEVHAgNRg==
X-CSE-MsgGUID: Cv1sTi3CRo6hnhz9uVmrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214663967"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:11:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, jgg@ziepe.ca, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 3/5] drm/pagemap: Drop source_peer_migrates flag and assume
 true
Date: Thu, 19 Feb 2026 12:10:55 -0800
Message-Id: <20260219201057.1010391-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219201057.1010391-1-matthew.brost@intel.com>
References: <20260219201057.1010391-1-matthew.brost@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A78821623EF
X-Rspamd-Action: no action

All current users of DRM pagemap set source_peer_migrates to true during
migration, and it is unclear whether any user would ever want to disable
this for performance reasons or for features such as compression. It is
also questionable whether this flag could be made to work with
high-speed fabric mapping APIs.

Drop the flag and make DRM pagemap unconditionally assume that
source_peer_migrates is true.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 10 ++++------
 drivers/gpu/drm/xe/xe_svm.c   |  1 -
 include/drm/drm_pagemap.h     |  8 ++------
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 01a06d1fd1a0..32535ab01c0f 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -602,12 +602,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				own_pages++;
 				continue;
 			}
-			if (mdetails->source_peer_migrates) {
-				cur.dpagemap = src_zdd->dpagemap;
-				cur.ops = src_zdd->devmem_allocation->ops;
-				cur.device = cur.dpagemap->drm->dev;
-				pages[i] = src_page;
-			}
+			cur.dpagemap = src_zdd->dpagemap;
+			cur.ops = src_zdd->devmem_allocation->ops;
+			cur.device = cur.dpagemap->drm->dev;
+			pages[i] = src_page;
 		}
 		if (!pages[i]) {
 			cur.dpagemap = NULL;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c96ed760c077..e86e69087c7e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1027,7 +1027,6 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
 	struct drm_pagemap_migrate_details mdetails = {
 		.timeslice_ms = timeslice_ms,
-		.source_peer_migrates = 1,
 	};
 	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
 	struct dma_fence *pre_migrate_fence = NULL;
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 72f6828f2604..5c33982141c2 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -329,12 +329,8 @@ struct drm_pagemap_devmem {
  * struct drm_pagemap_migrate_details - Details to govern migration.
  * @timeslice_ms: The time requested for the migrated pagemap pages to
  * be present in @mm before being allowed to be migrated back.
- * @can_migrate_same_pagemap: Whether the copy function as indicated by
- * the @source_peer_migrates flag, can migrate device pages within a
- * single drm_pagemap.
- * @source_peer_migrates: Whether on p2p migration, The source drm_pagemap
- * should use the copy_to_ram() callback rather than the destination
- * drm_pagemap should use the copy_to_devmem() callback.
+ * @can_migrate_same_pagemap: Whether the copy function can migrate
+ * device pages within a single drm_pagemap.
  */
 struct drm_pagemap_migrate_details {
 	unsigned long timeslice_ms;
-- 
2.34.1

