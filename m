Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22664714FE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 18:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E4110E5E0;
	Sat, 11 Dec 2021 17:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339A510E330;
 Sat, 11 Dec 2021 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639244474; x=1670780474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RR4OQyl93P6Xjlr+tous2lVRL+UUgd6EMt1s2adyaVM=;
 b=C8YQrm/VCuJmERGsbrhBvRFfqH8B6QE8OSuxfORwhhB73jpgp+yu0VXB
 7S1ZMvVDnv22rgu0GiBBBc7ReJMaMk7JhNegI612HB7CiknVs7kRd5+M0
 geD475GWpwJ0cv6z0Phxcp1t6KRrr0LSCR+64DnHxpuekPJShw0Sql65P
 Q9SK1EW0vTcTAxfu0Tp9tsSMZD+3HgxmjSLqs/pULWgIuP6MKNPoeXc20
 kMaPtCAYlwURI1SkJM5OFyXIPn8s7hGfmp1yp4sf96O1iHmzjyn4eM9iH
 hfUk8lJGUNgdq0yzkZTXjyNJ5Mer4pNb9gg1j6QcI8aNLZ4POGwJjVwI2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="238493209"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="238493209"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="602548102"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/7] drm/i915/guc: Use correct context lock when callig
 clr_context_registered
Date: Sat, 11 Dec 2021 09:35:39 -0800
Message-Id: <20211211173545.23536-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211173545.23536-1-matthew.brost@intel.com>
References: <20211211173545.23536-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/ce/cn/ when grabbing guc_state.lock before calling
clr_context_registered.

Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 1f9d4fde421f..9b7b4f4e0d91 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1937,9 +1937,9 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
 		list_del_init(&cn->guc_id.link);
 		ce->guc_id = cn->guc_id;
 
-		spin_lock(&ce->guc_state.lock);
+		spin_lock(&cn->guc_state.lock);
 		clr_context_registered(cn);
-		spin_unlock(&ce->guc_state.lock);
+		spin_unlock(&cn->guc_state.lock);
 
 		set_context_guc_id_invalid(cn);
 
-- 
2.33.1

