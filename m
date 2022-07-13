Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6E57328E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29EB98A86;
	Wed, 13 Jul 2022 09:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343D798A70;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8880B61CB6;
 Wed, 13 Jul 2022 09:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A05C341D3;
 Wed, 13 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704622;
 bh=d7Ye7f/yZMeD0fzLWJnDFqz2oIBKUGw1N39MIHO+bsk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yp/pZSEkoUvsGlC4rq7mlKo7cz2NpoAbkOwvGR8oKgWgtsy9Y0PYmJlYtjLh1w3iL
 Mh1wKOxxtP+OtWLAcjPRrPFjDKJDFr69KeSIN9wh+XG0JFNv66PSzS3wOZCNLYa2di
 hJ1AhfNhbgm2tMw5M4tBNjhTlL0b4LqziQhCSLpKcj68m9fshW+z26XHaSX0NWlr1z
 JY7+6wDu1u9TBhJwhEcBY+4W3w/BjiThWWS1FxilJIYUXJmyhNUr3T/hL3hZEuqCNr
 8jZvfKp22fAha3A/Q8/IXLsURheYzJs/LvP4XE6dpAMFOq7h3mUtmLUgzthQAii3a7
 e8v6uoFpP5ddA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhH-0050Lx-ST;
 Wed, 13 Jul 2022 10:30:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 15/21] drm/i915: Add platform macro for selective tlb flush
Date: Wed, 13 Jul 2022 10:30:12 +0100
Message-Id: <62c27558f7add68cc60fcf765e591f8886a195f9.1657703926.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657703926.git.mchehab@kernel.org>
References: <cover.1657703926.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>

Add support for selective TLB invalidation, which is a platform
feature supported on XeHP.

Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_drv.h          | 3 +++
 drivers/gpu/drm/i915/i915_pci.c          | 1 +
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index f1f70257dbe0..73494960a3a8 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1312,6 +1312,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_GT_UC(dev_priv)	(INTEL_INFO(dev_priv)->has_gt_uc)
 
+#define HAS_SELECTIVE_TLB_INVALIDATION(dev_priv) \
+	(INTEL_INFO(dev_priv)->has_selective_tlb_invalidation)
+
 #define HAS_POOLED_EU(dev_priv)	(INTEL_INFO(dev_priv)->has_pooled_eu)
 
 #define HAS_GLOBAL_MOCS_REGISTERS(dev_priv)	(INTEL_INFO(dev_priv)->has_global_mocs)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index aacc10f2e73f..30d945fe384b 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1022,6 +1022,7 @@ static const struct intel_device_info adl_p_info = {
 	.has_reset_engine = 1, \
 	.has_rps = 1, \
 	.has_runtime_pm = 1, \
+	.has_selective_tlb_invalidation = 1, \
 	.ppgtt_size = 48, \
 	.ppgtt_type = INTEL_PPGTT_FULL
 
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 23bf230aa104..92a38b8f7c47 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -170,6 +170,7 @@ enum intel_ppgtt_type {
 	func(has_rc6p); \
 	func(has_rps); \
 	func(has_runtime_pm); \
+	func(has_selective_tlb_invalidation); \
 	func(has_snoop); \
 	func(has_coherent_ggtt); \
 	func(unfenced_needs_alignment); \
-- 
2.36.1

