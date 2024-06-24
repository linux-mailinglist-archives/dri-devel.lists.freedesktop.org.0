Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5A91438B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A5410E37B;
	Mon, 24 Jun 2024 07:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="hgS2NDp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 410 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jun 2024 01:37:31 UTC
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A1310E139
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 01:37:31 +0000 (UTC)
X-Envelope-To: dmitry.torokhov@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719192648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTo3ukp0zCamZpVLQdh0E+Pd8A5dWYoZrTtf9mqapak=;
 b=hgS2NDp4+1frH5NJf9N3Aht6/OtKvIber2E6vM1NPO8u9gKSeZjotdw646gKIOa9+5u6Uf
 E5rhojoEx0OO1hM3uqrRpJAE6fE4df7Km9ImS6SKeyRqVCLY7ZexbM3o5V3ebBrNjH8Rm5
 KdsyUizoY7x1PbXfg0w0hoEX87Hoy0uodpVTynvjksSNLkVdlH5Ip98mFxt8BDs4cjJDTm
 ZZHoNmx/furq7YGlIYL+WSOPBBWClyp+047pLIr8Iuuq+Ge4s/92xwKAhrdtz3HtniUswX
 8t2dXtQoqGugMmQYQURqKRYbH0zzNAMAOe5GcbhQKxvrElLYTGvu4MzWKviXlA==
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: andersson@kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: frieder.hannenheim@proton.me
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: robh@kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Mon, 24 Jun 2024 03:30:30 +0200
Subject: [PATCH 6/7] Input: touchscreen: add Synaptics TCM oncell S3908
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-oneplus8-v1-6-388eecf2dff7@postmarketos.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
In-Reply-To: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Frieder Hannenheim <frieder.hannenheim@proton.me>
X-Developer-Signature: v=1; a=openpgp-sha256; l=20990;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=ofPH8XpIU8xv5ZUzDTdKHXODhkDQ/q282yF0Px7Iwfw=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmeMw8ADqCXumB1j5LUM4UcNRmcwFaVHuTt7MeM
 VOpL97euQ+JAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnjMPAAKCRAFgzErGV9k
 th+tEACJRrvRTBgwMGuwXyMvPF/gnMOE/jFlzUwM4K7+eZ8bZLLwedeoxpvfAj4Ysf9GFe8iNKF
 Jza7DIfSwOEbITAu0cc2dCOlSpWLGA2FI+ZzpKZDVW+f+6w6jnV9HagN0/lo2KEvTgTEkuWYcjr
 sah9vPbppNuxKdqfZqjvz8WgPVXMIcw6RxFuizEdX9TDWYYJSsVnFo1Wc9FED79fOYjSUD/m1Zd
 d1TXPUBReTfKB1EHT8Lk77xp2x+R/Lju34AJBL0qSSBa1UFU53oNirOVcaa7vHNkwKRBI68dryH
 b8XjY1U/rOyqdGsQqsS7dRlzssuKMNLUvX9EmHVG5OMBicoMn9BRlyhfsCqcfuthVySoF5XPt6N
 Tzc2XjPTRB2M/gkGNWLFC26v7BkjDPMbbteXQGgfZQn4dq0E/q5XkimH655blQMDUHBhhwo58A1
 Z7p0rtlgTpfYYv/GZj27JocpnizHR0897WxVQWKcOJOEAssFurbjvuWfNAIkm3ezjU1PyMb+FcY
 RILYzix174xiHvOfwfv/x7EBGslG1EA9SAfY+3iGpmFK2+DfXicBRgdfovo7Nlnh7Sf1w7ZSWd6
 lNy3ZBKr6UqiJxBEf4spPY6ps2mLNhnl61J940iZEayTF+c0/qC/UBAHjg86J65i5c1Jj34OP/L
 bao7/TgbpFwTw9w==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 24 Jun 2024 07:22:58 +0000
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

The TCM oncell is the next generation of Synaptics touchscreen ICs.
These run a very featured firmware with a reasonably well defined API.
It is however entirely incompatible with the existing RMI4 interface.

Unfortunately, no public datasheet for the interface seems to be
available, instead this driver was created through a combination of
vendor drivers and trial and error.

