Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E100D4BA34C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FF610E9A7;
	Thu, 17 Feb 2022 14:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C0B10E89B;
 Thu, 17 Feb 2022 14:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645109020; x=1676645020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+GzPfklFZLJiAcbK45kwO4BMbNF5U3lCw9oAkgR+XJE=;
 b=hFB8EcNYWINzqQxXXuTxj+6MLHgUynTxYEHOIsHluwlyWso1cKFQ3vvi
 ZdrKKhRlIGOcsDmVrMKh4pehjOdZgjw+zMeDX2MBfi812t86POl0cuBEL
 zDHWN+FLYPfsX7FXqxIV9NfbRWC/NOIcHnbbF1zdw/gfdm5DVfR9/pXUX
 4EBiSZ9UzLcPSvDvPHBylPLYvrGwFyWMoT7ruisDQc2lDzazMS3sH8B0w
 gEde3XYRJJ7FxsE76EFsddQ93RYcdEUJ4nfhHD2Lc2YundLZj/cJD1sxm
 bdXBG/x73ivhKPqEFU/TUZS5o8tezHVkF44uRdbqPGW6I4y/B5ouN4o1I Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234416664"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="234416664"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="637160695"
Received: from sewaggon-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.33.71])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:35 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 3/7] drm/i915/gt: add gt_is_root() helper
Date: Thu, 17 Feb 2022 15:41:54 +0100
Message-Id: <20220217144158.21555-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217144158.21555-1-andi.shyti@linux.intel.com>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
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
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "gt_is_root(struct intel_gt *gt)" helper return true if the
gt is the root gt, which means that its id is 0. Return false
otherwise.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 915d6192079b..f17f51e2d394 100644
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
2.27.0

