Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0A07A5FF6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 12:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ED210E396;
	Tue, 19 Sep 2023 10:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC8F10E390
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqyqgadTfy3+UT3N6heakvn1nlnOQatzaJyJG2/Exm8/cosrdSVu6Ahw/WywvS3akbeQ09MQNZVno5BX3YEMa2g2Th8s7XVIiZlr5KQEWC3CPH6DD89G0eKe27QrZGLb1NHrY4Ys2jFV7T9uc0/QqZnle/PY4NhN89PK17cProhJK98i6TkgK5UGKsxzqUzh9t2yY0fpeZFh5n4oxfnK/oL+XWPHOeBi6iiNhLGuxLmljkGEMiC8GM74swII3FXyom2traGCutKzfJoTcaALDZ74+aIy8KxN9dqFEjR9znRXHcV23JDbn9/jNKLbg5gvk03x/iGPZ3L0IfnF0NmlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSQWkK0PcI0rD/QERaWodfqwMMw0fl35aoPyxDH1Ghc=;
 b=T8bm4zWyi6GLTXGbw0JmvkwCHIJI8sLj15LuTzzNlCP+0CONjBNdWo3mlVRCQs6qJCZoKazsYcIQ7PyhZHJW6xwtev4k6NXTMq4Je2bm62FG8KPVidOuv9dxL0vg9ZmC7yyCAxURQjGt2P4fZkMRUthuzn/l0Wv5F+dlQl6NOl30u9dIKJxRJF8nRgoOIK0mQDCX9X/ivJvWWPJzvjGggcN8t5urLe6QCtu1V+1/bY6X/DFZDSjAZakPPyoYtj2nebAdA9du4U+3ZX2upOrvnEzauFtno7u4Txn5U2fYkuwQeVEmyl6Sok/uqwS+i/w9dF4lwC+ziXBo38nNlCdyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSQWkK0PcI0rD/QERaWodfqwMMw0fl35aoPyxDH1Ghc=;
 b=UWHYQ48GlHRm1QLk4lip84NufDFL4iCutQssulSkqi1JKlYDcyTFmm2c4wBZQ0Iq/JTUs/SnQ8JhZmZQx2JZesinhJUA+kt1CvmlB5qIrpgaS0Uq0Jj55TTST+ts2K9yYG+7ZiMKWyHsY6ExBOuTI+DmmutNqOLKuYm3Br7pCts=
