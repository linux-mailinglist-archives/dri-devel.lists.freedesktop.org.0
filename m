Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1A2471501
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 18:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B9810E605;
	Sat, 11 Dec 2021 17:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B2910E2E4;
 Sat, 11 Dec 2021 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639244474; x=1670780474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xs4Uezz0ZR31ss+ptKygyEXbVGcCanPcDYRuGPs0HPE=;
 b=YOH/sc1JyUmTepJ0Xq6vKa9fgLFb1Tz2ZjDszoF17DJ0k+FygRGBeegK
 O/flQ7e5NrEKaJu8sfKxVlGRSt+hNvunE94fHLmUcO21R8MVeTPePxOML
 Mw/CVVHC1n8aTanTau8EJ9r4Igwy0jKshSJdiU6ETJy3lWVNauOiwDBXr
 KgyH+KMoqpXygSZSMqr6Ikn+ROojwq/e8hS1i4shyjo0s1Rw8f+PzQ62A
 CucNiRecNWJhq+bJ+JR8ED5QlvqUE9JhCOV08bBrpBNTeHApOYCJ3iefk
 jNGHjU3gTB+ownmL2bjipL5+yP/UyHjBRYptYxdw2Gr0C+KOi0jziouWs Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="238493210"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="238493210"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="602548105"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/7] drm/i915/guc: Only assign guc_id.id when stealing guc_id
Date: Sat, 11 Dec 2021 09:35:40 -0800
Message-Id: <20211211173545.23536-3-matthew.brost@intel.com>
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

