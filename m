Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2E63D13D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 09:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A5510E428;
	Wed, 30 Nov 2022 08:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F189188FAE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 15:18:27 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NM5Yb6d5xzmWHl;
 Tue, 29 Nov 2022 23:17:39 +0800 (CST)
Received: from huawei.com (10.67.175.21) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 29 Nov
 2022 23:18:18 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Subject: [PATCH v2 1/5] 9p: Fix probe failed when modprobe 9pnet_virtio
Date: Wed, 30 Nov 2022 00:06:11 +0800
Message-ID: <20221129160615.3343036-2-lizetao1@huawei.com>
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
  step 1: modprobe 9pnet_virtio succeeded
    # modprobe 9pnet_virtio      <-- OK

  step 2: fault injection in sysfs_create_file()
    # modprobe -r 9pnet_virtio   <-- OK
    # ...
      FAULT_INJECTION: forcing a failure.
      name failslab, interval 1, probability 0, space 0, times 0
      CPU: 0 PID: 3790 Comm: modprobe Tainted: G        W
      6.1.0-rc6-00285-g6a1e40c4b995-dirty #108
      Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
      Call Trace:
       <TASK>
       ...
       should_failslab+0xa/0x20
       ...
       sysfs_create_file_ns+0x130/0x1d0
       p9_virtio_probe+0x662/0xb30 [9pnet_virtio]
       virtio_dev_probe+0x608/0xae0
       ...
       </TASK>
      9pnet_virtio: probe of virtio3 failed with error -12

  step 3: modprobe 9pnet_virtio failed
    # modprobe 9pnet_virtio       <-- failed
      9pnet_virtio: probe of virtio3 failed with error -2

The root cause of the problem is that the virtqueues are not
stopped on the error handling path when sysfs_create_file()
fails in p9_virtio_probe(), resulting in an error "-ENOENT"
returned in the next modprobe call in setup_vq().

virtio_pci_modern_device uses virtqueues to send or
receive message, and "queue_enable" records whether the
queues are available. In vp_modern_find_vqs(), all queues
will be selected and activated, but once queues are enabled
there is no way to go back except reset.

Fix it by reset virtio device on error handling path. After
virtio_find_single_vq() succeeded, all virtqueues should be
stopped on error handling path.

Fixes: ea52bf8eda98 ("9p/trans_virtio: reset virtio device on remove")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
Reviewed-by: Christian Schoenebeck <linux_oss@crudebyte.com>
---
v1 -> v2: modify the description error of the test case in step 3 and
modify the fixes tag information.

 net/9p/trans_virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index e757f0601304..39933187284b 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -668,6 +668,7 @@ static int p9_virtio_probe(struct virtio_device *vdev)
 out_free_tag:
 	kfree(tag);
 out_free_vq:
+	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
 out_free_chan:
 	kfree(chan);
-- 
2.25.1

