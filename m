Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EE77435D5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 09:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A192E10E141;
	Fri, 30 Jun 2023 07:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C734B10E0DE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 07:35:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdnXiftQ4fVMNP+ZNmVhBwGvmuFSQ1OfFZVcMswWsyPJ0rsdw0xUTTtUHgxnOZBKP9HeBpL/0Qaw4h9AgEInfSmgQPzPNRmWNhGnqt69e9dt02XHL4ZSESpvlE6gpEUdQKHi0XRh+WtICUhKjvUJH2iL6BnVrkFheZhhl7fGL0JmG6scC3iGLEaT5ef2XZtAvMVHF1S011xW5SaI/wATiR/z1N3NUc9anY/YeA3YwEP9kLR9aKRUS4Ivag0K4AVGDMDgmTAiTsNNvBd3a74co2hSrP6WcT0612ShzNe02PQyOpo26kxcr4pHalU5UeLxx7WCuVaZwh1chG9XgUjrgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppNRPku8dkiO7Shnqz4GBnoFzC/vZ0vYL1BvMQQBQuY=;
 b=O546CNGWNvaaTg61LskhhtPSf1S//uJ2eZqhNl5TQE6T9igxbuK/jQgLcVrUybd1iK7C2pskYZO2R9vkDfnF7uPzbEflVRnoJyaf4f5ipt7ISydehyyXzzE66TPFeHmuv5OhK1bB45H1xTW3KIrP8Bt7PETNwWbUEwamZC7QsazA+ht1q8GXoBmtv2AaiVR08LmSgx19RUPU0X79vYH+RIWDuiSq2vDggE+F0HloMWZu1ZaBQqlmyh9XIsrPLlmL6RjGcHUb14114cazCCeory/JqKLyJYKv1FiS5soBaoxMOkJiKEfrlD8UKB/H5ewAzmt5xcYluYNUZ31XhMMfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppNRPku8dkiO7Shnqz4GBnoFzC/vZ0vYL1BvMQQBQuY=;
 b=uZ0MfFCiHUjRh2kzOnzOVBdHE/PVTUzDTu+JlJ+smjf49a6KZObg51KThQSmuqO0+SMbqBgLLH2mguOgIfPnMCfGqfNrCIimAsfRImuKNA/yk+64ZKxg/Z/p3w5syL0l8pY6IAHK2wG+H0tXL6etz8XPa/PwbS7P1q/CyT8qu0M=
