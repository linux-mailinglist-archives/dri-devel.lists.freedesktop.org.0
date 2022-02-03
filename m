Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD8D4A80DA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABC310E9CB;
	Thu,  3 Feb 2022 09:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932DF10E9BA;
 Thu,  3 Feb 2022 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879051; x=1675415051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=auT8Ok6DBs759n/VjpL5SnRxA+0gyxB7pIaXolNkWiQ=;
 b=PVr3lbPkrI/g7EIm3yYHAxw1ehbP96stKyfkb9204Wkql9MhZzxhS7t3
 XSkYhBiGzWIWkSJ4uAoPzRqXgWhZICqZmTbQ+F06W49R0DZfFp9rwje3r
 gs5RETm+vcXzk8Qxk9Fl107pG0TmqD1+T323stFzYtcG2qLkZw9R2TVUd
 U92SOti4CdufVMFVdyQVMgOpdKznJJYHpdcSOuU2gCniluI7XwoUXS41F
 CC0USd1v6aZouuWlmHF6UxL7IcwWleYlcZsA4miLklhhttgUPumM6SZLH
 nZzPuikWGG/3i10zDNwn5kzAxpqNR5fs0ZOOwmSHQTt/zrC7OHAxxtU5J A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="245698293"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="245698293"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="538662868"
Received: from cbrady-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.6.65])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/dp: add drm_dp_128b132b_read_aux_rd_interval()
Date: Thu,  3 Feb 2022 11:03:50 +0200
Message-Id: <22f6637194c9edb22b6a84be82dd385550dbb958.1643878928.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643878928.git.jani.nikula@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DP 2.0 errata changes DP_128B132B_TRAINING_AUX_RD_INTERVAL (DPCD
0x2216) completely. Add a new function to read that. Follow-up will need
to clean up existing functions.

v2: fix reversed interpretation of bit 7 meaning (Uma)

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/dp/drm_dp.c    | 20 ++++++++++++++++++++
 include/drm/dp/drm_dp_helper.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index 6d43325acca5..52c6da510142 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -281,6 +281,26 @@ int drm_dp_read_channel_eq_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIV
 }
 EXPORT_SYMBOL(drm_dp_read_channel_eq_delay);
 
+/* Per DP 2.0 Errata */
+int drm_dp_128b132b_read_aux_rd_interval(struct drm_dp_aux *aux)
+{
+	int unit;
+	u8 val;
+
+	if (drm_dp_dpcd_readb(aux, DP_128B132B_TRAINING_AUX_RD_INTERVAL, &val) != 1) {
+		drm_err(aux->drm_dev, "%s: failed rd interval read\n",
+			aux->name);
+		/* default to max */
+		val = DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
+	}
+
+	unit = (val & DP_128B132B_TRAINING_AUX_RD_INTERVAL_1MS_UNIT) ? 1 : 2;
+	val &= DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
+
+	return (val + 1) * unit * 1000;
+}
+EXPORT_SYMBOL(drm_dp_128b132b_read_aux_rd_interval);
+
 void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
 					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index 98d020835b49..aa73dfc817ff 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -1112,6 +1112,7 @@ struct drm_panel;
 # define DP_UHBR13_5                           (1 << 2)
 
 #define DP_128B132B_TRAINING_AUX_RD_INTERVAL                    0x2216 /* 2.0 */
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_1MS_UNIT          (1 << 7)
 # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK              0x7f
 # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_400_US            0x00
 # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_4_MS              0x01
@@ -1549,6 +1550,8 @@ void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
 void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
 					      const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 
+int drm_dp_128b132b_read_aux_rd_interval(struct drm_dp_aux *aux);
+
 u8 drm_dp_link_rate_to_bw_code(int link_rate);
 int drm_dp_bw_code_to_link_rate(u8 link_bw);
 
-- 
2.30.2

