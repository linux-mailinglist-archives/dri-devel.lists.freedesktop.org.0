Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB7E4973AE
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 18:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90B410E6B0;
	Sun, 23 Jan 2022 17:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C05E10E6B0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 17:37:47 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4JhgLK6gBkz4www3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 17:37:45 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="q6g67JyS"
Date: Sun, 23 Jan 2022 17:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1642959460;
 bh=FQv1aKzS/LnuVdHDOCDAUsFd7cnwTX2Jbvn0yKrnTD8=;
 h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
 From:To:Cc;
 b=q6g67JyS8HxQhJ7EHX4YP+CwMNGCyEUO0jYvWSbWXoRGJSzpa0DJzPfBcfWuqRxmv
 bCF8VPbu0TRMDW0TQppmXn7bX0mrpmmAvJ15CjpLm82h78JJqkdQ+VNV0tN8awsAkl
 XIAQv7i8+zRj8SaaR/DI68NvsuKnWe0I6JBp+OEw=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Henrik Rydberg <rydberg@bitmath.org>, Harigovindan P <harigovi@codeaurora.org>,
 Caleb Connolly <caleb@connolly.tech>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Alexander Martinz <amartinz@shiftphones.com>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 2/6] input: touchscreen: add focaltech FTS driver
Message-ID: <20220123173650.290349-3-caleb@connolly.tech>
In-Reply-To: <20220123173650.290349-1-caleb@connolly.tech>
References: <20220123173650.290349-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The focaltech FTS driver supports several variants of focaltech touch
screens found in ~2018 era smartphones including a variant of the
PocoPhone F1 and the SHIFT6mq. This driver is loosely based on the
original driver from Focaltech but has been simplified and largely
reworked.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/input/touchscreen/Kconfig         |   9 +
 drivers/input/touchscreen/Makefile        |   1 +
 drivers/input/touchscreen/focaltech_fts.c | 870 ++++++++++++++++++++++
 3 files changed, 880 insertions(+)
 create mode 100644 drivers/input/touchscreen/focaltech_fts.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/=
Kconfig
index 2f6adfb7b938..10874f2d17ac 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -372,6 +372,15 @@ config TOUCHSCREEN_EXC3000
 =09  To compile this driver as a module, choose M here: the
 =09  module will be called exc3000.

+config TOUCHSCREEN_FOCALTECH_FTS
+=09tristate "Focaltech FTS Touchscreen"
+=09depends on I2C
+=09help
+=09  Say Y here to enable support for Focaltech FTS based
+=09  touch panels, including the 5452 and 8917 panels.
+
+=09  If unsure, say N.
+
 config TOUCHSCREEN_FUJITSU
 =09tristate "Fujitsu serial touchscreen"
 =09select SERIO
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen=
/Makefile
index 39a8127cf6a5..79f877d4ba02 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_TOUCHSCREEN_ELO)=09=09+=3D elo.o
 obj-$(CONFIG_TOUCHSCREEN_EGALAX)=09+=3D egalax_ts.o
 obj-$(CONFIG_TOUCHSCREEN_EGALAX_SERIAL)=09+=3D egalax_ts_serial.o
 obj-$(CONFIG_TOUCHSCREEN_EXC3000)=09+=3D exc3000.o
+obj-$(CONFIG_TOUCHSCREEN_FOCALTECH_FTS)=09+=3D focaltech_fts.o
 obj-$(CONFIG_TOUCHSCREEN_FUJITSU)=09+=3D fujitsu_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX)=09+=3D goodix_ts.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)=09+=3D hideep.o