Received: from SJ0PR13CA0116.namprd13.prod.outlook.com (2603:10b6:a03:2c5::31)
 by SA1PR12MB8967.namprd12.prod.outlook.com (2603:10b6:806:38b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 07:35:34 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2c5:cafe::c) by SJ0PR13CA0116.outlook.office365.com
 (2603:10b6:a03:2c5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.10 via Frontend
 Transport; Fri, 30 Jun 2023 07:35:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 07:35:33 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 02:35:27 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>, "Gurchetan
 Singh" <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Robert Beckett <bob.beckett@collabora.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>
Subject: [LINUX KERNEL PATCH v2 1/1] virtgpu: init vq during resume and notify
 qemu guest status
Date: Fri, 30 Jun 2023 15:34:48 +0800
Message-ID: <20230630073448.842767-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630073448.842767-1-Jiqian.Chen@amd.com>
References: <20230630073448.842767-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT046:EE_|SA1PR12MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 68660652-9aad-43da-b5b0-08db793c96f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFp5Fx2QL6L7YKyg+/rtpRS5QezbeiWmFLQC4AMQFI3XFH6AdjiZS/7qx6XN+YUeTRt067/pUku9eEwsTL2KwvsnBiNlT8Oa9HzaMQxEriPU6TL4dv0LUc+9fhU7uH3mUgWqLaHe5YWUUXr4vVdtgulVtxvrFbNb/g4zumNZ/VOTdDMdpiUT/oLnE2tdTRtkKd/jxG7cBnrrMoBHGHuKj1h3RKvHRwRLIBV8f/lFCsYDxaKacX5mdNAf5nO47H7te7NjCDAip3aemhC6sk7dMyp9OpGMSL14gJJ74B+beGsvRlRJIJAdTcvGWVm/HJICa2BpOjRa44uBbNnr2cMZPxzJsgvCyGkI0tDXbOAQhvfTTUYX7oM19C+6iJEzUzpau5+h18AgmGgR0S4+K+qXxGplYJxGZASSmr2PBRi6ZHdaEV3cQy+lYfxyYxCI6TDulIkwmMsNBh/GRmyzgtMkW3NBf80DarDosxuDm+TzEsfDN4P9wgZfKgKnfoTrWJk8oV7faFRL7ZX3YbgvI9MUZBO7ASQgVrtAhPn3BsMkSL6u6R0CO6jVZS3oPvVPRMV2QQXxl/RKzq2BngBL8Qp4tylJpqBA8Cwvb6My/jSLJK9hCtZ4+toalTtepTFVW1QxbN5Q6mAMfhKMeiOU09WW77+DMCySRj4nTzsaqTPgiTE0o5wBgApXh4IIwzozuvJpjmGZyDGpYArwbNSN/rTKNuMyE9tEW+jphxD7z9pLnjW5EFQOfslTi7NCceyQe9da0Mro8zSuldClCPAbbdBHZcIMrXGE7z4aH/NdeDfEysA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(921005)(356005)(82740400003)(81166007)(6666004)(7696005)(426003)(336012)(83380400001)(47076005)(16526019)(2616005)(186003)(26005)(1076003)(40480700001)(36860700001)(5660300002)(86362001)(40460700003)(8676002)(36756003)(7416002)(2906002)(30864003)(70206006)(70586007)(478600001)(54906003)(110136005)(8936002)(316002)(4326008)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 07:35:33.8750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68660652-9aad-43da-b5b0-08db793c96f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8967
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
Cc: Honglei Huang <Honglei1.Huang@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>, Julia Zhang <Julia.Zhang@amd.com>,
 Christian Koenig <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch solves two problem:

First, when we suspended guest VM, it called into Qemu to call
virtio_reset->__virtio_queue_reset, this cleared all virtuqueue
information of virtgpu on Qemu end. As a result, after guest
resumed, guest sended ctrl/cursor requests to Qemu through
virtqueue, but Qemu can't get requests from the virtqueue now.
In function virtio_queue_notify, vq->vring.desc is NULL.

So, this patch add freeze and restore function for virtgpu driver.
In freeze function, it flushes all virtqueue works and deletes
virtqueues. In restore function, it initializes virtqueues. And
then, Qemu and guest can communicate normally.

Second, when we suspended guest VM, it called into Qemu to call
virtio_reset->virtio_gpu_gl_reset, this destroyed resources and
reset renderer which were used for display. As a result, after
guest resumed, the display can't come back and we only saw a black
screen.

So, this patch add a new ctrl message VIRTIO_GPU_CMD_STATUS_FREEZING.
When guest is during suspending, we set freezing status to true to
notify Qemu that guest entered suspending, and then Qemu will not
destroy resources. When guest is during resuming, we set freezing
status to false to notify Qemu that guest exited suspending, and then
Qemu will keep its origin actions. As a result, the display can come
back and everything of guest can come back to the time when guest was
suspended.

Due to this implemention needs cooperation with host Qemu, so it
added a new feature flag VIRTIO_GPU_F_FREEZING, so that guest and
host can negotiate whenever freezing is supported or not.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     | 37 ++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  4 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 36 +++++++++++++++++------
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 15 ++++++++++
 include/uapi/linux/virtio_gpu.h          | 15 ++++++++++
 6 files changed, 99 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..9cd000be521a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -55,6 +55,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 
 	virtio_gpu_add_bool(m, "blob resources", vgdev->has_resource_blob);
 	virtio_gpu_add_bool(m, "context init", vgdev->has_context_init);
+	virtio_gpu_add_bool(m, "freezing", vgdev->has_freezing);
 	virtio_gpu_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_gpu_add_int(m, "scanouts", vgdev->num_scanouts);
 	if (vgdev->host_visible_region.len) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index add075681e18..e0b0abbed606 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -130,6 +130,38 @@ static void virtio_gpu_config_changed(struct virtio_device *vdev)
 	schedule_work(&vgdev->config_changed_work);
 }
 
+#ifdef CONFIG_PM
+static int virtio_gpu_freeze(struct virtio_device *dev)
+{
+	struct drm_device *ddev = dev->priv;
+	struct virtio_gpu_device *vgdev = ddev->dev_private;
+	int ret = 0;
+
+	if (vgdev->has_freezing) {
+		ret = virtio_gpu_cmd_status_freezing(vgdev, 1);
+	}
+	if (!ret) {
+		flush_work(&vgdev->ctrlq.dequeue_work);
+		flush_work(&vgdev->cursorq.dequeue_work);
+		vgdev->vdev->config->del_vqs(vgdev->vdev);
+	}
+	return ret;
+}
+
+static int virtio_gpu_restore(struct virtio_device *dev)
+{
+	struct drm_device *ddev = dev->priv;
+	struct virtio_gpu_device *vgdev = ddev->dev_private;
+	int ret;
+
+	ret = virtio_gpu_init_vqs(dev);
+	if (!ret && vgdev->has_freezing) {
+		ret = virtio_gpu_cmd_status_freezing(vgdev, 0);
+	}
+	return ret;
+}
+#endif
+
 static struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_GPU, VIRTIO_DEV_ANY_ID },
 	{ 0 },
@@ -148,6 +180,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
 	VIRTIO_GPU_F_CONTEXT_INIT,
+	VIRTIO_GPU_F_FREEZING,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
@@ -156,6 +189,10 @@ static struct virtio_driver virtio_gpu_driver = {
 	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = virtio_gpu_probe,
+#ifdef CONFIG_PM
+	.freeze = virtio_gpu_freeze,
+	.restore = virtio_gpu_restore,
+#endif
 	.remove = virtio_gpu_remove,
 	.config_changed = virtio_gpu_config_changed
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index af6ffb696086..f8f213a12691 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -246,6 +246,7 @@ struct virtio_gpu_device {
 	bool has_resource_blob;
 	bool has_host_visible;
 	bool has_context_init;
+	bool has_freezing;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
@@ -282,6 +283,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
 /* virtgpu_kms.c */
+int virtio_gpu_init_vqs(struct virtio_device *vdev);
 int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev);
 void virtio_gpu_deinit(struct drm_device *dev);
 void virtio_gpu_release(struct drm_device *dev);
@@ -425,6 +427,8 @@ virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 				uint32_t width, uint32_t height,
 				uint32_t x, uint32_t y);
 
