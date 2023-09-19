Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CDA7A5FF5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 12:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523BD10E38E;
	Tue, 19 Sep 2023 10:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26DF10E38E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvZVOSsMcAtEuiqFq4D3ZtSVl2ViOWrKKK7K5pVz5JZQARvgTW4cpKzu/QV1/kv9iB2m2IbYhjChQv6bxHFCZ28X52SiyrIDvtX7ByLzhBlS81vz9idmsSDh03igGco4zySUQ1yr0c+PUrCfDqZpJC+kYTERx26rCWkbqyEszCim6MtGXh9fUagkvwckid4mr6YS8WkOH7Tt4qsmzju4VHLdICR4d/k80CDKawVuwSTcSk6bQbVIdWhRpsxffSaEZJnsqzdJGG/PRtoLaYmfVzyhg0pFlGgrmoAHs7e15Ljz385/zpxvwpr9yjx8V6eUX3Gz8QW31HL9aeu+RPzpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0mjqhN6Eblsxxvoe22O8tWrfD7McvWF7geAzxfgWwg=;
 b=jBd/qumS0pnpfOjSCbdbhm3/46LHjurc9v7HB+YSfFBN/tQpd7KLrYti9fVDBjLB5e1aYawK2qFFPiWmYCYLrUX885u6PCM8+98HfYwQr98SKNRUgHacpUxmG3KzDXpcm9QUW0RFBbGRTcwjMvQmbw9X6RK1EPSECoxUCK9fiLkcuQCqZbN+cg1rZjQUpPBwGMfrf2mUwS0AUmKA1vki70Gn+6etu8uaXXcX5oeYXR6C8HpO8X1wI62iXDek7wbKdGDPRuh14Cajfq1G/pcA5SgBoW/Fz5TibKKLT+hXx1mfHGe/KNu9jZb6eGuzHi2Op+ikCZyjeQYmtiE23QRO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0mjqhN6Eblsxxvoe22O8tWrfD7McvWF7geAzxfgWwg=;
 b=Dytf/xdCoosOsydmpW5JUDSFwbCbEUq63yLjXJrHpupDKON6h8yklLMQ2XyzXWJYUERaUdZl8ebJ5hz6GG6Ps8lZ/MSGBQywTm8K2FumXhYmnPOSq/NmwmBV8Q+xYEBasSVTfBaBG+S4DHI8uPaoxzAW8cwkQVt5omOnabIHiac=
