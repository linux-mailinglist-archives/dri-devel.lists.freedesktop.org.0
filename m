Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD97F3D58
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 06:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED66110E5A2;
	Wed, 22 Nov 2023 05:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8531210E2EA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 05:31:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Orqd/4qqg5Jlav9M8CWpdryhfdqz1yjSgNFgkQNmZOXjq8IOdO5xfcl4fW9LB+Q3makHp3MZcCfnAA/dTlPgP6/zNdtPk2nEiA2Nt+L46BL8sb7d7y9kVGNN9JI1/R6dEmHMo7pZchFx7CRiKFpoMZtd6oVpi6abhDVWNFd0Aovw6kE1p+tKKJrGxyWHvijxi3OWjABGwMEtKYNKt1Ufqez3RjWVe/5AvIihlkXGdK8Od6hdYB5bjraMOiQkfVz7ei+SfbGMrRaGSZpAnd65SrxwTb4Yn4i8M1nVvWYQkAvd6p7nsMn37Xam/UbBxwar0i0pAlZDrPrelrhv0PMYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbTTlxZASBh0q8qRFW+vLxjZsFXjd/zFD5OKrxtsdMY=;
 b=fhy1pIyAEuXCzNtVY+39Cqgx791Kb9/UM/OBQaYDPXB2fAvWIkCR+T9qojovbDWj68iVfGTBg2MHe+2d/It2LDQ3UdvuAI6GpgjqWhuTdKjePIHSQ4AdFGIAFPEjLo98kXAcq+s0RXsVh1V06L3/lAAStUGai5hkBlg+3nKyc6GtnYxo8R5j+HOy1idBAJVDZZWMZYL3hDsqbh1WFyss77B4aglMkI9bZ2iV8HmxQu5g1qgx7knPWw/NZlUJG0eBQXyWuL48b1vfPlFNKj+HGb56CXKmNHUrUooIOyhlefbS77QiPVwwXO9EuzX0gaaNkJjWhfoX8xWfuj1SkC4DzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbTTlxZASBh0q8qRFW+vLxjZsFXjd/zFD5OKrxtsdMY=;
 b=AwyouEutTEoAuOF3AsmTZifb+vylM8mhv+ToRtEbDKzov/X0wsqkGdyyNLcvdT1092VCu8dj/CiFvlJMe0X9CmRG0XhxCggSJMzGiTSl28Q5KQqMUAAayr3fh1y4k9t/z0UC2s+Frg4XIvVlXr5o6wfA4YSzWd5D7qT2ONrxIiY=