The firmware interface implies support for defining the exact bit
encoding of the touch reports, however on the S3908 chip + firmware
found in the OnePlus 8t the TCM_SET_TOUCH_REPORT_CONFIG command appears
to be unsupported.

Co-developed-by: Frieder Hannenheim <frieder.hannenheim@proton.me>
Signed-off-by: Frieder Hannenheim <frieder.hannenheim@proton.me>
Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 MAINTAINERS                                      |   7 +
 drivers/input/touchscreen/Kconfig                |  11 +
 drivers/input/touchscreen/Makefile               |   1 +
 drivers/input/touchscreen/synaptics_tcm_oncell.c | 617 +++++++++++++++++++++++
 4 files changed, 636 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b9cfbf92d7a..db589c841d8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21826,8 +21826,15 @@ M:	Icenowy Zheng <icenowy@aosc.io>
 S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/silergy,sy8106a.yaml
 F:	drivers/regulator/sy8106a-regulator.c
 
+SYNAPTICS TCM ONCELL TOUCHSCREEN DRIVER
+M:	Caleb Connolly <caleb@postmarketos.org>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.yaml
+F:	drivers/input/touchscreen/synaptics_tcm_oncell.c
+
 SYNC FILE FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 R:	Gustavo Padovan <gustavo@padovan.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index c821fe3ee794..43c4fd80601c 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -531,8 +531,19 @@ config TOUCHSCREEN_S6SY761
 
 	  To compile this driver as module, choose M here: the
 	  module will be called s6sy761.
 
+config TOUCHSCREEN_SYNAPTICS_TCM_ONCELL
+	tristate "Synaptics TCM Oncell Touchscreen driver"
+	depends on I2C
+	help
+	  Say Y if you have the Synaptics S3908 TCM Oncell
+
+	  If unsure, say N
+
+	  To compile this driver as module, choose M here: the
+	  module will be called synaptics_tcm_oncell.
+
 config TOUCHSCREEN_GUNZE
 	tristate "Gunze AHL-51S touchscreen"
 	select SERIO
 	help
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index a81cb5aa21a5..6a2b85050c3a 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -88,8 +88,9 @@ obj-$(CONFIG_TOUCHSCREEN_STMFTS)	+= stmfts.o
 obj-$(CONFIG_TOUCHSCREEN_STMPE)		+= stmpe-ts.o
 obj-$(CONFIG_TOUCHSCREEN_SUN4I)		+= sun4i-ts.o
 obj-$(CONFIG_TOUCHSCREEN_SUR40)		+= sur40.o
 obj-$(CONFIG_TOUCHSCREEN_SURFACE3_SPI)	+= surface3_spi.o
+obj-$(CONFIG_TOUCHSCREEN_SYNAPTICS_TCM_ONCELL)	+= synaptics_tcm_oncell.o
 obj-$(CONFIG_TOUCHSCREEN_TI_AM335X_TSC)	+= ti_am335x_tsc.o
 obj-$(CONFIG_TOUCHSCREEN_TOUCHIT213)	+= touchit213.o
 obj-$(CONFIG_TOUCHSCREEN_TOUCHRIGHT)	+= touchright.o
 obj-$(CONFIG_TOUCHSCREEN_TOUCHWIN)	+= touchwin.o
