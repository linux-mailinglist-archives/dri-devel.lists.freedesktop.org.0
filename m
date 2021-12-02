Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E913B4669B6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 19:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9E6EC88;
	Thu,  2 Dec 2021 18:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0496EAA0;
 Thu,  2 Dec 2021 18:15:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="236575940"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="236575940"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 10:15:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="477995732"
Received: from cmichel-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.25.51])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 10:15:38 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915/migrate: fix offset calculation
Date: Thu,  2 Dec 2021 18:15:11 +0000
Message-Id: <20211202181515.2794397-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202181515.2794397-1-matthew.auld@intel.com>
References: <20211202181515.2794397-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ensure we add the engine base only after we calculate the qword offset
into the PTE window.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index d553b76b1168..cb0bb3b94644 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -284,10 +284,10 @@ static int emit_pte(struct i915_request *rq,
 	GEM_BUG_ON(GRAPHICS_VER(rq->engine->i915) < 8);
 
 	/* Compute the page directory offset for the target address range */
-	offset += (u64)rq->engine->instance << 32;
 	offset >>= 12;
 	offset *= sizeof(u64);
 	offset += 2 * CHUNK_SZ;
+	offset += (u64)rq->engine->instance << 32;
 
 	cs = intel_ring_begin(rq, 6);
 	if (IS_ERR(cs))
-- 
2.31.1

