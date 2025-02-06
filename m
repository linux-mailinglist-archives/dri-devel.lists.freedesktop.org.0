Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8D1A2B278
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 20:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719F710E931;
	Thu,  6 Feb 2025 19:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="kfSUVNG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B2110E942
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 19:42:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1738870942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTvtW9J4GUhNqqG9DHzZa1E2UHLm6NteXVEG5VcLNgc=;
 b=kfSUVNG201YB9rDs9iqbzhnGFCV9SFHcqMCDYa9VPbnrRM/Q0AwCmZi4DHDZ3f6GoFuPiY
 nkKLOPq+qvEg/tT9gcxg7bhtOWFtYWC8rmTP9Bh7DnsT05xYynWf80j5WNvPSrkInZfn4p
 EBaJHS8svuIRXNfrFToXlV5urAVkIaA=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR XILINX)
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
 linux-kernel@vger.kernel.org (open list), David Airlie <airlied@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
Date: Thu,  6 Feb 2025 14:41:19 -0500
Message-Id: <20250206194117.1496245-3-sean.anderson@linux.dev>
In-Reply-To: <20250206194117.1496245-1-sean.anderson@linux.dev>
References: <20250206194117.1496245-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Convert most mutex_(un)lock calls to use (scoped_)guard instead. This
generally reduces line count and prevents bugs like forgetting to unlock
the mutex. I've left traditional calls in a few places where scoped
helpers would be more verbose. This mostly happens where
debugfs_file_put needs to be called regardless. I looked into defining a
CLASS for debugfs_file, but it seems like more effort than it's worth
since debugfs_file_get can fail.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 151 ++++++++++++-------------------
 1 file changed, 58 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 189a08cdc73c..ffb81714c6a3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1534,10 +1534,10 @@ zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
 	}
 
 	/* Check with link rate and lane count */
-	mutex_lock(&dp->lock);
-	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
-				  dp->link_config.max_lanes, dp->config.bpp);
-	mutex_unlock(&dp->lock);
+	scoped_guard(mutex, &dp->lock)
+		rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
+					  dp->link_config.max_lanes,
+					  dp->config.bpp);
 	if (mode->clock > rate) {
 		dev_dbg(dp->dev, "filtered mode %s for high pixel rate\n",
 			mode->name);
@@ -1722,13 +1722,9 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *bridge)
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
-	enum drm_connector_status ret;
 
