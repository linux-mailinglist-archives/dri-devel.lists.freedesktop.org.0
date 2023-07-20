Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA075ADA2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 13:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98ECF10E5BC;
	Thu, 20 Jul 2023 11:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B47510E5BC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 11:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCq//9NXjn8tb1hFLphvG4x3ueM9vr58jrk4R61oTZp8nkVyVgLaq9CcSJ43SZJhN7BWteCOotEciLAVkGfaMs5aGQBFoBdynYJzJlFFuxHuybwh6tukh+ZUvex9EBk5ibAydppkXLoue5XJSv8DVLgjMoDJt4bLeXMrwBAjFKFAB6Ljsnn2EqqbPUiViFKnHf4eauFsY8BCvd4d8XIAHLg+YmNmqTP5GKvoWH3x828C1DEOmcjnmH41iO0RIGxy/UPk8L4OoWEa8PoSLtnfj1ZvhlTFHzG6RiFyFXxNngmRcAdncwQDSxjnywrBKjue/C4kkJawjvwDonapMu2WkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcZo3bf8z8SwwQG9zNxK76NSvPfAhiyEQDRvnk3eIKo=;
 b=MMSSJuoGXLjD18ssdDQdeUi51d3jOfBeAN6FINIuILA7/MrhNdtpYII+FVgi2F4xGzSAHJ0oWcZLHsDkMZsOgFYTLah1fHv19X3dhBJI2Hz/Tm2uwyxxV2Pi00LRoXQt3B3TmCD80Qq6bLXoC8DdyHp04qRcarb6uAPhK3Z0+XjdQAPk4NDtQA8a6wGqKYxRUVQ2dTLh1t2Yd22WZRdoN8KxWX5styp4WCoNXeX0AkJK4Tmf3pKNVDHH6uCCdi52dmBfaEFshYHSSWAkd/EH5SzW5qbty3MBkUGQ5dAObqPV53BoKydI+OlI+nXQ5Lwis9B5nZY8H4NZBzJbk8Oa3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcZo3bf8z8SwwQG9zNxK76NSvPfAhiyEQDRvnk3eIKo=;
 b=3xM41brXrV41SQi5aGHUg4e8YBp0dtYJsjcpZuX3kZIQXTEyAPImTi8vyfN5Ow+zlDOpGLd51GYxkUKswviSkMfx+fTkB91/XAGa1HYRedKMIGXzWsC1uRhdlIkPQcIiP6jD+svfaGFiw2TxLCbolTpeP2Os2Yma88u25GGuPK4=
