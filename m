Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002169F8711
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6798610EDD8;
	Thu, 19 Dec 2024 21:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuN95kEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AEF10EDC5;
 Thu, 19 Dec 2024 21:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644110; x=1766180110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d4uzqwDj6nzDYsWgOLQnVWThnIwGvggvZAQRPHj6C+E=;
 b=OuN95kEFOFiNeyFiUWWCXMDW9nkvdgqFAGHVGLyIVMwTd46pbmyYW0ve
 KdcZ6B/cAGlR0sJo0qLPv2N33+sDZ1BG02wr1WGq66tomA3oM+/WoAFRl
 QUhQhTBB1txoOkRn+om4K89/5+9rlpA63moRTw3OKAsz01pKfVmzkIfDl
 uRHwLCn/Kg5WPxNsZBNcFtaSALqPxl0uBRt91ezrurkg6E4tPp84O5fsQ
 5SB90JJS8tc7dBYwocsD1LDOf026gPKlVPxvNgSR6iUsr1NBfonb3owTD
 Fetq1sg+EKmwxIluogeyUkJxC2BQsSNKQNRR4La40pmXt+GnR5Z+FO3B7 w==;
X-CSE-ConnectionGUID: NUgBL91eRduQ+11QPZcupQ==
X-CSE-MsgGUID: K3dZvNLISSG6AuaQ09wj+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35330597"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35330597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:10 -0800
X-CSE-ConnectionGUID: Ns4ueVHUQAqtQujNIAULjQ==
X-CSE-MsgGUID: qMwiYHKkSHKKdh5NPzJbhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98115773"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 10/16] drm/i915/ddi: write payload for 128b/132b SST
Date: Thu, 19 Dec 2024 23:33:59 +0200
Message-Id: <5ce97e5f6c2dd4d5ee3181b2d4ed968eb806534c.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Write the payload allocation table for 128b/132b SST. Use VCPID 1 and
start from slot 0, with dp_m_n.tu slots.

This is preparation for enabling 128b/132b SST. This path is not
reachable yet. Indeed, we don't yet compute TU for 128b/132b SST.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 6f813bf85b23..64528ff8856e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2669,6 +2669,12 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	/* 6.o Configure and enable FEC if needed */
 	intel_ddi_enable_fec(encoder, crtc_state);
 
+	/* 7.a 128b/132b SST. */
+	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
+		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
+		drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);
+	}
+
 	if (!is_mst)
 		intel_dsc_dp_pps_write(encoder, crtc_state);
 }
@@ -2808,6 +2814,11 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	/* 7.l Configure and enable FEC if needed */
 	intel_ddi_enable_fec(encoder, crtc_state);
 
+	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
+		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
+		drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);
+	}
+
 	if (!is_mst)
 		intel_dsc_dp_pps_write(encoder, crtc_state);
 }
-- 
2.39.5