diff --git a/drivers/input/touchscreen/synaptics_tcm_oncell.c b/drivers/input/touchscreen/synaptics_tcm_oncell.c
new file mode 100644
index 000000000000..c1ba9a3a93c0
--- /dev/null
+++ b/drivers/input/touchscreen/synaptics_tcm_oncell.c
@@ -0,0 +1,617 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Driver for Synaptics TCM Oncell Touchscreens
+ *
+ *  Copyright (c) 2024 Frieder Hannenheim <frieder.hannenheim@proton.me>
+ *  Copyright (c) 2024 Caleb Connolly <caleb@postmarketos.org>
+ */
+
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/touchscreen.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <asm/unaligned.h>
+#include <linux/delay.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/of_gpio.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+
+/*
+ * The TCM oncell interface uses a command byte, which may be followed by additional
+ * data. The packet format is defined in the tcm_cmd struct.
+ *
+ * The following list only defines commands that are used in this driver (and their
+ * counterparts for context). Vendor reference implementations can be found at
+ * https://github.com/LineageOS/android_kernel_oneplus_sm8250/tree/ee0a7ee1939ffd53000e42051caf8f0800defb27/drivers/input/touchscreen/synaptics_tcm
+ */
+
+/*
+ * Request information about the chip. We don't send this command explicitly as
+ * the controller automatically sends this information when starting up.
+ */
+#define TCM_IDENTIFY 0x02
+
+/* Enable/disable reporting touch inputs */
+#define TCM_ENABLE_REPORT 0x05
+#define TCM_DISABLE_REPORT 0x06
+
+/*
+ * After powering on, we send this to exit the bootloader mode and run the main
+ * firmware.
+ */
+#define TCM_RUN_APPLICATION_FIRMWARE 0x14
+
+/*
+ * Reports information about the vendor provided application firmware. This is
+ * also used to determine when the firmware has finished booting.
+ */
+#define TCM_GET_APPLICATION_INFO 0x20
+
+#define MODE_APPLICATION 0x01
+
+#define APP_STATUS_OK 0x00
+#define APP_STATUS_BOOTING 0x01
+#define APP_STATUS_UPDATING 0x02
+#define APP_STATUS_BAD_APP_CONFIG 0xff
+
+/* status codes */
+#define REPORT_IDLE 0x00
+#define REPORT_OK 0x01
+#define REPORT_BUSY 0x02
+#define REPORT_CONTINUED_READ 0x03
+#define REPORT_RECEIVE_BUFFER_OVERFLOW 0x0c
+#define REPORT_PREVIOUS_COMMAND_PENDING 0x0d
+#define REPORT_NOT_IMPLEMENTED 0x0e
+#define REPORT_ERROR 0x0f
+
+/* report types */
+#define REPORT_IDENTIFY 0x10
+#define REPORT_TOUCH 0x11
+#define REPORT_DELTA 0x12
+#define REPORT_RAW 0x13
+#define REPORT_DEBUG 0x14
+#define REPORT_LOG 0x1d
+#define REPORT_TOUCH_HOLD 0x20
+#define REPORT_INVALID 0xff
+
+/* Touch report codes */
+#define TOUCH_END 0
+#define TOUCH_FOREACH_ACTIVE_OBJECT 1
+#define TOUCH_FOREACH_OBJECT 2
+#define TOUCH_FOREACH_END 3
+#define TOUCH_PAD_TO_NEXT_BYTE 4
+#define TOUCH_TIMESTAMP 5
+#define TOUCH_OBJECT_N_INDEX 6
+#define TOUCH_OBJECT_N_CLASSIFICATION 7
+#define TOUCH_OBJECT_N_X_POSITION 8
+#define TOUCH_OBJECT_N_Y_POSITION 9
+#define TOUCH_OBJECT_N_Z 10
+#define TOUCH_OBJECT_N_X_WIDTH 11
+#define TOUCH_OBJECT_N_Y_WIDTH 12
+#define TOUCH_OBJECT_N_TX_POSITION_TIXELS 13
+#define TOUCH_OBJECT_N_RX_POSITION_TIXELS 14
+#define TOUCH_0D_BUTTONS_STATE 15
+#define TOUCH_GESTURE_DOUBLE_TAP 16
+#define TOUCH_FRAME_RATE 17 /* Normally 80hz */
+#define TOUCH_POWER_IM 18
+#define TOUCH_CID_IM 19
+#define TOUCH_RAIL_IM 20
+#define TOUCH_CID_VARIANCE_IM 21
+#define TOUCH_NSM_FREQUENCY 22
+#define TOUCH_NSM_STATE 23
+#define TOUCH_NUM_OF_ACTIVE_OBJECTS 23
+#define TOUCH_NUM_OF_CPU_CYCLES_USED_SINCE_LAST_FRAME 24
+#define TOUCH_TUNING_GAUSSIAN_WIDTHS 0x80
+#define TOUCH_TUNING_SMALL_OBJECT_PARAMS 0x81
+#define TOUCH_TUNING_0D_BUTTONS_VARIANCE 0x82
+#define TOUCH_REPORT_GESTURE_SWIPE 193
+#define TOUCH_REPORT_GESTURE_CIRCLE 194
+#define TOUCH_REPORT_GESTURE_UNICODE 195
+#define TOUCH_REPORT_GESTURE_VEE 196
+#define TOUCH_REPORT_GESTURE_TRIANGLE 197
+#define TOUCH_REPORT_GESTURE_INFO 198
+#define TOUCH_REPORT_GESTURE_COORDINATE 199
+#define TOUCH_REPORT_CUSTOMER_GRIP_INFO 203
+
+struct tcm_message_header {
+	u8 marker;
+	u8 code;
+} __packed;
+
+/* header + 2 bytes (which are length of data depending on report code) */
+#define REPORT_PEAK_LEN (sizeof(struct tcm_message_header) + 2)
+
+struct tcm_cmd {
+	u8 cmd;
+	u16 length;
+	u8 data[];
+};
+
+struct tcm_identification {
+	struct tcm_message_header header;
+	u16 length;
+	u8 version;
+	u8 mode;
+	char part_number[16];
+	u8 build_id[4];
+	u8 max_write_size[2];
+} __packed;
+
+struct tcm_app_info {
+	struct tcm_message_header header;
+	u16 length;
+	u8 version[2];
+	u16 status;
+	u8 static_config_size[2];
+	u8 dynamic_config_size[2];
+	u8 app_config_start_write_block[2];
+	u8 app_config_size[2];
+	u8 max_touch_report_config_size[2];
+	u8 max_touch_report_payload_size[2];
+	char customer_config_id[16];
+	u16 max_x;
+	u16 max_y;
+	u8 max_objects[2];
+	u8 num_of_buttons[2];
+	u8 num_of_image_rows[2];
+	u8 num_of_image_cols[2];
+	u8 has_hybrid_data[2];
+} __packed;
+
+struct tcm_report_config_prop {
+	u8 id; /* TOUCH_OBJECT_* */
+	u8 bits; /* Size of the field in bits */
+};
+
+struct tcm_report_config_entry {
+	u8 foreach; /* TOUCH_FOREACH_* (and maybe other things?) */
+	int n_props;
+	const struct tcm_report_config_prop *props;
+};
+
+struct tcm_report_config {
+	int n_entries;
+	const struct tcm_report_config_entry *entries;
+};
+
+struct tcm_data {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct input_dev *input;
+	struct touchscreen_properties prop;
+	struct gpio_desc *reset_gpio;
+	struct completion response;
+	struct regulator_bulk_data supplies[2];
+
+	/* annoying state */
+	u16 buf_size;
+	char buf[256];
+};
+
+static int tcm_send_cmd(struct tcm_data *tcm, struct tcm_cmd *cmd)
+{
+	struct i2c_client *client = tcm->client;
+	struct i2c_msg msg;
+	int ret;
+
+	dev_dbg(&client->dev, "sending command %#x\n", cmd->cmd);
+
+	msg.addr = client->addr;
+	msg.flags = 0;
+	msg.len = 1 + cmd->length;
+	msg.buf = (u8 *)cmd;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret == 1)
+		return 0;
+	else if (ret < 0)
+		return ret;
+	else
+		return -EIO;
+}
+
+static int tcm_send_cmd_noargs(struct tcm_data *tcm, u8 cmd)
+{
+	struct tcm_cmd c = {
+		.cmd = cmd,
+		.length = 0,
+	};
+
+	return tcm_send_cmd(tcm, &c);
+}
+
+static int tcm_recv_report(struct tcm_data *tcm,
+			   void *buf, size_t length)
+{
+	struct i2c_client *client = tcm->client;
+	struct i2c_msg msg;
+	int ret;
+
+	msg.addr = client->addr;
+	msg.flags = I2C_M_RD;
+	msg.len = length;
+	msg.buf = buf;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret == 1)
+		return 0;
+	else if (ret < 0)
+		return ret;
+	else
+		return -EIO;
+}
+
+static int tcm_read_message(struct tcm_data *tcm, u8 cmd, void *buf, size_t length)
+{
+	int ret;
+
+	reinit_completion(&tcm->response);
+	ret = tcm_send_cmd_noargs(tcm, cmd);
+	if (ret)
+		return ret;
+
+	ret = wait_for_completion_timeout(&tcm->response, msecs_to_jiffies(1000));
+	if (ret == 0)
+		return -ETIMEDOUT;
+
+	if (buf) {
+		if (length > tcm->buf_size) {
+			dev_warn(&tcm->client->dev, "expected %zu bytes, got %u\n",
+				 length, tcm->buf_size);
+		}
+		length = min(tcm->buf_size, length);
+		memcpy(buf, tcm->buf, length);
+	}
+
+	return 0;
+}
+
+static void tcm_power_off(void *data)
+{
+	struct tcm_data *tcm = data;
+
+	disable_irq(tcm->client->irq);
+	regulator_bulk_disable(ARRAY_SIZE(tcm->supplies), tcm->supplies);
+}
+
+static int tcm_input_open(struct input_dev *dev)
+{
+	struct tcm_data *tcm = input_get_drvdata(dev);
+
+	return i2c_smbus_write_byte(tcm->client, TCM_ENABLE_REPORT);
+}
+
+static void tcm_input_close(struct input_dev *dev)
+{
+	struct tcm_data *tcm = input_get_drvdata(dev);
+	int ret;
+
+	ret = i2c_smbus_write_byte(tcm->client, TCM_DISABLE_REPORT);
+	if (ret)
+		dev_err(&tcm->client->dev, "failed to turn off sensing\n");
+}
+
+/*
+ * The default report config looks like this:
+ *
+ * a5 01 80 00 11 08 1e 08 0f 01 04 01 06 04 07 04
+ * 08 0c 09 0c 0a 08 0b 08 0c 08 0d 10 0e 10 03 00
+ * 00 00
+ *
+ * a5 01 80 00 - HEADER + length
+ *
+ * 11 08 - TOUCH_FRAME_RATE (8 bits)
+ * 30 08 - UNKNOWN (8 bits)
+ * 0f 01 - TOUCH_0D_BUTTONS_STATE (1 bit)
+ * 04 01 - TOUCH_PAD_TO_NEXT_BYTE (7 bits - padding)
+ * 06 04 - TOUCH_OBJECT_N_INDEX (4 bits)
+ * 07 04 - TOUCH_OBJECT_N_CLASSIFICATION (4 bits)
+ * 08 0c - TOUCH_OBJECT_N_X_POSITION (12 bits)
+ * 09 0c - TOUCH_OBJECT_N_Y_POSITION (12 bits)
+ * 0a 08 - TOUCH_OBJECT_N_Z (8 bits)
+ * 0b 08 - TOUCH_OBJECT_N_X_WIDTH (8 bits)
+ * 0c 08 - TOUCH_OBJECT_N_Y_WIDTH (8 bits)
+ * 0d 10 - TOUCH_OBJECT_N_TX_POSITION_TIXELS (16 bits) ??
+ * 0e 10 - TOUCH_OBJECT_N_RX_POSITION_TIXELS (16 bits) ??
+ * 03 00 - TOUCH_FOREACH_END (0 bits)
+ * 00 00 - TOUCH_END (0 bits)
+ *
+ * Since we only support this report config, we just hardcode the format below.
+ * To support additional report configs, we would need to parse the config and
+ * use it to parse the reports dynamically.
+ */
+
+struct tcm_default_report_data {
+	u8 fps;
+	struct {
+		u8 unknown;
+		u8 buttons;
+		u8 idx : 4;
+		u8 classification : 4;
+		u16 x : 12;
+		u16 y : 12;
+		u8 z;
+		u8 width_x;
+		u8 width_y;
+		u8 tx;
+		u8 rx;
+	} __packed points[];
+} __packed;
+
+static int tcm_handle_touch_report(struct tcm_data *tcm, char *buf, size_t len)
+{
+	struct tcm_default_report_data *data;
+
+	buf += REPORT_PEAK_LEN;
+	len -= REPORT_PEAK_LEN;
+
+	dev_dbg(&tcm->client->dev, "touch report len %zu\n", len);
+	if ((len - 1) % 11)
+		dev_err(&tcm->client->dev, "invalid touch report length\n");
+
+	data = (struct tcm_default_report_data *)buf;
+
+	/* We don't need to report releases because we have INPUT_MT_DROP_UNUSED */
+	for (int i = 0; i < (len - 1) / 11; i++) {
+		u8 major_width, minor_width;
+
+		minor_width = data->points[i].width_x;
+		major_width = data->points[i].width_y;
+
+		if (minor_width > major_width)
+			swap(major_width, minor_width);
+
+		dev_dbg(&tcm->client->dev, "touch report: idx %u x %u y %u\n",
+			data->points[i].idx, data->points[i].x, data->points[i].y);
+		input_mt_slot(tcm->input, data->points[i].idx);
+		input_mt_report_slot_state(tcm->input, MT_TOOL_FINGER, true);
+
+		input_report_abs(tcm->input, ABS_MT_POSITION_X, data->points[i].x);
+		input_report_abs(tcm->input, ABS_MT_POSITION_Y, data->points[i].y);
+		input_report_abs(tcm->input, ABS_MT_TOUCH_MAJOR, major_width);
+		input_report_abs(tcm->input, ABS_MT_TOUCH_MINOR, minor_width);
+		input_report_abs(tcm->input, ABS_MT_PRESSURE, data->points[i].z);
+	}
+
+	input_mt_sync_frame(tcm->input);
+	input_sync(tcm->input);
+
+	return 0;
+}
+
+static irqreturn_t tcm_report_irq(int irq, void *data)
+{
+	struct tcm_data *tcm = data;
+	struct tcm_message_header *header;
+	char buf[256];
+	u16 len;
+	int ret;
+
+	header = (struct tcm_message_header *)buf;
+	ret = tcm_recv_report(tcm, buf, sizeof(buf));
+	if (ret) {
+		dev_err(&tcm->client->dev, "failed to read report: %d\n", ret);
+		return IRQ_HANDLED;
+	}
+
+	switch (header->code) {
+	case REPORT_OK:
+	case REPORT_IDENTIFY:
+	case REPORT_TOUCH:
+	case REPORT_DELTA:
+	case REPORT_RAW:
+	case REPORT_DEBUG:
+	case REPORT_TOUCH_HOLD:
+		break;
+	default:
+		dev_dbg(&tcm->client->dev, "Ignoring report %#x\n", header->code);
+		return IRQ_HANDLED;
+	}
+
+	/* Not present for REPORT_CONTINUED_READ */
+	len = get_unaligned_le16(buf + sizeof(*header));
+
+	dev_dbg(&tcm->client->dev, "report %#x len %u\n", header->code, len);
+	print_hex_dump_bytes("report: ", DUMP_PREFIX_OFFSET, buf,
+			     min(sizeof(buf), len + sizeof(*header)));
+
+	if (len > sizeof(buf) - sizeof(*header)) {
+		dev_err(&tcm->client->dev, "report too long\n");
+		return IRQ_HANDLED;
+	}
+
+	/* Check if this is a read response or an indication. For indications
+	 * (user touched the screen) we just parse the report directly.
+	 */
+	if (completion_done(&tcm->response) && header->code == REPORT_TOUCH) {
+		tcm_handle_touch_report(tcm, buf, len + sizeof(*header));
+		return IRQ_HANDLED;
+	}
+
+	tcm->buf_size = len + sizeof(*header);
+	memcpy(tcm->buf, buf, len + sizeof(*header));
+	complete(&tcm->response);
+
+	return IRQ_HANDLED;
+}
+
+static int tcm_hw_init(struct tcm_data *tcm, u16 *max_x, u16 *max_y)
+{
+	int ret;
+	struct tcm_identification id = { 0 };
+	struct tcm_app_info app_info = { 0 };
+
+	/*
+	 * Tell the firmware to start up. After starting it sends an IDENTIFY report, which
+	 * we treat like a response to this message even though it's technically a new report.
+	 */
+	ret = tcm_read_message(tcm, TCM_RUN_APPLICATION_FIRMWARE, &id, sizeof(id));
+	if (ret) {
+		dev_err(&tcm->client->dev, "failed to identify device: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(&tcm->client->dev, "Synaptics TCM %s v%d mode %d\n",
+		id.part_number, id.version, id.mode);
+	if (id.mode != MODE_APPLICATION) {
+		/* We don't support firmware updates or anything else */
+		dev_err(&tcm->client->dev, "Device is not in application mode\n");
+		return -ENODEV;
+	}
+
+	do {
+		msleep(20);
+		ret = tcm_read_message(tcm, TCM_GET_APPLICATION_INFO, &app_info, sizeof(app_info));
+		if (ret) {
+			dev_err(&tcm->client->dev, "failed to get application info: %d\n", ret);
+			return ret;
+		}
+	} while (app_info.status == APP_STATUS_BOOTING || app_info.status == APP_STATUS_UPDATING);
+
+	dev_dbg(&tcm->client->dev, "Application firmware v%d.%d (customer '%s') status %d\n",
+		 app_info.version[0], app_info.version[1], app_info.customer_config_id,
+		 app_info.status);
+
+	*max_x = app_info.max_x;
+	*max_y = app_info.max_y;
+
+	return 0;
+}
+
+static int tcm_power_on(struct tcm_data *tcm)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(tcm->supplies),
+				    tcm->supplies);
+	if (ret)
+		return ret;
+
+	gpiod_set_value(tcm->reset_gpio, false);
+	usleep_range(10000, 11000);
+	gpiod_set_value(tcm->reset_gpio, true);
+	usleep_range(80000, 81000);
+
+	return 0;
+}
+
+static int tcm_probe(struct i2c_client *client)
+{
+	struct tcm_data *tcm;
+	struct tcm_report_config __maybe_unused report_config;
+	u16 max_x, max_y;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
+						I2C_FUNC_SMBUS_BYTE_DATA |
+						I2C_FUNC_SMBUS_I2C_BLOCK))
+		return -ENODEV;
+
+	tcm = devm_kzalloc(&client->dev, sizeof(struct tcm_data), GFP_KERNEL);
+	if (!tcm)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, tcm);
+	tcm->client = client;
+
+	init_completion(&tcm->response);
+
+	tcm->supplies[0].supply = "vdd";
+	tcm->supplies[1].supply = "vcc";
+	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(tcm->supplies),
+				      tcm->supplies);
+	if (ret)
+		return ret;
+
+	tcm->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+
+	ret = devm_add_action_or_reset(&client->dev, tcm_power_off,
+				       tcm);
+	if (ret)
+		return ret;
+
+	ret = tcm_power_on(tcm);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+					tcm_report_irq,
+					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					"synaptics_tcm_report", tcm);
+	if (ret < 0)
+		return ret;
+
+	ret = tcm_hw_init(tcm, &max_x, &max_y);
+	if (ret) {
+		dev_err(&client->dev, "failed to initialize hardware\n");
+		return ret;
+	}
+
+	tcm->input = devm_input_allocate_device(&client->dev);
+	if (!tcm->input)
+		return -ENOMEM;
+
+	tcm->input->name = "Synaptics TCM Oncell Touchscreen";
+	tcm->input->id.bustype = BUS_I2C;
+	tcm->input->open = tcm_input_open;
+	tcm->input->close = tcm_input_close;
+
+	input_set_abs_params(tcm->input, ABS_MT_POSITION_X, 0, max_x, 0, 0);
+	input_set_abs_params(tcm->input, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
+	input_set_abs_params(tcm->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+	input_set_abs_params(tcm->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
+	input_set_abs_params(tcm->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(tcm->input, true, &tcm->prop);
+
+	ret = input_mt_init_slots(tcm->input, 10, INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (ret)
+		return ret;
+
+	input_set_drvdata(tcm->input, tcm);
+
+	ret = input_register_device(tcm->input);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id syna_driver_ids[] = {
+	{
+		.compatible = "syna,s3908",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, syna_driver_ids);
+
+static const struct i2c_device_id syna_i2c_ids[] = {
+	{ "synaptics-tcm", 0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, syna_i2c_ids);
+
+static struct i2c_driver syna_i2c_driver = {
+	.probe	= tcm_probe,
+	.id_table	= syna_i2c_ids,
+	.driver	= {
+	.name	= "synaptics-tcm",
+	.of_match_table = syna_driver_ids,
+	},
+};
+
+module_i2c_driver(syna_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Frieder Hannenheim <frieder.hannenheim@proton.me>");
+MODULE_AUTHOR("Caleb Connolly <caleb@postmarketos.org>");
+MODULE_DESCRIPTION("A driver for Synaptics TCM Oncell Touchpanels");
+

-- 
2.45.0

