Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C9B8AD43A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 20:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16C9112CE5;
	Mon, 22 Apr 2024 18:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="r3UtJi6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E57112CE5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:46:27 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713811585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJ6Oi8CaQ6iRrch3RlrU6dm9QaE+HzshzAMd6D7LEeo=;
 b=r3UtJi6genhBjUIi11ts3AbB0DAICQwwWwyLmgfP5WDzv/QNBsC5ChJFhkA21MKHZvIE1J
 xiEl6zIJWeFh7HFuT/6XleIeXaH4fOY/1ZD5j7NNTjAqxrRpbPXktNIDaAm10qvd+BvMmp
 sJDrvDQYqMuHrBFddRauK5LAgtbjeKg=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v3 13/13] drm: zynqmp_dp: Add debugfs interface for compliance
 testing
Date: Mon, 22 Apr 2024 14:45:53 -0400
Message-Id: <20240422184553.3573009-14-sean.anderson@linux.dev>
In-Reply-To: <20240422184553.3573009-1-sean.anderson@linux.dev>
References: <20240422184553.3573009-1-sean.anderson@linux.dev>
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

Additionally, add some debugfs files for ignoring AUX errors and HPD
events, as this can allow testing with equipment that cannot emulate a
DPRX.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v2)

Changes in v2:
- Document debugfs files
- Add ignore_aux_errors and ignore_hpd debugfs files to replace earlier
  implicit functionality
- Attempt to fix unreproducable, spurious build warning

 Documentation/gpu/drivers.rst    |   1 +
 Documentation/gpu/zynqmp.rst     | 149 +++++++
 MAINTAINERS                      |   1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 682 ++++++++++++++++++++++++++++++-
 4 files changed, 830 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/gpu/zynqmp.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index b899cbc5c2b4..187201aedbe5 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -22,6 +22,7 @@ GPU Driver Documentation
    afbc
    komeda-kms
    panfrost
