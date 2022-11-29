Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335863D13B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 09:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A88010E425;
	Wed, 30 Nov 2022 08:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9130289654
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 15:18:26 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NM5Yc6XbdzmWL6;
 Tue, 29 Nov 2022 23:17:40 +0800 (CST)
Received: from huawei.com (10.67.175.21) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 29 Nov
 2022 23:18:19 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH v2 2/5] virtio-mem: Fix probe failed when modprobe virtio_mem
Date: Wed, 30 Nov 2022 00:06:12 +0800
Message-ID: <20221129160615.3343036-3-lizetao1@huawei.com>
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
  step 1: modprobe virtio_mem succeeded
    # modprobe virtio_mem      <-- OK

  step 2: fault injection in virtio_mem_init()
    # modprobe -r virtio_mem   <-- OK
    # ...
      CPU: 0 PID: 1837 Comm: modprobe Not tainted
      6.1.0-rc6-00285-g6a1e40c4b995-dirty
      Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
      Call Trace:
       <TASK>
       should_fail.cold+0x5/0x1f
       ...
       virtio_mem_init_hotplug+0x9ae/0xe57 [virtio_mem]
       virtio_mem_init.cold+0x327/0x339 [virtio_mem]
       virtio_mem_probe+0x48e/0x910 [virtio_mem]
       virtio_dev_probe+0x608/0xae0
       ...
       </TASK>
      virtio_mem virtio4: could not reserve device region
      virtio_mem: probe of virtio4 failed with error -16

  step 3: modprobe virtio_mem failed
    # modprobe virtio_mem       <-- failed
      virtio_mem: probe of virtio4 failed with error -16

The root cause of the problem is that the virtqueues are not
stopped on the error handling path when virtio_mem_init()
fails in virtio_mem_probe(), resulting in an error "-ENOENT"
returned in the next modprobe call in setup_vq().

virtio_pci_modern_device uses virtqueues to send or
receive message, and "queue_enable" records whether the
queues are available. In vp_modern_find_vqs(), all queues
will be selected and activated, but once queues are enabled
there is no way to go back except reset.

Fix it by reset virtio device on error handling path. After
virtio_mem_init_vq() succeeded, all virtqueues should be
stopped on error handling path.

Fixes: 5f1f79bbc9e2 ("virtio-mem: Paravirtualized memory hotplug")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
v1 -> v2: modify the description error of the test case in step 3 and
modify the fixes tag information.

 drivers/virtio/virtio_mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 0c2892ec6817..c7f09c2ce982 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2793,6 +2793,7 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 
 	return 0;
 out_del_vq:
+	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
 out_free_vm:
 	kfree(vm);
-- 
2.25.1

