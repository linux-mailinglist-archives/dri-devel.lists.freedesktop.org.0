Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE343848B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 19:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953726E82F;
	Sat, 23 Oct 2021 17:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A246E826
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 11:15:01 +0000 (UTC)
X-UUID: 3ab728d79a46457dbb478b62e43aeebf-20211023
X-UUID: 3ab728d79a46457dbb478b62e43aeebf-20211023
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 822622961; Sat, 23 Oct 2021 19:14:57 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 23 Oct 2021 19:14:55 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 23 Oct 2021 19:14:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:55 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 07/13] soc: mediatek: apu: Add apu power driver
Date: Sat, 23 Oct 2021 19:14:03 +0800
Message-ID: <20211023111409.30463-8-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 23 Oct 2021 17:35:54 +0000
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

APU power driver support for subsys clock and
regulator controller. It has device link to iommu-apu
and apusys-rv tinysys driver to ensure the power state is
ready for hardware in sub modules.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 drivers/soc/mediatek/apusys/Makefile      |   4 +
 drivers/soc/mediatek/apusys/apu-core.c    |   2 +
 drivers/soc/mediatek/apusys/apu-core.h    |   3 +
 drivers/soc/mediatek/apusys/apu-pwr-dbg.c | 167 ++++++
 drivers/soc/mediatek/apusys/apu-pwr-ipi.c | 377 ++++++++++++++
 drivers/soc/mediatek/apusys/apu-pwr.c     | 599 ++++++++++++++++++++++
 drivers/soc/mediatek/apusys/apu-pwr.h     | 260 ++++++++++
 7 files changed, 1412 insertions(+)
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr-dbg.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr-ipi.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr.h

diff --git a/drivers/soc/mediatek/apusys/Makefile b/drivers/soc/mediatek/apusys/Makefile
index 6b5249ec7064..8c61ed8e2c04 100644
--- a/drivers/soc/mediatek/apusys/Makefile
+++ b/drivers/soc/mediatek/apusys/Makefile
@@ -3,3 +3,7 @@ obj-$(CONFIG_MTK_APU_PM) += mtk-apu-pm.o
 
 obj-$(CONFIG_MTK_APU) += apu.o
 apu-objs += apu-core.o
+
+apu-objs += apu-pwr.o
+apu-objs += apu-pwr-ipi.o
+apu-$(CONFIG_MTK_APU_DEBUG) += apu-pwr-dbg.o
diff --git a/drivers/soc/mediatek/apusys/apu-core.c b/drivers/soc/mediatek/apusys/apu-core.c
index c1db2394307f..069e18af7a5b 100644
--- a/drivers/soc/mediatek/apusys/apu-core.c
+++ b/drivers/soc/mediatek/apusys/apu-core.c
@@ -18,6 +18,7 @@ static struct apusys_core_info g_core_info;
  * call init function in order at apu.ko init stage
  */
 static int (*apusys_init_func[])(struct apusys_core_info *) = {
+	apu_power_drv_init,
 };
 
 /*
@@ -25,6 +26,7 @@ static int (*apusys_init_func[])(struct apusys_core_info *) = {
  * call exit function in order at apu.ko exit stage
  */
 static void (*apusys_exit_func[])(void) = {
+	apu_power_drv_exit,
 };
 
 static void create_dbg_root(void)
diff --git a/drivers/soc/mediatek/apusys/apu-core.h b/drivers/soc/mediatek/apusys/apu-core.h
index bac730bbc7ea..77f1b39424d1 100644
--- a/drivers/soc/mediatek/apusys/apu-core.h
+++ b/drivers/soc/mediatek/apusys/apu-core.h
@@ -8,4 +8,7 @@
 struct apusys_core_info {
 	struct dentry *dbg_root;
 };
+
+int apu_power_drv_init(struct apusys_core_info *info);
+void apu_power_drv_exit(void);
 #endif
