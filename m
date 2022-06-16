Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C9854E073
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0796E11A4C3;
	Thu, 16 Jun 2022 12:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B4F11A4BC;
 Thu, 16 Jun 2022 12:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655380922; x=1686916922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VHTODF7UhDo72sATEzIwHCmUiR+gBcFlIkh9LkNvUEA=;
 b=MEIQuvKL56gA6CtK8OSAoonggtPDYvNuY/DJw00L4GKO1njJ9Xah+KrB
 Ex315cq1ggJrjEV9hFjXxbCmjjJwlyQAf6DMQdh3lKj0KmJySh2DYCwD9
 SkGCC4H6y8W3v1Sqo+VAIO2dTvukzqhQnd7I+z8zzX3SRlpwoKvSLnwZU
 EgXppDyjxgagF/VYS9fWd4g3NaLBTXEFZAC+/qO7yaXncRxBwyBsF4nc9
 6LpRmKPEqmdE/MRrsNb+mHNwyp0dMRBAb8gXdRTnIIbxQL6B3QHpsng5C
 7jh06sbGZJRQN2QpHkOnoONMAednOVFMShuBnkNVDYnawqsZeV4428d1k Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343189607"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="343189607"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="713330925"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:36 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/i915/dgfx: Add has_lmem_sr
Date: Thu, 16 Jun 2022 17:31:02 +0530
Message-Id: <20220616120106.24353-6-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220616120106.24353-1-anshuman.gupta@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>, jon.ewins@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add has_lmem_sr platform specific flag to know,
whether platform has VRAM self refresh support.
As of now both DG1 and DG2 client platforms supports VRAM self refresh
with D3Cold but let it enable first on DG2 as primary lead platform
for D3Cold support. Let it get enable on DG1 once this feature
is stable.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 1 +
 drivers/gpu/drm/i915/i915_pci.c          | 2 ++
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 28eee8088822..7983b36c1720 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1313,6 +1313,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
 #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
+#define HAS_LMEM_SR(i915) (INTEL_INFO(i915)->has_lmem_sr)
 
 /*
  * Platform has the dedicated compression control state for each lmem surfaces
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 5e51fc29bb8b..04aad54033dd 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -917,6 +917,7 @@ static const struct intel_device_info dg1_info = {
 	DGFX_FEATURES,
 	.graphics.rel = 10,
 	PLATFORM(INTEL_DG1),
+	.has_lmem_sr = 0,
 	.display.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),
 	.require_force_probe = 1,
 	.platform_engine_mask =
@@ -1074,6 +1075,7 @@ static const struct intel_device_info xehpsdv_info = {
 static const struct intel_device_info dg2_info = {
 	DG2_FEATURES,
 	XE_LPD_FEATURES,
+	.has_lmem_sr = 1,
 	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 			       BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
 	.require_force_probe = 1,
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index c929e2d7e59c..db51cdb9e09a 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -157,6 +157,7 @@ enum intel_ppgtt_type {
 	func(has_l3_ccs_read); \
 	func(has_l3_dpf); \
 	func(has_llc); \
+	func(has_lmem_sr); \
 	func(has_logical_ring_contexts); \
 	func(has_logical_ring_elsq); \
 	func(has_media_ratio_mode); \
-- 
2.26.2

