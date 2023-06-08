Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D496727771
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 08:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E8710E50B;
	Thu,  8 Jun 2023 06:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0544D10E50B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 06:39:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmaptGuD2GBc3Erj51VSLB+iVrs9NA2isZqYZ6FnXs/AtvXf4TomLdKJUPMZl863d7lqszilBuN0sEsclMdNeDTP7HnGUZay2jNm1P9gXk1u3sj9B+jP/DYohxs9gDYfxhzCCSsVxbAZlEp4+/7WkvdCwK2AFV0xi81jZUemEdWV1dgfX/Iqv4vHRt6zMmUSakB7j8NREvCOMd0y8eyVywax4RrlTLXtqDs/swHOZoRgRabdNtl99pi3f5YPx/E/PteS92ONqVWSO3w8n8CwzLGmOmc4d15YXx4Q7oxf9xNvBPt7BuAAZwULiwse2lvZ+mB9LcnBZnOfU7z/6IzVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrtqlwI917BueYUVd+Vj4XNp2MgxV5oyRTF8tuln7BI=;
 b=ekqYcGQizGX+hupoXdDnp5lx/V81+HA775CKTucUZ9cXpdehloEz0VGlDYur1fdFXZPmT45Xohp+X4jIUW/yF/F7ocSLqtvD2/Hs8oIB9A+QIhPSZB7qAhEVBwbugvSmpG5ezF/mVf1FT0fj7kxQ0A2tGoL62sms0o+v7vJizKZCb2mb454hKDdUH0kte8VWeyAxOey1iLHGOIhOMlEqhr+kcgpSIfNLxQh9wKgXpc3ixWo35+luwmJAM4VG9GLulxCzLZfHY9cTLGIBufBkvfMdP9VGWsyOa0q0I/+Qbs3Xf5H1TxK7DUrkIHWrw7kNxZ7/OWGklogy9PAdelBW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrtqlwI917BueYUVd+Vj4XNp2MgxV5oyRTF8tuln7BI=;
 b=NVS71tzMbJZenRTJdg6aH9ioiYPD147R7UHri7SW504YN9HhWCNWSNJ5AiD/OeqtZydZGUl6sqr8EUDxjmg+xYN/GgeZu54lAd8aVhSZ3y6nYy8syiq9BHL6B9cd1M/q3q7z4RNfA2Gj/xHK/eiawZ3AMJIpRko7ywrgPgfrm4k=
