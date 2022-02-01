Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37054A5773
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F6A10EB96;
	Tue,  1 Feb 2022 07:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E69910E488;
 Tue,  1 Feb 2022 07:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643699034; x=1675235034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v7fV3WpP1PThe1Q2559PdtswoXfVsdnIjkiioLUEPAk=;
 b=YNq1wpAtIEhMBEzm+SJ/l/OXhlKM3/wzBI+l/6m9yF8FK7JBF9HCqUSa
 RIpJ5e49mSiMIlhyt0lqcVK/nL6T8PuTbXsHSIuY31UPjp8Bug+fIstW+
 hixG2LSCugl1LxQI9aPkCsPIOv8OUNmPZDOm5AjpU5gV+N6jIRhwfDqV6
 xpjCjvFMpDOcB0Wo6flBZ7kczsy71IWjJs8hLSs/zpH86kc+Z/SGdXOiI
 uNxctpP5y+4sB9kV4Pkql2bFzj83xszB8ozr+zlQTQmmjIRlNSZCv12A4
 NmCM33vvuzi2pIIIaCJ3DRp6d7lm8Kmxp1Sc5Aq+/abVn2bnIDefndrMN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="308366180"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="308366180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:03:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="599149934"
Received: from djustese-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.242])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:03:51 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/ttm: Return some errors instead of trying memcpy move
Date: Tue,  1 Feb 2022 08:03:40 +0100
Message-Id: <20220201070340.16457-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i915_ttm_accel_move() function may return error codes that should
be propagated further up the stack rather than consumed assuming that
the accel move failed and could be replaced with a memcpy move.

For -EINTR, -ERESTARTSYS and -EAGAIN, just propagate those codes, rather
than retrying with a memcpy move.

Fixes: 2b0a750caf33 ("drm/i915/ttm: Failsafe migration blits")
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 1de306c03aaf..1ebe6e4086a1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -436,11 +436,17 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
 
 		if (!IS_ERR(fence))
 			goto out;
-	} else if (move_deps) {
-		int err = i915_deps_sync(move_deps, ctx);
+	} else {
+		int err = PTR_ERR(fence);
+
+		if (err == -EINTR || err == -ERESTARTSYS || err == -EAGAIN)
+			return fence;
 
-		if (err)
-			return ERR_PTR(err);
+		if (move_deps) {
+			err = i915_deps_sync(move_deps, ctx);
+			if (err)
+				return ERR_PTR(err);
+		}
 	}
 
 	/* Error intercept failed or no accelerated migration to start with */
-- 
2.34.1

