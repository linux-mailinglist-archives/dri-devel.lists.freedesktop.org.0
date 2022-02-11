Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD524B2462
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374FA10EA9C;
	Fri, 11 Feb 2022 11:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D02710EA97;
 Fri, 11 Feb 2022 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579297; x=1676115297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fPsSg2xzh36cNsoqe1PXqRxKogmPAHMiwVNDn8suB2Q=;
 b=Pi3vGdwIM9a7J8lFaIn0M1MaQ3ndBfuzJCJeTfWL9eQgHeqr3tlx8dza
 HX4WcjSF0+yLgosHueACZMQvoWlRviFS4MgncCRul6RkZGqyvwBGJMD91
 Mrba9xdJt714QHKB08vQhqS/JfhjARXNMYRufO/nLDRlHZ353cQ2CyAa0
 0RNYTr8hnuGZO6xVXole3J/IXovIvzmzVMFfavNRSO8Nw6B4lCwNlLyyv
 Ws4enrWAq3rBfIFtnQOABQ7gaAqiCcgKlEZn50i96npTlqegc9E3esabF
 lU7UKaNgH2vO0ZElk5oINlp3noc4pE0PJLbhuD6DiDVzREHij4jSGuy5c w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248548239"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248548239"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="602354971"
Received: from pogara-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:55 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 06/15] drm/i915/buddy: tweak 2big check
Date: Fri, 11 Feb 2022 11:34:28 +0000
Message-Id: <20220211113437.874691-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211113437.874691-1-matthew.auld@intel.com>
References: <20220211113437.874691-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise we get -EINVAL, instead of the more useful -E2BIG if the
allocation doesn't fit within the pfn range, like with mappable lmem.
The hugepages selftest, for example, needs this to know if a smaller
size is needed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 0ac6b2463fd5..92d49a3c378c 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -82,7 +82,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 			lpfn = pages;
 	}
 
-	if (size > mm->size) {
+	if (size > lpfn << PAGE_SHIFT) {
 		err = -E2BIG;
 		goto err_free_res;
 	}
-- 
2.34.1

