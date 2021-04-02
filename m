Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D443528BC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 11:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA906E088;
	Fri,  2 Apr 2021 09:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3536EE40
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 09:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/MFUz3oPXfDmsUlNNE4c4nPEnLTppk9Ja/y7nn7ysHeKgnb1/I6B00BuEyLNDdOpDoWNwAShuttsAQi9ayOTbxwAk7c9Alo2/oYSih+Q2iP3+d7mv7qJU3+1Pg9XUeWUzIHMfRR18IdYUYFsUF0og7IOEk54db5+WhbeJElmdnmFLRrHJqyM/xq5WxAvz4tTRDmfreNQ38RIuIOKWEV1lT8ntH6CcbLPdiODGGYQGDCxX/ZAvmKvWuH/5SMWqtoweK6r9RhVcrfDkE3fGfEDTTPswtitngqYerrAoNV3GdTKfWvj4KyRRd0ns3LcqbzFggESM9X+EEsV1z/4EzeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OA3EMeQtE3ViCLwk/i1eGuR66thZKoQTKtaiTEE4W8=;
 b=Qk0CruArQPznk+C3d+yEUkuohMlLJv9NIzqsKuHurbttuAtlZ0SF7Y6MVO+sk3d07fpRLjWgiSPc/5loXlWWfiXci4AGT0vUPXNmGSU6PiIjfcnudU4gwY8K2ffesIGMz2eAzMPRgXWfHhPEIXCc0j1Ax4yZQNgc+Ybm8KYuI2b65bh8vSr9LSvl645sBSYg0+P9yD4P587QL7KaA83t1zDQobVZgdU4Fiv2W+yPdEbuueY4IV7hcJhwSZh6xvOCeq6ylsKSnc9g1IRJiiBi6kRSSv6tJeND8aKj07ulD0P0kUUFgGFH6NtX120YXygZDj9bT0gmEmNYG4KWcGR/VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OA3EMeQtE3ViCLwk/i1eGuR66thZKoQTKtaiTEE4W8=;
 b=M6YURlEbh5L2IltZq88U75UePRW2RO/eGiJxwnbLoTMI+5Kd3MYeh7qBu+EEQhJiZv4fB6u5Oehz6zW6wTrkTAbqQ2WgAO/XjpPixPuNiFVbnPAsppQSsjlsCp1uksdJttbSJKWYRzuiJ7f0dFkwNa71pHvKu7Uza8YoocXpdZw=
