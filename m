Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A565C474C18
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042D510E1AD;
	Tue, 14 Dec 2021 19:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E7F10E1A9;
 Tue, 14 Dec 2021 19:35:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219753971"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="219753971"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 11:35:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="604462376"
Received: from njayagop-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.16])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 11:35:28 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 12/16] drm/i915/display: Use to_gt() helper for GGTT
 accesses
Date: Tue, 14 Dec 2021 21:33:42 +0200
Message-Id: <20211214193346.21231-13-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214193346.21231-1-andi.shyti@linux.intel.com>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

GGTT is currently available both through i915->ggtt and gt->ggtt, and we
eventually want to get rid of the i915->ggtt one.
Use to_gt() for all i915->ggtt accesses to help with the future
refactoring.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c           | 2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 8be01b93015f..98319c0322d7 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -595,7 +595,7 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
-	if (i915->ggtt.num_fences)
+	if (to_gt(i915)->ggtt->num_fences)
 		snb_fbc_program_fence(fbc);
 
 	intel_de_write(i915, ILK_DPFC_CONTROL,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index adc3a81be9f7..41d279db2be6 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -180,7 +180,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
-	struct i915_ggtt *ggtt = &dev_priv->ggtt;
+	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
 	const struct i915_ggtt_view view = {
 		.type = I915_GGTT_VIEW_NORMAL,
 	};
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 01ce1d72297f..e4186a0b8edb 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -94,7 +94,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 		goto err_obj;
 	}
 
-	vma = i915_vma_instance(obj, &i915->ggtt.vm, NULL);
+	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
 	if (IS_ERR(vma))
 		goto err_obj;
 
-- 
2.34.1

