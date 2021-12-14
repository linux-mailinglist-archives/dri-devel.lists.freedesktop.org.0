Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5CF474904
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A87910E195;
	Tue, 14 Dec 2021 17:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DE910E16E;
 Tue, 14 Dec 2021 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639502071; x=1671038071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xs4Uezz0ZR31ss+ptKygyEXbVGcCanPcDYRuGPs0HPE=;
 b=ns6ySsaH0qeaJTcYHI0vo2CnoJB1IV2Zo5nEojUHf8reVu7T+bjoVMGa
 1Fo/5kiNzVSk9+5RPiLlEpuD8DfKIkPh2Nu340IBmaPKTTTKQh6FnZqUQ
 oDyJOZVC0hL6QmJ1ehil1YHIY64pKtokjxrKuIxfG70fZJZoY94+8gbtf
 RCX8Xap7nGKxf8ZokhfsyKPVN9xGY4eS3HKOJnDoC8Sg92qhy7oFZ29mn
 kq4LT7AseRiOhwGhWUegw2W/+aFSGy6IgyFEjhLpnUEf4XrBqseD6blv5
 920iDOs86fhZuGnJpX/2pzujShYIhzeQa2FXz2q7VMdSWZo5qf8hLQuke Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219043201"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="219043201"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:10:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="614357546"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:10:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/7] drm/i915/guc: Only assign guc_id.id when stealing guc_id
Date: Tue, 14 Dec 2021 09:04:55 -0800
Message-Id: <20211214170500.28569-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214170500.28569-1-matthew.brost@intel.com>
References: <20211214170500.28569-1-matthew.brost@intel.com>
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

Previously assigned whole guc_id structure (list, spin lock) which is
incorrect, only assign the guc_id.id.

Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9b7b4f4e0d91..0fb2eeff0262 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1935,7 +1935,7 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
 		GEM_BUG_ON(intel_context_is_parent(cn));
 
 		list_del_init(&cn->guc_id.link);
-		ce->guc_id = cn->guc_id;
+		ce->guc_id.id = cn->guc_id.id;
 
 		spin_lock(&cn->guc_state.lock);
 		clr_context_registered(cn);
-- 
2.33.1

