Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFAB470714
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AE210EC35;
	Fri, 10 Dec 2021 17:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA3710EB13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:26:53 +0000 (UTC)
X-UUID: 5db32c13bbbb4c5eb1707471c550d1a9-20211211
X-UUID: 5db32c13bbbb4c5eb1707471c550d1a9-20211211
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 46113754; Sat, 11 Dec 2021 01:26:50 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 01:26:49 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:26:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:47 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [PATCH 10/17] soc: mediatek: apu: Add APU software logger dirver
Date: Sat, 11 Dec 2021 01:25:58 +0800
Message-ID: <20211210172605.30618-11-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: JB Tsai <jb.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The APU software logger is for debug for remote processor.
The remote microprocessor's logs will be output to the mapped
memory and application processor can read logs from the
dedicated reserved registers

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 drivers/soc/mediatek/apusys/Makefile        |   2 +
 drivers/soc/mediatek/apusys/apu-sw-logger.c | 540 ++++++++++++++++++++
 2 files changed, 542 insertions(+)
 create mode 100644 drivers/soc/mediatek/apusys/apu-sw-logger.c

diff --git a/drivers/soc/mediatek/apusys/Makefile b/drivers/soc/mediatek/apusys/Makefile
index 8fff18d63dc1..6fb69abcf3b9 100644
--- a/drivers/soc/mediatek/apusys/Makefile
+++ b/drivers/soc/mediatek/apusys/Makefile
@@ -5,3 +5,5 @@ obj-$(CONFIG_MTK_APU) += mtk_apu_pwr.o
 mtk_apu_pwr-objs += apu-pwr.o
 mtk_apu_pwr-objs += apu-pwr-ipi.o
 mtk_apu_pwr-$(CONFIG_MTK_APU_DEBUG) += apu-pwr-dbg.o
