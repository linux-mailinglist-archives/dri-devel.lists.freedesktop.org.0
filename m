Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E5467748
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 13:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D8573F57;
	Fri,  3 Dec 2021 12:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5A873F57;
 Fri,  3 Dec 2021 12:25:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="297761400"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="297761400"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:25:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="746699416"
Received: from ashunt-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.106])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:25:03 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/i915/migrate: fix offset calculation
Date: Fri,  3 Dec 2021 12:24:22 +0000
Message-Id: <20211203122426.2859679-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203122426.2859679-1-matthew.auld@intel.com>
References: <20211203122426.2859679-1-matthew.auld@intel.com>
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
Cc: bob.beckett@collabora.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 adrian.larumbe@collabora.com, dri-devel@lists.freedesktop.org
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

