Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D07341F1D1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 18:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0266EE57;
	Fri,  1 Oct 2021 16:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526AC6EE5B;
 Fri,  1 Oct 2021 16:05:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="205632275"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="205632275"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 09:03:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="521171584"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 09:03:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Fix bug in user proto-context creation that leaked
 contexts
Date: Fri,  1 Oct 2021 08:58:25 -0700
Message-Id: <20211001155825.6762-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
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

Set number of engines before attempting to create contexts so the
function free_engines can clean up properly. Also check return of
alloc_engines for NULL.

v2:
 (Tvrtko)
  - Send as stand alone patch
 (John Harrison)
  - Check for alloc_engines returning NULL
v3:
 (Checkpatch / Tvrtko)
  - Remove braces around single line if statement

Cc: Jason Ekstrand <jason@jlekstrand.net>
Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 8208fd5b72c3..8c7ea6e56262 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -898,6 +898,10 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 	unsigned int n;
 
 	e = alloc_engines(num_engines);
+	if (!e)
+		return ERR_PTR(-ENOMEM);
+	e->num_engines = num_engines;
+
 	for (n = 0; n < num_engines; n++) {
 		struct intel_context *ce;
 		int ret;
@@ -931,7 +935,6 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 			goto free_engines;
 		}
 	}
-	e->num_engines = num_engines;
 
 	return e;
 
-- 
2.32.0