Received: from BL0PR0102CA0032.prod.exchangelabs.com (2603:10b6:207:18::45) by
 CY5PR12MB6347.namprd12.prod.outlook.com (2603:10b6:930:20::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Tue, 19 Sep 2023 10:46:38 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:207:18:cafe::3a) by BL0PR0102CA0032.outlook.office365.com
 (2603:10b6:207:18::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Tue, 19 Sep 2023 10:46:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Tue, 19 Sep 2023 10:46:37 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 05:46:30 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, David Airlie <airlied@redhat.com>, "Gurchetan
 Singh" <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>, "Robert
 Beckett" <bob.beckett@collabora.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [LINUX KERNEL PATCH v5 1/2] virtio_pci: Add freeze_mode for
 virtio_pci_common_cfg
Date: Tue, 19 Sep 2023 18:46:06 +0800
Message-ID: <20230919104607.2282248-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919104607.2282248-1-Jiqian.Chen@amd.com>
References: <20230919104607.2282248-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|CY5PR12MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 93312f9a-8049-4a14-fe62-08dbb8fdb340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iloywI+wP2fK1vC0Z34f796V6NoX7w2/bT73YCil8FCERFhT0v7jKRDA3pKVkBWEJQdlWf7AsJwzHuBC4/8hT42pl2hAuqdOtz7QM1ViyaecaO96d8XKlPNACp5CoII+xbWWOfsVjzKiJcuHXmC9ZpugT8dHZ1HyYuMjbkxnwZki4pKbUkTzmnNK23bvw48haNrRFU6Pehauh51/i9UQ18wNAwMN02YOxg0GnXtDvD0nmWqCIg7H/kC/4D0GwZtoAFbNgYG/SJPswsOLdcBqvs6rWR9F3HLMY1lihgOiHeguSYt6wJHOGkdEukRQuvWR9c9Insi2GhGBKWEm1d76cRlRmU22fdyOMWxCrMvVBJ5elEeL47JXdapiiZWspD7Gwd0qeqMYPaBelB3hBsGibKUrnChmUDt06aoSeXVWuReAsEOHVWhU6e4cw+IOQD779zC4lg2U7q+ch9VqLRENcSfoWpkOc5ETGNiGaVO4b/B+3ncypZcKR84sjnpRi0gM9yW3QnIIREaosRnknZAzger/PIyLJW7uZS1wId/9yAvfuEqTKEWvFdNpRzs/spmO+cl588UOMcxYnZ3SvJ5WtiBy1b5A/elbg3prZEQsTgdyqFhyVANFzzcdsY3a0HfKvCxIT87KPv4Pp1K+Rgenh4ostcvgnxJ8CljqBUbFVL08YyJAPavs9TudFyN4LS7hjjO2uSejoTolLcC++o+YY/PjGvaN2x/lG0CMbf6Ck+gB5uNJ9iuIRzZltIko6O3MNzUZicS7alU9TUMz9JnzrVyrEEXI/SGr24HwmJy/z00=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(41300700001)(7696005)(7416002)(40460700003)(110136005)(70206006)(82740400003)(81166007)(70586007)(356005)(921005)(36756003)(478600001)(86362001)(40480700001)(2906002)(6666004)(54906003)(316002)(8676002)(4326008)(8936002)(2616005)(83380400001)(1076003)(5660300002)(26005)(16526019)(426003)(336012)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 10:46:37.6206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93312f9a-8049-4a14-fe62-08dbb8fdb340
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6347
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <Honglei1.Huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Julia Zhang <Julia.Zhang@amd.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When guest vm does S3, Qemu will reset and clear some things of virtio
devices, but guest can't aware that, so that may cause some problems.
For excample, Qemu calls virtio_reset->virtio_gpu_gl_reset, that will
destroy render resources of virtio-gpu. As a result, after guest resume,
the display can't come back and we only saw a black screen. Due to guest
can't re-create all the resources, so we need to let Qemu not to destroy
them when S3.

For above purpose, this patch add a new parameter named freeze_mode to
struct virtio_pci_common_cfg, and when guest suspends, it can set
freeze_mode to be FREEZE_S3, so that virtio devices can change their
reset behavior on Qemu side according to that mode.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 drivers/virtio/virtio.c                | 13 +++++++++++++
 drivers/virtio/virtio_pci_modern.c     |  9 +++++++++
 drivers/virtio/virtio_pci_modern_dev.c | 16 ++++++++++++++++
 include/linux/virtio_config.h          |  1 +
 include/linux/virtio_pci_modern.h      |  2 ++
 include/uapi/linux/virtio_pci.h        | 16 ++++++++++++++--
 6 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index 3893dc29eb26..b4eb8369d5a1 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -7,6 +7,7 @@
 #include <linux/idr.h>
 #include <linux/of.h>
 #include <uapi/linux/virtio_ids.h>
+#include <uapi/linux/virtio_pci.h>
 
 /* Unique numbering for virtio devices. */
 static DEFINE_IDA(virtio_index_ida);
@@ -486,10 +487,20 @@ void unregister_virtio_device(struct virtio_device *dev)
 EXPORT_SYMBOL_GPL(unregister_virtio_device);
 
 #ifdef CONFIG_PM_SLEEP
+static void virtio_set_freeze_mode(struct virtio_device *dev, u16 mode)
+{
+	if (!dev->config->set_freeze_mode)
+		return;
+	might_sleep();
+	dev->config->set_freeze_mode(dev, mode);
+}
+
 int virtio_device_freeze(struct virtio_device *dev)
 {
 	struct virtio_driver *drv = drv_to_virtio(dev->dev.driver);
 
+	virtio_set_freeze_mode(dev, VIRTIO_PCI_FREEZE_MODE_FREEZE_S3);
+
 	virtio_config_disable(dev);
 
 	dev->failed = dev->config->get_status(dev) & VIRTIO_CONFIG_S_FAILED;
@@ -544,6 +555,8 @@ int virtio_device_restore(struct virtio_device *dev)
 
 	virtio_config_enable(dev);
 
+	virtio_set_freeze_mode(dev, VIRTIO_PCI_FREEZE_MODE_UNFREEZE);
+
 	return 0;
 
 err:
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index d6bb68ba84e5..846b70919cbd 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -491,6 +491,13 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 	return true;
 }
 
+static void vp_set_freeze_mode(struct virtio_device *vdev, u16 mode)
+{
+	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+
+	vp_modern_set_freeze_mode(&vp_dev->mdev, mode);
+}
+
 static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
 	.get		= NULL,
 	.set		= NULL,
@@ -509,6 +516,7 @@ static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
 	.get_shm_region  = vp_get_shm_region,
 	.disable_vq_and_reset = vp_modern_disable_vq_and_reset,
 	.enable_vq_after_reset = vp_modern_enable_vq_after_reset,
+	.set_freeze_mode = vp_set_freeze_mode,
 };
 
 static const struct virtio_config_ops virtio_pci_config_ops = {
@@ -529,6 +537,7 @@ static const struct virtio_config_ops virtio_pci_config_ops = {
 	.get_shm_region  = vp_get_shm_region,
 	.disable_vq_and_reset = vp_modern_disable_vq_and_reset,
 	.enable_vq_after_reset = vp_modern_enable_vq_after_reset,
+	.set_freeze_mode = vp_set_freeze_mode,
 };
 
 /* the PCI probing function */
diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
index aad7d9296e77..4a6f7d130b6e 100644
--- a/drivers/virtio/virtio_pci_modern_dev.c
+++ b/drivers/virtio/virtio_pci_modern_dev.c
@@ -203,6 +203,8 @@ static inline void check_offsets(void)
 		     offsetof(struct virtio_pci_common_cfg, queue_used_lo));
 	BUILD_BUG_ON(VIRTIO_PCI_COMMON_Q_USEDHI !=
 		     offsetof(struct virtio_pci_common_cfg, queue_used_hi));
