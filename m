Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43BA63D145
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307AC10E427;
	Wed, 30 Nov 2022 09:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FEC89711
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 15:18:26 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NM5Yh4Z1Wz15MyW;
 Tue, 29 Nov 2022 23:17:44 +0800 (CST)
Received: from huawei.com (10.67.175.21) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 29 Nov
 2022 23:18:22 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH v2 5/5] drm/virtio: Fix probe failed when modprobe virtio_gpu
Date: Wed, 30 Nov 2022 00:06:15 +0800
Message-ID: <20221129160615.3343036-6-lizetao1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129160615.3343036-1-lizetao1@huawei.com>
References: <20221128021005.232105-1-lizetao1@huawei.com>
 <20221129160615.3343036-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.21]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 30 Nov 2022 08:58:34 +0000
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
Cc: lucho@ionkov.net, david@redhat.com, jasowang@redhat.com,
 linux_oss@crudebyte.com, pmorel@linux.vnet.ibm.com,
 dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org,
 edumazet@google.com, kraxel@redhat.com, kuba@kernel.org, pabeni@redhat.com,
 asmadeus@codewreck.org, st@redhat.com, ericvh@gmail.com, rusty@rustcorp.com.au,
 linux-block@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 stefanha@redhat.com, airlied@redhat.com, cornelia.huck@de.ibm.com,
 virtualization@lists.linux-foundation.org, axboe@kernel.dk,
 pankaj.gupta.linux@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pbonzini@redhat.com, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When doing the following test steps, an error was found:
  step 1: modprobe virtio_gpu succeeded
    # modprobe virtio_gpu      <-- OK

  step 2: fault injection in virtio_gpu_alloc_vbufs()
    # modprobe -r virtio_gpu   <-- OK
    # ...
      CPU: 0 PID: 1714 Comm: modprobe Not tainted 6.1.0-rc7-dirty
      Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
      Call Trace:
       <TASK>
       should_fail_ex.cold+0x1a/0x1f
       ...
       kmem_cache_create+0x12/0x20
       virtio_gpu_alloc_vbufs+0x2f/0x90 [virtio_gpu]
       virtio_gpu_init.cold+0x659/0xcad [virtio_gpu]
       virtio_gpu_probe+0x14f/0x260 [virtio_gpu]
       virtio_dev_probe+0x608/0xae0
       ?...
       </TASK>
      kmem_cache_create_usercopy(virtio-gpu-vbufs) failed with error -12

  step 3: modprobe virtio_gpu failed
    # modprobe virtio_gpu       <-- failed
      failed to find virt queues
      virtio_gpu: probe of virtio6 failed with error -2

The root cause of the problem is that the virtqueues are not
stopped on the error handling path when virtio_gpu_alloc_vbufs()
fails in virtio_gpu_init(), resulting in an error "-ENOENT"
returned in the next modprobe call in setup_vq().

virtio_pci_modern_device uses virtqueues to send or
receive message, and "queue_enable" records whether the
queues are available. In vp_modern_find_vqs(), all queues
will be selected and activated, but once queues are enabled
there is no way to go back except reset.

Fix it by reset virtio device on error handling path. After
virtio_find_vqs() succeeded, all virtqueues should be stopped
on error handling path.

Fixes: dc5698e80cf7 ("Add virtio gpu driver.")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: patch is new.

 drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 27b7f14dae89..1a03e8e13b5b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -255,6 +255,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 err_scanouts:
 	virtio_gpu_free_vbufs(vgdev);
 err_vbufs:
+	virtio_reset_device(vgdev->vdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 err_vqs:
 	dev->dev_private = NULL;
-- 
2.25.1

