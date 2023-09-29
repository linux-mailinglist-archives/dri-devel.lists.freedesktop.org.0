Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B8C7B2D98
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45B810E6CA;
	Fri, 29 Sep 2023 08:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A80910E6C9;
 Fri, 29 Sep 2023 08:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695975463; x=1727511463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9OtnwBDodir+vfHGruLoe7NnRWlfRWTw39M/ApH8Z4=;
 b=LsDWfwHJojZxI6EaGJPTqcL22EV4U1JSqI5y/N4mUq9cqP0ED+NH5ACu
 WV7CoZJyycBbrPFR7dr9u3vMFP7svZQoVD2LadWfHrqoM2RqIW4An5I1/
 n+K8UuYjZ5XX55OFhK00ilQsDnWxBxyVR9iJyjNn/ZT6ktCVn/eQyb2QR
 LebFGVmCYHLaycDNwc5cpL5hG5rwVixNPW+7hM/dd2AloxNy7TbRIvu8m
 naVVaGedGk7IQqRLKIFoVF1CHDvIC/QuIbZeOSG4jqIJQdi0/2uQkijgc
 hVJHd7Z+zgSU6dQ9vDU4UKaTQwkftyfDlPobjlo6sBjQfHDKYQa1L9swc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379520255"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="379520255"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815517392"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="815517392"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 00:19:07 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/display/dp: Add helper function to get DSC bpp
 precision
Date: Fri, 29 Sep 2023 12:43:15 +0530
Message-Id: <20230929071322.945521-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929071322.945521-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230929071322.945521-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: suraj.kandpal@intel.com, suijingfeng@loongson.cn, jani.nikula@intel.com,
 swati2.sharma@intel.com, mripard@kernel.org, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Add helper to get the DSC bits_per_pixel precision for the DP sink.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
Acked-by: Maxime Ripard <mripard@kernel.org>
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

