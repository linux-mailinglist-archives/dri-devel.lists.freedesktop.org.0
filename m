Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413EC429305
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 17:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E816E544;
	Mon, 11 Oct 2021 15:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42C06E51B;
 Mon, 11 Oct 2021 15:19:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="290391429"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="290391429"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 08:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="547062983"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2021 08:19:45 -0700
Received: from intel.com (srinivasulu-X299-AORUS-Gaming-7.iind.intel.com
 [10.145.162.218])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 19BFJcaJ019164; Mon, 11 Oct 2021 16:19:43 +0100
From: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, thanneeru.srinivasulu@intel.com
Subject: [PATCH 3/4] drm/i915/guc: Inject probe errors for MMIO send
Date: Mon, 11 Oct 2021 20:51:05 +0530
Message-Id: <20211011152106.3424810-4-thanneeru.srinivasulu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
References: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Injecting probe errors -ENXIO for MMIO send.

Signed-off-by: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 8f8182bf7c11..490d66712afc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -403,6 +403,10 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 	int i;
 	int ret;
 
+	ret = i915_inject_probe_error(i915, -ENXIO);
+	if (ret)
+		return ret;
+
 	GEM_BUG_ON(!len);
 	GEM_BUG_ON(len > guc->send_regs.count);
 
-- 
2.25.1

