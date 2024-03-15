Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D687D72E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 00:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BEA11269B;
	Fri, 15 Mar 2024 23:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="BxTXyEDr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6FA11269C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 23:09:37 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710544175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDXfOekMkWxHj0tq2/kO43ElNfcMHuVmA6YRLV++uCM=;
 b=BxTXyEDrHCg/zgdtWnpqPFZs/Ai1j7w7L8cMPTnW0O+9WZz3SzGJrp++nBRMV7N8syzUAd
 aVMmu47GM8FxaoK0QtZCXUBvN9Wlm4OUAhQ3jH6isV62Ys6+yRsWl4W9whXSVKlscfHT5j
 SiYhf8rJXON+LxhvaErRM7MQHuRaSgw=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance
 testing
Date: Fri, 15 Mar 2024 19:09:16 -0400
Message-Id: <20240315230916.1759060-7-sean.anderson@linux.dev>
In-Reply-To: <20240315230916.1759060-1-sean.anderson@linux.dev>
References: <20240315230916.1759060-1-sean.anderson@linux.dev>
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

Add a debugfs interface for exercising the various test modes supported
by the DisplayPort controller. This allows performing compliance
testing, or performing signal integrity measurements on a failing link.
At the moment, we do not support sink-driven link quality testing,
although such support would be fairly easy to add.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 591 ++++++++++++++++++++++++++++++-
 1 file changed, 590 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 040f7b88ee51..57032186e1ca 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -18,7 +18,9 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -50,6 +52,7 @@ MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
 #define ZYNQMP_DP_LANE_COUNT_SET			0x4
 #define ZYNQMP_DP_ENHANCED_FRAME_EN			0x8
 #define ZYNQMP_DP_TRAINING_PATTERN_SET			0xc
+#define ZYNQMP_DP_LINK_QUAL_PATTERN_SET			0x10
 #define ZYNQMP_DP_SCRAMBLING_DISABLE			0x14
 #define ZYNQMP_DP_DOWNSPREAD_CTL			0x18
 #define ZYNQMP_DP_SOFTWARE_RESET			0x1c
@@ -63,6 +66,9 @@ MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
 							 ZYNQMP_DP_SOFTWARE_RESET_STREAM3 | \
 							 ZYNQMP_DP_SOFTWARE_RESET_STREAM4 | \
 							 ZYNQMP_DP_SOFTWARE_RESET_AUX)
+#define ZYNQMP_DP_COMP_PATTERN_80BIT_1			0x20
+#define ZYNQMP_DP_COMP_PATTERN_80BIT_2			0x24
+#define ZYNQMP_DP_COMP_PATTERN_80BIT_3			0x28
 
 /* Core enable registers */
 #define ZYNQMP_DP_TRANSMITTER_ENABLE			0x80
@@ -206,6 +212,7 @@ MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
 #define ZYNQMP_DP_TX_PHY_POWER_DOWN_LANE_2		BIT(2)
 #define ZYNQMP_DP_TX_PHY_POWER_DOWN_LANE_3		BIT(3)
 #define ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL			0xf
+#define ZYNQMP_DP_TRANSMIT_PRBS7			0x230
 #define ZYNQMP_DP_PHY_PRECURSOR_LANE_0			0x23c
 #define ZYNQMP_DP_PHY_PRECURSOR_LANE_1			0x240
 #define ZYNQMP_DP_PHY_PRECURSOR_LANE_2			0x244
@@ -273,6 +280,69 @@ struct zynqmp_dp_config {
 	u8 bpp;
 };
 
