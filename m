Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD778D7B22
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 07:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC13510E29B;
	Mon,  3 Jun 2024 05:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLUJ6CPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7324410E291;
 Mon,  3 Jun 2024 05:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717394370; x=1748930370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tNkWjkRpwLN2ZCjESht0HfKO4O0MS8BOPfTuoRFBSmg=;
 b=PLUJ6CPXxL/UCQXAaAjUu/5CzXDvF+eJgVVo+GuFt3MDO07gH+EBJOTG
 aWUkiEcop//S5joWrGFWGhQiA3IQnqdWHHaT26HplLocEFR7L+XnjjS7O
 1soqwbIfeXWowJxSTiCT4nplnsx/Ev/WQjxiiqqoh6hPzf9YT4HzNlbTc
 GA7mrwxkGWNp/jmuASATp5bCJkwhKD4fwpwA6tKaGZ2IyaCdupFQM+k6j
 2+jX8EQ6pZW77ZivtlwPiz2sKhIy00bMJeLGeixdV5ohw3sI4bADd0kuw
 xDRdVASrOpl3zTdpItbyUQ+KrdEOK1A8A+Rffw27Wwn43xSFYBs4uoAh9 A==;
X-CSE-ConnectionGUID: uPfHMRLCS4y3fxnN79E0UA==
X-CSE-MsgGUID: K9ul1uukSDWV+XWjD0gOSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24527518"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="24527518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 22:59:30 -0700
X-CSE-ConnectionGUID: FV1IDkMBR++Vxsh7Mh/bJw==
X-CSE-MsgGUID: IGKQMY/iRjS+EDKGbSeFOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="67616489"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 02 Jun 2024 22:59:29 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v11 3/8] drm/i915: Update trans_vrr_ctl flag when cmrr is
 computed
Date: Mon,  3 Jun 2024 11:18:59 +0530
Message-Id: <20240603054904.222589-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
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
index 532ca5040a2e..e565aed06c88 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
@@ -123,5 +123,7 @@
 #define _TRANS_CMRR_N_HI_A			0x604FC
 #define TRANS_CMRR_N_HI(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_N_HI_A)
 
+#define VRR_CTL_CMRR_ENABLE			REG_BIT(27)
+
 #endif /* __INTEL_VRR_REGS__ */
 
-- 
2.25.1