-	mutex_lock(&dp->lock);
-	ret = __zynqmp_dp_bridge_detect(dp);
-	mutex_unlock(&dp->lock);
-
-	return ret;
+	guard(mutex)(&dp->lock);
+	return __zynqmp_dp_bridge_detect(dp);
 }
 
 static const struct drm_edid *zynqmp_dp_bridge_edid_read(struct drm_bridge *bridge,
@@ -1881,10 +1877,9 @@ static ssize_t zynqmp_dp_pattern_read(struct file *file, char __user *user_buf,
 	if (unlikely(ret))
 		return ret;
 
-	mutex_lock(&dp->lock);
-	ret = snprintf(buf, sizeof(buf), "%s\n",
-		       test_pattern_str[dp->test.pattern]);
-	mutex_unlock(&dp->lock);
+	scoped_guard(mutex, &dp->lock)
+		ret = snprintf(buf, sizeof(buf), "%s\n",
+			       test_pattern_str[dp->test.pattern]);
 
 	debugfs_file_put(dentry);
 	return simple_read_from_buffer(user_buf, count, ppos, buf, ret);
@@ -1939,24 +1934,21 @@ static int zynqmp_dp_enhanced_get(void *data, u64 *val)
 {
 	struct zynqmp_dp *dp = data;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*val = dp->test.enhanced;
-	mutex_unlock(&dp->lock);
 	return 0;
 }
 
 static int zynqmp_dp_enhanced_set(void *data, u64 val)
 {
 	struct zynqmp_dp *dp = data;
-	int ret = 0;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	dp->test.enhanced = val;
 	if (dp->test.active)
-		ret = zynqmp_dp_test_setup(dp);
-	mutex_unlock(&dp->lock);
+		return zynqmp_dp_test_setup(dp);
 
-	return ret;
+	return 0;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_enhanced, zynqmp_dp_enhanced_get,
@@ -1966,24 +1958,21 @@ static int zynqmp_dp_downspread_get(void *data, u64 *val)
 {
 	struct zynqmp_dp *dp = data;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*val = dp->test.downspread;
-	mutex_unlock(&dp->lock);
 	return 0;
 }
 
 static int zynqmp_dp_downspread_set(void *data, u64 val)
 {
 	struct zynqmp_dp *dp = data;
-	int ret = 0;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	dp->test.downspread = val;
 	if (dp->test.active)
-		ret = zynqmp_dp_test_setup(dp);
-	mutex_unlock(&dp->lock);
+		return zynqmp_dp_test_setup(dp);
 
-	return ret;
+	return 0;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_downspread, zynqmp_dp_downspread_get,
@@ -1993,33 +1982,32 @@ static int zynqmp_dp_active_get(void *data, u64 *val)
 {
 	struct zynqmp_dp *dp = data;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*val = dp->test.active;
-	mutex_unlock(&dp->lock);
 	return 0;
 }
 
 static int zynqmp_dp_active_set(void *data, u64 val)
 {
 	struct zynqmp_dp *dp = data;
-	int ret = 0;
+	int ret;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	if (val) {
 		if (val < 2) {
 			ret = zynqmp_dp_test_setup(dp);
 			if (ret)
-				goto out;
+				return ret;
 		}
 
 		ret = zynqmp_dp_set_test_pattern(dp, dp->test.pattern,
 						 dp->test.custom);
 		if (ret)
-			goto out;
+			return ret;
 
 		ret = zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
 		if (ret)
-			goto out;
+			return ret;
 
 		dp->test.active = true;
 	} else {
@@ -2032,10 +2020,8 @@ static int zynqmp_dp_active_set(void *data, u64 val)
 				 err);
 		zynqmp_dp_train_loop(dp);
 	}
-out:
-	mutex_unlock(&dp->lock);
 
-	return ret;
+	return 0;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_active, zynqmp_dp_active_get,
@@ -2053,7 +2039,8 @@ static ssize_t zynqmp_dp_custom_read(struct file *file, char __user *user_buf,
 		return ret;
 
 	mutex_lock(&dp->lock);
-	ret = simple_read_from_buffer(user_buf, count, ppos, &dp->test.custom,
+	ret = simple_read_from_buffer(user_buf, count, ppos,
+				      &dp->test.custom,
 				      sizeof(dp->test.custom));
 	mutex_unlock(&dp->lock);
 
@@ -2102,9 +2089,8 @@ static int zynqmp_dp_swing_get(void *data, u64 *val)
 	struct zynqmp_dp_train_set_priv *priv = data;
 	struct zynqmp_dp *dp = priv->dp;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*val = dp->test.train_set[priv->lane] & DP_TRAIN_VOLTAGE_SWING_MASK;
-	mutex_unlock(&dp->lock);
 	return 0;
 }
 
@@ -2113,12 +2099,11 @@ static int zynqmp_dp_swing_set(void *data, u64 val)
 	struct zynqmp_dp_train_set_priv *priv = data;
 	struct zynqmp_dp *dp = priv->dp;
 	u8 *train_set = &dp->test.train_set[priv->lane];
-	int ret = 0;
 
 	if (val > 3)
 		return -EINVAL;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*train_set &= ~(DP_TRAIN_MAX_SWING_REACHED |
 			DP_TRAIN_VOLTAGE_SWING_MASK);
 	*train_set |= val;
@@ -2126,10 +2111,9 @@ static int zynqmp_dp_swing_set(void *data, u64 val)
 		*train_set |= DP_TRAIN_MAX_SWING_REACHED;
 
 	if (dp->test.active)
-		ret = zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
-	mutex_unlock(&dp->lock);
+		return zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
 
-	return ret;
+	return 0;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_swing, zynqmp_dp_swing_get,
@@ -2140,10 +2124,9 @@ static int zynqmp_dp_preemphasis_get(void *data, u64 *val)
 	struct zynqmp_dp_train_set_priv *priv = data;
 	struct zynqmp_dp *dp = priv->dp;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*val = FIELD_GET(DP_TRAIN_PRE_EMPHASIS_MASK,
 			 dp->test.train_set[priv->lane]);
-	mutex_unlock(&dp->lock);
 	return 0;
 }
 
@@ -2152,12 +2135,11 @@ static int zynqmp_dp_preemphasis_set(void *data, u64 val)
 	struct zynqmp_dp_train_set_priv *priv = data;
 	struct zynqmp_dp *dp = priv->dp;
 	u8 *train_set = &dp->test.train_set[priv->lane];
-	int ret = 0;
 
 	if (val > 2)
 		return -EINVAL;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*train_set &= ~(DP_TRAIN_MAX_PRE_EMPHASIS_REACHED |
 			DP_TRAIN_PRE_EMPHASIS_MASK);
 	*train_set |= val;
@@ -2165,10 +2147,9 @@ static int zynqmp_dp_preemphasis_set(void *data, u64 val)
 		*train_set |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
 
 	if (dp->test.active)
-		ret = zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
-	mutex_unlock(&dp->lock);
+		return zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
 
-	return ret;
+	return 0;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_preemphasis, zynqmp_dp_preemphasis_get,
@@ -2178,31 +2159,27 @@ static int zynqmp_dp_lanes_get(void *data, u64 *val)
 {
 	struct zynqmp_dp *dp = data;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*val = dp->test.link_cnt;
-	mutex_unlock(&dp->lock);
 	return 0;
 }
 
 static int zynqmp_dp_lanes_set(void *data, u64 val)
 {
 	struct zynqmp_dp *dp = data;
-	int ret = 0;
 
 	if (val > ZYNQMP_DP_MAX_LANES)
 		return -EINVAL;
 
-	mutex_lock(&dp->lock);
-	if (val > dp->num_lanes) {
-		ret = -EINVAL;
-	} else {
-		dp->test.link_cnt = val;
-		if (dp->test.active)
-			ret = zynqmp_dp_test_setup(dp);
-	}
-	mutex_unlock(&dp->lock);
+	guard(mutex)(&dp->lock);
+	if (val > dp->num_lanes)
+		return -EINVAL;
 
-	return ret;
+	dp->test.link_cnt = val;
+	if (dp->test.active)
+		return zynqmp_dp_test_setup(dp);
+
+	return 0;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_lanes, zynqmp_dp_lanes_get,
@@ -2212,9 +2189,8 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
 {
 	struct zynqmp_dp *dp = data;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
-	mutex_unlock(&dp->lock);
 	return 0;
 }
 
@@ -2222,7 +2198,6 @@ static int zynqmp_dp_rate_set(void *data, u64 val)
 {
 	struct zynqmp_dp *dp = data;
 	int link_rate;
-	int ret = 0;
 	u8 bw_code;
 
 	if (do_div(val, 10000))
@@ -2237,13 +2212,12 @@ static int zynqmp_dp_rate_set(void *data, u64 val)
 	    bw_code != DP_LINK_BW_5_4)
 		return -EINVAL;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	dp->test.bw_code = bw_code;
 	if (dp->test.active)
-		ret = zynqmp_dp_test_setup(dp);
-	mutex_unlock(&dp->lock);
+		return zynqmp_dp_test_setup(dp);
 
-	return ret;
+	return 0;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_rate, zynqmp_dp_rate_get,
@@ -2253,9 +2227,8 @@ static int zynqmp_dp_ignore_aux_errors_get(void *data, u64 *val)
 {
 	struct zynqmp_dp *dp = data;
 
-	mutex_lock(&dp->aux.hw_mutex);
+	guard(mutex)(&dp->lock);
 	*val = dp->ignore_aux_errors;
-	mutex_unlock(&dp->aux.hw_mutex);
 	return 0;
 }
 
@@ -2266,9 +2239,8 @@ static int zynqmp_dp_ignore_aux_errors_set(void *data, u64 val)
 	if (val != !!val)
 		return -EINVAL;
 
-	mutex_lock(&dp->aux.hw_mutex);
+	guard(mutex)(&dp->lock);
 	dp->ignore_aux_errors = val;
-	mutex_unlock(&dp->aux.hw_mutex);
 	return 0;
 }
 
@@ -2280,9 +2252,8 @@ static int zynqmp_dp_ignore_hpd_get(void *data, u64 *val)
 {
 	struct zynqmp_dp *dp = data;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	*val = dp->ignore_hpd;
-	mutex_unlock(&dp->lock);
 	return 0;
 }
 
@@ -2293,9 +2264,8 @@ static int zynqmp_dp_ignore_hpd_set(void *data, u64 val)
 	if (val != !!val)
 		return -EINVAL;
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	dp->ignore_hpd = val;
-	mutex_unlock(&dp->lock);
 	return 0;
 }
 
@@ -2391,14 +2361,12 @@ static void zynqmp_dp_hpd_work_func(struct work_struct *work)
 	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp, hpd_work);
 	enum drm_connector_status status;
 
-	mutex_lock(&dp->lock);
-	if (dp->ignore_hpd) {
-		mutex_unlock(&dp->lock);
-		return;
-	}
+	scoped_guard(mutex, &dp->lock) {
+		if (dp->ignore_hpd)
+			return;
 
-	status = __zynqmp_dp_bridge_detect(dp);
-	mutex_unlock(&dp->lock);
+		status = __zynqmp_dp_bridge_detect(dp);
+	}
 
 	drm_bridge_hpd_notify(&dp->bridge, status);
 }
@@ -2410,11 +2378,9 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
 	u8 status[DP_LINK_STATUS_SIZE + 2];
 	int err;
 
-	mutex_lock(&dp->lock);
-	if (dp->ignore_hpd) {
-		mutex_unlock(&dp->lock);
+	guard(mutex)(&dp->lock);
+	if (dp->ignore_hpd)
 		return;
-	}
 
 	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
 			       DP_LINK_STATUS_SIZE + 2);
@@ -2428,7 +2394,6 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
 			zynqmp_dp_train_loop(dp);
 		}
 	}
-	mutex_unlock(&dp->lock);
 }
 
 static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
-- 
2.35.1.1320.gc452695387.dirty

