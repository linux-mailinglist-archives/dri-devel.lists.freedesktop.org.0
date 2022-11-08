Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18D6217DB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3355310E47B;
	Tue,  8 Nov 2022 15:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19FE10E2B4;
 Tue,  8 Nov 2022 15:17:23 +0000 (UTC)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N6BXj50b1z15MPd;
 Tue,  8 Nov 2022 23:17:09 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 23:17:20 +0800
From: Wei Li <liwei391@huawei.com>
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/qxl: Fix missing free_irq
Date: Tue, 8 Nov 2022 23:16:01 +0800
Message-ID: <20221108151601.1235068-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected
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
Cc: spice-devel@lists.freedesktop.org, liwei391@huawei.com,
 huawei.libin@huawei.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When doing "cat /proc/interrupts" after qxl.ko is unloaded, an oops occurs:

BUG: unable to handle page fault for address: ffffffffc0274769
PGD 2a0d067 P4D 2a0d067 PUD 2a0f067 PMD 103f39067 PTE 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 6 PID: 246 Comm: cat Not tainted 6.1.0-rc2 #24
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:string_nocheck+0x34/0x50
Code: 66 85 c0 74 3c 83 e8 01 4c 8d 5c 07 01 31 c0 eb 19 49 39 fa 76 03 44 88 07 48 83 c7
RSP: 0018:ffffc90000893bb8 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffffc90000893c50 RCX: ffff0a00ffffff04
RDX: ffffffffc0274769 RSI: ffff888102812000 RDI: ffff88810281133e
RBP: ffff888102812000 R08: ffffffff823fa5e6 R09: 0000000000000007
R10: ffff888102812000 R11: ffff88820281133d R12: ffffffffc0274769
R13: ffff0a00ffffff04 R14: 0000000000000cc4 R15: ffffffff823276b4
FS:  000000000214f8c0(0000) GS:ffff88842fd80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffc0274769 CR3: 00000001025c4005 CR4: 0000000000770ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 <TASK>
 string+0x46/0x60
 vsnprintf+0x27a/0x4f0
 seq_vprintf+0x34/0x50
 seq_printf+0x53/0x70
 ? seq_read_iter+0x365/0x450
 show_interrupts+0x259/0x330
 seq_read_iter+0x2a3/0x450
 proc_reg_read_iter+0x47/0x70
 generic_file_splice_read+0x94/0x160
 splice_direct_to_actor+0xb0/0x230
 ? do_splice_direct+0xd0/0xd0
 do_splice_direct+0x8b/0xd0
 do_sendfile+0x345/0x4f0
 __x64_sys_sendfile64+0xa1/0xc0
 do_syscall_64+0x38/0x90
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x4bb0ce
Code: c3 0f 1f 00 4c 89 d2 4c 89 c6 e9 bd fd ff ff 0f 1f 44 00 00 31 c0 c3 0f 1f 44 00 00
RSP: 002b:00007ffd99dc3fb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 0000000001000000 RCX: 00000000004bb0ce
RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
RBP: 0000000000000001 R08: 000000000068f240 R09: 0000000001000000
R10: 0000000001000000 R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

It seems that qxl doesn't free the interrupt it requests during unload,
fix this by adding the missing free_irq().

Fixes: f64122c1f6ad ("drm: add new QXL driver. (v1.4)")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index dc3828db1991..d591084824de 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -283,6 +283,8 @@ int qxl_device_init(struct qxl_device *qdev,
 void qxl_device_fini(struct qxl_device *qdev)
 {
 	int cur_idx;
+	struct drm_device *ddev = &qdev->ddev;
+	struct pci_dev *pdev = to_pci_dev(ddev->dev);
 
 	/* check if qxl_device_init() was successful (gc_work is initialized last) */
 	if (!qdev->gc_work.func)
@@ -305,6 +307,7 @@ void qxl_device_fini(struct qxl_device *qdev)
 	wait_event_timeout(qdev->release_event,
 			   atomic_read(&qdev->release_count) == 0,
 			   HZ);
+	free_irq(pdev->irq, ddev);
 	flush_work(&qdev->gc_work);
 	qxl_surf_evict(qdev);
 	qxl_vram_evict(qdev);
-- 
2.25.1

