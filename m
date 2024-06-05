Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CECB8FD3AF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 19:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED64110E75D;
	Wed,  5 Jun 2024 17:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpqfLBwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47F310E64A;
 Wed,  5 Jun 2024 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717607495; x=1749143495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AIIsH+8nPC3RlbN7TX2Vi7D3rPeE7ktU0cYcWrfSzlY=;
 b=cpqfLBwhzK2s7ylrgYzQABGJr1ArZelojaeNGeYl1O+1uCJaSKeuQzSq
 FJaxkOhHC/YBqzcwMexZQLvQCfzH/3LwfiG3hIVGhws5sRXJPrOJ/Zhog
 yDAOtr6bkwPd1+ZD4Ip7uD24gnoEdBowGtESoW930Vuk2tTaO3hyPEDQg
 n0dqTciiNjbX9OsYiHlZnTrMeTYe8BrJhTM0rIVdmbbeYRM4xlZeVIAae
 czOib+/+ZH6K9+xNcKHXgS53pWEdcsPMLbA7BG31x/YDkUL+LiruZwb9k
 9gaESLFkMIBPHT2h/bdYgT1XAoE74gz8uJGfFHe9JD7en77ITfs94rRVm g==;
X-CSE-ConnectionGUID: WXGmB7y8SGukIp5vBJznsA==
X-CSE-MsgGUID: YGUB9PzIRV6MvKpZ/fCw8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14452441"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14452441"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:11:34 -0700
X-CSE-ConnectionGUID: GYXO637qTB+/YZD7GAciwA==
X-CSE-MsgGUID: kK4c/WgURiuTlRXA6RI6SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="60848406"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2024 10:11:34 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v13 4/9] drm/i915: Update trans_vrr_ctl flag when cmrr is
 computed
Date: Wed,  5 Jun 2024 22:31:06 +0530
Message-Id: <20240605170111.494784-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add/update trans_vrr_ctl flag when crtc_state->cmrr.enable
is set, With this commit setting the stage for subsequent
CMRR enablement.

--v2:
- Check pipe active state in cmrr enabling. [Jani]
- Remove usage of bitwise OR on booleans. [Jani]
- Revert unrelated changes. [Jani]
- Update intel_vrr_enable, vrr and cmrr enable conditions. [Jani]
- Simplify whole if-ladder in intel_vrr_enable. [Jani]
- Revert patch restructuring mistakes in intel_vrr_get_config. [Jani]

--v3:
- Check pipe active state in cmrr disabling.[Jani]
- Correct messed up condition in intel_vrr_enable. [Jani]

--v4:
- Removing RFC tag.

--v5:
- CMRR handling in co-existatnce of LRR and DRRS.

--v7:
- Rebase on top of AS SDP merge.

--v8:
- Remove cmrr_enabling/disabling and update commit message. (Ankit)

--v9:
- Revert removed line(Ankit).

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c      | 10 ++++++++--
 drivers/gpu/drm/i915/display/intel_vrr_regs.h |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index d2f854d9d18b..19b364074de0 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -282,8 +282,14 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 			       VRR_VSYNC_END(crtc_state->vrr.vsync_end) |
 			       VRR_VSYNC_START(crtc_state->vrr.vsync_start));
 
-	intel_de_write(dev_priv, TRANS_VRR_CTL(dev_priv, cpu_transcoder),
-		       VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state));
+	if (crtc_state->cmrr.enable) {
+		intel_de_write(dev_priv, TRANS_VRR_CTL(dev_priv, cpu_transcoder),
+			       VRR_CTL_VRR_ENABLE | VRR_CTL_CMRR_ENABLE |
+			       trans_vrr_ctl(crtc_state));
+	} else {
+		intel_de_write(dev_priv, TRANS_VRR_CTL(dev_priv, cpu_transcoder),
+			       VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state));
+	}
 }
 
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
diff --git a/drivers/gpu/drm/i915/display/intel_vrr_regs.h b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
index 1aeb0cd45068..577b0abb66db 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
@@ -123,4 +123,6 @@
 #define _TRANS_CMRR_N_HI_A			0x604FC
 #define TRANS_CMRR_N_HI(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_N_HI_A)
 
+#define VRR_CTL_CMRR_ENABLE			REG_BIT(27)
+
 #endif /* __INTEL_VRR_REGS__ */
-- 
2.25.1

