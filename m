Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AD242DCEC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFE16EB56;
	Thu, 14 Oct 2021 15:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2214C6EB52;
 Thu, 14 Oct 2021 15:01:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="207807072"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="207807072"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 08:01:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="481287784"
Received: from rwambsga-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.251.210.16])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 08:01:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 2/3] drm/dp: reuse the 8b/10b link training delay helpers
Date: Thu, 14 Oct 2021 18:00:58 +0300
Message-Id: <20211014150059.28957-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014150059.28957-1-jani.nikula@intel.com>
References: <20211014150059.28957-1-jani.nikula@intel.com>
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

Reuse the 8b/10b link training delay helpers. Functionally this skips
the check for invalid values for DPCD 1.4 and later at clock recovery
delay (as it's a fixed delay and bypasses the rd_interval) but the same
value will be checked and invalid values reported at channel
equalization.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index f7ebf5974fa7..ada0a1ff262d 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -284,35 +284,25 @@ EXPORT_SYMBOL(drm_dp_read_channel_eq_delay);
 void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
 					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
-	unsigned long rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
-					 DP_TRAINING_AUX_RD_MASK;
+	u8 rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
+		DP_TRAINING_AUX_RD_MASK;
+	int delay_us;
 
-	if (rd_interval > 4)
-		drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
-			    aux->name, rd_interval);
-
-	if (rd_interval == 0 || dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
-		rd_interval = 100;
+	if (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
+		delay_us = 100;
 	else
-		rd_interval *= 4 * USEC_PER_MSEC;
+		delay_us = __8b10b_clock_recovery_delay_us(aux, rd_interval);
 
-	usleep_range(rd_interval, rd_interval * 2);
+	usleep_range(delay_us, delay_us * 2);
 }
 EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_delay);
 
 static void __drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
-						 unsigned long rd_interval)
+						 u8 rd_interval)
 {
-	if (rd_interval > 4)
-		drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
-			    aux->name, rd_interval);
-
-	if (rd_interval == 0)
-		rd_interval = 400;
-	else
-		rd_interval *= 4 * USEC_PER_MSEC;
+	int delay_us = __8b10b_channel_eq_delay_us(aux, rd_interval);
 
-	usleep_range(rd_interval, rd_interval * 2);
+	usleep_range(delay_us, delay_us * 2);
 }
 
 void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
-- 
2.30.2

