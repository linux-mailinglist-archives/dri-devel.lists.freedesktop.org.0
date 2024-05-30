Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A2A8D4555
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 08:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1933311B468;
	Thu, 30 May 2024 06:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IejsaACP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC7211B467;
 Thu, 30 May 2024 06:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717049678; x=1748585678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rjSl2QOjlWEk6svTx3ouRYQVGowREOsQv7bpoxWPu3M=;
 b=IejsaACPNSCXdQCsP42ICRBq1+kobr4dmmBg1RiG9/sh+DEsGeecpXO4
 I0S58EWosogTgMIVIdut2LWpC0K4AkyulB5XU4HrtpFRXurS6XgolUl8/
 T5gnJNaeJy+KKlyT38OhyHEOP81W8jpjXyKi5zm3y0Wcocfd/c9RD+TNU
 XJWddo0SYHDI8rTa7DwFmprLukU17STE669KlVrzSLgDc9KCAmG83s2ej
 E8zV5wEnrzcOcgTJEWEoIrxXo/sIC6nVWn1MaOGTrp+K6ZPdNlI1b9fdZ
 OWc0eWnIEuC3kma5Thg0e0PBp65VYTwdevlCluK5iDgh4qIiKVWck8ROc A==;
X-CSE-ConnectionGUID: vBn6M34pQ+eEQbekwsZ8Wg==
X-CSE-MsgGUID: VvgExxUSQKSVufIci/3z8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24915512"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24915512"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 23:14:38 -0700
X-CSE-ConnectionGUID: Wbk4gAw6RyK+z2fyeManRA==
X-CSE-MsgGUID: H9tVE6DDSLi1V/OV7OViGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="36335670"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 29 May 2024 23:14:36 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v10 3/8] drm/i915: Update trans_vrr_ctl flag when cmrr is
 computed
Date: Thu, 30 May 2024 11:34:03 +0530
Message-Id: <20240530060408.67027-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 1f363e34495e..c2b5424f53db 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -284,8 +284,14 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
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
-- 
2.25.1