diff --git a/drivers/soc/mediatek/apusys/apu-pwr-dbg.c b/drivers/soc/mediatek/apusys/apu-pwr-dbg.c
new file mode 100644
index 000000000000..ee81271cbb2c
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-pwr-dbg.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+
+#include "apu-pwr.h"
+
+#define DEBUG_MAX_ARGS_NUM (5)
+
+struct dentry *apu_power_debugfs;
+
+static int apu_power_set_parameter(struct apu_power *apupwr,
+				   enum APU_POWER_PARAM param,
+				   u32 argc, u32 *args)
+{
+	struct device *dev = apupwr->dev;
+	int ret = 0;
+
+	switch (param) {
+	case POWER_PARAM_FIX_OPP:
+		if (args[0] == 0) {
+			apu_update_fixed_opp_by_reg(dev, 0xffffffff);
+			apu_power_notify_uP_opp_limit(apupwr,
+						      OPP_LIMIT_FIX_OPP);
+		}
+		break;
+	case POWER_PARAM_DVFS_DEBUG:
+		if (args[0] >= 0 && args[0] <= 0xffffffff) {
+			apu_update_fixed_opp_by_reg(dev, args[0]);
+			apu_power_notify_uP_opp_limit(apupwr,
+						      OPP_LIMIT_DVFS_DEBUG);
+		}
+		break;
+	case POWER_PARAM_ULOG_LEVEL:
+		ret = (argc == 1) ? 0 : -EINVAL;
+		if (ret) {
+			dev_err(dev,
+				"invalid argument, expected:1, received:%d\n",
+				argc);
+			goto out;
+		}
+		apupwr->dbg_option = POWER_PARAM_ULOG_LEVEL;
+		apupwr->ulog_level = args[0];
+		apu_power_set_ulog_level(apupwr, args[0]);
+		break;
+
+	default:
+		dev_err(dev, "unsupport the power parameter:%d\n", param);
+		break;
+	}
+
+out:
+	return ret;
+}
+
+static int apu_power_dbg_show(struct seq_file *s, void *unused)
+{
+	struct apu_power *apupwr = (struct apu_power *)s->private;
+	u32 ulog_level = apupwr->ulog_level;
+	u32 dbg_option = apupwr->dbg_option;
+
+	switch (dbg_option) {
+	case POWER_PARAM_ULOG_LEVEL:
+		seq_printf(s, "ulog_level = %d\n", ulog_level);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int apu_power_dbg_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, apu_power_dbg_show, inode->i_private);
+}
+
+static ssize_t apu_power_dbg_write(struct file *filp,
+				   const char __user *buffer,
+				   size_t count, loff_t *f_pos)
+{
+	struct apu_power *obj = file_inode(filp)->i_private;
+	char *tmp, *token, *cursor;
+	int ret, i;
+	enum APU_POWER_PARAM param;
+	unsigned int args[DEBUG_MAX_ARGS_NUM];
+
+	tmp = kzalloc(count + 1, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	ret = copy_from_user(tmp, buffer, count);
+	if (ret) {
+		dev_err(obj->dev, "copy_from_user failed, ret=%d\n", ret);
+		goto out;
+	}
+
+	tmp[count] = '\0';
+	cursor = tmp;
+
+	/* parse a command */
+	token = strsep(&cursor, " ");
+	if (strcmp(token, "fix_opp") == 0) {
+		param = POWER_PARAM_FIX_OPP;
+	} else if (strcmp(token, "dvfs_debug") == 0) {
+		param = POWER_PARAM_DVFS_DEBUG;
+	} else if (strcmp(token, "ulog") == 0) {
+		param = POWER_PARAM_ULOG_LEVEL;
+	} else {
+		ret = -EINVAL;
+		dev_err(obj->dev, "no power param[%s]!\n", token);
+		goto out;
+	}
+
+	/* parse arguments */
+	for (i = 0;
+	     i < DEBUG_MAX_ARGS_NUM && (token = strsep(&cursor, " ")); i++) {
+		ret = kstrtouint(token, 0, &args[i]);
+		if (ret) {
+			dev_err(obj->dev, "fail to parse args[%d]\n", i);
+			goto out;
+		}
+	}
+
+	apu_power_set_parameter(obj, param, i, args);
+	ret = count;
+out:
+	kfree(tmp);
+	return ret;
+}
+
+static const struct file_operations apu_power_dbg_fops = {
+	.open = apu_power_dbg_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = seq_release,
+	.write = apu_power_dbg_write,
+};
+
+void apu_power_debugfs_init(struct apu_power *apupwr)
+{
+	int ret;
+
+	apu_power_debugfs = debugfs_create_dir("apu_power",
+					       apupwr->dbg_root);
+	ret = IS_ERR_OR_NULL(apu_power_debugfs);
+	if (ret) {
+		dev_err(apupwr->dev, "failed to create debug dir.\n");
+		apu_power_debugfs = NULL;
+	}
+
+	debugfs_create_file("power", (0644),
+			    apu_power_debugfs, apupwr, &apu_power_dbg_fops);
+}
+
+void apu_power_debugfs_exit(void)
+{
+	debugfs_remove_recursive(apu_power_debugfs);
+}
diff --git a/drivers/soc/mediatek/apusys/apu-pwr-ipi.c b/drivers/soc/mediatek/apusys/apu-pwr-ipi.c
new file mode 100644
index 000000000000..c7bbcd1de73d
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-pwr-ipi.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/rpmsg.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+#include "apu-pwr.h"
+
+#define APU_TX_MSG_TIMEOUT	1000
+#define RX_MAGIC0		0xaabb
+#define RX_MAGIC1		0xccdd
+
+#define to_rpmsg_driver(__drv) container_of(__drv, struct rpmsg_driver, drv)
+#define tx_to_apu_power(__d)	\
+	container_of(__d, struct apu_power, tx_rpmsg_driver)
+#define rx_to_apu_power(__d)	\
+	container_of(__d, struct apu_power, rx_rpmsg_driver)
+
+struct apu_power_rpmsg {
+	struct rpmsg_device *rpdev;
+	struct rpmsg_endpoint *ept;
+	struct mutex lock;  /* wait remote msg */
+	struct completion comp;
+	int initialized;
+	struct power_ipi_cmd_reply ipi_rply;
+};
+
+static int apu_power_tx_send(struct apu_power *apupwr,
+			     struct power_cmd_AP *pcmd,
+			     u32 *data0, u32 *data1)
+{
+	struct rpmsg_device *rpdev = apupwr->tx_rpmsg_device;
+	struct apu_power_rpmsg *power_rpmsg = dev_get_drvdata(&rpdev->dev);
+	struct power_ipi_cmd_AP ipi_cmd_send;
+	struct timespec64 ts64;
+	unsigned long timeout = msecs_to_jiffies(APU_TX_MSG_TIMEOUT);
+	u64 timestamp;
+	int ret = 0;
+
+	if (!power_rpmsg || !power_rpmsg->initialized) {
+		dev_err(&rpdev->dev, "%s: rpmsg not valid\n", __func__);
+		ret = -EINVAL;
+		return ret;
+	}
+
+	memset(&ipi_cmd_send, 0, sizeof(struct power_ipi_cmd_AP));
+	ktime_get_real_ts64(&ts64);
+	timestamp = ((ts64.tv_sec & 0xFFF) * USEC_PER_SEC) +
+		    (ts64.tv_nsec / NSEC_PER_USEC);
+	ipi_cmd_send.cmd_sn = (u32)timestamp;
+	ipi_cmd_send.pwr_cmd = *pcmd;
+
+	/* transport normal raw data */
+	ipi_cmd_send.data0 = *data0;
+	ipi_cmd_send.data1 = *data1;
+
+	mutex_lock(&power_rpmsg->lock);
+	reinit_completion(&power_rpmsg->comp);
+
+	ret = rpmsg_send(power_rpmsg->ept,
+			 (void *)&ipi_cmd_send, sizeof(ipi_cmd_send));
+	if (ret) {
+		dev_err(&rpdev->dev,
+			"%s: failed to send msg to remote, ret=%d\n",
+			__func__, ret);
+		goto out;
+	}
+
+	ret = wait_for_completion_interruptible_timeout(&power_rpmsg->comp,
+							timeout);
+	if (ret <= 0) {
+		dev_err(&rpdev->dev,
+			"%s waiting for ack interrupted or timeout, ret=%d\n",
+			__func__, ret);
+		goto out;
+	}
+
+out:
+	mutex_unlock(&power_rpmsg->lock);
+	return ret;
+}
+
+void apu_power_set_ulog_level(struct apu_power *apupwr,
+			      int level)
+{
+	struct power_cmd_AP pwr_cmd;
+	u32 data0;
+	u32 data1;
+
+	memset(&pwr_cmd, 0, sizeof(struct power_cmd_AP));
+	memset(&data0, 0, sizeof(u32));
+	memset(&data1, 0, sizeof(u32));
+
+	pwr_cmd.req_id = CHANGE_LOG_LEVEL;
+	data0 = level;
+	apu_power_tx_send(apupwr, &pwr_cmd, &data0, &data1);
+}
+
+void apu_power_notify_uP_opp_limit(struct apu_power *apupwr,
+				   enum request_id_AP req)
+{
+	struct power_cmd_AP pwr_cmd;
+	u32 data0;
+	u32 data1;
+
+	memset(&pwr_cmd, 0, sizeof(struct power_cmd_AP));
+	memset(&data0, 0, sizeof(u32));
+	memset(&data1, 0, sizeof(u32));
+
+	pwr_cmd.req_id = req;
+	switch (pwr_cmd.req_id) {
+	case OPP_LIMIT_THERM:
+	case OPP_LIMIT_FIX_OPP:
+	case OPP_LIMIT_DVFS_DEBUG:
+		break;
+	default:
+		return;
+	}
+
+	apu_power_tx_send(apupwr, &pwr_cmd, &data0, &data1);
+}
+
+static int apu_power_rx_callback(struct rpmsg_device *rpdev, void *data,
+				 int len, void *priv, u32 src)
+{
+	struct apu_power_rpmsg *power_rpmsg = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
+	struct apu_power *apupwr = rx_to_apu_power(rpdrv);
+	int ret = 0;
+	struct device *dev = &rpdev->dev;
+	struct power_ipi_cmd_uP *received_data = NULL;
+	struct power_ipi_cmd_reply reply_data;
+	static u32 prev_cmd_sn;
+	u32 cmd_sn;
+	struct power_cmd_uP pwr_cmd;
+	u32 data0;
+	u32 data1;
+
+	if (!len) {
+		dev_warn(dev, "apu power rpmsg received empty cmd");
+		return -EINVAL;
+	}
+
+	received_data = data;
+	cmd_sn = received_data->cmd_sn;
+	pwr_cmd = received_data->pwr_cmd;
+	data0 = received_data->data0;
+	data1 = received_data->data1;
+
+	if (cmd_sn != prev_cmd_sn)
+		prev_cmd_sn = cmd_sn;
+	else
+		return -EINVAL;
+
+	switch (pwr_cmd.req_id) {
+	case CHANGE_DEV_CLKSRC:
+		/*
+		 * received_data.data0 : user
+		 * received_data.data1 : on
+		 */
+		if (data1 == 1)
+			ret = apu_enable_dev_clksrc(apupwr->dev, data0);
+		else
+			apu_disable_dev_clksrc(apupwr->dev, data0);
+		break;
+	case CHANGE_DEV_CLOCK:
+		/*
+		 * received_data.data0 : target_freq
+		 * received_data.data1 : volt_domain
+		 */
+		ret = apu_set_clk_freq(apupwr->dev, data0, data1);
+		break;
+	case CHANGE_SYS_VCORE:
+		/*
+		 * received_data.data0 : user
+		 * received_data.data1 : vcore_opp
+		 */
+		ret = apu_config_vcore_volt(apupwr->dev, data1);
+		break;
+	default:
+		dev_err(dev, "invalid request id:%d (cmd_sn:0x%08x)\n",
+			pwr_cmd.req_id,
+			cmd_sn);
+		return -EINVAL;
+	}
+
+	/* prepare reply data to remote */
+	memset(&reply_data, 0, sizeof(struct power_ipi_cmd_reply));
+	reply_data.cmd_sn = cmd_sn;
+	reply_data.data0 = RX_MAGIC0;
+	reply_data.data1 = RX_MAGIC1;
+
+	/* send reply data to remote (no blocking) */
+	ret = rpmsg_send(power_rpmsg->ept,
+			 (void *)&reply_data, sizeof(reply_data));
+	if (ret)
+		dev_err(dev, "%s: failed to send msg to remote, ret=%d\n",
+			__func__, ret);
+
+	return ret;
+}
+
+static int apu_power_rx_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct rpmsg_channel_info chinfo = {};
+	struct rpmsg_endpoint *ept;
+	struct apu_power_rpmsg *power_rpmsg;
+	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
+	struct apu_power *apupwr = rx_to_apu_power(rpdrv);
+
+	power_rpmsg = devm_kzalloc(dev,
+				   sizeof(struct apu_power_rpmsg), GFP_KERNEL);
+	if (!power_rpmsg)
+		return -ENOMEM;
+
+	strscpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
+	chinfo.src = rpdev->src;
+	chinfo.dst = RPMSG_ADDR_ANY;
+	ept = rpmsg_create_ept(rpdev, apu_power_rx_callback, NULL, chinfo);
+	if (!ept) {
+		dev_err(dev, "failed to create ept\n");
+		return -ENODEV;
+	}
+
+	init_completion(&power_rpmsg->comp);
+	mutex_init(&power_rpmsg->lock);
+	power_rpmsg->ept = ept;
+	power_rpmsg->rpdev = rpdev;
+	power_rpmsg->initialized = 1;
+	memset(&power_rpmsg->ipi_rply, 0x0,
+	       sizeof(struct power_ipi_cmd_reply));
+	dev_set_drvdata(dev, power_rpmsg);
+	apupwr->rx_rpmsg_device = rpdev;
+
+	return 0;
+}
+
+static void apu_power_rx_remove(struct rpmsg_device *rpdev)
+{
+	struct apu_power_rpmsg *power_rpmsg = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
+	struct apu_power *apupwr = rx_to_apu_power(rpdrv);
+
+	rpmsg_destroy_ept(power_rpmsg->ept);
+	apupwr->rx_rpmsg_device = NULL;
+}
+
+static int apu_power_tx_callback(struct rpmsg_device *rpdev, void *data,
+				 int len, void *priv, u32 src)
+{
+	struct device *dev = &rpdev->dev;
+	struct apu_power_rpmsg *power_rpmsg = dev_get_drvdata(&rpdev->dev);
+
+	if (!len) {
+		dev_err(dev, "apu power rpmsg received empty rply");
+		complete(&power_rpmsg->comp);
+		return -EINVAL;
+	}
+
+	memcpy(&power_rpmsg->ipi_rply, data,
+	       sizeof(struct power_ipi_cmd_reply));
+	complete(&power_rpmsg->comp);
+
+	return 0;
+}
+
+static int apu_power_tx_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct rpmsg_channel_info chinfo = {};
+	struct rpmsg_endpoint *ept;
+	struct apu_power_rpmsg *power_rpmsg;
+	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
+	struct apu_power *apupwr = tx_to_apu_power(rpdrv);
+
+	power_rpmsg = devm_kzalloc(dev,
+				   sizeof(struct apu_power_rpmsg), GFP_KERNEL);
+	if (!power_rpmsg)
+		return -ENOMEM;
+
+	strscpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
+	chinfo.src = rpdev->src;
+	chinfo.dst = RPMSG_ADDR_ANY;
+	ept = rpmsg_create_ept(rpdev, apu_power_tx_callback, NULL, chinfo);
+	if (!ept) {
+		dev_err(dev, "failed to create ept\n");
+		return -ENODEV;
+	}
+
+	init_completion(&power_rpmsg->comp);
+	mutex_init(&power_rpmsg->lock);
+	power_rpmsg->ept = ept;
+	power_rpmsg->rpdev = rpdev;
+	power_rpmsg->initialized = 1;
+	memset(&power_rpmsg->ipi_rply, 0x0,
+	       sizeof(struct power_ipi_cmd_reply));
+	dev_set_drvdata(dev, power_rpmsg);
+	apupwr->tx_rpmsg_device = rpdev;
+
+	return 0;
+}
+
+static void apu_power_tx_remove(struct rpmsg_device *rpdev)
+{
+	struct apu_power_rpmsg *power_rpmsg = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
+	struct apu_power *apupwr = tx_to_apu_power(rpdrv);
+
+	rpmsg_destroy_ept(power_rpmsg->ept);
+	apupwr->tx_rpmsg_device = NULL;
+}
+
+static const struct of_device_id apupwr_tx_rpmsg_of_match[] = {
+	{ .compatible = "mediatek,apupwr-tx-rpmsg"},
+	{},
+};
+
+static const struct of_device_id apupwr_rx_rpmsg_of_match[] = {
+	{ .compatible = "mediatek,apupwr-rx-rpmsg"},
+	{},
+};
+
+static struct rpmsg_driver pwr_tx_rpmsg_drv = {
+	.drv = {
+		.name = "apupwr-tx-rpmsg",
+		.owner = THIS_MODULE,
+		.of_match_table = apupwr_tx_rpmsg_of_match,
+	},
+	.probe = apu_power_tx_probe,
+	.remove = apu_power_tx_remove,
+};
+
+static struct rpmsg_driver pwr_rx_rpmsg_drv = {
+	.drv = {
+		.name = "apupwr-rx-rpmsg",
+		.owner = THIS_MODULE,
+		.of_match_table = apupwr_rx_rpmsg_of_match,
+	},
+	.probe = apu_power_rx_probe,
+	.remove = apu_power_rx_remove,
+};
+
+int apu_power_ipi_init(struct apu_power *apupwr)
+{
+	int ret = 0;
+
+	apupwr->tx_rpmsg_driver = pwr_tx_rpmsg_drv;
+	ret = register_rpmsg_driver(&apupwr->tx_rpmsg_driver);
+	if (ret)
+		return ret;
+
+	apupwr->rx_rpmsg_driver = pwr_rx_rpmsg_drv;
+	ret = register_rpmsg_driver(&apupwr->rx_rpmsg_driver);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	unregister_rpmsg_driver(&apupwr->tx_rpmsg_driver);
+	return ret;
+}
+
+void apu_power_ipi_exit(struct apu_power *apupwr)
+{
+	unregister_rpmsg_driver(&apupwr->tx_rpmsg_driver);
+	unregister_rpmsg_driver(&apupwr->rx_rpmsg_driver);
+}
diff --git a/drivers/soc/mediatek/apusys/apu-pwr.c b/drivers/soc/mediatek/apusys/apu-pwr.c
new file mode 100644
index 000000000000..ef0df1469a76
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-pwr.c
@@ -0,0 +1,599 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#include "apu-core.h"
+#include "apu-pwr.h"
+
+static const char *mt8192_apu_clks[CLK_NUM] = {
+	[CLK_TOP_DSP_SEL] = "clk_top_dsp_sel",
+	[CLK_TOP_DSP1_SEL] = "clk_top_dsp1_sel",
+	[CLK_TOP_DSP1_NPUPLL_SEL] = "clk_top_dsp1_npupll_sel",
+	[CLK_TOP_DSP2_SEL] = "clk_top_dsp2_sel",
+	[CLK_TOP_DSP2_NPUPLL_SEL] = "clk_top_dsp2_npupll_sel",
+	[CLK_TOP_DSP5_SEL] = "clk_top_dsp5_sel",
+	[CLK_TOP_DSP5_APUPLL_SEL] = "clk_top_dsp5_apupll_sel",
+	[CLK_TOP_IPU_IF_SEL] = "clk_top_ipu_if_sel",
+	[CLK_CLK26M] = "clk_top_clk26m",
+	[CLK_TOP_MAINPLL_D4_D2] = "clk_top_mainpll_d4_d2",
+	[CLK_TOP_UNIVPLL_D4_D2] = "clk_top_univpll_d4_d2",
+	[CLK_TOP_UNIVPLL_D6_D2] = "clk_top_univpll_d6_d2",
+	[CLK_TOP_MMPLL_D6] = "clk_top_mmpll_d6",
+	[CLK_TOP_MMPLL_D5] = "clk_top_mmpll_d5",
+	[CLK_TOP_MMPLL_D4] = "clk_top_mmpll_d4",
+	[CLK_TOP_UNIVPLL_D5] = "clk_top_univpll_d5",
+	[CLK_TOP_UNIVPLL_D4] = "clk_top_univpll_d4",
+	[CLK_TOP_UNIVPLL_D3] = "clk_top_univpll_d3",
+	[CLK_TOP_MAINPLL_D6] = "clk_top_mainpll_d6",
+	[CLK_TOP_MAINPLL_D4] = "clk_top_mainpll_d4",
+	[CLK_TOP_MAINPLL_D3] = "clk_top_mainpll_d3",
+	[CLK_TOP_TVDPLL] = "clk_top_tvdpll_ck",
+	[CLK_TOP_APUPLL] = "clk_top_apupll_ck",
+	[CLK_TOP_NPUPLL] = "clk_top_npupll_ck",
+	[CLK_APMIXED_APUPLL] = "clk_apmixed_apupll_rate",
+	[CLK_APMIXED_NPUPLL] = "clk_apmixed_npupll_rate",
+};
+
+static struct dentry *dbg_root;
+
+static void apu_power_reg_init(struct device *dev)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	const struct apupwr_plat_reg *plat_regs;
+	void __iomem *spare_base;
+
+	spare_base = apupwr->spare_base;
+	plat_regs = apupwr->plat_data->plat_regs;
+
+	writel(0xffffffff, spare_base + plat_regs->opp_user);
+	writel(0xffffffff, spare_base + plat_regs->opp_curr);
+	writel(0xffffffff, spare_base + plat_regs->opp_thermal);
+}
+
+static int apu_power_regulator_init(struct device *dev)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	int ret;
+
+	apupwr->vvpu_reg_id = devm_regulator_get_optional(dev, "vvpu");
+	if (IS_ERR(apupwr->vvpu_reg_id)) {
+		ret = PTR_ERR(apupwr->vvpu_reg_id);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get vvpu regulator");
+
+		return ret;
+	}
+
+	apupwr->vmdla_reg_id = devm_regulator_get_optional(dev, "vmdla");
+	if (IS_ERR(apupwr->vmdla_reg_id)) {
+		ret = PTR_ERR(apupwr->vmdla_reg_id);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get vmdla regulator");
+
+		return ret;
+	}
+
+	ret = regulator_enable(apupwr->vvpu_reg_id);
+	if (ret)
+		return ret;
+
+	ret = regulator_enable(apupwr->vmdla_reg_id);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static void apu_power_regulator_exit(struct device *dev)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+
+	if (apupwr->vvpu_reg_id) {
+		if (regulator_disable(apupwr->vvpu_reg_id))
+			dev_err(apupwr->dev, "disable vvpu fail\n");
+	}
+
+	if (apupwr->vmdla_reg_id) {
+		if (regulator_disable(apupwr->vmdla_reg_id))
+			dev_err(apupwr->dev, "disable mdla fail\n");
+	}
+}
+
+static int mt8192_apu_clock_init(struct device *dev)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	int i = 0;
+
+	apupwr->clk = devm_kcalloc(dev, CLK_NUM,
+				   sizeof(*apupwr->clk), GFP_KERNEL);
+	if (!apupwr->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < CLK_NUM; i++) {
+		apupwr->clk[i] = devm_clk_get(dev, mt8192_apu_clks[i]);
+		if (IS_ERR(apupwr->clk[i])) {
+			dev_warn(dev, "%s devm_clk_get %s fail\n",
+				 __func__,
+				 mt8192_apu_clks[i]);
+			apupwr->clk[i] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int mt8192_enalbe_vpu_clksrc(struct apu_power *apupwr)
+{
+	int ret;
+
+	ret = clk_prepare_enable(apupwr->clk[CLK_TOP_DSP1_SEL]);
+	if (ret)
+		goto dsp1_sel_err;
+
+	ret = clk_prepare_enable(apupwr->clk[CLK_TOP_DSP2_SEL]);
+	if (ret)
+		goto dsp2_sel_err;
+
+	ret = clk_prepare_enable(apupwr->clk[CLK_TOP_NPUPLL]);
+	if (ret)
+		goto npupll_sel_err;
+
+	ret = clk_prepare_enable(apupwr->clk[CLK_TOP_DSP1_NPUPLL_SEL]);
+	if (ret)
+		goto dsp1_npupll_sel_err;
+
+	ret = clk_prepare_enable(apupwr->clk[CLK_TOP_DSP2_NPUPLL_SEL]);
+	if (ret)
+		goto dsp2_npupll_sel_err;
+
+	return 0;
+
+dsp2_npupll_sel_err:
+	clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP1_NPUPLL_SEL]);
+dsp1_npupll_sel_err:
+	clk_disable_unprepare(apupwr->clk[CLK_TOP_NPUPLL]);
+npupll_sel_err:
+	clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP2_SEL]);
+dsp2_sel_err:
+	clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP1_SEL]);
+dsp1_sel_err:
+	dev_err(apupwr->dev, "failed to enable vpu clk src\n");
+	return ret;
+}
+
+static int mt8192_enalbe_mdla_clksrc(struct apu_power *apupwr)
+{
+	int ret;
+
+	ret = clk_prepare_enable(apupwr->clk[CLK_TOP_DSP5_SEL]);
+	if (ret)
+		goto dsp5_sel_err;
+
+	ret = clk_prepare_enable(apupwr->clk[CLK_TOP_APUPLL]);
+	if (ret)
+		goto apupll_err;
+
+	ret = clk_prepare_enable(apupwr->clk[CLK_TOP_DSP5_APUPLL_SEL]);
+	if (ret)
+		goto dsp5_apupll_sel_err;
+
+	return 0;
+
+dsp5_apupll_sel_err:
+	clk_disable_unprepare(apupwr->clk[CLK_TOP_APUPLL]);
+apupll_err:
+	clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP5_APUPLL_SEL]);
+dsp5_sel_err:
+	dev_err(apupwr->dev, "failed to enable mdla clk src\n");
+	return ret;
+}
+
+static int mt8192_apu_enable_dev_clksrc(struct device *dev, enum DVFS_USER user)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	int ret = 0;
+
+	switch (user) {
+	case VPU0:
+	case VPU1:
+		ret = mt8192_enalbe_vpu_clksrc(apupwr);
+		break;
+	case MDLA0:
+		ret = mt8192_enalbe_mdla_clksrc(apupwr);
+		break;
+	default:
+		dev_err(dev, "%s illegal DVFS_USER: %d\n", __func__, user);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static void mt8192_apu_disable_dev_clksrc(struct device *dev,
+					  enum DVFS_USER user)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+
+	switch (user) {
+	case VPU0:
+	case VPU1:
+		clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP2_NPUPLL_SEL]);
+		clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP1_NPUPLL_SEL]);
+		clk_disable_unprepare(apupwr->clk[CLK_TOP_NPUPLL]);
+		clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP2_SEL]);
+		clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP1_SEL]);
+		break;
+	case MDLA0:
+		clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP5_APUPLL_SEL]);
+		clk_disable_unprepare(apupwr->clk[CLK_TOP_APUPLL]);
+		clk_disable_unprepare(apupwr->clk[CLK_TOP_DSP5_SEL]);
+		break;
+	default:
+		dev_err(dev, "%s illegal DVFS_USER: %d\n", __func__, user);
+	}
+}
+
+static struct clk *find_clk_by_domain(struct device *dev,
+				      enum DVFS_VOLTAGE_DOMAIN domain)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+
+	switch (domain) {
+	case V_APU_CONN:
+		return apupwr->clk[CLK_TOP_DSP_SEL];
+
+	case V_VPU0:
+		return apupwr->clk[CLK_TOP_DSP1_SEL];
+
+	case V_VPU1:
+		return apupwr->clk[CLK_TOP_DSP2_SEL];
+
+	case V_MDLA0:
+		return apupwr->clk[CLK_TOP_DSP5_SEL];
+
+	case V_VCORE:
+		return apupwr->clk[CLK_TOP_IPU_IF_SEL];
+
+	default:
+		dev_err(dev, "%s fail to find clk !\n", __func__);
+		return NULL;
+	}
+}
+
+static int mt8192_apu_set_clk_freq(struct device *dev,
+				   enum DVFS_FREQ freq,
+				   enum DVFS_VOLTAGE_DOMAIN domain)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	int ret = 0;
+	struct clk *clk_src = NULL;
+	struct clk *clk_target = NULL;
+
+	switch (freq) {
+	case DVFS_FREQ_00_026000_F:
+		clk_src = apupwr->clk[CLK_CLK26M];
+		break;
+
+	case DVFS_FREQ_00_208000_F:
+		clk_src = apupwr->clk[CLK_TOP_UNIVPLL_D6_D2];
+		break;
+
+	case DVFS_FREQ_00_273000_F:
+		clk_src = apupwr->clk[CLK_TOP_MAINPLL_D4_D2];
+		break;
+
+	case DVFS_FREQ_00_312000_F:
+		clk_src = apupwr->clk[CLK_TOP_UNIVPLL_D4_D2];
+		break;
+
+	case DVFS_FREQ_00_499200_F:
+		clk_src = apupwr->clk[CLK_TOP_UNIVPLL_D5];
+		break;
+
+	case DVFS_FREQ_00_546000_F:
+		clk_src = apupwr->clk[CLK_TOP_MAINPLL_D4];
+		break;
+
+	case DVFS_FREQ_00_624000_F:
+		clk_src = apupwr->clk[CLK_TOP_UNIVPLL_D4];
+		break;
+
+	case DVFS_FREQ_00_687500_F:
+		clk_src = apupwr->clk[CLK_TOP_MMPLL_D4];
+		break;
+
+	case DVFS_FREQ_00_728000_F:
+		clk_src = apupwr->clk[CLK_TOP_MAINPLL_D3];
+		break;
+
+	case DVFS_FREQ_00_832000_F:
+		clk_src = apupwr->clk[CLK_TOP_UNIVPLL_D3];
+		break;
+
+	case DVFS_FREQ_NOT_SUPPORT:
+	default:
+		clk_src = apupwr->clk[CLK_CLK26M];
+		dev_warn(dev, "%s wrong freq : %d, force assign 26M\n",
+			 __func__, freq);
+	}
+
+	clk_target = find_clk_by_domain(dev, domain);
+	if (clk_target) {
+		ret = clk_set_parent(clk_target, clk_src);
+		if (ret) {
+			dev_err(dev, "%s fail p1 fail\n", __func__);
+			return ret;
+		}
+		switch (domain) {
+		case V_VPU0:
+			clk_target = apupwr->clk[CLK_TOP_DSP1_NPUPLL_SEL];
+			clk_src = apupwr->clk[CLK_TOP_DSP1_SEL];
+			break;
+
+		case V_VPU1:
+			clk_target = apupwr->clk[CLK_TOP_DSP2_NPUPLL_SEL];
+			clk_src = apupwr->clk[CLK_TOP_DSP2_SEL];
+			break;
+
+		case V_MDLA0:
+			clk_target = apupwr->clk[CLK_TOP_DSP5_APUPLL_SEL];
+			clk_src = apupwr->clk[CLK_TOP_DSP5_SEL];
+			break;
+
+		default:
+			break;
+		}
+		ret = clk_set_parent(clk_target, clk_src);
+		if (ret) {
+			dev_err(dev, "%s fail p2 fail\n", __func__);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int apu_clock_init(struct device *dev)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (apupwr->plat_data->ops->clock_init)
+		ret = apupwr->plat_data->ops->clock_init(dev);
+
+	return ret;
+}
+
+int apu_enable_dev_clksrc(struct device *dev, enum DVFS_USER user)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (apupwr->plat_data->ops->enable_dev_clksrc)
+		ret = apupwr->plat_data->ops->enable_dev_clksrc(dev, user);
+
+	return ret;
+}
+
+void apu_disable_dev_clksrc(struct device *dev, enum DVFS_USER user)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+
+	if (apupwr->plat_data->ops->disable_dev_clksrc)
+		apupwr->plat_data->ops->disable_dev_clksrc(dev, user);
+}
+
+int apu_set_clk_freq(struct device *dev,
+		     enum DVFS_FREQ freq,
+		     enum DVFS_VOLTAGE_DOMAIN domain)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (apupwr->plat_data->ops->set_clk_freq)
+		ret = apupwr->plat_data->ops->set_clk_freq(dev,
+							      freq, domain);
+
+	return ret;
+}
+
+void apu_update_fixed_opp_by_reg(struct device *dev,
+				 u32 opp_limit_stat)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	const struct apupwr_plat_reg *plat_regs;
+	void __iomem *spare_base;
+
+	spare_base = apupwr->spare_base;
+	plat_regs = apupwr->plat_data->plat_regs;
+	writel(opp_limit_stat, spare_base + plat_regs->opp_user);
+}
+
+void apu_check_curr_opp_by_reg(struct device *dev,
+			       enum DVFS_USER specify_usr)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	const struct apupwr_plat_reg *plat_regs;
+	void __iomem *spare_base;
+	u32 curr_opp_stat;
+
+	spare_base = apupwr->spare_base;
+	plat_regs = apupwr->plat_data->plat_regs;
+
+	curr_opp_stat = readl(spare_base + plat_regs->opp_curr);
+	dev_info(dev, "%s user:%d curr opp:%d\n",
+		 __func__, specify_usr, curr_opp_stat);
+}
+
+void apu_update_thermal_opp_by_reg(struct device *dev,
+				   enum DVFS_USER user, int therm_opp)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	const struct apupwr_plat_reg *plat_regs;
+	void __iomem *spare_base;
+	u32 curr_therm_stat;
+
+	spare_base = apupwr->spare_base;
+	plat_regs = apupwr->plat_data->plat_regs;
+
+	curr_therm_stat = readl(spare_base + plat_regs->opp_thermal);
+	curr_therm_stat &= ~(0xf << user);
+	curr_therm_stat |= ((therm_opp & 0xf) << user);
+
+	writel(curr_therm_stat, spare_base + plat_regs->opp_thermal);
+}
+
+int apu_config_vcore_volt(struct device *dev, enum DVFS_VOLTAGE volt)
+{
+	struct apu_power *apupwr = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (apupwr->plat_data->ops->set_vcore)
+		ret = apupwr->plat_data->ops->set_vcore(dev, volt);
+
+	return ret;
+}
+
+static int apu_power_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct apu_power *apupwr;
+	struct resource *res;
+	int ret = 0;
+
+	apupwr = devm_kzalloc(dev, sizeof(struct apu_power), GFP_KERNEL);
+	if (!apupwr)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, apupwr);
+
+	apupwr->dev = &pdev->dev;
+	apupwr->plat_data = device_get_match_data(dev);
+	res = platform_get_resource_byname(pdev,
+					   IORESOURCE_MEM, "apu_spare");
+	apupwr->spare_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(apupwr->spare_base)) {
+		dev_err(dev, "Unable to ioremap spare_base\n");
+		apupwr->spare_base = NULL;
+		return PTR_ERR(apupwr->spare_base);
+	}
+
+	/* prepare registers */
+	apu_power_reg_init(dev);
+
+	/* prepare regulators */
+	ret = apu_power_regulator_init(dev);
+	if (ret)
+		goto err_regulator;
+
+	/* prepare clocks */
+	ret = apu_clock_init(dev);
+	if (ret)
+		goto err_regulator;
+
+	/* debugfs */
+	apupwr->dbg_root = dbg_root;
+	apu_power_debugfs_init(apupwr);
+
+	/* init remote ipi channel */
+	ret = apu_power_ipi_init(apupwr);
+	if (ret) {
+		dev_err(dev, "failed to rpmsg channel\n");
+		goto err_exit;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+
+err_exit:
+	apu_power_ipi_exit(apupwr);
+	apu_power_debugfs_exit();
+err_regulator:
+	apu_power_regulator_exit(dev);
+
+	return ret;
+}
+
+static int apu_power_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct apu_power *apupwr = platform_get_drvdata(pdev);
+
+	if (!apupwr)
+		return -ENODEV;
+
+	pm_runtime_disable(dev);
+	apu_power_ipi_exit(apupwr);
+	apu_power_debugfs_exit();
+	apu_power_regulator_exit(dev);
+	return 0;
+}
+
+static const struct apupwr_plat_reg mt8192_pwr_reg = {
+	.opp_user = 0x40,
+	.opp_thermal = 0x44,
+	.opp_curr = 0x48,
+	.opp_mask = 0xF,
+};
+
+static struct apupwr_plat_ops mt8192_pwr_ops = {
+	.clock_init = mt8192_apu_clock_init,
+	.enable_dev_clksrc = mt8192_apu_enable_dev_clksrc,
+	.disable_dev_clksrc = mt8192_apu_disable_dev_clksrc,
+	.set_clk_freq = mt8192_apu_set_clk_freq,
+	.set_vcore = NULL,
+};
+
+static struct apupwr_plat_data mt8192_apu_power_data = {
+	.dvfs_user = MDLA0,
+	.plat_regs = &mt8192_pwr_reg,
+	.ops = &mt8192_pwr_ops,
+};
+
+static const struct of_device_id apu_power_of_match[] = {
+	{
+		.compatible = "mediatek,mt8192-apu-power",
+		.data = &mt8192_apu_power_data
+	}, {
+		/* Terminator */
+	},
+};
+MODULE_DEVICE_TABLE(of, apu_power_of_match);
+
+static struct platform_driver apu_power_driver = {
+	.probe	= apu_power_probe,
+	.remove	= apu_power_remove,
+	.driver = {
+		.name = "apusys_power",
+		.of_match_table = of_match_ptr(apu_power_of_match),
+	},
+};
+
+int apu_power_drv_init(struct apusys_core_info *info)
+{
+	dbg_root = info->dbg_root;
+	return platform_driver_register(&apu_power_driver);
+}
+
+void apu_power_drv_exit(void)
+{
+	platform_driver_unregister(&apu_power_driver);
+}
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("apu power driver");
diff --git a/drivers/soc/mediatek/apusys/apu-pwr.h b/drivers/soc/mediatek/apusys/apu-pwr.h
new file mode 100644
index 000000000000..4b6d90d5f206
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-pwr.h
@@ -0,0 +1,260 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef APU_PWR_H
+#define APU_PWR_H
+
+#include <linux/platform_device.h>
+#include <linux/rpmsg.h>
+
+enum DVFS_USER {
+	VPU0 = 0,
+	VPU1,
+	MDLA0,
+	MDLA1,
+	APUSYS_DVFS_USER_NUM,
+};
+
+enum DVFS_VOLTAGE_DOMAIN {
+	V_VPU0 = 0,
+	V_VPU1,
+	V_MDLA0,
+	V_APU_CONN,
+	V_VCORE,
+	APUSYS_BUCK_DOMAIN_NUM,
+};
+
+enum DVFS_USER_TYPE {
+	TYPE_VPU,
+	TYPE_MDLA,
+	DVFS_USER_TYPE_NUM,
+	TYPE_UNKNOWN,
+};
+
+/* mt8192 apu clocks*/
+enum {
+	CLK_TOP_DSP_SEL = 0,
+	CLK_TOP_DSP1_SEL,
+	CLK_TOP_DSP1_NPUPLL_SEL,
+	CLK_TOP_DSP2_SEL,
+	CLK_TOP_DSP2_NPUPLL_SEL,
+	CLK_TOP_DSP5_SEL,
+	CLK_TOP_DSP5_APUPLL_SEL,
+	CLK_TOP_IPU_IF_SEL,
+	CLK_CLK26M,
+	CLK_TOP_MAINPLL_D4_D2,
+	CLK_TOP_UNIVPLL_D4_D2,
+	CLK_TOP_UNIVPLL_D6_D2,
+	CLK_TOP_MMPLL_D6,
+	CLK_TOP_MMPLL_D5,
+	CLK_TOP_MMPLL_D4,
+	CLK_TOP_UNIVPLL_D5,
+	CLK_TOP_UNIVPLL_D4,
+	CLK_TOP_UNIVPLL_D3,
+	CLK_TOP_MAINPLL_D6,
+	CLK_TOP_MAINPLL_D4,
+	CLK_TOP_MAINPLL_D3,
+	CLK_TOP_TVDPLL,
+	CLK_TOP_APUPLL,
+	CLK_TOP_NPUPLL,
+	CLK_APMIXED_APUPLL,
+	CLK_APMIXED_NPUPLL,
+	CLK_NUM
+};
+
+enum DVFS_VOLTAGE {
+	DVFS_VOLT_NOT_SUPPORT = 0,
+	DVFS_VOLT_00_550000_V = 550000,
+	DVFS_VOLT_00_575000_V = 575000,
+	DVFS_VOLT_00_600000_V = 600000,
+	DVFS_VOLT_00_650000_V = 650000,
+	DVFS_VOLT_00_700000_V = 700000,
+	DVFS_VOLT_00_725000_V = 725000,
+	DVFS_VOLT_00_750000_V = 750000,
+	DVFS_VOLT_00_775000_V = 775000,
+	DVFS_VOLT_00_800000_V = 800000,
+	DVFS_VOLT_00_825000_V = 825000,
+	DVFS_VOLT_MAX = 825000 + 1,
+};
+
+enum DVFS_FREQ {
+	DVFS_FREQ_NOT_SUPPORT = 0,
+	DVFS_FREQ_00_026000_F = 26000,
+	DVFS_FREQ_00_208000_F = 208000,
+	DVFS_FREQ_00_273000_F = 273000,
+	DVFS_FREQ_00_312000_F = 312000,
+	DVFS_FREQ_00_499200_F = 499200,
+	DVFS_FREQ_00_525000_F = 525000,
+	DVFS_FREQ_00_546000_F = 546000,
+	DVFS_FREQ_00_594000_F = 594000,
+	DVFS_FREQ_00_624000_F = 624000,
+	DVFS_FREQ_00_688000_F = 688000,
+	DVFS_FREQ_00_687500_F = 687500,
+	DVFS_FREQ_00_728000_F = 728000,
+	DVFS_FREQ_00_800000_F = 800000,
+	DVFS_FREQ_00_832000_F = 832000,
+	DVFS_FREQ_00_960000_F = 960000,
+	DVFS_FREQ_00_1100000_F = 1100000,
+	DVFS_FREQ_MAX,
+};
+
+enum APU_POWER_PARAM {
+	POWER_PARAM_FIX_OPP,
+	POWER_PARAM_DVFS_DEBUG,
+	POWER_PARAM_GET_POWER_REG,
+	POWER_PARAM_POWER_STRESS,
+	POWER_PARAM_OPP_TABLE,
+	POWER_PARAM_CURR_STATUS,
+	POWER_PARAM_LOG_LEVEL,
+	POWER_PARAM_ULOG_LEVEL,
+};
+
+struct apu_dev_power_data {
+	int dev_type;
+	int dev_core;
+	void *pdata;
+};
+
+struct apupwr_plat_reg {
+	u32 opp_user;
+	u32 opp_thermal;
+	u32 opp_curr;
+	u32 opp_mask;
+};
+
+struct apupwr_plat_ops {
+	int (*clock_init)(struct device *dev);
+	int (*enable_dev_clksrc)(struct device *dev, enum DVFS_USER user);
+	void (*disable_dev_clksrc)(struct device *dev, enum DVFS_USER user);
+	int (*set_clk_freq)(struct device *dev, enum DVFS_FREQ freq,
+			    enum DVFS_VOLTAGE_DOMAIN domain);
+	int (*set_vcore)(struct device *dev, enum DVFS_VOLTAGE volt);
+};
+
+struct apupwr_plat_data {
+	u32 flags;
+	int dvfs_user;
+	const struct apupwr_plat_reg *plat_regs;
+	const struct apupwr_plat_ops *ops;
+};
+
+struct apu_power {
+	struct device *dev;
+	void __iomem *spare_base;
+	const struct apupwr_plat_data *plat_data;
+	struct clk **clk;
+	struct regulator *vvpu_reg_id;
+	struct regulator *vmdla_reg_id;
+
+	/* rpmsg device for power ipi */
+	struct rpmsg_driver tx_rpmsg_driver;
+	struct rpmsg_device *tx_rpmsg_device;
+	struct rpmsg_driver rx_rpmsg_driver;
+	struct rpmsg_device *rx_rpmsg_device;
+
+	/*debug*/
+	struct dentry *dbg_root;
+	u32 dbg_option;
+	u32 ulog_level;
+};
+
+/* request send from AP to uP */
+enum request_id_AP {
+	DVFS_STAT_UPDATE = 0,
+	OPP_LIMIT_THERM,
+	OPP_LIMIT_FIX_OPP,
+	OPP_LIMIT_DVFS_DEBUG,
+	CHANGE_LOG_LEVEL,
+	STRESS_TEST,
+};
+
+/* request send from uP to AP */
+enum request_id_uP {
+	CHANGE_DEV_CLKSRC = 0,
+	CHANGE_DEV_CLOCK,
+	CHANGE_SYS_VCORE,
+	SYNC_STAT_UP_POWER,
+	SYNC_STAT_DEV_POWER,
+	DUMP_POWER_INFO,
+};
+
+/* power cmd format (from AP to uP) */
+struct power_cmd_AP {
+	u32 req_id:4,
+	    reserved0:4,
+	    reserved1:4,
+	    reserved2:4,
+	    reserved3:4,
+	    reserved4:4,
+	    reserved5:4,
+	    need_handle_ack:4;
+};
+
+/* ipi cmd format (from AP to uP) */
+struct power_ipi_cmd_AP {
+	u32 cmd_sn;
+	struct power_cmd_AP pwr_cmd;
+	u32 data0;
+	u32 data1;
+};
+
+/*power cmd format (from uP to AP) */
+struct power_cmd_uP {
+	u32 req_id:4,
+	    dev_id:4,
+	    target_opp:4,
+	    reserved0:4,
+	    reserved1:4,
+	    reserved2:4,
+	    reserved3:4,
+	    need_handle_ack:4;
+};
+
+/* ipi cmd format (from uP to AP) */
+struct power_ipi_cmd_uP {
+	u32 cmd_sn;
+	struct power_cmd_uP pwr_cmd;
+	u32 data0;
+	u32 data1;
+};
+
+/* reply to remote that we are completed */
+struct power_ipi_cmd_reply {
+	u32 cmd_sn;
+	u32 data0;
+	u32 data1;
+	u32 reserved3[61];
+};
+
+int apu_enable_dev_clksrc(struct device *dev, enum DVFS_USER);
+void apu_disable_dev_clksrc(struct device *dev, enum DVFS_USER);
+int apu_set_clk_freq(struct device *dev,
+		     enum DVFS_FREQ freq,
+		     enum DVFS_VOLTAGE_DOMAIN domain);
+
+void apu_update_fixed_opp_by_reg(struct device *dev,
+				 u32 opp_limit_stat);
+void apu_check_curr_opp_by_reg(struct device *dev,
+			       enum DVFS_USER specify_usr);
+void apu_update_thermal_opp_by_reg(struct device *dev,
+				   enum DVFS_USER user, int therm_opp);
+
+int apu_config_vcore_volt(struct device *dev, enum DVFS_VOLTAGE volt);
+
+int apu_power_ipi_init(struct apu_power *apupwr);
+void apu_power_ipi_exit(struct apu_power *apupwr);
+void apu_power_set_ulog_level(struct apu_power *apupwr,
+			      int level);
+void apu_power_notify_uP_opp_limit(struct apu_power *apu_power,
+				   enum request_id_AP req);
+
+#if IS_ENABLED(CONFIG_MTK_APU_DEBUG)
+void apu_power_debugfs_init(struct apu_power *apupwr);
+void apu_power_debugfs_exit(void);
+#else
+static inline void apu_power_debugfs_init(struct apu_power *apupwr) { }
+static inline void apu_power_debugfs_exit(void) { }
+#endif
+#endif
-- 
2.18.0