Received: from BYAPR07CA0087.namprd07.prod.outlook.com (2603:10b6:a03:12b::28)
 by CY5PR12MB6599.namprd12.prod.outlook.com (2603:10b6:930:41::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 11:58:33 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:12b:cafe::26) by BYAPR07CA0087.outlook.office365.com
 (2603:10b6:a03:12b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25 via Frontend
 Transport; Thu, 20 Jul 2023 11:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.25 via Frontend Transport; Thu, 20 Jul 2023 11:58:32 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Jul
 2023 06:58:26 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>, "Gurchetan
 Singh" <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Robert Beckett <bob.beckett@collabora.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [LINUX KERNEL PATCH v3 1/1] virtgpu: init vq during resume and notify
 qemu guest status
Date: Thu, 20 Jul 2023 19:58:05 +0800
Message-ID: <20230720115805.8206-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720115805.8206-1-Jiqian.Chen@amd.com>
References: <20230720115805.8206-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT020:EE_|CY5PR12MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a254fa-62fe-41cb-5368-08db8918a3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/6Q4PufneewRpaES0AJdpc9BR71BIZIvXuofHBOmrvME8bcydnYQN634iA/qn02iqsVTd+E4ttm0FuWHhJGJ6R+E0ZE6eYOqG46q3h9PYiEUfE6c1wE5/Ii9Vmxp/ZF6a6+Td/56RGOFo4AiT8pa+/gtwLf6k7otfO2cKCOFAmcnvnqyH18zPh83qSR/OrxN57zcClRHixesYDokFGDFckN5vNSPMisyAgm/ncfjybkYx58+axIZpT9IcYfIKIOElgHrpaY7gHGIMqNvQeQFws7h6pQtFrEdg0xz2coAYwUYxxz8PE+8QP/ZNRJyJR8AO8tSEmGiOc7spcwdHBFEWAU5ApQn18RrqqOjUcICtDYaCNYRrxvCIdm9RUC5sRdW8wdRpZdfawJnxuchZDZTIaU3k+OHXVFGpGGKresLr7YQUXf207QBTUfltowiEbvamRnFOIM4bbLUk+tOjdC+8Pjir3weUmUCj9yWE0NGZi7HRcJyjTTsY5quIRoEJVRbfLR/xxc/7dLFtWMVRfPuQJdD9RxcMXkx6NLAe3hQv+ggopoyPOvcWZ4SvQHAFsnFQujwie+eJ9g+3O8SeKkG3YlC9BMs+lpm25HDVD1ICWa0l+/Sm2BHzaNU352auPtdhvxlLVn5ieG3DYMSeBWsm+kVoyJROTwWFr7XYDiai0bsA/7QvTPGhLkeCH4Tl1YUus57TIhQlwsGdkMXnGr3T6TrC4VAe+Z0FNKWfDNeOvgQC9jnIaRDjbz88BREj8T2GAdTbyH6H8hVnXA3kbdkZVu6gcuC7obsUIA3SQlstY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(82310400008)(451199021)(40470700004)(46966006)(36840700001)(336012)(7696005)(6666004)(26005)(186003)(70586007)(70206006)(316002)(4326008)(40480700001)(41300700001)(1076003)(16526019)(5660300002)(54906003)(110136005)(478600001)(7416002)(8936002)(8676002)(2616005)(356005)(47076005)(426003)(921005)(40460700003)(83380400001)(36860700001)(30864003)(2906002)(81166007)(82740400003)(36756003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 11:58:32.1721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a254fa-62fe-41cb-5368-08db8918a3bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6599
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
 Alex Deucher <Alexander.Deucher@amd.com>, xen-devel@lists.xenproject.org,
 Julia Zhang <Julia.Zhang@amd.com>, Christian Koenig <Christian.Koenig@amd.com>
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

So, this patch add a new ctrl message VIRTIO_GPU_CMD_SET_FREEZE_MODE.
When guest is during suspending, we set freeze mode to freeze_S3 to
notify Qemu that guest entered suspending, and then Qemu will not
destroy resources. When guest is during resuming, we set freeze mode
to unfreeze to notify Qemu that guest exited suspending, and then
Qemu will keep its origin actions. As a result, the display can come
back and everything of guest can come back to the time when guest
was suspended.

Due to this implemention needs cooperation with host Qemu, so it
added a new feature flag VIRTIO_GPU_F_FREEZE_S3, so that guest and
host can negotiate whenever freeze_S3 is supported or not.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  5 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 36 ++++++++++++++++------
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 16 ++++++++++
 include/uapi/linux/virtio_gpu.h          | 19 ++++++++++++
 6 files changed, 107 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..c84fd6d7f5f3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -55,6 +55,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 
 	virtio_gpu_add_bool(m, "blob resources", vgdev->has_resource_blob);
 	virtio_gpu_add_bool(m, "context init", vgdev->has_context_init);
+	virtio_gpu_add_bool(m, "freeze_S3", vgdev->has_freeze_S3);
 	virtio_gpu_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_gpu_add_int(m, "scanouts", vgdev->num_scanouts);
 	if (vgdev->host_visible_region.len) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index add075681e18..83ad0ac82b94 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -130,6 +130,40 @@ static void virtio_gpu_config_changed(struct virtio_device *vdev)
 	schedule_work(&vgdev->config_changed_work);
 }
 
+#ifdef CONFIG_PM
+static int virtio_gpu_freeze(struct virtio_device *dev)
+{
+	struct drm_device *ddev = dev->priv;
+	struct virtio_gpu_device *vgdev = ddev->dev_private;
+	int ret = 0;
+
+	if (vgdev->has_freeze_S3) {
+		ret = virtio_gpu_cmd_set_freeze_mode(vgdev,
+					VIRTIO_GPU_FREEZE_MODE_FREEZE_S3);
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
+	if (!ret && vgdev->has_freeze_S3) {
+		ret = virtio_gpu_cmd_set_freeze_mode(vgdev,
+					VIRTIO_GPU_FREEZE_MODE_UNFREEZE);
+	}
+	return ret;
+}
+#endif
+
 static struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_GPU, VIRTIO_DEV_ANY_ID },
 	{ 0 },
@@ -148,6 +182,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
 	VIRTIO_GPU_F_CONTEXT_INIT,
+	VIRTIO_GPU_F_FREEZE_S3,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
@@ -156,6 +191,10 @@ static struct virtio_driver virtio_gpu_driver = {
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
index 4126c384286b..231b5a6138b2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -246,6 +246,7 @@ struct virtio_gpu_device {
 	bool has_resource_blob;
 	bool has_host_visible;
 	bool has_context_init;
+	bool has_freeze_S3;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
@@ -282,6 +283,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
 /* virtgpu_kms.c */
+int virtio_gpu_init_vqs(struct virtio_device *vdev);
 int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev);
 void virtio_gpu_deinit(struct drm_device *dev);
 void virtio_gpu_release(struct drm_device *dev);
@@ -425,6 +427,9 @@ virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 				uint32_t width, uint32_t height,
 				uint32_t x, uint32_t y);
 
+int virtio_gpu_cmd_set_freeze_mode(struct virtio_gpu_device *vgdev,
+				virtio_gpu_freeze_mode_t freeze_mode);
+
 /* virtgpu_display.c */
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 5a3b5aaed1f3..a762a762f907 100644
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
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_FREEZE_S3)) {
+		vgdev->has_freeze_S3 = true;
+	}
 
 	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible",
 		 vgdev->has_virgl_3d    ? '+' : '-',
