Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE852F4C9
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 23:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D3710E3B2;
	Fri, 20 May 2022 21:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0854410E3B2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 21:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653080979; x=1684616979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jXFjX5NYE4I4epiDgpJ4pSPnxwQNEv84pcFhL6WsAOs=;
 b=m269b2xmy6u2US3rn8rF6Cn2RtGi/r9y0l2Jtk4zM6J+xHfNd4VbaEDd
 LFgfYTBIn43AoThAiuGSHJHOVc5MYsCI4N4ZBiGrkWjcyvxxeXX5YAJ1p
 Opr70wI1sHIZY1YdCUeZ4X+MkDQijBlIzSgJJksFUbHzVV9EZ87PXPD8e
 GeCnTPyl0xg1pYXyYuOw5DB7AHrjmfyUFp8a8Ugv8LWeexSZUhvevFlWN
 kzQzUX+xSkwUyGsK1p+m1zkf6vzn2Gj+HY0JZ+IUTX9L5NI0Ca3wFESjW
 loD9HXFfu5YLdT/d3r9G3a6d3ssjfRUJce6huD6Qx132tB5aHb5/CzTuc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="333365568"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="333365568"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:09:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="557626674"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:09:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] udmabuf: Set the DMA mask for the udmabuf device (v2)
Date: Fri, 20 May 2022 13:52:35 -0700
Message-Id: <20220520205235.3687336-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <CACT4Y+ZiexzqBxeDQJAeQMR7Ef=JSh-2S8P73LN2BnibXhiC3Q@mail.gmail.com>
References: <CACT4Y+ZiexzqBxeDQJAeQMR7Ef=JSh-2S8P73LN2BnibXhiC3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the DMA mask is not set explicitly, the following warning occurs
when the userspace tries to access the dma-buf via the CPU as
reported by syzbot here:

WARNING: CPU: 1 PID: 3595 at kernel/dma/mapping.c:188
__dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Modules linked in:
CPU: 0 PID: 3595 Comm: syz-executor249 Not tainted
5.17.0-rc2-syzkaller-00316-g0457e5153e0e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
Google 01/01/2011
RIP: 0010:__dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Code: 00 00 00 00 00 fc ff df 48 c1 e8 03 80 3c 10 00 75 71 4c 8b 3d c0
83 b5 0d e9 db fe ff ff e8 b6 0f 13 00 0f 0b e8 af 0f 13 00 <0f> 0b 45
   31 e4 e9 54 ff ff ff e8 a0 0f 13 00 49 8d 7f 50 48 b8 00
RSP: 0018:ffffc90002a07d68 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff88807e25e2c0 RSI: ffffffff81649e91 RDI: ffff88801b848408
RBP: ffff88801b848000 R08: 0000000000000002 R09: ffff88801d86c74f
R10: ffffffff81649d72 R11: 0000000000000001 R12: 0000000000000002
R13: ffff88801d86c680 R14: 0000000000000001 R15: 0000000000000000
FS:  0000555556e30300(0000) GS:ffff8880b9d00000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200000cc CR3: 000000001d74a000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dma_map_sgtable+0x70/0xf0 kernel/dma/mapping.c:264
 get_sg_table.isra.0+0xe0/0x160 drivers/dma-buf/udmabuf.c:72
 begin_cpu_udmabuf+0x130/0x1d0 drivers/dma-buf/udmabuf.c:126
 dma_buf_begin_cpu_access+0xfd/0x1d0 drivers/dma-buf/dma-buf.c:1164
 dma_buf_ioctl+0x259/0x2b0 drivers/dma-buf/dma-buf.c:363
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f62fcf530f9
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89
f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe3edab9b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f62fcf530f9
RDX: 0000000020000200 RSI: 0000000040086200 RDI: 0000000000000006
RBP: 00007f62fcf170e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f62fcf17170
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

v2: Dont't forget to deregister if DMA mask setup fails.

Reported-by: syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index e7330684d3b8..384cb3d06ff3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -365,7 +365,23 @@ static struct miscdevice udmabuf_misc = {
 
 static int __init udmabuf_dev_init(void)
 {
-	return misc_register(&udmabuf_misc);
+	int ret;
+
+	ret = misc_register(&udmabuf_misc);
+	if (ret < 0) {
+		pr_err("Could not initialize udmabuf device\n");
+		return ret;
+	}
+
+	ret = dma_coerce_mask_and_coherent(udmabuf_misc.this_device,
+					   DMA_BIT_MASK(64));
+	if (ret < 0) {
+		pr_err("Could not setup DMA mask for udmabuf device\n");
+		misc_deregister(&udmabuf_misc);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void __exit udmabuf_dev_exit(void)
-- 
2.35.1