diff --git a/drivers/input/touchscreen/focaltech_fts.c b/drivers/input/touc=
hscreen/focaltech_fts.c
new file mode 100644
index 000000000000..c62dc40a5bd0
--- /dev/null
+++ b/drivers/input/touchscreen/focaltech_fts.c
@@ -0,0 +1,870 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *
+ * FocalTech touchscreen driver.
+ *
+ * Copyright (c) 2010-2017, FocalTech Systems, Ltd., all rights reserved.
+ * Copyright (C) 2018 XiaoMi, Inc.
+ * Copyright (c) 2021 Caleb Connolly <caleb@connolly.tech>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/mutex.h>
+#include <linux/wait.h>
+#include <linux/time.h>
+#include <linux/workqueue.h>
+#include <linux/uaccess.h>
+#include <linux/version.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/netdevice.h>
+#include <linux/unistd.h>
+#include <linux/vmalloc.h>
+#include <linux/notifier.h>
+
+#define FTS_CMD_START1 0x55
+#define FTS_CMD_START2 0xAA
+#define FTS_CMD_START_DELAY 10
+#define FTS_CMD_READ_ID 0x90
+#define FTS_CMD_READ_ID_LEN 4
+
+#define FTS_REG_INT_CNT 0x8F
+#define FTS_REG_FLOW_WORK_CNT 0x91
+#define FTS_REG_WORKMODE 0x00
+#define FTS_REG_WORKMODE_FACTORY_VALUE 0x40
+#define FTS_REG_WORKMODE_WORK_VALUE 0x00
+#define FTS_REG_ESDCHECK_DISABLE 0x8D
+#define FTS_REG_CHIP_ID 0xA3
+#define FTS_REG_CHIP_ID2 0x9F
+#define FTS_REG_POWER_MODE 0xA5
+#define FTS_REG_POWER_MODE_SLEEP_VALUE 0x03
+#define FTS_REG_FW_VER 0xA6
+#define FTS_REG_VENDOR_ID 0xA8
+#define FTS_REG_LCD_BUSY_NUM 0xAB
+#define FTS_REG_FACE_DEC_MODE_EN 0xB0
+#define FTS_REG_FACE_DEC_MODE_STATUS 0x01
+#define FTS_REG_IDE_PARA_VER_ID 0xB5
+#define FTS_REG_IDE_PARA_STATUS 0xB6
+#define FTS_REG_GLOVE_MODE_EN 0xC0
+#define FTS_REG_COVER_MODE_EN 0xC1
+#define FTS_REG_CHARGER_MODE_EN 0x8B
+#define FTS_REG_GESTURE_EN 0xD0
+#define FTS_REG_GESTURE_OUTPUT_ADDRESS 0xD3
+#define FTS_REG_MODULE_ID 0xE3
+#define FTS_REG_LIC_VER 0xE4
+#define FTS_REG_ESD_SATURATE 0xED
+
+#define FTS_MAX_POINTS_SUPPORT 10
+#define FTS_ONE_TCH_LEN 6
+
+#define FTS_MAX_ID 0x0A
+#define FTS_TOUCH_X_H_POS 3
+#define FTS_TOUCH_X_L_POS 4
+#define FTS_TOUCH_Y_H_POS 5
+#define FTS_TOUCH_Y_L_POS 6
+#define FTS_TOUCH_PRE_POS 7
+#define FTS_TOUCH_AREA_POS 8
+#define FTS_TOUCH_POINT_NUM 2
+#define FTS_TOUCH_EVENT_POS 3
+#define FTS_TOUCH_ID_POS 5
+#define FTS_COORDS_ARR_SIZE 2
+
+#define FTS_TOUCH_DOWN 0
+#define FTS_TOUCH_UP 1
+#define FTS_TOUCH_CONTACT 2
+
+#define EVENT_DOWN(flag) ((flag =3D=3D FTS_TOUCH_DOWN) || (flag =3D=3D FTS=
_TOUCH_CONTACT))
+
+#define FTS_LOCKDOWN_INFO_SIZE 8
+#define LOCKDOWN_INFO_ADDR 0x1FA0
+
+#define FTS_DRIVER_NAME "fts-i2c"
+#define INTERVAL_READ_REG 100 /* unit:ms */
+#define TIMEOUT_READ_REG 2000 /* unit:ms */
+#define FTS_VDD_MIN_UV 2600000
+#define FTS_VDD_MAX_UV 3300000
+#define FTS_I2C_VCC_MIN_UV 1800000
+#define FTS_I2C_VCC_MAX_UV 1800000
+
+#define I2C_RETRY_NUMBER 3
+
+#define CHIP_TYPE_5452 0x5452
+#define CHIP_TYPE_8719 0x8719
+
+static DEFINE_MUTEX(i2c_rw_access);
+
+struct ts_event {
+=09int x; /*x coordinate */
+=09int y; /*y coordinate */
+=09int p; /* pressure */
+=09int flag; /* touch event flag: 0 -- down; 1-- up; 2 -- contact */
+=09int id; /*touch ID */
+=09int area;
+};
+
+struct fts_ts_data {
+=09struct i2c_client *client;
+=09struct input_dev *input_dev;
+=09struct regulator *vdd;
+=09struct regulator *vcc_i2c;
+=09spinlock_t irq_lock;
+=09struct mutex report_mutex;
+=09int irq;
+=09bool irq_disabled;
+=09bool power_disabled;
+
+=09/* multi-touch */
+=09struct ts_event *events;
+=09u32 max_touch_number;
+=09u8 *point_buf;
+=09int pnt_buf_size;
+=09int touches;
+=09int touch_point;
+=09int point_num;
+=09bool dev_pm_suspend;
+=09bool low_power_mode;
+=09struct completion dev_pm_suspend_completion;
+=09struct pinctrl *pinctrl;
+
+=09// DT data
+=09struct gpio_desc *irq_gpio;
+=09struct gpio_desc *reset_gpio;
+=09u32 width;
+=09u32 height;
+};
+
+int fts_i2c_read(struct i2c_client *client, char *writebuf, int writelen,
+=09=09 char *readbuf, int readlen)
+{
+=09int ret =3D 0;
+=09int msg_count =3D !!writelen + 1;
+=09struct i2c_msg msgs[2];
+
+=09if (readlen < 0 || writelen < 0)
+=09=09return -EINVAL;
+
+=09// If writelen is zero then only populate msgs[0].
+=09// otherwise we read into msgs[1]
+=09msgs[msg_count-1].len =3D readlen;
+=09msgs[msg_count-1].buf =3D readbuf;
+=09msgs[msg_count-1].addr =3D client->addr;
+=09msgs[msg_count-1].flags =3D I2C_M_RD;
+
+=09if (writelen > 0) {
+=09=09msgs[0].len =3D writelen;
+=09=09msgs[0].buf =3D writebuf;
+=09=09msgs[0].addr =3D client->addr;
+=09=09msgs[0].flags =3D 0;
+=09}
+
+=09mutex_lock(&i2c_rw_access);
+
+=09ret =3D i2c_transfer(client->adapter, msgs, msg_count);
+
+=09mutex_unlock(&i2c_rw_access);
+=09return ret;
+}
+
+int fts_i2c_read_reg(struct i2c_client *client, u8 regaddr, u8 *regvalue)
+{
+=09return fts_i2c_read(client, &regaddr, 1, regvalue, 1);
+}
+
+static bool fts_chip_is_valid(struct fts_ts_data *data, u16 id)
+{
+=09if (id !=3D CHIP_TYPE_5452 && id !=3D CHIP_TYPE_8719)
+=09=09return false;
+
+=09return true;
+}
+
+int fts_wait_ready(struct fts_ts_data *data)
+{
+=09int ret =3D 0;
+=09int cnt =3D 0;
+=09u8 reg_value[2];
+=09struct i2c_client *client =3D data->client;
+
+=09do {
+=09=09ret =3D fts_i2c_read_reg(client, FTS_REG_CHIP_ID, &reg_value[0]);
+=09=09ret =3D fts_i2c_read_reg(client, FTS_REG_CHIP_ID2, &reg_value[1]);
+=09=09if (fts_chip_is_valid(data, reg_value[0] << 8 | reg_value[1])) {
+=09=09=09dev_dbg(&data->client->dev, "TP Ready, Device ID =3D 0x%x%x, coun=
t =3D %d",
+=09=09=09=09reg_value[0], reg_value[1], cnt);
+=09=09=09return 0;
+=09=09}
+=09=09cnt++;
+=09=09msleep(INTERVAL_READ_REG);
+=09} while ((cnt * INTERVAL_READ_REG) < TIMEOUT_READ_REG);
+
+=09return -EIO;
+}
+
+static int fts_power_source_init(struct fts_ts_data *data)
+{
+=09int ret =3D 0;
+
+=09data->vdd =3D devm_regulator_get(&data->client->dev, "vdd");
+=09if (IS_ERR_OR_NULL(data->vdd)) {
+=09=09ret =3D PTR_ERR(data->vdd);
+=09=09dev_err(&data->client->dev, "get vdd regulator failed,ret=3D%d", ret=
);
+=09=09return ret;
+=09}
+
+=09if (regulator_count_voltages(data->vdd) > 0) {
+=09=09ret =3D regulator_set_voltage(data->vdd, FTS_VDD_MIN_UV,
+=09=09=09=09=09    FTS_VDD_MAX_UV);
+=09=09if (ret < 0) {
+=09=09=09dev_err(&data->client->dev, "failed to set vdd regulator ret=3D%d=
", ret);
+=09=09=09goto exit;
+=09=09}
+=09}
+
+=09data->vcc_i2c =3D devm_regulator_get(&data->client->dev, "vcc-i2c");
+=09if (IS_ERR(data->vcc_i2c)) {
+=09=09ret =3D PTR_ERR(data->vcc_i2c);
+=09=09dev_err(&data->client->dev, "get vcc_i2c regulator failed,ret=3D%d",=
 ret);
+=09=09return ret;
+=09}
+
+=09if (regulator_count_voltages(data->vcc_i2c) > 0) {
+=09=09ret =3D regulator_set_voltage(data->vcc_i2c, FTS_I2C_VCC_MIN_UV,
+=09=09=09=09=09    FTS_I2C_VCC_MAX_UV);
+=09=09if (ret < 0) {
+=09=09=09dev_err(&data->client->dev, "failed to set vcc_i2c regulator ret=
=3D%d",
+=09=09=09=09ret);
+=09=09=09goto exit;
+=09=09}
+=09}
+
+exit:
+=09return ret;
+}
+
+static int fts_power_source_release(struct fts_ts_data *data)
+{
+=09if (!data->power_disabled) {
+=09=09regulator_disable(data->vdd);
+=09=09regulator_disable(data->vcc_i2c);
+=09}
+
+=09devm_regulator_put(data->vdd);
+=09devm_regulator_put(data->vcc_i2c);
+
+=09return 0;
+}
+
+static int fts_power_source_ctrl(struct fts_ts_data *data, bool enable)
+{
+=09int ret =3D 0;
+
+=09if (enable) {
+=09=09if (data->power_disabled) {
+=09=09=09ret =3D regulator_enable(data->vdd);
+=09=09=09if (ret < 0) {
+=09=09=09=09dev_err(&data->client->dev,
+=09=09=09=09=09"enable vdd regulator failed,ret=3D%d",
+=09=09=09=09=09ret);
+=09=09=09}
+
+=09=09=09ret =3D regulator_enable(data->vcc_i2c);
+=09=09=09if (ret < 0) {
+=09=09=09=09dev_err(&data->client->dev, "enable vcc_i2c regulator failed,r=
et=3D%d",
+=09=09=09=09=09  ret);
+=09=09=09}
+=09=09=09data->power_disabled =3D false;
+=09=09}
+=09} else {
+=09=09if (!data->power_disabled) {
+=09=09=09ret =3D regulator_disable(data->vdd);
+=09=09=09if (ret < 0) {
+=09=09=09=09dev_err(&data->client->dev,
+=09=09=09=09=09"disable vdd regulator failed,ret=3D%d",
+=09=09=09=09=09ret);
+=09=09=09}
+
+=09=09=09ret =3D regulator_disable(data->vcc_i2c);
+=09=09=09if (ret < 0) {
+=09=09=09=09dev_err(&data->client->dev, "disable vcc_i2c regulator failed,=
ret=3D%d",
+=09=09=09=09=09  ret);
+=09=09=09}
+
+=09=09=09data->power_disabled =3D true;
+=09=09}
+=09}
+
+=09return ret;
+}
+
+static int fts_pinctrl_set_active(struct fts_ts_data *data, bool enable)
+{
+=09int ret =3D 0;
+=09struct pinctrl_state *state =3D pinctrl_lookup_state(data->pinctrl,
+=09=09enable ? "default" : "suspend");
+
+=09if (IS_ERR_OR_NULL(state)) {
+=09=09dev_err(&data->client->dev, "pinctrl lookup %s failed\n",
+=09=09=09enable ? "default" : "suspend");
+=09=09return -EINVAL;
+=09}
+
+=09ret =3D pinctrl_select_state(data->pinctrl, state);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev,
+=09=09=09"Failed to set pinctrl state: enable =3D %d, ret =3D %d",
+=09=09=09enable, ret);
+=09}
+
+=09return ret;
+}
+
+static void fts_release_all_finger(struct fts_ts_data *data)
+{
+=09struct input_dev *input_dev =3D data->input_dev;
+=09u32 finger_count =3D 0;
+
+=09mutex_lock(&data->report_mutex);
+
+=09for (finger_count =3D 0; finger_count < data->max_touch_number;
+=09     finger_count++) {
+=09=09input_mt_slot(input_dev, finger_count);
+=09=09input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, false);
+=09}
+
+=09input_report_key(input_dev, BTN_TOUCH, 0);
+=09input_sync(input_dev);
+
+=09mutex_unlock(&data->report_mutex);
+}
+
+static int fts_input_report_b(struct fts_ts_data *data)
+{
+=09int i =3D 0;
+=09int uppoint =3D 0;
+=09int touches =3D 0;
+=09bool va_reported =3D false;
+=09struct ts_event *events =3D data->events;
+
+=09for (i =3D 0; i < data->touch_point; i++) {
+=09=09if (events[i].id >=3D data->max_touch_number)
+=09=09=09break;
+
+=09=09va_reported =3D true;
+=09=09input_mt_slot(data->input_dev, events[i].id);
+
+=09=09if (events[i].flag =3D=3D FTS_TOUCH_DOWN || events[i].flag =3D=3D FT=
S_TOUCH_CONTACT) {
+=09=09=09input_mt_report_slot_state(data->input_dev,
+=09=09=09=09=09=09   MT_TOOL_FINGER, true);
+
+=09=09=09if (events[i].p <=3D 0)
+=09=09=09=09events[i].p =3D 0x3f;
+
+=09=09=09input_report_abs(data->input_dev, ABS_MT_PRESSURE,
+=09=09=09=09=09 events[i].p);
+
+=09=09=09if (events[i].area <=3D 0)
+=09=09=09=09events[i].area =3D 0x09;
+
+=09=09=09input_report_abs(data->input_dev, ABS_MT_TOUCH_MAJOR,
+=09=09=09=09=09 events[i].area);
+=09=09=09input_report_abs(data->input_dev, ABS_MT_POSITION_X,
+=09=09=09=09=09 events[i].x);
+=09=09=09input_report_abs(data->input_dev, ABS_MT_POSITION_Y,
+=09=09=09=09=09 events[i].y);
+
+=09=09=09touches |=3D BIT(events[i].id);
+=09=09=09data->touches |=3D BIT(events[i].id);
+=09=09} else {
+=09=09=09uppoint++;
+
+=09=09=09input_report_abs(data->input_dev, ABS_MT_PRESSURE, 0);
+
+=09=09=09input_mt_report_slot_state(data->input_dev,
+=09=09=09=09=09=09   MT_TOOL_FINGER, false);
+=09=09=09data->touches &=3D ~BIT(events[i].id);
+=09=09}
+=09}
+
+=09if (data->touches ^ touches) {
+=09=09for (i =3D 0; i < data->max_touch_number; i++) {
+=09=09=09if (BIT(i) & (data->touches ^ touches)) {
+=09=09=09=09va_reported =3D true;
+=09=09=09=09input_mt_slot(data->input_dev, i);
+=09=09=09=09input_mt_report_slot_state(
+=09=09=09=09=09data->input_dev, MT_TOOL_FINGER, false);
+=09=09=09}
+=09=09}
+=09}
+=09data->touches =3D touches;
+
+=09if (va_reported) {
+=09=09if (!data->point_num || !touches)
+=09=09=09input_report_key(data->input_dev, BTN_TOUCH, 0);
+=09=09else
+=09=09=09input_report_key(data->input_dev, BTN_TOUCH, 1);
+=09} else {
+=09=09dev_err(&data->client->dev, "va not reported, but touches=3D%d", tou=
ches);
+=09}
+
+=09input_sync(data->input_dev);
+=09return 0;
+}
+
+static int fts_read_touchdata(struct fts_ts_data *data)
+{
+=09int ret =3D 0;
+=09int i =3D 0;
+=09u8 pointid;
+=09int base;
+=09struct ts_event *events =3D data->events;
+=09int max_touch_num =3D data->max_touch_number;
+=09u8 *buf =3D data->point_buf;
+
+=09data->point_num =3D 0;
+=09data->touch_point =3D 0;
+
+=09memset(buf, 0xFF, data->pnt_buf_size);
+=09buf[0] =3D 0x00;
+
+=09ret =3D fts_i2c_read(data->client, buf, 1, buf, data->pnt_buf_size);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "read touchdata failed, ret:%d", ret);
+=09=09return ret;
+=09}
+=09data->point_num =3D buf[FTS_TOUCH_POINT_NUM] & 0x0F;
+
+=09if (data->point_num > max_touch_num)
+=09=09return -EINVAL;
+
+=09for (i =3D 0; i < max_touch_num; i++) {
+=09=09base =3D FTS_ONE_TCH_LEN * i;
+
+=09=09pointid =3D (buf[FTS_TOUCH_ID_POS + base]) >> 4;
+=09=09if (pointid >=3D FTS_MAX_ID)
+=09=09=09break;
+
+=09=09else if (pointid >=3D max_touch_num)
+=09=09=09return -EINVAL;
+
+=09=09data->touch_point++;
+
+=09=09events[i].x =3D ((buf[FTS_TOUCH_X_H_POS + base] & 0x0F) << 8) +
+=09=09=09      (buf[FTS_TOUCH_X_L_POS + base] & 0xFF);
+=09=09events[i].y =3D ((buf[FTS_TOUCH_Y_H_POS + base] & 0x0F) << 8) +
+=09=09=09      (buf[FTS_TOUCH_Y_L_POS + base] & 0xFF);
+=09=09events[i].flag =3D buf[FTS_TOUCH_EVENT_POS + base] >> 6;
+=09=09events[i].id =3D buf[FTS_TOUCH_ID_POS + base] >> 4;
+=09=09events[i].area =3D buf[FTS_TOUCH_AREA_POS + base] >> 4;
+=09=09events[i].p =3D buf[FTS_TOUCH_PRE_POS + base];
+
+=09=09if (((events[i].flag =3D=3D FTS_TOUCH_DOWN) || (events[i].flag =3D=
=3D FTS_TOUCH_CONTACT))
+=09=09    && (data->point_num =3D=3D 0)) {
+=09=09=09dev_err(&data->client->dev, "abnormal touch data from fw");
+=09=09=09return -EIO;
+=09=09}
+=09}
+=09if (data->touch_point =3D=3D 0) {
+=09=09dev_err(&data->client->dev, "no touch point information");
+=09=09return -EIO;
+=09}
+
+=09return 0;
+}
+
+static void fts_report_event(struct fts_ts_data *data)
+{
+=09fts_input_report_b(data);
+}
+
+static irqreturn_t fts_ts_interrupt(int irq, void *d)
+{
+=09int ret =3D 0;
+=09struct fts_ts_data *data =3D (struct fts_ts_data *)d;
+
+=09if (!data) {
+=09=09dev_err(&data->client->dev, "%s() Invalid fts_ts_data", __func__);
+=09=09return IRQ_HANDLED;
+=09}
+
+=09if (data->dev_pm_suspend) {
+=09=09ret =3D wait_for_completion_timeout(
+=09=09=09&data->dev_pm_suspend_completion,
+=09=09=09msecs_to_jiffies(700));
+=09=09if (!ret) {
+=09=09=09dev_err(&data->client->dev,
+=09=09=09=09"Didn't resume in time, skipping wakeup event handling\n");
+=09=09=09return IRQ_HANDLED;
+=09=09}
+=09}
+
+=09ret =3D fts_read_touchdata(data);
+=09if (ret =3D=3D 0) {
+=09=09mutex_lock(&data->report_mutex);
+=09=09fts_report_event(data);
+=09=09mutex_unlock(&data->report_mutex);
+=09}
+
+=09return IRQ_HANDLED;
+}
+
+static int fts_input_init(struct fts_ts_data *data)
+{
+=09int ret =3D 0;
+=09struct input_dev *input_dev;
+
+=09input_dev =3D input_allocate_device();
+=09if (!input_dev) {
+=09=09dev_err(&data->client->dev, "Failed to allocate memory for input dev=
ice");
+=09=09return -ENOMEM;
+=09}
+
+=09/* Init and register Input device */
+=09input_dev->name =3D FTS_DRIVER_NAME;
+=09input_dev->id.bustype =3D BUS_I2C;
+=09input_dev->dev.parent =3D &data->client->dev;
+
+=09input_set_drvdata(input_dev, data);
+
+=09__set_bit(EV_SYN, input_dev->evbit);
+=09__set_bit(EV_ABS, input_dev->evbit);
+=09__set_bit(BTN_TOUCH, input_dev->keybit);
+=09__set_bit(INPUT_PROP_DIRECT, input_dev->propbit);
+
+=09input_mt_init_slots(input_dev, data->max_touch_number,
+=09=09=09    INPUT_MT_DIRECT);
+
+=09input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0,
+=09=09=09     data->width - 1, 0, 0);
+=09input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0,
+=09=09=09     data->height - 1, 0, 0);
+=09input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, 0xFF, 0, 0);
+
+=09input_set_abs_params(input_dev, ABS_MT_PRESSURE, 0, 0xFF, 0, 0);
+
+=09data->pnt_buf_size =3D data->max_touch_number * FTS_ONE_TCH_LEN + 3;
+=09data->point_buf =3D devm_kzalloc(&data->client->dev, data->pnt_buf_size=
, GFP_KERNEL);
+=09if (!data->point_buf) {
+=09=09dev_err(&data->client->dev, "Failed to alloc memory for point buf!")=
;
+=09=09ret =3D -ENOMEM;
+=09=09goto err_out;
+=09}
+
+=09data->events =3D devm_kzalloc(&data->client->dev,
+=09=09data->max_touch_number * sizeof(struct ts_event), GFP_KERNEL);
+=09if (!data->events) {
+=09=09ret =3D -ENOMEM;
+=09=09goto err_out;
+=09}
+=09ret =3D input_register_device(input_dev);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "Input device registration failed");
+=09=09goto err_out;
+=09}
+
+=09data->input_dev =3D input_dev;
+
+=09return 0;
+
+err_out:
+=09input_set_drvdata(input_dev, NULL);
+=09input_free_device(input_dev);
+=09input_dev =3D NULL;
+
+=09return ret;
+}
+
+static int fts_reset(struct fts_ts_data *data)
+{
+=09gpiod_set_value_cansleep(data->reset_gpio, 0);
+=09msleep(20);
+=09gpiod_set_value_cansleep(data->reset_gpio, 1);
+
+=09return 0;
+}
+
+static int fts_parse_dt(struct fts_ts_data *data)
+{
+=09int ret =3D 0;
+=09struct device *dev =3D &data->client->dev;
+=09struct device_node *np =3D dev->of_node;
+=09u32 val;
+
+=09ret =3D of_property_read_u32(np, "touchscreen-size-x", &data->width);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "Unable to read property 'touchscreen-si=
ze-x'");
+=09=09return -EINVAL;
+=09}
+
+=09ret =3D of_property_read_u32(np, "touchscreen-size-y", &data->height);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "Unable to read property 'touchscreen-si=
ze-y'");
+=09=09return -EINVAL;
+=09}
+
+=09ret =3D of_property_read_u32(np, "focaltech,max-touch-number", &val);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "Unable to read property 'focaltech,max-=
touch-number'");
+=09=09return -EINVAL;
+=09}
+=09if (val < 2 || val > FTS_MAX_POINTS_SUPPORT) {
+=09=09dev_err(&data->client->dev, "'focaltech,max-touch-number' out of ran=
ge [2, %d]",
+=09=09=09FTS_MAX_POINTS_SUPPORT);
+=09=09return -EINVAL;
+=09}
+=09data->max_touch_number =3D val;
+
+=09data->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+=09if (data->reset_gpio < 0) {
+=09=09dev_err(&data->client->dev, "Unable to get reset gpio");
+=09=09return -EINVAL;
+=09}
+
+=09data->irq_gpio =3D devm_gpiod_get_optional(dev, "irq", GPIOD_OUT_LOW);
+
+=09return 0;
+}
+
+static int fts_ts_probe(struct i2c_client *client,
+=09=09=09const struct i2c_device_id *id)
+{
+=09int ret =3D 0;
+=09struct fts_ts_data *data;
+=09struct pinctrl_state *pinctrl_state_temp;
+
+=09if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+=09=09dev_err(&data->client->dev, "I2C not supported");
+=09=09return -ENODEV;
+=09}
+
+=09data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+=09if (!data)
+=09=09return -ENOMEM;
+
+=09data->client =3D client;
+=09ret =3D fts_parse_dt(data);
+=09if (ret < 0)
+=09=09return ret;
+
+=09i2c_set_clientdata(client, data);
+
+=09spin_lock_init(&data->irq_lock);
+=09mutex_init(&data->report_mutex);
+
+=09ret =3D fts_input_init(data);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "Input initialization fail");
+=09=09goto err_input_init;
+=09}
+
+=09ret =3D fts_power_source_init(data);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "fail to get vdd/vcc_i2c regulator");
+=09=09goto err_power_init;
+=09}
+
+=09data->power_disabled =3D true;
+=09ret =3D fts_power_source_ctrl(data, true);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "fail to enable vdd/vcc_i2c regulator");
+=09=09goto err_power_ctrl;
+=09}
+
+=09data->pinctrl =3D devm_pinctrl_get(&client->dev);
+=09if (IS_ERR_OR_NULL(data->pinctrl)) {
+=09=09dev_err(&data->client->dev, "Failed to get pinctrl, please check dts=
");
+=09=09ret =3D PTR_ERR(data->pinctrl);
+=09=09goto err_power_ctrl;
+=09}
+
+=09pinctrl_state_temp =3D pinctrl_lookup_state(data->pinctrl, "default");
+=09if (IS_ERR_OR_NULL(pinctrl_state_temp) ||
+=09=09IS_ERR_OR_NULL(pinctrl_lookup_state(data->pinctrl, "suspend"))) {
+=09=09dev_err(&data->client->dev, "Failed to get default or suspend pinctr=
l state, please check dts");
+=09=09goto err_power_ctrl;
+=09}
+
+=09fts_pinctrl_set_active(data, true);
+
+=09ret =3D fts_reset(data);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "Failed to reset chip");
+=09=09goto err_gpio_config;
+=09}
+
+=09ret =3D fts_wait_ready(data);
+=09if (ret < 0) {
+=09=09dev_err(&data->client->dev, "Touch IC didn't turn on or is unsupport=
ed");
+=09=09goto err_gpio_config;
+=09}
+
+=09if (data->irq_gpio) {
+=09=09data->irq =3D gpiod_to_irq(data->irq_gpio);
+
+=09=09ret =3D request_threaded_irq(data->irq, NULL, fts_ts_interrupt,
+=09=09=09=09=09IRQF_ONESHOT,
+=09=09=09=09=09data->client->name, data);
+=09=09if (ret < 0) {
+=09=09=09dev_err(&data->client->dev, "request irq failed");
+=09=09=09goto err_gpio_config;
+=09=09}
+=09=09device_init_wakeup(&client->dev, true);
+=09}
+
+=09data->dev_pm_suspend =3D false;
+=09init_completion(&data->dev_pm_suspend_completion);
+
+=09return 0;
+
+err_gpio_config:
+=09fts_power_source_ctrl(data, false);
+err_power_ctrl:
+=09fts_power_source_release(data);
+err_power_init:
+=09input_unregister_device(data->input_dev);
+err_input_init:
+=09devm_kfree(&client->dev, data);
+
+=09return ret;
+}
+
+static int fts_ts_remove(struct i2c_client *client)
+{
+=09struct fts_ts_data *data =3D i2c_get_clientdata(client);
+
+=09free_irq(client->irq, data);
+=09input_unregister_device(data->input_dev);
+
+=09fts_power_source_ctrl(data, false);
+=09fts_power_source_release(data);
+
+=09kfree(data->point_buf);
+=09kfree(data->events);
+
+=09devm_kfree(&client->dev, data);
+
+=09return 0;
+}
+
+static int fts_ts_suspend(struct device *dev)
+{
+=09struct fts_ts_data *data =3D dev_get_drvdata(dev);
+=09int ret =3D 0;
+
+=09disable_irq(data->irq);
+
+=09ret =3D fts_power_source_ctrl(data, false);
+=09if (ret < 0)
+=09=09dev_err(dev, "power off fail, ret=3D%d", ret);
+=09fts_pinctrl_set_active(data, false);
+
+=09return 0;
+}
+
+static int fts_ts_resume(struct device *dev)
+{
+=09struct fts_ts_data *data =3D dev_get_drvdata(dev);
+
+=09fts_release_all_finger(data);
+
+=09fts_power_source_ctrl(data, true);
+=09fts_pinctrl_set_active(data, true);
+
+=09fts_wait_ready(data);
+
+=09enable_irq(data->irq);
+
+=09return 0;
+}
+
+static int fts_pm_suspend(struct device *dev)
+{
+=09struct fts_ts_data *data =3D dev_get_drvdata(dev);
+=09int ret =3D 0;
+
+=09data->dev_pm_suspend =3D true;
+
+=09if (data->low_power_mode) {
+=09=09ret =3D enable_irq_wake(data->irq);
+=09=09if (ret < 0) {
+=09=09=09dev_err(&data->client->dev, "enable_irq_wake(irq:%d) failed",
+=09=09=09=09 data->irq);
+=09=09}
+=09} else {
+=09=09ret =3D fts_ts_suspend(dev);
+=09}
+
+=09reinit_completion(&data->dev_pm_suspend_completion);
+
+=09return ret;
+}
+
+static int fts_pm_resume(struct device *dev)
+{
+=09struct fts_ts_data *data =3D dev_get_drvdata(dev);
+=09int ret =3D 0;
+
+=09data->dev_pm_suspend =3D false;
+
+=09if (data->low_power_mode) {
+=09=09ret =3D disable_irq_wake(data->irq);
+=09=09if (ret < 0) {
+=09=09=09dev_err(&data->client->dev, "disable_irq_wake(irq:%d) failed",
+=09=09=09=09 data->irq);
+=09=09}
+=09} else {
+=09=09ret =3D fts_ts_resume(dev);
+=09}
+
+=09complete(&data->dev_pm_suspend_completion);
+
+=09return 0;
+}
+
+static const struct dev_pm_ops fts_dev_pm_ops =3D {
+=09.suspend =3D fts_pm_suspend,
+=09.resume =3D fts_pm_resume,
+};
+
+static const struct of_device_id fts_match_table[] =3D {
+=09{ .compatible =3D "focaltech,fts5452", },
+=09{ .compatible =3D "focaltech,fts8719", },
+=09{ /* sentinel */ },
+};
+
+MODULE_DEVICE_TABLE(of, fts_match_table);
+
+static struct i2c_driver fts_ts_driver =3D {
+=09.probe =3D fts_ts_probe,
+=09.remove =3D fts_ts_remove,
+=09.driver =3D {
+=09=09.name =3D FTS_DRIVER_NAME,
+=09=09.pm =3D &fts_dev_pm_ops,
+=09=09.of_match_table =3D fts_match_table,
+=09},
+};
+module_i2c_driver(fts_ts_driver);
+
+MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
+MODULE_DESCRIPTION("FocalTech touchscreen Driver");
+MODULE_LICENSE("GPL v2");
--
2.34.1