Received: from SN1PR12CA0069.namprd12.prod.outlook.com (2603:10b6:802:20::40)
 by CY4PR0201MB3553.namprd02.prod.outlook.com (2603:10b6:910:8e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Fri, 2 Apr
 2021 09:17:43 +0000
Received: from SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:20:cafe::e5) by SN1PR12CA0069.outlook.office365.com
 (2603:10b6:802:20::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29 via Frontend
 Transport; Fri, 2 Apr 2021 09:17:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT041.mail.protection.outlook.com (10.152.72.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3999.28 via Frontend Transport; Fri, 2 Apr 2021 09:17:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 2 Apr 2021 02:17:36 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 2 Apr 2021 02:17:36 -0700
Envelope-to: git@xilinx.com, mdf@kernel.org, trix@redhat.com,
 robh+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, linux-fpga@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Received: from [10.140.6.60] (port=55560 helo=xhdnavam40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <nava.manne@xilinx.com>)
 id 1lSFvq-0005T9-VT; Fri, 02 Apr 2021 02:17:35 -0700
From: Nava kishore Manne <nava.manne@xilinx.com>
To: <mdf@kernel.org>, <trix@redhat.com>, <robh+dt@kernel.org>,
 <michal.simek@xilinx.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <linux-fpga@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <git@xilinx.com>
Subject: [PATCH RFC 2/3] fpga: support loading from a pre-allocated buffer
Date: Fri, 2 Apr 2021 14:39:32 +0530
Message-ID: <20210402090933.32276-3-nava.manne@xilinx.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210402090933.32276-1-nava.manne@xilinx.com>
References: <20210402090933.32276-1-nava.manne@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cebefaa1-d417-42b4-037c-08d8f5b82ba7
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3553:
X-Microsoft-Antispam-PRVS: <CY4PR0201MB3553FCD9E024B8D32905A5E4C27A9@CY4PR0201MB3553.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FEQnJOKG5mmZFp8INBRmHVLzSdK2LY9Vc9XIwSgQ6NbIBVOfGcCu8NI2NKEXXehjmr8K65XvkTScoht4lkkuROq3HfHHOy7+HpPPwaIhO3wH6iyWdh65eddPDtX8x+BpUFQQEGD14ub+un3PHh2iDnAGiYo1rlfeFD1Kisk0o72X2Hj2MFqawRCPT8KaGnE7giQ4PuELqqQy6Tcc4Fzbx3g/YyFeLK0Mlnx72Abz/W1nbFwThFybgfPdZgmRVV+TWG68lEheNj2e8QLZE8wj0Q45/hiOuQQfjOzYghmILWD++LscB8mLi5lqo+PL/RZIlNHyFgB6RX/I6o/pGLDOxrhXRefzRMsyus1huJKI3pqM8bIPTm8enrnf3lQGpYutbBCuw8WF2Dezjz2n4ZjCIU809AEUx0Wn5mILjQSamCjfdKhfSLk3GemPj+Nqq757zkzgTe1dJCX+zJxVDfFOSDSNxQDyxmYOV4aTpGwa/uj3+umjVFTK61C2YesmdhG6m5hCHTDuCR1UBv/xfUforSjOx9rsLyhjSgkZv9B+gguie2V9vN7IGEeLC7bY4sWaJearI3A3SPHHqepzacs04VwRj1Mc4Ra7YnmxzxJ+gGgJSwkuRf99mBOpiUIZoqsrYDSX0NN1zqqnMZaUrKdfq/PtifA/QTlR0lNigOHWsDzOhw/crjvHXI4pvFVRWu7MaRULuchzBAfNjS7I9/riefy13ZUmr7CEe1/3cruL9jU8ayC4n7Ly1ne8Tv/+xdGv
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(8676002)(47076005)(36860700001)(1076003)(4326008)(9786002)(82310400003)(336012)(7636003)(8936002)(36906005)(26005)(6636002)(7416002)(186003)(921005)(83380400001)(2616005)(6666004)(478600001)(2906002)(5660300002)(356005)(316002)(36756003)(7696005)(82740400003)(107886003)(70586007)(426003)(110136005)(70206006)(102446001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 09:17:42.7268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cebefaa1-d417-42b4-037c-08d8f5b82ba7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3553
X-Mailman-Approved-At: Fri, 02 Apr 2021 09:30:09 +0000
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
Cc: Nava kishore Manne <nava.manne@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
---
 drivers/fpga/fpga-mgr.c       | 126 +++++++++++++++++++++++++++++++++-
 drivers/fpga/of-fpga-region.c |   3 +
 include/linux/fpga/fpga-mgr.h |   6 +-
 3 files changed, 132 insertions(+), 3 deletions(-)

diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
index b85bc47c91a9..13faed61af62 100644
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
@@ -306,6 +308,51 @@ static int fpga_mgr_buf_load(struct fpga_manager *mgr,
 	return rc;
 }
 
+/**
+ * fpga_mgr_buf_load - load fpga from image in dma buffer
+ * @mgr:        fpga manager
+ * @info:       fpga image info
+ *
+ * Step the low level fpga manager through the device-specific steps of getting
+ * an FPGA ready to be configured, writing the image to it, then doing whatever
+ * post-configuration steps necessary.  This code assumes the caller got the
+ * mgr pointer from of_fpga_mgr_get() and checked that it is not an error code.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
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
@@ -358,6 +405,8 @@ static int fpga_mgr_firmware_load(struct fpga_manager *mgr,
  */
 int fpga_mgr_load(struct fpga_manager *mgr, struct fpga_image_info *info)
 {
+	if (info->flags & FPGA_MGR_CONFIG_DMA_BUF)
+		return fpga_dmabuf_load(mgr, info);
 	if (info->sgt)
 		return fpga_mgr_buf_load_sg(mgr, info, info->sgt);
 	if (info->buf && info->count)
@@ -549,6 +598,62 @@ void fpga_mgr_unlock(struct fpga_manager *mgr)
 }
 EXPORT_SYMBOL_GPL(fpga_mgr_unlock);
 
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
  * fpga_mgr_create - create and initialize a FPGA manager struct
  * @dev:	fpga manager device from pdev
@@ -569,8 +674,7 @@ struct fpga_manager *fpga_mgr_create(struct device *dev, const char *name,
 	int id, ret;
 
 	if (!mops || !mops->write_complete || !mops->state ||
-	    !mops->write_init || (!mops->write && !mops->write_sg) ||
-	    (mops->write && mops->write_sg)) {
+	    !mops->write_init || (!mops->write && !mops->write_sg)) {
 		dev_err(dev, "Attempt to register without fpga_manager_ops\n");
 		return NULL;
 	}
@@ -601,10 +705,28 @@ struct fpga_manager *fpga_mgr_create(struct device *dev, const char *name,
 	mgr->dev.of_node = dev->of_node;
 	mgr->dev.id = id;
 
+	/* Make device dma capable by inheriting from parent's */
+	set_dma_ops(&mgr->dev, get_dma_ops(dev));
+	ret = dma_coerce_mask_and_coherent(&mgr->dev, dma_get_mask(dev));
+	if (ret) {
+		dev_warn(dev,
+			 "Failed to set DMA mask %llx.Trying to continue.%x\n",
+			 dma_get_mask(dev), ret);
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
 	return mgr;
 
 error_device:
diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
index 35fc2f3d4bd8..698e3e42ccba 100644
--- a/drivers/fpga/of-fpga-region.c
+++ b/drivers/fpga/of-fpga-region.c
@@ -229,6 +229,9 @@ static struct fpga_image_info *of_fpga_region_parse_ov(
 	if (of_property_read_bool(overlay, "encrypted-fpga-config"))
 		info->flags |= FPGA_MGR_ENCRYPTED_BITSTREAM;
 
+	if (of_property_read_bool(overlay, "fpga-config-from-dmabuf"))
+		info->flags |= FPGA_MGR_CONFIG_DMA_BUF;
+
 	if (!of_property_read_string(overlay, "firmware-name",
 				     &firmware_name)) {
 		info->firmware_name = devm_kstrdup(dev, firmware_name,
diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
index 2bc3030a69e5..6208c22f7bed 100644
--- a/include/linux/fpga/fpga-mgr.h
+++ b/include/linux/fpga/fpga-mgr.h
@@ -9,6 +9,7 @@
 #define _LINUX_FPGA_MGR_H
 
 #include <linux/mutex.h>
+#include <linux/miscdevice.h>
 #include <linux/platform_device.h>
 
 struct fpga_manager;
@@ -73,7 +74,7 @@ enum fpga_mgr_states {
 #define FPGA_MGR_ENCRYPTED_BITSTREAM	BIT(2)
 #define FPGA_MGR_BITSTREAM_LSB_FIRST	BIT(3)
 #define FPGA_MGR_COMPRESSED_BITSTREAM	BIT(4)
-
+#define FPGA_MGR_CONFIG_DMA_BUF		BIT(5)
 /**
  * struct fpga_image_info - information specific to a FPGA image
  * @flags: boolean flags as defined above
@@ -167,6 +168,8 @@ struct fpga_compat_id {
 struct fpga_manager {
 	const char *name;
 	struct device dev;
+	struct miscdevice miscdev;
+	struct dma_buf *dmabuf;
 	struct mutex ref_mutex;
 	enum fpga_mgr_states state;
 	struct fpga_compat_id *compat_id;
@@ -204,4 +207,5 @@ struct fpga_manager *devm_fpga_mgr_create(struct device *dev, const char *name,
 					  const struct fpga_manager_ops *mops,
 					  void *priv);
 
+#define FPGA_IOCTL_LOAD_DMA_BUFF	_IOWR('R', 1, __u32)
 #endif /*_LINUX_FPGA_MGR_H */
-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
