Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616D517453
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D4810F041;
	Mon,  2 May 2022 16:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE65F10E53F;
 Mon,  2 May 2022 16:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651509261; x=1683045261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rd0ScOubeBxgLxv8yMgw6/R/6d0J3dnn3Ns6Enhd50=;
 b=Z2ZOW4QrQs0YgGtiyWcV8k8XruSjC3hlgScMuLk3ZG0AfsNVSSU4iAvo
 +9cOj+l4g27e6VypGhkDhxTyk00KUcNwHyBl2pJeP8hvWswHOgNajsoHd
 DlMJDYDkZhE+U4f09+0Fd/igxue1KiVegoF3AxqlNAgroXN8vf5D92Hgs
 Lj9r/DP+iOu5WRN5KC+zQX6zqDUWtHZPmB/2w0duBNkmlVk8ECoNmoAJl
 oCFkL2qxMRg79pZF+zUyeXFjLZfuc5CZVo5uEJgJak5tWdaVfqo4Pttf4
 PcdFwRoMU6MySjILIWuZ37ye/3ZspLmdlImn5mgBRGCKn1QxT3VPBQOHp w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266104998"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="266104998"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583781831"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/11] drm/i915/pvc: Read correct RP_STATE_CAP register
Date: Mon,  2 May 2022 09:34:10 -0700
Message-Id: <20220502163417.2635462-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502163417.2635462-1-matthew.d.roper@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SoC registers, including RP_STATE_CAP, have moved to a new location
in GTTMMADR on Ponte Vecchio.  We need to update the register offset
accordingly.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 4 +++-
 drivers/gpu/drm/i915/i915_reg.h     | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 3476a11f294c..3bd8415a0f1b 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1075,7 +1075,9 @@ static u32 intel_rps_read_state_cap(struct intel_rps *rps)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 
-	if (IS_XEHPSDV(i915))
+	if (IS_PONTEVECCHIO(i915))
+		return intel_uncore_read(uncore, PVC_RP_STATE_CAP);
+	else if (IS_XEHPSDV(i915))
 		return intel_uncore_read(uncore, XEHPSDV_RP_STATE_CAP);
 	else if (IS_GEN9_LP(i915))
 		return intel_uncore_read(uncore, BXT_RP_STATE_CAP);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 9ccb67eec1bd..4a3d7b96ef43 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1846,6 +1846,7 @@
 #define BXT_RP_STATE_CAP        _MMIO(0x138170)
 #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
 #define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
+#define PVC_RP_STATE_CAP	_MMIO(0x281014)
 
 #define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381a8)
 #define   GT0_PERF_LIMIT_REASONS_MASK	0xde3
-- 
2.35.1