+   zynqmp
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/zynqmp.rst b/Documentation/gpu/zynqmp.rst
new file mode 100644
index 000000000000..f57bfa0ad6ec
--- /dev/null
+++ b/Documentation/gpu/zynqmp.rst
@@ -0,0 +1,149 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+===============================================
+Xilinx ZynqMP Ultrascale+ DisplayPort Subsystem
+===============================================
+
+This subsystem handles DisplayPort video and audio output on the ZynqMP. It
+supports in-memory framebuffers with the DisplayPort DMA controller
+(xilinx-dpdma), as well as "live" video and audio from the programmable logic
+(PL). This subsystem can perform several transformations, including color space
+conversion, alpha blending, and audio mixing, although not all features are
+currently supported.
+
+debugfs
+-------
+
+To support debugging and compliance testing, several test modes can be enabled
+though debugfs. The following files in /sys/kernel/debug/dri/X/DP-1/test/
+control the DisplayPort test modes:
+
+active:
+        Writing a 1 to this file will activate test mode, and writing a 0 will
+        deactivate test mode. Writing a 1 or 0 when the test mode is already
+        active/inactive will re-activate/re-deactivate test mode. When test
+        mode is inactive, changes made to other files will have no (immediate)
+        effect, although the settings will be saved for when test mode is
+        activated. When test mode is active, changes made to other files will
+        apply immediately.
+
+custom:
+        Custom test pattern value
+
+downspread:
+        Enable/disable clock downspreading (spread-spectrum clocking) by
+        writing 1/0
+
+enhanced:
+        Enable/disable enhanced framing
+
+ignore_aux_errors:
+        Ignore AUX errors when set to 1. Writes to this file take effect
+        immediately (regardless of whether test mode is active) and affect all
+        AUX transfers.
+
+ignore_hpd:
+        Ignore hotplug events (such as cable removals or monitor link
+        retraining requests) when set to 1. Writes to this file take effect
+        immediately (regardless of whether test mode is active).
+
+laneX_preemphasis:
+        Preemphasis from 0 (lowest) to 2 (highest) for lane X
+
+laneX_swing:
+        Voltage swing from 0 (lowest) to 3 (highest) for lane X
+
+lanes:
+        Number of lanes to use (1, 2, or 4)
+
+pattern:
+        Test pattern. May be one of:
+
+                video
+                        Use regular video input
+
+                symbol-error
+                        Symbol error measurement pattern
+
+                prbs7
+                        Output of the PRBS7 (x^7 + x^6 + 1) polynomial
+
+                80bit-custom
+                        A custom 80-bit pattern
+
+                cp2520
+                        HBR2 compliance eye pattern
+
+                tps1
+                        Link training symbol pattern TPS1 (/D10.2/)
+
+                tps2
+                        Link training symbol pattern TPS2
+
+                tps3
+                        Link training symbol pattern TPS3 (for HBR2)
+
+rate:
+        Rate in hertz. One of
+
+                * 5400000000 (HBR2)
+                * 2700000000 (HBR)
+                * 1620000000 (RBR)
+
+You can dump the displayport test settings with the following command::
+
+        for prop in /sys/kernel/debug/dri/1/DP-1/test/*; do
+                printf '%-17s ' ${prop##*/}
+                if [ ${prop##*/} = custom ]; then
+                        hexdump -C $prop | head -1
+                else
+                        cat $prop
+                fi
+        done
+
+The output could look something like::
+
+        active            1
+        custom            00000000  00 00 00 00 00 00 00 00  00 00                    |..........|
+        downspread        0
+        enhanced          1
+        ignore_aux_errors 1
+        ignore_hpd        1
+        lane0_preemphasis 0
+        lane0_swing       3
+        lane1_preemphasis 0
+        lane1_swing       3
+        lanes             2
+        pattern           prbs7
+        rate              1620000000
+
+The recommended test procedure is to connect the board to a monitor,
+configure test mode, activate test mode, and then disconnect the cable
+and connect it to your test equipment of choice. For example, one
+sequence of commands could be::
+
+        echo 1 > /sys/kernel/debug/dri/1/DP-1/test/enhanced
+        echo tps1 > /sys/kernel/debug/dri/1/DP-1/test/pattern
+        echo 1620000000 > /sys/kernel/debug/dri/1/DP-1/test/rate
+        echo 1 > /sys/kernel/debug/dri/1/DP-1/test/ignore_aux_errors
+        echo 1 > /sys/kernel/debug/dri/1/DP-1/test/ignore_hpd
+        echo 1 > /sys/kernel/debug/dri/1/DP-1/test/active
+
+at which point the cable could be disconnected from the monitor.
+
+Internals
+---------
+
+.. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_disp.h
+
+.. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+
+.. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_kms.h
+
+.. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_disp.c
+
+.. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_dp.c
+
+.. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+
+.. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_kms.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d1052fa6a69..78680180aefc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7305,6 +7305,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/xlnx/
+F:	Documentation/gpu/zynqmp.rst
 F:	drivers/gpu/drm/xlnx/
 
 DRM GPU SCHEDULER
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index dea4b8a819fd..5cf9e514b848 100644
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
+ * @TEST_VIDEO: Use regular video input
+ * @TEST_SYMBOL_ERROR: Symbol error measurement pattern
+ * @TEST_PRBS7: Output of the PRBS7 (x^7 + x^6 + 1) polynomial
+ * @TEST_80BIT_CUSTOM: A custom 80-bit pattern
+ * @TEST_CP2520: HBR2 compliance eye pattern
+ * @TEST_TPS1: Link training symbol pattern TPS1 (/D10.2/)
+ * @TEST_TPS2: Link training symbol pattern TPS2
+ * @TEST_TPS3: Link training symbol pattern TPS3 (for HBR2)
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
@@ -283,23 +353,28 @@ struct zynqmp_dp_config {
  * @irq: irq
  * @bridge: DRM bridge for the DP encoder
  * @next_bridge: The downstream bridge
+ * @test: Configuration for test mode
  * @config: IP core configuration from DTS
  * @aux: aux channel
  * @aux_done: Completed when we get an AUX reply or timeout
+ * @ignore_aux_errors: If set, AUX errors are suppressed
  * @phy: PHY handles for DP lanes
  * @num_lanes: number of enabled phy lanes
  * @hpd_work: hot plug detection worker
  * @hpd_irq_work: hot plug detection IRQ worker
+ * @ignore_hpd: If set, HPD events and IRQs are ignored
  * @status: connection status
  * @enabled: flag to indicate if the device is enabled
  * @dpcd: DP configuration data from currently connected sink device
  * @link_config: common link configuration between IP core and sink device
  * @mode: current mode between IP core and sink device
  * @train_set: set of training data
+ * @debugfs_train_set: Debugfs private data for @train_set
  *
  * @lock covers the link configuration in this struct and the device's
- * registers. It does not cover @aux. It is not strictly required for any of
- * the members which are only modified at probe/remove time (e.g. @dev).
+ * registers. It does not cover @aux or @ignore_aux_errors. It is not strictly
+ * required for any of the members which are only modified at probe/remove time
+ * (e.g. @dev).
  */
 struct zynqmp_dp {
 	struct drm_dp_aux aux;
@@ -319,9 +394,13 @@ struct zynqmp_dp {
 	enum drm_connector_status status;
 	int irq;
 	bool enabled;
+	bool ignore_aux_errors;
+	bool ignore_hpd;
 
+	struct zynqmp_dp_train_set_priv debugfs_train_set[ZYNQMP_DP_MAX_LANES];
 	struct zynqmp_dp_mode mode;
 	struct zynqmp_dp_link_config link_config;
+	struct zynqmp_dp_test test;
 	struct zynqmp_dp_config config;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 train_set[ZYNQMP_DP_MAX_LANES];
@@ -1034,6 +1113,8 @@ zynqmp_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 
 		if (dp->status == connector_status_disconnected) {
 			dev_dbg(dp->dev, "no connected aux device\n");
+			if (dp->ignore_aux_errors)
+				goto fake_response;
 			return -ENODEV;
 		}
 
@@ -1042,7 +1123,13 @@ zynqmp_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 
 	dev_dbg(dp->dev, "failed to do aux transfer (%d)\n", ret);
 
-	return ret;
+	if (!dp->ignore_aux_errors)
+		return ret;
+
+fake_response:
+	msg->reply = DP_AUX_NATIVE_REPLY_ACK;
+	memset(msg->buffer, 0, msg->size);
+	return msg->size;
 }
 
 /**
@@ -1616,6 +1703,584 @@ static struct edid *zynqmp_dp_bridge_get_edid(struct drm_bridge *bridge,
 	return drm_get_edid(connector, &dp->aux.ddc);
 }
 
+/* -----------------------------------------------------------------------------
+ * debugfs
+ */
+
+/**
+ * zynqmp_dp_set_test_pattern() - Configure the link for a test pattern
+ * @dp: DisplayPort IP core structure
+ * @pattern: The test pattern to configure
+ * @custom: The custom pattern to use if @pattern is %TEST_80BIT_CUSTOM
+ *
+ * Return: 0 on success, or negative errno on (DPCD) failure
+ */
+static int zynqmp_dp_set_test_pattern(struct zynqmp_dp *dp,
+				      enum test_pattern pattern,
+				      u8 *const custom)
+{
+	bool scramble = false;
+	u32 train_pattern = 0;
+	u32 link_pattern = 0;
+	u8 dpcd_train = 0;
+	u8 dpcd_link = 0;
+	int ret;
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
+		ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_QUAL_LANE0_SET,
+					dpcd_link_lane, ZYNQMP_DP_MAX_LANES);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET, dpcd_train);
+	return ret < 0 ? ret : 0;
+}
+
+static int zynqmp_dp_test_setup(struct zynqmp_dp *dp)
+{
+	return zynqmp_dp_setup(dp, dp->test.bw_code, dp->test.link_cnt,
+			       dp->test.enhanced, dp->test.downspread);
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
+		ret = zynqmp_dp_set_test_pattern(dp, dp->test.pattern,
+						 dp->test.custom) ?: ret;
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
+		ret = zynqmp_dp_set_test_pattern(dp, dp->test.pattern,
+						 dp->test.custom);
+		if (ret)
+			goto out;
+
+		ret = zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
+		if (ret)
+			goto out;
+
+		dp->test.active = true;
+	} else {
+		int err;
+
+		dp->test.active = false;
+		err = zynqmp_dp_set_test_pattern(dp, TEST_VIDEO, NULL);
+		if (err)
+			dev_warn(dp->dev, "could not clear test pattern: %d\n",
+				 err);
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
+		ret = zynqmp_dp_set_test_pattern(dp, dp->test.pattern,
+						 dp->test.custom) ?: ret;
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
+		ret = zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
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
+		ret = zynqmp_dp_update_vs_emph(dp, dp->test.train_set);
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
+	int link_rate;
+	int ret = 0;
+	u8 bw_code;
+
+	if (do_div(val, 10000))
+		return -EINVAL;
+
+	bw_code = drm_dp_link_rate_to_bw_code(val);
+	link_rate = drm_dp_bw_code_to_link_rate(bw_code);
+	if (val != link_rate)
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
+static int zynqmp_dp_ignore_aux_errors_get(void *data, u64 *val)
+{
+	struct zynqmp_dp *dp = data;
+
+	mutex_lock(&dp->aux.hw_mutex);
+	*val = dp->ignore_aux_errors;
+	mutex_unlock(&dp->aux.hw_mutex);
+	return 0;
+}
+
+static int zynqmp_dp_ignore_aux_errors_set(void *data, u64 val)
+{
+	struct zynqmp_dp *dp = data;
+
+	if (val != !!val)
+		return -EINVAL;
+
+	mutex_lock(&dp->aux.hw_mutex);
+	dp->ignore_aux_errors = val;
+	mutex_unlock(&dp->aux.hw_mutex);
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_ignore_aux_errors,
+			 zynqmp_dp_ignore_aux_errors_get,
+			 zynqmp_dp_ignore_aux_errors_set, "%llu\n");
+
+static int zynqmp_dp_ignore_hpd_get(void *data, u64 *val)
+{
+	struct zynqmp_dp *dp = data;
+
+	mutex_lock(&dp->lock);
+	*val = dp->ignore_hpd;
+	mutex_unlock(&dp->lock);
+	return 0;
+}
+
+static int zynqmp_dp_ignore_hpd_set(void *data, u64 val)
+{
+	struct zynqmp_dp *dp = data;
+
+	if (val != !!val)
+		return -EINVAL;
+
+	mutex_lock(&dp->lock);
+	dp->ignore_hpd = val;
+	mutex_lock(&dp->lock);
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_ignore_hpd, zynqmp_dp_ignore_hpd_get,
+			 zynqmp_dp_ignore_hpd_set, "%llu\n");
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
+	CREATE_FILE(ignore_aux_errors);
+	CREATE_FILE(ignore_hpd);
+
+	for (i = 0; i < dp->num_lanes; i++) {
+		static const char fmt[] = "lane%d_preemphasis";
+		char name[sizeof(fmt)];
+
+		dp->debugfs_train_set[i].dp = dp;
+		dp->debugfs_train_set[i].lane = i;
+
+		snprintf(name, sizeof(name), fmt, i);
+		debugfs_create_file(name, 0600, test,
+				    &dp->debugfs_train_set[i],
+				    &fops_zynqmp_dp_preemphasis);
+
+		snprintf(name, sizeof(name), "lane%d_swing", i);
+		debugfs_create_file(name, 0600, test,
+				    &dp->debugfs_train_set[i],
+				    &fops_zynqmp_dp_swing);
+	}
+}
+
 static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.attach = zynqmp_dp_bridge_attach,
 	.detach = zynqmp_dp_bridge_detach,
@@ -1628,6 +2293,7 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.atomic_check = zynqmp_dp_bridge_atomic_check,
 	.detect = zynqmp_dp_bridge_detect,
 	.get_edid = zynqmp_dp_bridge_get_edid,
+	.debugfs_init = zynqmp_dp_bridge_debugfs_init,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1662,6 +2328,11 @@ static void zynqmp_dp_hpd_work_func(struct work_struct *work)
 	enum drm_connector_status status;
 
 	mutex_lock(&dp->lock);
+	if (dp->ignore_hpd) {
+		mutex_unlock(&dp->lock);
+		return;
+	}
+
 	status = __zynqmp_dp_bridge_detect(dp);
 	mutex_unlock(&dp->lock);
 
@@ -1676,6 +2347,11 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
 	int err;
 
 	mutex_lock(&dp->lock);
+	if (dp->ignore_hpd) {
+		mutex_unlock(&dp->lock);
+		return;
+	}
+
 	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
 			       DP_LINK_STATUS_SIZE + 2);
 	if (err < 0) {
-- 
2.35.1.1320.gc452695387.dirty

