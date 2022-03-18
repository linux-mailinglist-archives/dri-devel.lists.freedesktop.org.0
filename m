Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C74DD2DE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 03:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C162810E95A;
	Fri, 18 Mar 2022 02:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C985F10E959;
 Fri, 18 Mar 2022 02:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647569495; x=1679105495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GLmFMornaSnSqY+/8GFKSjNa3P2XPko6VrSXeh1rJj4=;
 b=a/MxwceCqHhZ01Dyx4k9MlSSZCdNcakC0KFYmdb2b2On3IQzpQ8wClyo
 5o5Rjd7owAuSselrj2FlXSl4O6yfjbks9bKLC60nrUsLPoPzmDY4sizXh
 3RJPnomsqLdKzqet6JYdEYoRrKi5st6BOdqE0VFlraSJKq8z2/Oe1qDGR
 9UYptB7Rq5MEsv2v823VHpakpWML+hQiKRmZUAp/8zr/m/pHCY7l94vWY
 rJeCtOmNDABt9+XBoOa1ncod+PfKIcxcBL2OhBB+/XZMe4gWXw/wHVXCY
 I+voEm9pOMvmc6JtK5jg33MoUBzhCbOV3iOodUxbBqTenVq3x1CqJnJtr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="256977070"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="256977070"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 19:11:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="517006389"
Received: from akramak-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.144])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 19:11:30 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 2/7] drm/i915/gt: add gt_is_root() helper
Date: Fri, 18 Mar 2022 04:10:41 +0200
Message-Id: <20220318021046.40348-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318021046.40348-1-andi.shyti@linux.intel.com>
References: <20220318021046.40348-1-andi.shyti@linux.intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "gt_is_root(struct intel_gt *gt)" helper return true if the
gt is the root gt, which means that its id is 0. Return false
otherwise.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 996f8f3c17b95..ce471aa5c83d7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -19,6 +19,11 @@ struct drm_printer;
 		  ##__VA_ARGS__);					\
 } while (0)
 
+static inline bool gt_is_root(struct intel_gt *gt)
+{
+	return !gt->info.id;
+}
+
 static inline struct intel_gt *uc_to_gt(struct intel_uc *uc)
 {
 	return container_of(uc, struct intel_gt, uc);
-- 
2.35.1

