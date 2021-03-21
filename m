Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FC23431E1
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 10:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46156E1B4;
	Sun, 21 Mar 2021 09:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1850 seconds by postgrey-1.36 at gabe;
 Sun, 21 Mar 2021 08:59:42 UTC
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEED6E18E;
 Sun, 21 Mar 2021 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=K1gDIG4hnr2XFeqCAC
 HAQWV6JzEkVMdv0O0bEPt20sY=; b=JqL4fsEHNFQZYl21uI3iNqI7y5pdPgzelu
 vYtwxB+kxNKzAJ/g8zgFtbG6KgHAwbDaJ9I7OWSufhX2VLtKwhAZsGbCA3cG0ypC
 sPUjNDGtOKcz+OEOClRqo4GhD5X00UQy36OtL16iR17fhgYUBEW7QGXdzsTzb+Vj
 5NEAGg3Qk=
Received: from localhost.localdomain.localdomain (unknown [182.150.46.145])
 by smtp3 (Coremail) with SMTP id DcmowAAHDemnA1dgNdOYPg--.35025S2;
 Sun, 21 Mar 2021 16:28:24 +0800 (CST)
From: Qu Huang <jinsdb@126.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amdkfd: Fix cat debugfs hang_hws file causes system crash
 bug
Date: Sun, 21 Mar 2021 16:28:18 +0800
Message-Id: <1616315298-109091-1-git-send-email-jinsdb@126.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: DcmowAAHDemnA1dgNdOYPg--.35025S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF43Gw4xAr17KF43tw4fXwb_yoW5WFWrpw
 4UAr15Krs5Ary7Jry5A3WfJwn3Kws7Zay8ZrW8urySyF1kG3sxJrykJFWUArykuryUGFW7
 XFZ8X3yfKr17taUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U02NNUUUUU=
X-Originating-IP: [182.150.46.145]
X-CM-SenderInfo: pmlq2vbe6rjloofrz/1tbiEAhcDlpECjTS-AAAsE
X-Mailman-Approved-At: Sun, 21 Mar 2021 09:33:14 +0000
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
Cc: jinsdb@126.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here is the system crash log:
[ 1272.884438] BUG: unable to handle kernel NULL pointer dereference at
(null)
[ 1272.884444] IP: [<          (null)>]           (null)
[ 1272.884447] PGD 825b09067 PUD 8267c8067 PMD 0
[ 1272.884452] Oops: 0010 [#1] SMP
[ 1272.884509] CPU: 13 PID: 3485 Comm: cat Kdump: loaded Tainted: G
[ 1272.884515] task: ffff9a38dbd4d140 ti: ffff9a37cd3b8000 task.ti:
ffff9a37cd3b8000
[ 1272.884517] RIP: 0010:[<0000000000000000>]  [<          (null)>]
(null)
[ 1272.884520] RSP: 0018:ffff9a37cd3bbe68  EFLAGS: 00010203
[ 1272.884522] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000014d5f
[ 1272.884524] RDX: fffffffffffffff4 RSI: 0000000000000001 RDI:
ffff9a38aca4d200
[ 1272.884526] RBP: ffff9a37cd3bbed0 R08: ffff9a38dcd5f1a0 R09:
ffff9a31ffc07300
[ 1272.884527] R10: ffff9a31ffc07300 R11: ffffffffaddd5e9d R12:
ffff9a38b4e0fb00
[ 1272.884529] R13: 0000000000000001 R14: ffff9a37cd3bbf18 R15:
ffff9a38aca4d200
[ 1272.884532] FS:  00007feccaa67740(0000) GS:ffff9a38dcd40000(0000)
knlGS:0000000000000000
[ 1272.884534] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1272.884536] CR2: 0000000000000000 CR3: 00000008267c0000 CR4:
00000000003407e0
[ 1272.884537] Call Trace:
[ 1272.884544]  [<ffffffffade68940>] ? seq_read+0x130/0x440
[ 1272.884548]  [<ffffffffade40f8f>] vfs_read+0x9f/0x170
[ 1272.884552]  [<ffffffffade41e4f>] SyS_read+0x7f/0xf0
[ 1272.884557]  [<ffffffffae374ddb>] system_call_fastpath+0x22/0x27
[ 1272.884558] Code:  Bad RIP value.
[ 1272.884562] RIP  [<          (null)>]           (null)
[ 1272.884564]  RSP <ffff9a37cd3bbe68>
[ 1272.884566] CR2: 0000000000000000

Signed-off-by: Qu Huang <jinsdb@126.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c b/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
index 511712c..673d5e3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
@@ -33,6 +33,11 @@ static int kfd_debugfs_open(struct inode *inode, struct file *file)

 	return single_open(file, show, NULL);
 }
+static int kfd_debugfs_hang_hws_read(struct seq_file *m, void *data)
+{
+	seq_printf(m, "echo gpu_id > hang_hws\n");
+	return 0;
+}

 static ssize_t kfd_debugfs_hang_hws_write(struct file *file,
 	const char __user *user_buf, size_t size, loff_t *ppos)
@@ -94,7 +99,7 @@ void kfd_debugfs_init(void)
 	debugfs_create_file("rls", S_IFREG | 0444, debugfs_root,
 			    kfd_debugfs_rls_by_device, &kfd_debugfs_fops);
 	debugfs_create_file("hang_hws", S_IFREG | 0200, debugfs_root,
-			    NULL, &kfd_debugfs_hang_hws_fops);
+			    kfd_debugfs_hang_hws_read, &kfd_debugfs_hang_hws_fops);
 }

 void kfd_debugfs_fini(void)
--
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