@@ -207,13 +225,13 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	DRM_INFO("features: %ccontext_init\n",
 		 vgdev->has_context_init ? '+' : '-');
 
-	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
+	DRM_INFO("features: %cfreeze_S3\n",
+		 vgdev->has_freeze_S3 ? '+' : '-');
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
index b1a00c0c25a7..74b34951e4fa 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1302,3 +1302,19 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
+
+int virtio_gpu_cmd_set_freeze_mode(struct virtio_gpu_device *vgdev,
+				virtio_gpu_freeze_mode_t freeze_mode)
+{
+	struct virtio_gpu_set_freeze_mode *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_SET_FREEZE_MODE);
+	cmd_p->freeze_mode = freeze_mode;
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
+	return 0;
+}
\ No newline at end of file
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index f556fde07b76..21ca87bf7417 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -65,6 +65,11 @@
  */
 #define VIRTIO_GPU_F_CONTEXT_INIT        4
 
+/*
+ * VIRTIO_GPU_CMD_SET_FREEZE_MODE
+ */
+#define VIRTIO_GPU_F_FREEZE_S3            5
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -100,6 +105,9 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
 	VIRTIO_GPU_CMD_MOVE_CURSOR,
 
+	/* freeze mode */
+	VIRTIO_GPU_CMD_SET_FREEZE_MODE = 0x0400,
+
 	/* success responses */
 	VIRTIO_GPU_RESP_OK_NODATA = 0x1100,
 	VIRTIO_GPU_RESP_OK_DISPLAY_INFO,
@@ -453,4 +461,15 @@ struct virtio_gpu_resource_unmap_blob {
 	__le32 padding;
 };
 
+/* VIRTIO_GPU_CMD_SET_FREEZE_MODE */
+typedef enum {
+	VIRTIO_GPU_FREEZE_MODE_UNFREEZE = 0,
+	VIRTIO_GPU_FREEZE_MODE_FREEZE_S3 = 3,
+} virtio_gpu_freeze_mode_t;
+
+struct virtio_gpu_set_freeze_mode {
+	struct virtio_gpu_ctrl_hdr hdr;
+	virtio_gpu_freeze_mode_t freeze_mode;
+};
+
 #endif
-- 
2.34.1