Received: from BLAPR03CA0168.namprd03.prod.outlook.com (2603:10b6:208:32f::6)
 by IA1PR12MB7637.namprd12.prod.outlook.com (2603:10b6:208:427::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 10:46:43 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:32f:cafe::85) by BLAPR03CA0168.outlook.office365.com
 (2603:10b6:208:32f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27 via Frontend
 Transport; Tue, 19 Sep 2023 10:46:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Tue, 19 Sep 2023 10:46:42 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 05:46:36 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, David Airlie <airlied@redhat.com>, "Gurchetan
 Singh" <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>, "Robert
 Beckett" <bob.beckett@collabora.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [LINUX KERNEL PATCH v5 2/2] virtgpu: Add freeze and restore func to
 reinit vqs
Date: Tue, 19 Sep 2023 18:46:07 +0800
Message-ID: <20230919104607.2282248-3-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|IA1PR12MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f5be26-03a4-41df-dc9a-08dbb8fdb664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDOB4mkMnYPWCwmhoiwQ7HvT3AXROf9eYiss1w3edq9a3yvowRoRhUZFd9UWpvr+5DwvsEsCAwBZcpp9WL9Y7oHXCkAgMVk925HAazvb35nL8UVPijb8xOb6i/iTz7d0FhHqQxf4XzEr86tqy3R4ip0+KqCfE6OyMxB8rVCyrKNV4Iw4RcklGl+NnVq677/14aXsjFCzRNAFR9pwTHqAELJskHNoYOjlT/6R/MD35mwO5OA91kRZJDPqe/bUcHLSb+EiEA6JY+s/SZkVkGSiMv+tdPZ4OwE2Sm1qQg48e57xGLxc0ii0V4FZOXjGPkuLx2q1JY1LKf8hs9PeHx+nypur76Y43jJrqrWXOiWCr6QDuoA+RrGewKwQ9i3yaCFEr9PEyEOebhCpBlHjK4RyCAH18Hj7de3fTWys2Lw2zQPxyBxidwYgPYbCNH22NfeyJjEJ5pxjpg7AhdNwFcs86bBeECcQXwuPuip4aP3DPqixDCuVs7m4H8MzHTVnN5R8JcapctvFS8CTKtel2QznGsXkD7RHl994hzUIGql2R6pfndN4A7Y9k+4A+JulYU2T62eC8OnGi5riV+K9uWvdC6nqlvTZKQ2AN5Lqay2qIGvNyd4YfijoDf0GSWWsB6+KeAUP7xaFnYuMCgm3VUVftNtbsuBLLGy9ZPFr1ax8YYAPCcOeLeP1aPfkLL3kQonRrCq7MxsZt7XhgQmEQQX4MKNOHbs8cmJlr/JuFNbSH+Q3J6SZGB7dAXzT6Hf1WXyb23S+9ZxJODZW2ptQ/0xJDxjB0YMCfiOEaeCX0U5xdZc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(186009)(82310400011)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(86362001)(2906002)(81166007)(921005)(82740400003)(356005)(36756003)(41300700001)(47076005)(40460700003)(16526019)(26005)(336012)(426003)(83380400001)(8676002)(2616005)(5660300002)(7696005)(6666004)(478600001)(36860700001)(1076003)(70586007)(8936002)(70206006)(316002)(110136005)(40480700001)(7416002)(4326008)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 10:46:42.8888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f5be26-03a4-41df-dc9a-08dbb8fdb664
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7637
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

When we suspended guest VM, it called into Qemu to call
virtio_reset->__virtio_queue_reset, this cleared all virtqueue information
of virtgpu on Qemu end, but guest kernel still keep the virtqueus. As a
result, after guest resumed, if guest sent ctrl/cursor requests to Qemu
through virtqueue, but now Qemu can't get requests from the virtqueue.
(Failed in function virtio_queue_notify, vq->vring.desc is NULL)

So, this patch add freeze and restore function for virtgpu driver. In
freeze function, it flushes all virtqueue works and deletes virtqueues. In
restore function, it re-initializes virtqueues. And then, Qemu and guest
can communicate normally.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 23 +++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c | 30 +++++++++++++++++++---------
 3 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 644b8ee51009..8e751db129e4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -130,6 +130,25 @@ static void virtio_gpu_config_changed(struct virtio_device *vdev)
 	schedule_work(&vgdev->config_changed_work);
 }
 
+#ifdef CONFIG_PM
+static int virtio_gpu_freeze(struct virtio_device *dev)
+{
+	struct drm_device *ddev = dev->priv;
+	struct virtio_gpu_device *vgdev = ddev->dev_private;
+
+	flush_work(&vgdev->ctrlq.dequeue_work);
+	flush_work(&vgdev->cursorq.dequeue_work);
+	vgdev->vdev->config->del_vqs(vgdev->vdev);
+
+	return 0;
+}
+
+static int virtio_gpu_restore(struct virtio_device *dev)
+{
+	return virtio_gpu_init_vqs(dev);
+}
+#endif
+
 static struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_GPU, VIRTIO_DEV_ANY_ID },
 	{ 0 },
@@ -156,6 +175,10 @@ static struct virtio_driver virtio_gpu_driver = {
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
index 4126c384286b..d93dd53a947d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -282,6 +282,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
 /* virtgpu_kms.c */
+int virtio_gpu_init_vqs(struct virtio_device *vdev);
 int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev);
 void virtio_gpu_deinit(struct drm_device *dev);
 void virtio_gpu_release(struct drm_device *dev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 5a3b5aaed1f3..871b7ba98257 100644
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
@@ -207,13 +222,10 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	DRM_INFO("features: %ccontext_init\n",
 		 vgdev->has_context_init ? '+' : '-');
 
-	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
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
-- 
2.34.1

