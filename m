Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F546F376
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 19:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C48510E25A;
	Thu,  9 Dec 2021 18:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3919010E248;
 Thu,  9 Dec 2021 18:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639076035; x=1670612035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1pHYBJ1RHb5dlPsfg3d2uuOeN6KsRGg2eJS0OU7Twpc=;
 b=T3gD/Ps3AHRqrkTDfNYtAMg/tjDO0gMPQGCWHJEHYGVgJcBK7ClYABEg
 3X4uyRBfE3ygn6IbbR5Cz5X1yw2E9DZ9lFUnctLP6FflR9KNtJeyX6ITW
 UXQ53pkshTJb77gly1PPaij1rh6fheRhmgRzKgAdt2c+avhOfbgd+jvKK
 9grel0a8o1i7LTtk7ky6Tnqz9DfhzgpH1MRzryQxAAad7DUe5XiDXYELV
 TAsR3U44k6st5zJt3coE6QygAk9sGe9EVNSTpaeyI2GnPX3iyM24IUsfD
 1wEYA0makKu4x4wWze8nV96iVXMm+rwZvtUuqoQl/+WFwAg1tuT5mnq9d w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="298972831"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="298972831"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 10:53:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="612629419"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 10:53:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/guc: Use correct context lock when callig
 clr_context_registered
Date: Thu,  9 Dec 2021 10:48:14 -0800
Message-Id: <20211209184814.21125-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
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
Cc: <stable@vger.kernel.org>
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