+/**
+ * enum test_pattern - Test patterns for test testing
+ * TEST_VIDEO: Use regular video input
+ * TEST_SYMBOL_ERROR: Symbol error measurement pattern
+ * TEST_PRBS7: Output of the PRBS7 (x^7 + x^6 + 1) polynomial
+ * TEST_80BIT_CUSTOM: A custom 80-bit pattern
+ * TEST_CP2520: HBR2 compliance eye pattern
+ * TEST_TPS1: Link training symbol pattern TPS1 (/D10.2/)
+ * TEST_TPS2: Link training symbol pattern TPS2
+ * TEST_TPS3: Link training symbol pattern TPS3 (for HBR2)
+ */
+enum test_pattern {
+	TEST_VIDEO,
+	TEST_TPS1,
+	TEST_TPS2,
+	TEST_TPS3,
+	TEST_SYMBOL_ERROR,
+	TEST_PRBS7,
+	TEST_80BIT_CUSTOM,
+	TEST_CP2520,
+};
+
+static const char *const test_pattern_str[] = {
+	[TEST_VIDEO] = "video",
+	[TEST_TPS1] = "tps1",
+	[TEST_TPS2] = "tps2",
+	[TEST_TPS3] = "tps3",
+	[TEST_SYMBOL_ERROR] = "symbol-error",
+	[TEST_PRBS7] = "prbs7",
+	[TEST_80BIT_CUSTOM] = "80bit-custom",
+	[TEST_CP2520] = "cp2520",
+};
+
+/**
+ * struct zynqmp_dp_test - Configuration for test mode
+ * @pattern: The test pattern
+ * @enhanced: Use enhanced framing
+ * @downspread: Use SSC
+ * @active: Whether test mode is active
+ * @custom: Custom pattern for %TEST_80BIT_CUSTOM
+ * @train_set: Voltage/preemphasis settings
+ * @bw_code: Bandwidth code for the link
+ * @link_cnt: Number of lanes
+ */
+struct zynqmp_dp_test {
+	enum test_pattern pattern;
+	bool enhanced, downspread, active;
+	u8 custom[10];
+	u8 train_set[ZYNQMP_DP_MAX_LANES];
+	u8 bw_code;
+	u8 link_cnt;
+};
+
+/**
+ * struct zynqmp_dp_train_set_priv - Private data for train_set debugfs files
+ * @dp: DisplayPort IP core structure
+ * @lane: The lane for this file
+ */
+struct zynqmp_dp_train_set_priv {
+	struct zynqmp_dp *dp;
+	int lane;
+};
+
 /**
  * struct zynqmp_dp - Xilinx DisplayPort core
  * @dev: device structure
@@ -283,6 +353,7 @@ struct zynqmp_dp_config {
  * @irq: irq
  * @bridge: DRM bridge for the DP encoder
  * @next_bridge: The downstream bridge
+ * @test: Configuration for test mode
  * @config: IP core configuration from DTS
  * @aux: aux channel
  * @phy: PHY handles for DP lanes
@@ -294,6 +365,7 @@ struct zynqmp_dp_config {
  * @link_config: common link configuration between IP core and sink device
  * @mode: current mode between IP core and sink device
  * @train_set: set of training data
+ * @debugfs_train_set: Debugfs private data for @train_set
  */
 struct zynqmp_dp {
 	struct device *dev;
@@ -306,6 +378,7 @@ struct zynqmp_dp {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 
+	struct zynqmp_dp_test test;
 	struct zynqmp_dp_config config;
 	struct drm_dp_aux aux;
 	struct phy *phy[ZYNQMP_DP_MAX_LANES];
@@ -318,6 +391,7 @@ struct zynqmp_dp {
 	struct zynqmp_dp_link_config link_config;
 	struct zynqmp_dp_mode mode;
 	u8 train_set[ZYNQMP_DP_MAX_LANES];
+	struct zynqmp_dp_train_set_priv debugfs_train_set[ZYNQMP_DP_MAX_LANES];
 };
 
 static inline struct zynqmp_dp *bridge_to_dp(struct drm_bridge *bridge)
@@ -1599,6 +1673,510 @@ static struct edid *zynqmp_dp_bridge_get_edid(struct drm_bridge *bridge,
 	return drm_get_edid(connector, &dp->aux.ddc);
 }
 
+/* -----------------------------------------------------------------------------
+ * debugfs
+ */
+
+/**
+ * zynqmp_dp_set_test_pattern() - Configure the link for a test pattern
+ * @dp: DisplayPort IP core structure
+ */
+static void zynqmp_dp_set_test_pattern(struct zynqmp_dp *dp,
+				       enum test_pattern pattern,
+				       u8 *const custom)
+{
+	bool scramble = false;
+	u32 train_pattern = 0;
+	u32 link_pattern = 0;
+	u8 dpcd_train = 0;
+	u8 dpcd_link = 0;
+	int err;
+
+	switch (pattern) {
+	case TEST_TPS1:
+		train_pattern = 1;
+		break;
+	case TEST_TPS2:
+		train_pattern = 2;
+		break;
+	case TEST_TPS3:
+		train_pattern = 3;
+		break;
+	case TEST_SYMBOL_ERROR:
+		scramble = true;
+		link_pattern = DP_PHY_TEST_PATTERN_ERROR_COUNT;
+		break;
+	case TEST_PRBS7:
+		/* We use a dedicated register to enable PRBS7 */
+		dpcd_link = DP_LINK_QUAL_PATTERN_ERROR_RATE;
+		break;
+	case TEST_80BIT_CUSTOM: {
+		const u8 *p = custom;
+
+		link_pattern = DP_LINK_QUAL_PATTERN_80BIT_CUSTOM;
+
+		zynqmp_dp_write(dp, ZYNQMP_DP_COMP_PATTERN_80BIT_1,
+				(p[3] << 24) | (p[2] << 16) | (p[1] << 8) | p[0]);
+		zynqmp_dp_write(dp, ZYNQMP_DP_COMP_PATTERN_80BIT_2,
+				(p[7] << 24) | (p[6] << 16) | (p[5] << 8) | p[4]);
+		zynqmp_dp_write(dp, ZYNQMP_DP_COMP_PATTERN_80BIT_3,
+				(p[9] << 8) | p[8]);
+		break;
+	}
+	case TEST_CP2520:
+		link_pattern = DP_LINK_QUAL_PATTERN_CP2520_PAT_1;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		fallthrough;
+	case TEST_VIDEO:
+		scramble = true;
+	}
+
+	zynqmp_dp_write(dp, ZYNQMP_DP_SCRAMBLING_DISABLE, !scramble);
+	zynqmp_dp_write(dp, ZYNQMP_DP_TRAINING_PATTERN_SET, train_pattern);
+	zynqmp_dp_write(dp, ZYNQMP_DP_LINK_QUAL_PATTERN_SET, link_pattern);
+	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMIT_PRBS7, pattern == TEST_PRBS7);
+
+	dpcd_link = dpcd_link ?: link_pattern;
+	dpcd_train = train_pattern;
+	if (!scramble)
+		dpcd_train |= DP_LINK_SCRAMBLING_DISABLE;
+
+	if (dp->dpcd[DP_DPCD_REV] < 0x12) {
+		if (pattern == TEST_CP2520)
+			dev_warn(dp->dev,
+				"can't set sink link quality pattern to CP2520 for DPCD < r1.2; error counters will be invalid\n");
+		else
+			dpcd_train |= FIELD_PREP(DP_LINK_QUAL_PATTERN_11_MASK,
+						 dpcd_link);
+	} else {
+		u8 dpcd_link_lane[ZYNQMP_DP_MAX_LANES];
+
+		memset(dpcd_link_lane, dpcd_link, ZYNQMP_DP_MAX_LANES);
+		err = drm_dp_dpcd_write(&dp->aux, DP_LINK_QUAL_LANE0_SET,
+					dpcd_link_lane, ZYNQMP_DP_MAX_LANES);
+		if (err < 0)
+			dev_err(dp->dev, "failed to set quality pattern\n");
+	}
+
+	err = drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET, dpcd_train);
+	if (err < 0)
+		dev_err(dp->dev, "failed to set training pattern\n");
+}
+
+static int zynqmp_dp_test_setup(struct zynqmp_dp *dp)
+{
+	return zynqmp_dp_setup(dp, dp->test.bw_code, dp->test.link_cnt,
+			       dp->test.enhanced, dp->test.downspread, true);
+}
+
+static ssize_t zynqmp_dp_pattern_read(struct file *file, char __user *user_buf,
+				      size_t count, loff_t *ppos)
+{
+	struct dentry *dentry = file->f_path.dentry;
+	struct zynqmp_dp *dp = file->private_data;
+	char buf[16];
+	ssize_t ret;
+
+	ret = debugfs_file_get(dentry);
+	if (unlikely(ret))
+		return ret;
+
+	mutex_lock(&dp->lock);
+	ret = snprintf(buf, sizeof(buf), "%s\n",
+		       test_pattern_str[dp->test.pattern]);
+	mutex_unlock(&dp->lock);
+
+	debugfs_file_put(dentry);
+	return simple_read_from_buffer(user_buf, count, ppos, buf, ret);
+}
+
+static ssize_t zynqmp_dp_pattern_write(struct file *file,
+				       const char __user *user_buf,
+				       size_t count, loff_t *ppos)
+{
+
+	struct dentry *dentry = file->f_path.dentry;
+	struct zynqmp_dp *dp = file->private_data;
+	char buf[16];
+	ssize_t ret;
+	int pattern;
+
+	ret = debugfs_file_get(dentry);
+	if (unlikely(ret))
+		return ret;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf,
+				     count);
+	if (ret < 0)
+		goto out;
+	buf[ret] = '\0';
+
+	pattern = sysfs_match_string(test_pattern_str, buf);
+	if (pattern < 0) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	mutex_lock(&dp->lock);
+	dp->test.pattern = pattern;
+	if (dp->test.active)
+		zynqmp_dp_set_test_pattern(dp, dp->test.pattern,
+					   dp->test.custom);
+	mutex_unlock(&dp->lock);
+
+out:
+	debugfs_file_put(dentry);
+	return ret;
+}
+
+static const struct file_operations fops_zynqmp_dp_pattern = {
+	.read = zynqmp_dp_pattern_read,
+	.write = zynqmp_dp_pattern_write,
+	.open = simple_open,
+	.llseek = noop_llseek,
+};
+
+static int zynqmp_dp_enhanced_get(void *data, u64 *val)
+{
+	struct zynqmp_dp *dp = data;
+
+	mutex_lock(&dp->lock);
+	*val = dp->test.enhanced;
+	mutex_unlock(&dp->lock);
+	return 0;
+}
+
+static int zynqmp_dp_enhanced_set(void *data, u64 val)
+{
+	struct zynqmp_dp *dp = data;
+	int ret = 0;
+
+	mutex_lock(&dp->lock);
+	dp->test.enhanced = val;
+	if (dp->test.active)
+		ret = zynqmp_dp_test_setup(dp);
+	mutex_unlock(&dp->lock);
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_enhanced, zynqmp_dp_enhanced_get,
+			 zynqmp_dp_enhanced_set, "%llu\n");
+
+static int zynqmp_dp_downspread_get(void *data, u64 *val)
+{
+	struct zynqmp_dp *dp = data;
+
+	mutex_lock(&dp->lock);
+	*val = dp->test.downspread;
+	mutex_unlock(&dp->lock);
+	return 0;
+}
+
+static int zynqmp_dp_downspread_set(void *data, u64 val)
+{
+	struct zynqmp_dp *dp = data;
+	int ret = 0;
+
+	mutex_lock(&dp->lock);
+	dp->test.downspread = val;
+	if (dp->test.active)
+		ret = zynqmp_dp_test_setup(dp);
+	mutex_unlock(&dp->lock);
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_downspread, zynqmp_dp_downspread_get,
+			 zynqmp_dp_downspread_set, "%llu\n");
+
+static int zynqmp_dp_active_get(void *data, u64 *val)
+{
+	struct zynqmp_dp *dp = data;
+
+	mutex_lock(&dp->lock);
+	*val = dp->test.active;
+	mutex_unlock(&dp->lock);
+	return 0;
+}
+
+static int zynqmp_dp_active_set(void *data, u64 val)
+{
+	struct zynqmp_dp *dp = data;
+	int ret = 0;
+
+	mutex_lock(&dp->lock);
+	if (val) {
+		if (val < 2) {
+			ret = zynqmp_dp_test_setup(dp);
+			if (ret)
+				goto out;
+		}
+
+		zynqmp_dp_set_test_pattern(dp, dp->test.pattern,
+					   dp->test.custom);
+		zynqmp_dp_update_vs_emph(dp, dp->test.train_set, true);
+		dp->test.active = true;
+	} else {
+		dp->test.active = false;
+		zynqmp_dp_set_test_pattern(dp, TEST_VIDEO, NULL);
+		zynqmp_dp_train_loop(dp);
+	}
+out:
+	mutex_unlock(&dp->lock);
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_active, zynqmp_dp_active_get,
+			 zynqmp_dp_active_set, "%llu\n");
+
+static ssize_t zynqmp_dp_custom_read(struct file *file, char __user *user_buf,
+				      size_t count, loff_t *ppos)
+{
+	struct dentry *dentry = file->f_path.dentry;
+	struct zynqmp_dp *dp = file->private_data;
+	ssize_t ret;
+
+	ret = debugfs_file_get(dentry);
+	if (unlikely(ret))
+		return ret;
+
+	mutex_lock(&dp->lock);
+	ret = simple_read_from_buffer(user_buf, count, ppos, &dp->test.custom,
+				      sizeof(dp->test.custom));
+	mutex_unlock(&dp->lock);
+
+	debugfs_file_put(dentry);
+	return ret;
+}
+
+static ssize_t zynqmp_dp_custom_write(struct file *file,
+				      const char __user *user_buf,
+				      size_t count, loff_t *ppos)
+{
+
+	struct dentry *dentry = file->f_path.dentry;
+	struct zynqmp_dp *dp = file->private_data;
+	ssize_t ret;
+	char buf[sizeof(dp->test.custom)];
+
+	ret = debugfs_file_get(dentry);
+	if (unlikely(ret))
+		return ret;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
+	if (ret < 0)
+		goto out;
+
+	mutex_lock(&dp->lock);
+	memcpy(dp->test.custom, buf, ret);
+	if (dp->test.active)
+		zynqmp_dp_set_test_pattern(dp, dp->test.pattern,
+					   dp->test.custom);
+	mutex_unlock(&dp->lock);
+
+out:
+	debugfs_file_put(dentry);
+	return ret;
+}
+
+static const struct file_operations fops_zynqmp_dp_custom = {
+	.read = zynqmp_dp_custom_read,
+	.write = zynqmp_dp_custom_write,
+	.open = simple_open,
+	.llseek = noop_llseek,
+};
+
+static int zynqmp_dp_swing_get(void *data, u64 *val)
+{
+	struct zynqmp_dp_train_set_priv *priv = data;
+	struct zynqmp_dp *dp = priv->dp;
+
+	mutex_lock(&dp->lock);
+	*val = dp->test.train_set[priv->lane] & DP_TRAIN_VOLTAGE_SWING_MASK;
+	mutex_unlock(&dp->lock);
+	return 0;
+}
+
+static int zynqmp_dp_swing_set(void *data, u64 val)
+{
+	struct zynqmp_dp_train_set_priv *priv = data;
+	struct zynqmp_dp *dp = priv->dp;
+	u8 *train_set = &dp->test.train_set[priv->lane];
+	int ret = 0;
+
+	if (val > 3)
+		return -EINVAL;
+
+	mutex_lock(&dp->lock);
+	*train_set &= ~(DP_TRAIN_MAX_SWING_REACHED |
+			DP_TRAIN_VOLTAGE_SWING_MASK);
+	*train_set |= val;
+	if (val == 3)
+		*train_set |= DP_TRAIN_MAX_SWING_REACHED;
+
+	if (dp->test.active)
+		zynqmp_dp_update_vs_emph(dp, dp->test.train_set, true);
+	mutex_unlock(&dp->lock);
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_swing, zynqmp_dp_swing_get,
+			 zynqmp_dp_swing_set, "%llu\n");
+
+static int zynqmp_dp_preemphasis_get(void *data, u64 *val)
+{
+	struct zynqmp_dp_train_set_priv *priv = data;
+	struct zynqmp_dp *dp = priv->dp;
+
+	mutex_lock(&dp->lock);
+	*val = FIELD_GET(DP_TRAIN_PRE_EMPHASIS_MASK,
+			 dp->test.train_set[priv->lane]);
+	mutex_unlock(&dp->lock);
+	return 0;
+}
+
+static int zynqmp_dp_preemphasis_set(void *data, u64 val)
+{
+	struct zynqmp_dp_train_set_priv *priv = data;
+	struct zynqmp_dp *dp = priv->dp;
+	u8 *train_set = &dp->test.train_set[priv->lane];
+	int ret = 0;
+
+	if (val > 2)
+		return -EINVAL;
+
+	mutex_lock(&dp->lock);
+	*train_set &= ~(DP_TRAIN_MAX_PRE_EMPHASIS_REACHED |
+			DP_TRAIN_PRE_EMPHASIS_MASK);
+	*train_set |= val;
+	if (val == 2)
+		*train_set |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
+
+	if (dp->test.active)
+		zynqmp_dp_update_vs_emph(dp, dp->test.train_set, true);
+	mutex_unlock(&dp->lock);
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_preemphasis, zynqmp_dp_preemphasis_get,
+			 zynqmp_dp_preemphasis_set, "%llu\n");
+
+static int zynqmp_dp_lanes_get(void *data, u64 *val)
+{
+	struct zynqmp_dp *dp = data;
+
+	mutex_lock(&dp->lock);
+	*val = dp->test.link_cnt;
+	mutex_unlock(&dp->lock);
+	return 0;
+}
+
+static int zynqmp_dp_lanes_set(void *data, u64 val)
+{
+	struct zynqmp_dp *dp = data;
+	int ret = 0;
+
+	if (val > ZYNQMP_DP_MAX_LANES)
+		return -EINVAL;
+
+	mutex_lock(&dp->lock);
+	if (val > dp->num_lanes) {
+		ret = -EINVAL;
+	} else {
+		dp->test.link_cnt = val;
+		if (dp->test.active)
+			ret = zynqmp_dp_test_setup(dp);
+	}
+	mutex_unlock(&dp->lock);
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_lanes, zynqmp_dp_lanes_get,
+			 zynqmp_dp_lanes_set, "%llu\n");
+
+static int zynqmp_dp_rate_get(void *data, u64 *val)
+{
+	struct zynqmp_dp *dp = data;
+
+	mutex_lock(&dp->lock);
+	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
+	mutex_unlock(&dp->lock);
+	return 0;
+}
+
+static int zynqmp_dp_rate_set(void *data, u64 val)
+{
+	struct zynqmp_dp *dp = data;
+	u8 bw_code = drm_dp_link_rate_to_bw_code(val / 10000);
+	int link_rate = drm_dp_bw_code_to_link_rate(bw_code);
+	int ret = 0;
+
+	if (val / 10000 != link_rate)
+		return -EINVAL;
+
+	if (bw_code != DP_LINK_BW_1_62 && bw_code != DP_LINK_BW_2_7 &&
+	    bw_code != DP_LINK_BW_5_4)
+		return -EINVAL;
+
+	mutex_lock(&dp->lock);
+	dp->test.bw_code = bw_code;
+	if (dp->test.active)
+		ret = zynqmp_dp_test_setup(dp);
+	mutex_unlock(&dp->lock);
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_rate, zynqmp_dp_rate_get,
+			 zynqmp_dp_rate_set, "%llu\n");
+
+static void zynqmp_dp_bridge_debugfs_init(struct drm_bridge *bridge,
+					  struct dentry *root)
+{
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
+	struct dentry *test;
+	int i;
+
+	dp->test.bw_code = DP_LINK_BW_5_4;
+	dp->test.link_cnt = dp->num_lanes;
+
+	test = debugfs_create_dir("test", root);
+#define CREATE_FILE(name) \
+	debugfs_create_file(#name, 0600, test, dp, &fops_zynqmp_dp_##name)
+	CREATE_FILE(pattern);
+	CREATE_FILE(enhanced);
+	CREATE_FILE(downspread);
+	CREATE_FILE(active);
+	CREATE_FILE(custom);
+	CREATE_FILE(rate);
+	CREATE_FILE(lanes);
+
+	for (i = 0; i < dp->num_lanes; i++) {
+		static const char fmt[] = "lane%d_preemphasis";
+		char name[sizeof(fmt)];
+
+		dp->debugfs_train_set[i].dp = dp;
+		dp->debugfs_train_set[i].lane = i;
+
+		sprintf(name, fmt, i);
+		debugfs_create_file(name, 0600, test,
+				    &dp->debugfs_train_set[i],
+				    &fops_zynqmp_dp_preemphasis);
+
+		sprintf(name, "lane%d_swing", i);
+		debugfs_create_file(name, 0600, test,
+				    &dp->debugfs_train_set[i],
+				    &fops_zynqmp_dp_swing);
+	}
+}
+
 static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.attach = zynqmp_dp_bridge_attach,
 	.detach = zynqmp_dp_bridge_detach,
@@ -1611,6 +2189,7 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.atomic_check = zynqmp_dp_bridge_atomic_check,
 	.detect = zynqmp_dp_bridge_detect,
 	.get_edid = zynqmp_dp_bridge_get_edid,
+	.debugfs_init = zynqmp_dp_bridge_debugfs_init,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1645,6 +2224,9 @@ static void zynqmp_dp_hpd_work_func(struct work_struct *work)
 					    hpd_work.work);
 	enum drm_connector_status status;
 
+	if (dp->test.active)
+		return;
+
 	status = zynqmp_dp_bridge_detect(&dp->bridge);
 	drm_bridge_hpd_notify(&dp->bridge, status);
 }
@@ -1666,7 +2248,14 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
 		if (status[4] & DP_LINK_STATUS_UPDATED ||
 		    !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
 		    !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt)) {
-			zynqmp_dp_train_loop(dp);
+			if (dp->test.active) {
+				dev_dbg(dp->dev, "Ignoring HPD IRQ in test mode\n");
+			} else {
+				dev_dbg(dp->dev,
+					"Retraining due to HPD IRQ (status is [%*ph])\n",
+					(int)sizeof(status), status);
+				zynqmp_dp_train_loop(dp);
+			}
 		}
 	}
 	mutex_unlock(&dp->lock);
-- 
2.35.1.1320.gc452695387.dirty

