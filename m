Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A061EBBD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214C610E21A;
	Mon,  7 Nov 2022 07:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5E810E218;
 Mon,  7 Nov 2022 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805636; x=1699341636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NohMCoyeEjjjb+6Bqcl/ttWBcoLEYhSQLN5yYPBU/7Q=;
 b=ft4nH42eAxXG4AA30KARTpCiIaN+gcFGnEAJJF6TlC6hnIaIuvsd/p5T
 oKpfLzr4ZwBTjmSIpeDWVBfeahbs+yAKQ6Yj216JByuXTPcGqfw6bJLmA
 GaJfzr7Dk9S0GQexZfLxYU1qXwoGLd88ojj6+O2kU07sS4nYb0E9ibSom
 BFp7EWpgfU3ELjzpHzx26n+DoSmo79/4cE1SRttWtYyUyJhjE20tNfOH8
 dHS7cz6xIZJt7ttO5xFvrppsYdwDw/ZCn2r0DTKUa86/bF//ci2Lu1izL
 7bD0BsVro9tQcYvGvqPJh5THM12F8X5i3qyiGOs/sNGeytGlegwDbsYm5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463376"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463376"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767281"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767281"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:31 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 10/15] drm/i915/display/mtl: Add new members in crtc_state for
 FRL configuration
Date: Mon,  7 Nov 2022 12:50:40 +0530
Message-Id: <20221107072045.628895-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new struture to store FRL related configurations for a pipe.
These members to be calculated during compute config phase, when FRL
mode is to be used.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_display_types.h    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e57fac00e945..8cab50d5d565 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1307,6 +1307,29 @@ struct intel_crtc_state {
 		u16 flipline, vmin, vmax, guardband;
 	} vrr;
 
+	struct {
+		/* Go for FRL training */
+		bool enable;
+
+		/* Enable resource based scheduling */
+		bool rsrc_sched_en;
+
+		/* can be either 3 or 4 lanes */
+		u8 required_lanes;
+
+		/* required rate - can be 3, 6, 8, 10, 12 Gbps */
+		u8 required_rate;
+
+		/* FRL DFM Parameters */
+		u32 tb_borrowed, tb_actual, tb_threshold_min, active_char_buf_threshold;
+
+		/* FRL DFM DSC Tribytes */
+		u32 hcactive_tb, hctotal_tb;
+
+		/* Clock parameters in KHz */
+		u32 div18, link_m_ext, link_n_ext;
+	} frl;
+
 	/* Stream Splitter for eDP MSO */
 	struct {
 		bool enable;
-- 
2.25.1