+
+obj-$(CONFIG_MTK_APU_DEBUG) += apu-sw-logger.o
diff --git a/drivers/soc/mediatek/apusys/apu-sw-logger.c b/drivers/soc/mediatek/apusys/apu-sw-logger.c
new file mode 100644
index 000000000000..98a9748e92a7
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-sw-logger.c
@@ -0,0 +1,540 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc/mtk-apu-config.h>
+#include <linux/sched/signal.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+
+#define APUSYS_LOGGER_DIR "apu_logger"
+
+#define LOG_LINE_MAX_LENS SZ_128
+#define APU_LOG_SIZE SZ_1M
+#define APU_LOG_BUF_SIZE SZ_1M
+
+#define LOG_W_PTR 0x0
+#define LOG_R_PTR 0x4
+#define LOG_OV_FLG 0xC
+
+struct sw_logger_seq_data {
+	u32 w_ptr;
+	u32 r_ptr;
+	u32 overflow_flg;
+	int i;
+	int is_finished;
+	char *data;
+	bool startl_first;
+};
+
+struct apu_sw_logger {
+	struct device *dev;
+	struct dentry *dbg_root;
+	dma_addr_t handle;
+	char *sw_log_buf;
+	void __iomem *apu_slog;
+	spinlock_t logger_spinlock; /* logger status update lock */
+	struct sw_logger_seq_data pseqdata_lock;
+	struct sw_logger_seq_data *pseqdata;
+};
+
+static struct dentry *log_root;
+static struct dentry *log_seqlog;
+static struct dentry *log_seqlogl;
+static struct device *sw_logger_dev;
+
+static void sw_logger_buf_invalidate(struct apu_sw_logger *logger)
+{
+	dma_sync_single_for_cpu(logger->dev, logger->handle, APU_LOG_SIZE,
+				DMA_FROM_DEVICE);
+}
+
+static int sw_logger_buf_alloc(struct device *dev)
+{
+	struct apu_sw_logger *logger = dev_get_drvdata(dev);
+	int ret;
+
+	ret = dma_set_coherent_mask(logger->dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
+	logger->sw_log_buf = kzalloc(APU_LOG_SIZE, GFP_KERNEL);
+	if (!logger->sw_log_buf)
+		return -ENOMEM;
+
+	logger->handle = dma_map_single(logger->dev, logger->sw_log_buf,
+					APU_LOG_SIZE, DMA_FROM_DEVICE);
+	if (dma_mapping_error(logger->dev, logger->handle) != 0) {
+		kfree(logger->sw_log_buf);
+		logger->sw_log_buf = NULL;
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+int sw_logger_config_init(struct config_v1 *conf)
+{
+	int ret;
+	unsigned long flags;
+	struct logger_init_info *st_logger_init_info;
+	struct apu_sw_logger *logger;
+
+	if (!conf)
+		return -EINVAL;
+
+	if (!sw_logger_dev) {
+		pr_debug("%s: logger NA and skip logger\n",
+			 __func__);
+		return 0;
+	}
+
+	logger = dev_get_drvdata(sw_logger_dev);
+	if (!logger->sw_log_buf) {
+		ret = sw_logger_buf_alloc(logger->dev);
+		if (ret) {
+			dev_err(logger->dev, "%s: sw_logger_buf_alloc fail\n",
+				__func__);
+			return ret;
+		}
+	}
+
+	spin_lock_irqsave(&logger->logger_spinlock, flags);
+	iowrite32(0, logger->apu_slog + LOG_W_PTR);
+	iowrite32(0, logger->apu_slog + LOG_R_PTR);
+	iowrite32(0, logger->apu_slog + LOG_OV_FLG);
+	spin_unlock_irqrestore(&logger->logger_spinlock, flags);
+
+	st_logger_init_info = (struct logger_init_info *)
+		get_apu_config_user_ptr(conf, LOGGER_INIT_INFO);
+
+	st_logger_init_info->iova = logger->handle;
+
+	return 0;
+}
+EXPORT_SYMBOL(sw_logger_config_init);
+
+void sw_logger_config_remove(void)
+{
+	struct apu_sw_logger *logger = dev_get_drvdata(sw_logger_dev);
+
+	if (logger->handle)
+		dma_unmap_single(logger->dev, logger->handle,
+				 APU_LOG_SIZE, DMA_FROM_DEVICE);
+	kfree(logger->sw_log_buf);
+	logger->sw_log_buf = NULL;
+}
+EXPORT_SYMBOL(sw_logger_config_remove);
+
+/*
+ * seq_start() takes a position as an argument and returns an iterator which
+ * will start reading at that position.
+ * start->show->next->show...->next->show->next->stop->start->stop
+ */
+static void *seq_start(struct seq_file *s, loff_t *pos)
+{
+	struct apu_sw_logger *logger = (struct apu_sw_logger *)s->private;
+	u32 w_ptr, r_ptr, overflow_flg;
+	unsigned long flags;
+
+	if (!logger->sw_log_buf) {
+		pr_err("%s: sw_log_buf == NULL\n", __func__);
+		return NULL;
+	}
+
+	spin_lock_irqsave(&logger->logger_spinlock, flags);
+	w_ptr = ioread32(logger->apu_slog + LOG_W_PTR);
+	r_ptr = ioread32(logger->apu_slog + LOG_R_PTR);
+	overflow_flg = ioread32(logger->apu_slog + LOG_OV_FLG);
+	spin_unlock_irqrestore(&logger->logger_spinlock, flags);
+
+	sw_logger_buf_invalidate(logger);
+
+	if (w_ptr == r_ptr && overflow_flg == 0)
+		return NULL;
+
+	if (!logger->pseqdata) {
+		logger->pseqdata = kzalloc(sizeof(*logger->pseqdata),
+					   GFP_KERNEL);
+		if (logger->pseqdata) {
+			logger->pseqdata->w_ptr = w_ptr;
+			logger->pseqdata->r_ptr = r_ptr;
+			logger->pseqdata->overflow_flg = overflow_flg;
+			if (overflow_flg == 0)
+				logger->pseqdata->i = r_ptr;
+			else
+				logger->pseqdata->i = w_ptr;
+
+			logger->pseqdata->is_finished = 0;
+		}
+	}
+
+	return logger->pseqdata;
+}
+
+/*
+ * seq_start() takes a position as an argument and returns an iterator which
+ * will start reading at that position.
+ */
+static void *seq_startl(struct seq_file *s, loff_t *pos)
+{
+	struct apu_sw_logger *logger = s->private;
+	u32 w_ptr, r_ptr, overflow_flg;
+	struct sw_logger_seq_data *pseqdata_lock = &logger->pseqdata_lock;
+	unsigned long flags;
+
+	if (!logger->sw_log_buf)
+		return NULL;
+
+	spin_lock_irqsave(&logger->logger_spinlock, flags);
+	w_ptr = ioread32(logger->apu_slog + LOG_W_PTR);
+	r_ptr = ioread32(logger->apu_slog + LOG_R_PTR);
+	overflow_flg = ioread32(logger->apu_slog + LOG_OV_FLG);
+	spin_unlock_irqrestore(&logger->logger_spinlock, flags);
+
+	sw_logger_buf_invalidate(logger);
+
+	/* for ctrl-c to force exit the loop */
+	while (!signal_pending(current) && w_ptr == r_ptr) {
+		usleep_range(10000, 12000);
+
+		spin_lock_irqsave(&logger->logger_spinlock, flags);
+		w_ptr = ioread32(logger->apu_slog + LOG_W_PTR);
+		r_ptr = ioread32(logger->apu_slog + LOG_R_PTR);
+		overflow_flg = ioread32(logger->apu_slog + LOG_OV_FLG);
+		spin_unlock_irqrestore(&logger->logger_spinlock, flags);
+
+		sw_logger_buf_invalidate(logger);
+
+		pseqdata_lock->w_ptr = w_ptr;
+		pseqdata_lock->r_ptr = r_ptr;
+		pseqdata_lock->overflow_flg = overflow_flg;
+		pseqdata_lock->i = r_ptr;
+	}
+
+	if (pseqdata_lock->startl_first ||
+	    pseqdata_lock->i == pseqdata_lock->w_ptr) {
+		pseqdata_lock->startl_first = false;
+		pseqdata_lock->w_ptr = w_ptr;
+		pseqdata_lock->r_ptr = r_ptr;
+		pseqdata_lock->overflow_flg = overflow_flg;
+		pseqdata_lock->i = r_ptr;
+	}
+
+	if (signal_pending(current))
+		pseqdata_lock->startl_first = true;
+
+	return pseqdata_lock;
+}
+
+/*
+ * move the iterator forward to the next position in the sequence
+ */
+static void *seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct sw_logger_seq_data *psdata = v;
+
+	if (!psdata) {
+		pr_err("%s: psdata == NULL\n", __func__);
+		return NULL;
+	}
+
+	psdata->i = (psdata->i + LOG_LINE_MAX_LENS) % APU_LOG_SIZE;
+
+	/* prevent kernel warning */
+	*pos = psdata->i;
+
+	if (psdata->i != psdata->w_ptr)
+		return v;
+
+	psdata->is_finished = 1;
+	return NULL;
+}
+
+/*
+ * move the iterator forward to the next position in the sequence
+ */
+static void *seq_next_lock(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct apu_sw_logger *logger = s->private;
+	struct sw_logger_seq_data *psdata = v;
+
+	if (!psdata) {
+		pr_err("%s: psdata == NULL\n", __func__);
+		return NULL;
+	}
+
+	psdata->i = (psdata->i + LOG_LINE_MAX_LENS) % APU_LOG_SIZE;
+
+	/* prevent kernel warning */
+	*pos = psdata->i;
+
+	if (psdata->i != psdata->w_ptr)
+		return v;
+
+	iowrite32(psdata->i, logger->apu_slog + LOG_R_PTR);
+	return NULL;
+}
+
+/*
+ * stop() is called when iteration is complete (clean up)
+ */
+static void seq_stop(struct seq_file *s, void *v)
+{
+	struct apu_sw_logger *logger = (struct apu_sw_logger *)s->private;
+	unsigned long flags;
+
+	if (logger->pseqdata) {
+		if (logger->pseqdata->is_finished == 1) {
+			spin_lock_irqsave(&logger->logger_spinlock, flags);
+			iowrite32(logger->pseqdata->i,
+				  logger->apu_slog + LOG_R_PTR);
+			/* fixme: assume next overflow won't happen
+			 * until next seq_start
+			 */
+			iowrite32(0, logger->apu_slog + LOG_OV_FLG);
+			spin_unlock_irqrestore(&logger->logger_spinlock, flags);
+			kfree(logger->pseqdata);
+			logger->pseqdata = NULL;
+		}
+	}
+}
+
+/*
+ * stop() is called when iteration is complete (clean up)
+ */
+static void seq_stopl(struct seq_file *s, void *v)
+{
+}
+
+/*
+ * success return 0, otherwise return error code
+ */
+static int seq_show(struct seq_file *s, void *v)
+{
+	struct apu_sw_logger *logger = (struct apu_sw_logger *)s->private;
+	struct sw_logger_seq_data *psdata = v;
+
+	seq_printf(s, "%s", logger->sw_log_buf + psdata->i);
+
+	return 0;
+}
+
+static int seq_showl(struct seq_file *s, void *v)
+{
+	struct apu_sw_logger *logger = (struct apu_sw_logger *)s->private;
+	struct sw_logger_seq_data *psdata = v;
+
+	if (psdata->i != psdata->w_ptr)
+		seq_printf(s, "%s", logger->sw_log_buf + psdata->i);
+
+	return 0;
+}
+
+static const struct seq_operations seq_ops = {
+	.start = seq_start,
+	.next  = seq_next,
+	.stop  = seq_stop,
+	.show  = seq_show
+};
+
+static const struct seq_operations seq_ops_lock = {
+	.start = seq_startl,
+	.next  = seq_next_lock,
+	.stop  = seq_stopl,
+	.show  = seq_showl
+};
+
+static int debug_sqopen_lock(struct inode *inode, struct file *file)
+{
+	struct apu_sw_logger *logger = inode->i_private;
+	int ret;
+
+	ret = seq_open(file, &seq_ops_lock);
+	if (ret)
+		return ret;
+
+	((struct seq_file *)file->private_data)->private = logger;
+
+	return 0;
+}
+
+static int debug_sqopen(struct inode *inode, struct file *file)
+{
+	struct apu_sw_logger *logger = inode->i_private;
+	int ret;
+
+	ret = seq_open(file, &seq_ops);
+	if (ret)
+		return ret;
+
+	((struct seq_file *)file->private_data)->private = logger;
+
+	return 0;
+}
+
+static const struct file_operations seqlog_ops = {
+	.owner   = THIS_MODULE,
+	.open    = debug_sqopen,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = seq_release,
+};
+
+static const struct file_operations seqlogl_ops = {
+	.owner   = THIS_MODULE,
+	.open    = debug_sqopen_lock,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = seq_release,
+};
+
+static int sw_logger_create_debugfs(struct device *dev)
+{
+	struct apu_sw_logger *logger = dev_get_drvdata(dev);
+	int ret = 0;
+
+	logger->dbg_root = NULL;
+	log_root = debugfs_create_dir(APUSYS_LOGGER_DIR, logger->dbg_root);
+	ret = IS_ERR_OR_NULL(log_root);
+	if (ret) {
+		dev_err(dev, "(%d)failed to create apusys_logger dir\n", ret);
+		goto out;
+	}
+
+	log_seqlog = debugfs_create_file("seq_log", 0444,
+					 log_root, logger, &seqlog_ops);
+	ret = IS_ERR_OR_NULL(log_seqlog);
+	if (ret) {
+		dev_err(dev, "(%d)failed to create apusys_logger node(seqlog)\n",
+			ret);
+		goto out;
+	}
+
+	log_seqlogl = debugfs_create_file("seq_logl", 0444,
+					  log_root, logger, &seqlogl_ops);
+	ret = IS_ERR_OR_NULL(log_seqlogl);
+	if (ret) {
+		dev_err(dev, "(%d)failed to create apusys_logger node(seqlogL)\n",
+			ret);
+		goto out;
+	}
+
+	return 0;
+
+out:
+	debugfs_remove_recursive(log_root);
+	return ret;
+}
+
+static void sw_logger_remove_debugfs(struct device *dev)
+{
+	debugfs_remove_recursive(log_root);
+}
+
+static int sw_logger_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct apu_sw_logger *logger;
+	struct resource *res;
+	int ret = 0;
+
+	logger = devm_kzalloc(dev, sizeof(struct apu_sw_logger), GFP_KERNEL);
+	if (!logger)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, logger);
+
+	logger->dev = dev;
+	sw_logger_dev = dev;
+	spin_lock_init(&logger->logger_spinlock);
+
+	ret = sw_logger_create_debugfs(dev);
+	if (ret) {
+		dev_err(dev, "%s fail\n", __func__);
+		goto remove_debugfs;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_info(dev, "%s: apu log get resource fail\n", __func__);
+		ret = -ENODEV;
+		goto remove_ioremap;
+	}
+	logger->apu_slog = ioremap(res->start, res->end - res->start + 1);
+	if (IS_ERR((void const *)logger->apu_slog)) {
+		dev_info(dev, "%s: apu_slog remap base fail\n", __func__);
+		ret = -ENOMEM;
+		goto remove_ioremap;
+	}
+
+	return 0;
+
+remove_ioremap:
+	if (logger->apu_slog)
+		iounmap(logger->apu_slog);
+
+remove_debugfs:
+	sw_logger_remove_debugfs(dev);
+
+	return ret;
+}
+
+static int sw_logger_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	sw_logger_remove_debugfs(dev);
+
+	return 0;
+}
+
+static const struct of_device_id sw_logger_of_match[] = {
+	{ .compatible = "mediatek,apu-sw-logger"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, sw_logger_of_match);
+
+static struct platform_driver sw_logger_driver = {
+	.probe = sw_logger_probe,
+	.remove = sw_logger_remove,
+	.driver = {
+		.name = "apu-sw-logger",
+		.of_match_table = of_match_ptr(sw_logger_of_match),
+	}
+};
+
+static int __init sw_logger_init(void)
+{
+	int ret = 0;
+
+	allow_signal(SIGKILL);
+	ret = platform_driver_register(&sw_logger_driver);
+	if (ret != 0) {
+		pr_err("failed to register sw_logger driver");
+		return -ENODEV;
+	}
+
+	return ret;
+}
+
+static void __exit sw_logger_exit(void)
+{
+	platform_driver_unregister(&sw_logger_driver);
+}
+
+module_init(sw_logger_init);
+module_exit(sw_logger_exit);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek APU SW Logger Driver");
+
-- 
2.18.0