Received: from DS0PR17CA0013.namprd17.prod.outlook.com (2603:10b6:8:191::11)
 by CH3PR12MB8583.namprd12.prod.outlook.com (2603:10b6:610:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Thu, 8 Jun
 2023 06:39:53 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:191:cafe::a7) by DS0PR17CA0013.outlook.office365.com
 (2603:10b6:8:191::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Thu, 8 Jun 2023 06:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.24 via Frontend Transport; Thu, 8 Jun 2023 06:39:54 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Jun
 2023 01:39:48 -0500
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, <virtualization@lists.linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <xen-devel@lists.xenproject.org>
Subject: [LINUX KERNEL PATCH 1/1] virtgpu: init vq during resume and notify
 qemu guest status
Date: Thu, 8 Jun 2023 14:38:57 +0800
Message-ID: <20230608063857.1677973-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608063857.1677973-1-Jiqian.Chen@amd.com>
References: <20230608063857.1677973-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT064:EE_|CH3PR12MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: fda92b22-3c30-4018-db28-08db67eb2b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mraRXTL0VjJ+Icyy7dYgi2WD2hoFFqX1rpVqbf8b0tqCWFGKQFU4YNC5zoZKt5So0rNz36rg1ELrvgZmrEj8uXDhXTIRucl3hh8pJf9+3c+6VaiCl3IeaGvpqgpHFjiaWdKCPlmDl+OWIl8dyY+yHMDRcc6mmaQr872IKvzLH1kGiwRNm12xL3xd1f1zWGmTK4Qzggu2GkOLw4WyurJqCkRXrCIb3vQZgaNZ08qtQYskRJFTT0I9M271KSdrmhnFJaE5y+L0K6mUzWGLZCNvibUPaLBH2W6Q3oCSBrl2GG3nKrmdfuj4l+QJ/yIx7m3HEoC7EBIu/QU+x/kwP1EE5X/FoZ9oGA3A0z33JxP2Q2UHNDbLj6pFEEfJLjEgAwR3OOp+DxXrdhL02BskFb0mXJgkKc4BhpKhOAE+LTKNWxeYA9qHyQImerCoO2IqWSmbZ8BzFhMLk7CJ9kW2jS0hVkV8roXIH84yIyY9dZqQ4FTX7Czszf12FE+vFEbs81bBMFpbTlFVf3JKL056JmZICe9F0hMtIQKoamV/8BxwmltLIYAAVIXB3UcwbfCZ5DVE5Ce3Qh+0BdoaMUiBdvvKD/2jAc1vXtIeWsaODQKSXv1xflO1woDuDmhAI9bkTBNDCXf6cMPBr6mUYU8bs1xdAIrA0oYYOFtgrRFBwx5vdJ1gC896HotRtFH4AGE2P1G+353i7APj3jbYTAQHB/Axc7tznHgHsDrgCgrNy0MZPrcdt+4luosZ3DUsrGJaRVdMOEbqvjA8HRTiKgCbHkwxdB+HS6BLo0KlMsfwE11eZiw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(7416002)(83380400001)(47076005)(426003)(336012)(82740400003)(110136005)(54906003)(40480700001)(478600001)(8676002)(8936002)(41300700001)(316002)(70586007)(70206006)(356005)(921005)(81166007)(4326008)(5660300002)(86362001)(40460700003)(36756003)(6666004)(7696005)(2906002)(82310400005)(36860700001)(16526019)(186003)(1076003)(26005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:39:54.7181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fda92b22-3c30-4018-db28-08db67eb2b81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8583
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

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 32 ++++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h |  3 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c | 30 ++++++++++++++++++--------
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 15 +++++++++++++
 include/uapi/linux/virtio_gpu.h      |  9 ++++++++
 5 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index add075681e18..d5f9a6fbdbe4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -130,6 +130,34 @@ static void virtio_gpu_config_changed(struct virtio_device *vdev)
 	schedule_work(&vgdev->config_changed_work);
 }
 
+static int virtio_gpu_freeze(struct virtio_device *dev)
+{
+	struct drm_device *ddev = dev->priv;
+	struct virtio_gpu_device *vgdev = ddev->dev_private;
+	int ret;
+
+	ret = virtio_gpu_cmd_status_freezing(vgdev, 1);
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
+	if (!ret) {
+		ret = virtio_gpu_cmd_status_freezing(vgdev, 0);
+	}
+	return ret;
+}
+
 static struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_GPU, VIRTIO_DEV_ANY_ID },
 	{ 0 },
@@ -156,6 +184,10 @@ static struct virtio_driver virtio_gpu_driver = {
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
index af6ffb696086..7f9cc1f3ad98 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -282,6 +282,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
 /* virtgpu_kms.c */
+int virtio_gpu_init_vqs(struct virtio_device *vdev);
 int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev);
 void virtio_gpu_deinit(struct drm_device *dev);
 void virtio_gpu_release(struct drm_device *dev);
@@ -425,6 +426,8 @@ virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 				uint32_t width, uint32_t height,
 				uint32_t x, uint32_t y);
 
+int virtio_gpu_cmd_status_freezing(struct virtio_gpu_device *vgdev, uint32_t freezing);
+
 /* virtgpu_display.c */
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
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
index f556fde07b76..15b0c4d2f504 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -116,6 +116,9 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID,
 	VIRTIO_GPU_RESP_ERR_INVALID_CONTEXT_ID,
 	VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER,
+
+	/* status */
+	VIRTIO_GPU_CMD_STATUS_FREEZING = 0x1300,
 };
 
 enum virtio_gpu_shm_id {
@@ -453,4 +456,10 @@ struct virtio_gpu_resource_unmap_blob {
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