Received: from MN2PR05CA0053.namprd05.prod.outlook.com (2603:10b6:208:236::22)
 by MN0PR12MB6152.namprd12.prod.outlook.com (2603:10b6:208:3c4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 05:31:06 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::2e) by MN2PR05CA0053.outlook.office365.com
 (2603:10b6:208:236::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16 via Frontend
 Transport; Wed, 22 Nov 2023 05:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 05:31:06 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 23:31:03 -0600
From: Nava kishore Manne <nava.kishore.manne@amd.com>
To: <mdf@kernel.org>, <hao.wu@intel.com>, <yilun.xu@intel.com>,
 <trix@redhat.com>, <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <linux-fpga@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [RFC 1/2] fpga: support loading from a pre-allocated buffer
Date: Wed, 22 Nov 2023 11:00:34 +0530
Message-ID: <20231122053035.3758124-2-nava.kishore.manne@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122053035.3758124-1-nava.kishore.manne@amd.com>
References: <20231122053035.3758124-1-nava.kishore.manne@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|MN0PR12MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: c32917b5-97a4-4cf8-7a89-08dbeb1c39a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mhW8wwc64CGdHlzG57FxJcJ51XuYF/4d/Ik1fHQIuZYaoYG4D9WZdkOyEHw+CuKp5jO6wibM3WKAA/3z9OlbrByU8sdmHFdg6bmrbpqy+eAwzUTEGHWOtTY2TA6xX12F5EqbKIgxPnEJqY3DgmQLAZZB+Ytl+0QUuvhfir2QWDUfAGu6/o2xusqD1+Ip3jn64vzHBwWQ/Da3RTYScHhHFd6DMn5gqk58IKE177pu4E1q70cGqKs4Yy16q3cBgls3uPE0XbntN+JoksKaBSdAQz6e3fxIVNRhR9hypa5vZxVlbQMjujMEvPfOZUTJYvBHCgjoGnLlrUMtqpCSZpM+2HrFYdOoJ5OZ47huy87Jch0awwvhvi+822/dljTND6RIOQFU2AQqgdw9CYcH4AB6unSpD+obOTBUM8xrxzEqQkScXIvbFsdTTlZNFGPQCLQNR7OfcY8dklObIrQXiOtIqJX9ZU3rKoGkHZcPfD+yepvXJfyZiYD6mzbvvMsPrzFlpzqzAcn/a7j/iEWn07RlM56lCxUqafbawyRJDyJXRdsq3s0WizrhwTAmZrTnPGTCAwWqQ66Pr6mgKAHVrs4L1vxYJHP6lYL7loeZD6FL/jhO0mrqlkLUyqXWgjWCEAnZWuZs6cpehcFBY1IlN/NFa8mfB/bHHzPJMLeptxWGN9cYDYPsUilcfEwhEkL7DrqTktymWFMT7jX3bq6o7tT17v6buSOLqcDlEzz3Xl6BUD+upAQ/Y3bozslyWFsoE7N4J7d5vVfbSWR8uG4Sm2Ozpxnuw5cztdZHKWN/biCIDeQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(82310400011)(451199024)(1800799012)(64100799003)(186009)(46966006)(40470700004)(36840700001)(36756003)(41300700001)(40460700003)(86362001)(7416002)(5660300002)(103116003)(921008)(336012)(81166007)(47076005)(356005)(2906002)(40480700001)(2616005)(478600001)(1076003)(26005)(16526019)(426003)(82740400003)(83380400001)(70586007)(8936002)(8676002)(6666004)(316002)(70206006)(110136005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 05:31:06.1215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c32917b5-97a4-4cf8-7a89-08dbeb1c39a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6152
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

Some systems are memory constrained but they need to load very
large Configuration files. The FPGA subsystem allows drivers to
request this Configuration image be loaded from the filesystem,
but this requires that the entire configuration data be loaded
into kernel memory first before it's provided to the driver.
This can lead to a situation where we map the configuration
data twice, once to load the configuration data into kernel
memory and once to copy the configuration data into the final
resting place which is nothing but a dma-able continuous buffer.

This creates needless memory pressure and delays due to multiple
copies. Let's add a dmabuf handling support to the fpga manager
framework that allows drivers to load the Configuration data
directly from a pre-allocated buffer. This skips the intermediate
step of allocating a buffer in kernel memory to hold the
Configuration data.

Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
---
 drivers/fpga/fpga-mgr.c       | 113 ++++++++++++++++++++++++++++++++++
 include/linux/fpga/fpga-mgr.h |  10 +++
 2 files changed, 123 insertions(+)

diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
index 06651389c592..23d2b4d45827 100644
--- a/drivers/fpga/fpga-mgr.c
+++ b/drivers/fpga/fpga-mgr.c
@@ -8,6 +8,8 @@
  * With code from the mailing list:
  * Copyright (C) 2013 Xilinx, Inc.
  */
+#include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
 #include <linux/firmware.h>
 #include <linux/fpga/fpga-mgr.h>
 #include <linux/idr.h>
@@ -519,6 +521,39 @@ static int fpga_mgr_buf_load(struct fpga_manager *mgr,
 	return rc;
 }
 
+static int fpga_dmabuf_load(struct fpga_manager *mgr,
+			    struct fpga_image_info *info)
+{
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	int ret;
+
+	/* create attachment for dmabuf with the user device */
+	attach = dma_buf_attach(mgr->dmabuf, &mgr->dev);
+	if (IS_ERR(attach)) {
+		pr_err("failed to attach dmabuf\n");
+		ret = PTR_ERR(attach);
+		goto fail_put;
+	}
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto fail_detach;
+	}
+
+	info->sgt = sgt;
+	ret = fpga_mgr_buf_load_sg(mgr, info, info->sgt);
+	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+
+fail_detach:
+	dma_buf_detach(mgr->dmabuf, attach);
+fail_put:
+	dma_buf_put(mgr->dmabuf);
+
+	return ret;
+}
+
 /**
  * fpga_mgr_firmware_load - request firmware and load to fpga
  * @mgr:	fpga manager
@@ -573,6 +608,8 @@ int fpga_mgr_load(struct fpga_manager *mgr, struct fpga_image_info *info)
 {
 	info->header_size = mgr->mops->initial_header_size;
 
+	if (mgr->flags & FPGA_MGR_CONFIG_DMA_BUF)
+		return fpga_dmabuf_load(mgr, info);
 	if (info->sgt)
 		return fpga_mgr_buf_load_sg(mgr, info, info->sgt);
 	if (info->buf && info->count)
@@ -732,6 +769,64 @@ void fpga_mgr_put(struct fpga_manager *mgr)
 }
 EXPORT_SYMBOL_GPL(fpga_mgr_put);
 
+static int fpga_dmabuf_fd_get(struct file *file, char __user *argp)
+{
+	struct fpga_manager *mgr =  (struct fpga_manager *)(file->private_data);
+	int buffd;
+
+	if (copy_from_user(&buffd, argp, sizeof(buffd)))
+		return -EFAULT;
+
+	mgr->dmabuf = dma_buf_get(buffd);
+	if (IS_ERR_OR_NULL(mgr->dmabuf))
+		return -EINVAL;
+
+	mgr->flags = FPGA_MGR_CONFIG_DMA_BUF;
+
+	return 0;
+}
+
+static int fpga_device_open(struct inode *inode, struct file *file)
+{
+	struct miscdevice *miscdev = file->private_data;
+	struct fpga_manager *mgr = container_of(miscdev,
+						struct fpga_manager, miscdev);
+
+	file->private_data = mgr;
+
+	return 0;
+}
+
+static int fpga_device_release(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static long fpga_device_ioctl(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	char __user *argp = (char __user *)arg;
+	int err;
+
+	switch (cmd) {
+	case FPGA_IOCTL_LOAD_DMA_BUFF:
+		err = fpga_dmabuf_fd_get(file, argp);
+		break;
+	default:
+		err = -ENOTTY;
+	}
+
+	return err;
+}
+
+static const struct file_operations fpga_fops = {
+	.owner		= THIS_MODULE,
+	.open		= fpga_device_open,
+	.release	= fpga_device_release,
+	.unlocked_ioctl	= fpga_device_ioctl,
+	.compat_ioctl	= fpga_device_ioctl,
+};
+
 /**
  * fpga_mgr_lock - Lock FPGA manager for exclusive use
  * @mgr:	fpga manager
@@ -815,10 +910,28 @@ fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *in
 	mgr->dev.of_node = parent->of_node;
 	mgr->dev.id = id;
 
+	/* Make device dma capable by inheriting from parent's */
+	set_dma_ops(&mgr->dev, get_dma_ops(parent));
+	ret = dma_coerce_mask_and_coherent(&mgr->dev, dma_get_mask(parent));
+	if (ret) {
+		dev_warn(parent,
+			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
+			 dma_get_mask(parent), ret);
+	}
+
 	ret = dev_set_name(&mgr->dev, "fpga%d", id);
 	if (ret)
 		goto error_device;
 
+	mgr->miscdev.minor = MISC_DYNAMIC_MINOR;
+	mgr->miscdev.name = kobject_name(&mgr->dev.kobj);
+	mgr->miscdev.fops = &fpga_fops;
+	ret = misc_register(&mgr->miscdev);
+	if (ret) {
+		pr_err("fpga: failed to register misc device.\n");
+		goto error_device;
+	}
+
 	/*
 	 * Initialize framework state by requesting low level driver read state
 	 * from device.  FPGA may be in reset mode or may have been programmed
diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
index 54f63459efd6..c5de19a9b4ed 100644
--- a/include/linux/fpga/fpga-mgr.h
+++ b/include/linux/fpga/fpga-mgr.h
@@ -9,6 +9,7 @@
 #define _LINUX_FPGA_MGR_H
 
 #include <linux/mutex.h>
+#include <linux/miscdevice.h>
 #include <linux/platform_device.h>
 
 struct fpga_manager;
@@ -77,6 +78,7 @@ enum fpga_mgr_states {
 #define FPGA_MGR_ENCRYPTED_BITSTREAM	BIT(2)
 #define FPGA_MGR_BITSTREAM_LSB_FIRST	BIT(3)
 #define FPGA_MGR_COMPRESSED_BITSTREAM	BIT(4)
+#define FPGA_MGR_CONFIG_DMA_BUF		BIT(5)
 
 /**
  * struct fpga_image_info - information specific to an FPGA image
@@ -197,7 +199,10 @@ struct fpga_manager_ops {
  * struct fpga_manager - fpga manager structure
  * @name: name of low level fpga manager
  * @dev: fpga manager device
+ * @flags: flags determines the type of Bitstream
+ * @dmabuf: shared dma buffer
  * @ref_mutex: only allows one reference to fpga manager
+ * @miscdev: information about character device node
  * @state: state of fpga manager
  * @compat_id: FPGA manager id for compatibility check.
  * @mops: pointer to struct of fpga manager ops
@@ -206,7 +211,10 @@ struct fpga_manager_ops {
 struct fpga_manager {
 	const char *name;
 	struct device dev;
+	unsigned long flags;
+	struct dma_buf *dmabuf;
 	struct mutex ref_mutex;
+	struct miscdevice miscdev;
 	enum fpga_mgr_states state;
 	struct fpga_compat_id *compat_id;
 	const struct fpga_manager_ops *mops;
@@ -244,4 +252,6 @@ struct fpga_manager *
 devm_fpga_mgr_register(struct device *parent, const char *name,
 		       const struct fpga_manager_ops *mops, void *priv);
 
+#define FPGA_IOCTL_LOAD_DMA_BUFF	_IOWR('R', 1, __u32)
+
 #endif /*_LINUX_FPGA_MGR_H */
-- 
2.25.1

