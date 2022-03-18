Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F7C4DE48F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 00:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE0010E473;
	Fri, 18 Mar 2022 23:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665B110E451;
 Fri, 18 Mar 2022 23:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647646810; x=1679182810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GLmFMornaSnSqY+/8GFKSjNa3P2XPko6VrSXeh1rJj4=;
 b=AqRVwxNjqxXIkQGUS46sPYRT2QqsOlwZ8kj1f60bGi+/ckxGIZCRXZZb
 ZPIPPihiV3L2cwZzPF35aSdCBCGcMvh7TCLH+0laWzEFrF117bHs5H+vq
 +P7ahENHH5n20kmAoCdPiSlGjtKsu5e7whi4I9UTvYzYMw3Hq7vNg2fLh
 pqofy/ZCw34P2qVuGD/k5bTVAPKbzySSfagfPGOQ6f696c2iNz+oXdUqM
 4Qc4ePpg722lqavoPiVIjXCxLVg7IkAHVvBoLJp6fjwsPN5Bm6VM8JnOA
 WOG5cy9hXucDc3rlSVL6uuqHyXKNW2ksgd2Qyj0n98XjcV/Eh7K9XH/uS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="317961416"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="317961416"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:40:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="517463195"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.168])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:40:03 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 2/7] drm/i915/gt: add gt_is_root() helper
Date: Sat, 19 Mar 2022 01:39:32 +0200
Message-Id: <20220318233938.149744-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318233938.149744-1-andi.shyti@linux.intel.com>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
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