+	BUILD_BUG_ON(VIRTIO_PCI_COMMON_F_MODE !=
+		     offsetof(struct virtio_pci_common_cfg, freeze_mode));
 }
 
 /*
@@ -714,6 +716,20 @@ void __iomem *vp_modern_map_vq_notify(struct virtio_pci_modern_device *mdev,
 }
 EXPORT_SYMBOL_GPL(vp_modern_map_vq_notify);
 
+/*
+ * vp_modern_set_freeze_mode - set freeze mode to device
+ * @mdev: the modern virtio-pci device
+ * @mode: the mode set to device
+ */
+void vp_modern_set_freeze_mode(struct virtio_pci_modern_device *mdev,
+				 u16 mode)
+{
+	struct virtio_pci_common_cfg __iomem *cfg = mdev->common;
+
+	vp_iowrite16(mode, &cfg->freeze_mode);
+}
+EXPORT_SYMBOL_GPL(vp_modern_set_freeze_mode);
+
 MODULE_VERSION("0.1");
 MODULE_DESCRIPTION("Modern Virtio PCI Device");
 MODULE_AUTHOR("Jason Wang <jasowang@redhat.com>");
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 2b3438de2c4d..2a7443ff7f12 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -120,6 +120,7 @@ struct virtio_config_ops {
 			       struct virtio_shm_region *region, u8 id);
 	int (*disable_vq_and_reset)(struct virtqueue *vq);
 	int (*enable_vq_after_reset)(struct virtqueue *vq);
+	void (*set_freeze_mode)(struct virtio_device *vdev, u16 mode);
 };
 
 /* If driver didn't advertise the feature, it will never appear. */
diff --git a/include/linux/virtio_pci_modern.h b/include/linux/virtio_pci_modern.h
index 067ac1d789bc..ba6eed216ded 100644
--- a/include/linux/virtio_pci_modern.h
+++ b/include/linux/virtio_pci_modern.h
@@ -121,4 +121,6 @@ int vp_modern_probe(struct virtio_pci_modern_device *mdev);
 void vp_modern_remove(struct virtio_pci_modern_device *mdev);
 int vp_modern_get_queue_reset(struct virtio_pci_modern_device *mdev, u16 index);
 void vp_modern_set_queue_reset(struct virtio_pci_modern_device *mdev, u16 index);
+void vp_modern_set_freeze_mode(struct virtio_pci_modern_device *mdev,
+		   u16 mode);
 #endif
diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
index f703afc7ad31..725ace458a1b 100644
--- a/include/uapi/linux/virtio_pci.h
+++ b/include/uapi/linux/virtio_pci.h
@@ -140,6 +140,15 @@ struct virtio_pci_notify_cap {
 	__le32 notify_off_multiplier;	/* Multiplier for queue_notify_off. */
 };
 
+typedef enum {
+       VIRTIO_PCI_FREEZE_MODE_UNFREEZE = 0,
+       VIRTIO_PCI_FREEZE_MODE_FREEZE_S3 = 3,
+} virtio_pci_freeze_mode_t;
+
+#define VIRTIO_PCI_FREEZE_MODE_MASK \
+	((1 << VIRTIO_PCI_FREEZE_MODE_UNFREEZE) | \
+	(1 << VIRTIO_PCI_FREEZE_MODE_FREEZE_S3))
+
 /* Fields in VIRTIO_PCI_CAP_COMMON_CFG: */
 struct virtio_pci_common_cfg {
 	/* About the whole device. */
@@ -164,6 +173,8 @@ struct virtio_pci_common_cfg {
 	__le32 queue_avail_hi;		/* read-write */
 	__le32 queue_used_lo;		/* read-write */
 	__le32 queue_used_hi;		/* read-write */
+
+	__le16 freeze_mode;		/* read-write */
 };
 
 /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
@@ -202,8 +213,9 @@ struct virtio_pci_cfg_cap {
 #define VIRTIO_PCI_COMMON_Q_AVAILHI	44
 #define VIRTIO_PCI_COMMON_Q_USEDLO	48
 #define VIRTIO_PCI_COMMON_Q_USEDHI	52
-#define VIRTIO_PCI_COMMON_Q_NDATA	56
-#define VIRTIO_PCI_COMMON_Q_RESET	58
+#define VIRTIO_PCI_COMMON_F_MODE	56
+#define VIRTIO_PCI_COMMON_Q_NDATA	58
+#define VIRTIO_PCI_COMMON_Q_RESET	60
 
 #endif /* VIRTIO_PCI_NO_MODERN */
 
-- 
2.34.1

