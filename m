Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA54DE43D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 23:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ED010E2F5;
	Fri, 18 Mar 2022 22:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4C510E2F0;
 Fri, 18 Mar 2022 22:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647643671; x=1679179671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GLmFMornaSnSqY+/8GFKSjNa3P2XPko6VrSXeh1rJj4=;
 b=EX0sLe6TS7hthgcQzl9r2YxkDBx1vrBGQDV/5okxktaFOPGr+KOyT2UP
 U17gu7i87Aqg0pTmpMEN5DEQC8Su2N+TS342UA+P1Ly78EwHGf6EFyKoq
 0gJJ5gaStSwvREaaqjbmrOvbZEWGBcRLF3ht+MOEiKvhrtOJit5MGs7Lb
 u+zZ9NoPPLpd5QpCC8W+9JWn1w8LhrlnOLJwQeOxVHwFAAsrUcCFFK5bI
 cq73PE0YkTWbOWmOlfsVp3qem8u66RUkn3EcJmoAXkIsuxZHJRs8rD+fK
 h5E5nPFZGI/XUEVg1RMX31dNxygYjNknGa2DH2bZGpFO00kcvE71S54PW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="257435893"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="257435893"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 15:47:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558698593"
Received: from mriahix-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.167])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 15:47:45 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 2/7] drm/i915/gt: add gt_is_root() helper
Date: Sat, 19 Mar 2022 00:46:35 +0200
Message-Id: <20220318224640.61594-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318224640.61594-1-andi.shyti@linux.intel.com>
References: <20220318224640.61594-1-andi.shyti@linux.intel.com>
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
 Dale B Stimson <dale.b.stimson@intel.com>,
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