+int virtio_gpu_cmd_status_freezing(struct virtio_gpu_device *vgdev, uint32_t freezing);
+
 /* virtgpu_display.c */
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 5a3b5aaed1f3..4e245b552145 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -114,16 +114,33 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 	vgdev->num_capsets = num_capsets;
 }
 
-int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
+int virtio_gpu_init_vqs(struct virtio_device *vdev)
 {
 	static vq_callback_t *callbacks[] = {
 		virtio_gpu_ctrl_ack, virtio_gpu_cursor_ack
 	};
 	static const char * const names[] = { "control", "cursor" };
+	struct drm_device *dev = vdev->priv;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtqueue *vqs[2];
+	int ret;
+
+	virtio_gpu_init_vq(&vgdev->ctrlq, virtio_gpu_dequeue_ctrl_func);
+	virtio_gpu_init_vq(&vgdev->cursorq, virtio_gpu_dequeue_cursor_func);
+
+	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
+	if (ret) {
+		DRM_ERROR("failed to find virt queues\n");
+		return ret;
+	}
+	vgdev->ctrlq.vq = vqs[0];
+	vgdev->cursorq.vq = vqs[1];
+	return 0;
+}
 
+int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
+{
 	struct virtio_gpu_device *vgdev;
-	/* this will expand later */
-	struct virtqueue *vqs[2];
 	u32 num_scanouts, num_capsets;
 	int ret = 0;
 
@@ -144,8 +161,6 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	ida_init(&vgdev->ctx_id_ida);
 	ida_init(&vgdev->resource_ida);
 	init_waitqueue_head(&vgdev->resp_wq);
-	virtio_gpu_init_vq(&vgdev->ctrlq, virtio_gpu_dequeue_ctrl_func);
-	virtio_gpu_init_vq(&vgdev->cursorq, virtio_gpu_dequeue_cursor_func);
 
 	vgdev->fence_drv.context = dma_fence_context_alloc(1);
 	spin_lock_init(&vgdev->fence_drv.lock);
@@ -197,6 +212,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_CONTEXT_INIT)) {
 		vgdev->has_context_init = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_FREEZING)) {
+		vgdev->has_freezing = true;
+	}
 
 	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible",
 		 vgdev->has_virgl_3d    ? '+' : '-',
@@ -207,13 +225,13 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	DRM_INFO("features: %ccontext_init\n",
 		 vgdev->has_context_init ? '+' : '-');
 
-	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
+	DRM_INFO("features: %cfreezing\n",
+		 vgdev->has_freezing ? '+' : '-');
+
+	ret = virtio_gpu_init_vqs(vdev);
 	if (ret) {
-		DRM_ERROR("failed to find virt queues\n");
 		goto err_vqs;
 	}
-	vgdev->ctrlq.vq = vqs[0];
-	vgdev->cursorq.vq = vqs[1];
 	ret = virtio_gpu_alloc_vbufs(vgdev);
 	if (ret) {
 		DRM_ERROR("failed to alloc vbufs\n");
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index b1a00c0c25a7..34976bccc330 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1302,3 +1302,18 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
+
+int virtio_gpu_cmd_status_freezing(struct virtio_gpu_device *vgdev, uint32_t freezing)
+{
+	struct virtio_gpu_status_freezing *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_STATUS_FREEZING);
+	cmd_p->freezing = freezing;
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
+	return 0;
+}
\ No newline at end of file
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index f556fde07b76..ae271733daef 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -65,6 +65,11 @@
  */
 #define VIRTIO_GPU_F_CONTEXT_INIT        4
 
+/*
+ * VIRTIO_GPU_CMD_STATUS_FREEZING
+ */
+#define VIRTIO_GPU_F_FREEZING            5
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -100,6 +105,9 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
 	VIRTIO_GPU_CMD_MOVE_CURSOR,
 
+	/* status */
+	VIRTIO_GPU_CMD_STATUS_FREEZING = 0x0400,
+
 	/* success responses */
 	VIRTIO_GPU_RESP_OK_NODATA = 0x1100,
 	VIRTIO_GPU_RESP_OK_DISPLAY_INFO,
@@ -116,6 +124,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID,
 	VIRTIO_GPU_RESP_ERR_INVALID_CONTEXT_ID,
 	VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER,
+
 };
 
 enum virtio_gpu_shm_id {
@@ -453,4 +462,10 @@ struct virtio_gpu_resource_unmap_blob {
 	__le32 padding;
 };
 
+/* VIRTIO_GPU_CMD_STATUS_FREEZING */
+struct virtio_gpu_status_freezing {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__u32 freezing;
+};
+
 #endif
-- 
2.34.1

