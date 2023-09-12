Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B7779D695
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A90B10E441;
	Tue, 12 Sep 2023 16:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D68310E43E;
 Tue, 12 Sep 2023 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694536982; x=1726072982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sMgBEbFGROTgLS+UysAWyZpLbtA58FYyoMxCTbEr6Zs=;
 b=QYxBk7DS8L7ppqiQf1RtV5pMV/ng/AzJIaB3yXSJe9kLizHfTOO9XXzN
 V6oBGDJ0LvLD4vaf/s0mPSsHGGithVpuW7FtER1piMGt374uOpEd1B7rB
 p7hyXypg4oMM1fiYSpj3ziM+861ha54WgYcSFKHeG0XMzZcrj1oLwZ39R
 HL97UVfrXkUab5ko1hbMv0aWpY4CrDX1orwNUnPN5GZE/xOuACL4Fz2KZ
 fxcSLO28pMaNpIAjH83dea0xTD/b0tmcAMmz4v5WFtBZiTyQ61StmNVok
 rRwwbwfGSzVkaAtXnKuPjsiK/Yj/29kl4OTIEWVrcI4vhEvOai1myCGWg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442446815"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442446815"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743775644"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743775644"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 09:42:58 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/display/dp: Add helper function to get DSC bpp
 prescision
Date: Tue, 12 Sep 2023 22:07:28 +0530
Message-Id: <20230912163735.1075868-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Add helper to get the DSC bits_per_pixel precision for the DP sink.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 27 +++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 8a1b64c57dfd..5c23d5b8fc50 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2323,6 +2323,33 @@ int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
 }
 EXPORT_SYMBOL(drm_dp_read_desc);
 
+/**
+ * drm_dp_dsc_sink_bpp_incr() - Get bits per pixel increment
+ * @dsc_dpcd: DSC capabilities from DPCD
+ *
+ * Returns the bpp precision supported by the DP sink.
+ */
+u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
+{
+	u8 bpp_increment_dpcd = dsc_dpcd[DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT];
+
+	switch (bpp_increment_dpcd) {
+	case DP_DSC_BITS_PER_PIXEL_1_16:
+		return 16;
+	case DP_DSC_BITS_PER_PIXEL_1_8:
+		return 8;
+	case DP_DSC_BITS_PER_PIXEL_1_4:
+		return 4;
+	case DP_DSC_BITS_PER_PIXEL_1_2:
+		return 2;
+	case DP_DSC_BITS_PER_PIXEL_1_1:
+		return 1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_dsc_sink_bpp_incr);
+
 /**
  * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
  * supported by the DSC sink.
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 3369104e2d25..6968d4d87931 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -164,6 +164,7 @@ drm_dp_is_branch(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 }
 
 /* DP/eDP DSC support */
+u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 				   bool is_edp);
 u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
-- 
2.25.1

