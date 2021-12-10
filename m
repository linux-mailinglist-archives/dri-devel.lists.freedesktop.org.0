Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CD46F841
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 02:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F5A10E1AE;
	Fri, 10 Dec 2021 01:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E91D10E1A2;
 Fri, 10 Dec 2021 01:08:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="262352159"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="262352159"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 17:08:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="516554691"
Received: from tuedungt-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.17])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 17:08:16 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 08/11] drm/i915/pxp: Use to_gt() helper
Date: Fri, 10 Dec 2021 03:07:56 +0200
Message-Id: <20211210010756.6423-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211209132512.47241-9-andi.shyti@linux.intel.com>
References: <20211209132512.47241-9-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use to_gt() helper consistently throughout the codebase.
Pure mechanical s/i915->gt/to_gt(i915). No functional changes.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

the inline of i915_dev_to_pxp() was accidentally removed in v6.
Thanks Matt.

Andi

 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 5d169624ad60..195b2323ec00 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -16,7 +16,9 @@
 
 static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
 {
-	return &kdev_to_i915(i915_kdev)->gt.pxp;
+	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
+
+	return &to_gt(i915)->pxp;
 }
 
 static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
-- 
2.34.1

