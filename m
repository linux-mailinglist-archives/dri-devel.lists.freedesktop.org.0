Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F4BC518CC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 11:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1724210E1B3;
	Wed, 12 Nov 2025 10:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="0qh8C1VQ";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="0qh8C1VQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1001 seconds by postgrey-1.36 at gabe;
 Wed, 12 Nov 2025 07:36:05 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2A010E6BB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:36:05 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=irUYqWMOySTEOFqOXf1mC30hXOb+We/PmI+gXOE9qqA=;
 b=0qh8C1VQEQBhlxZ+YTNIaa2TvA7bkXHSTRPozST6Cuzum6aFvy/PZ/lIMOC724yu+SBu8zlhU
 s/+4FjyDGIK8VpX0klYMK5qTyHP4dWa0rgBL2WikLsuWQ4ppaCzY+8B5zoAdCe2MoQKqPSR5c6q
 IUpyc5ttMQ17X3cmj71vA3c=
Received: from canpmsgout02.his.huawei.com (unknown [172.19.92.185])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4d5vsF4m8Zz1BFn4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 15:18:57 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=irUYqWMOySTEOFqOXf1mC30hXOb+We/PmI+gXOE9qqA=;
 b=0qh8C1VQEQBhlxZ+YTNIaa2TvA7bkXHSTRPozST6Cuzum6aFvy/PZ/lIMOC724yu+SBu8zlhU
 s/+4FjyDGIK8VpX0klYMK5qTyHP4dWa0rgBL2WikLsuWQ4ppaCzY+8B5zoAdCe2MoQKqPSR5c6q
 IUpyc5ttMQ17X3cmj71vA3c=
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4d5vqX5nKMzcbQc;
 Wed, 12 Nov 2025 15:17:28 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id 1BB9A14022E;
 Wed, 12 Nov 2025 15:19:18 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 12 Nov
 2025 15:19:17 +0800
From: Gu Bowen <gubowen5@huawei.com>
To: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>
CC: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <stable@vger.kernel.org>, Lu Jialin <lujialin4@huawei.com>, Gu Bowen
 <gubowen5@huawei.com>
Subject: [PATCH stable] fbdev: Fix out-of-bounds issue in sys_fillrect()
Date: Wed, 12 Nov 2025 15:32:07 +0800
Message-ID: <20251112073207.1731125-1-gubowen5@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-Mailman-Approved-At: Wed, 12 Nov 2025 10:06:49 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was an out-of-bounds issue found by syzkaller test on v6.6.

BUG: unable to handle page fault for address: ffffc90000c3f000
PGD 100000067 P4D 100000067 PUD 100c80067 PMD 10ac1c067 PTE 0
Oops: 0002 [#1] PREEMPT SMP KASAN PTI
CPU: 3 PID: 6521 Comm: syz.3.1365 Not tainted 6.6.0+ #82
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
RIP: 0010:memset64 arch/x86/include/asm/string_64.h:58 [inline]
RIP: 0010:memset_l include/linux/string.h:168 [inline]
RIP: 0010:bitfill_aligned drivers/video/fbdev/core/sysfillrect.c:53 [inline]
RIP: 0010:bitfill_aligned+0x144/0x1c0 drivers/video/fbdev/core/sysfillrect.c:25
Code: 23 04 24 48 31 d0 49 89 46 f8 44 89 e0 44 29 f8 29 c3 e8 9f 39 49 fe 89 d8 31 d2 4c 89 f7 41 f7 f4 48 89 c3 48 89 c1 48 89 e8 <f3> 48 ab 31 ff 4c 89 ee e8 df 2f 49 fe 4d 85 ed 0f 84 6b ff ff ff
RSP: 0018:ffff888119ce7418 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000180 RCX: 0000000000000180
RDX: 0000000000000000 RSI: ffffc90003873000 RDI: ffffc90000c3f000
RBP: 0000000000000000 R08: 0000000000006000 R09: 0000000000000040
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000040
R13: 0000000000000000 R14: ffffc90000c3f000 R15: 0000000000000000
FS:  00007f1704b926c0(0000) GS:ffff8881f5980000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc90000c3f000 CR3: 00000001230d0002 CR4: 0000000000770ee0
DR0: 0000000000000000 DR1: 000000000000e000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
PKRU: 80000000
Call Trace:
 <TASK>
 sys_fillrect+0x429/0x830 drivers/video/fbdev/core/sysfillrect.c:281
 drm_fbdev_generic_defio_fillrect+0x27/0x140 drivers/gpu/drm/drm_fbdev_generic.c:37
 bit_clear+0x183/0x220 drivers/video/fbdev/core/bitblit.c:73
 __fbcon_clear+0x5ea/0x670 drivers/video/fbdev/core/fbcon.c:1281
 fbcon_scroll+0x41e/0x560 drivers/video/fbdev/core/fbcon.c:1847
 con_scroll+0x464/0x6a0 drivers/tty/vt/vt.c:577
 lf+0x274/0x2d0 drivers/tty/vt/vt.c:1461
 do_con_trol+0x5ea/0x3d80 drivers/tty/vt/vt.c:2149
 do_con_write+0x780/0x10c0 drivers/tty/vt/vt.c:2905
 con_write+0x28/0xc0 drivers/tty/vt/vt.c:3245
 do_output_char+0x5de/0x850 drivers/tty/n_tty.c:433
 process_output drivers/tty/n_tty.c:500 [inline]
 n_tty_write+0x442/0xb00 drivers/tty/n_tty.c:2406
 iterate_tty_write+0x2b5/0x630 drivers/tty/tty_io.c:1017
 file_tty_write.constprop.0+0x20c/0x3b0 drivers/tty/tty_io.c:1088
 call_write_iter include/linux/fs.h:2085 [inline]
 do_iter_readv_writev+0x210/0x3c0 fs/read_write.c:737
 do_iter_write+0x181/0x4e0 fs/read_write.c:862
 vfs_writev+0x15b/0x4d0 fs/read_write.c:935
 do_writev+0x136/0x370 fs/read_write.c:978
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x59/0x110 arch/x86/entry/common.c:81
 entry_SYSCALL_64_after_hwframe+0x78/0xe2

When the virtual console is rotated in the backend state, it can lead to
inconsistencies between the size of the virtual console's size and its
hook functions. In such cases, clearing the screen may result in
out-of-bounds issue.

Fix it by adding a check in sys_fillrect() and moving set_blitting_type()
to the visible area of the VC.

CC: stable@vger.kernel.org      # fbdev had been refactored on 6.15-rc1
Fixes: 68648ed1f58d ("fbdev: add drawing functions for framebuffers in system RAM")
Signed-off-by: Gu Bowen <gubowen5@huawei.com>
---
 drivers/video/fbdev/core/fbcon.c       | 2 +-
 drivers/video/fbdev/core/sysfillrect.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b49f15a3442e..a6602f230089 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2702,9 +2702,9 @@ static void fbcon_modechanged(struct fb_info *info)
 		return;
 
 	p = &fb_display[vc->vc_num];
-	set_blitting_type(vc, info);
 
 	if (con_is_visible(vc)) {
+		set_blitting_type(vc, info);
 		var_to_display(p, &info->var, info);
 		cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
 		rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
index bcdcaeae6538..e5c4ee317b0b 100644
--- a/drivers/video/fbdev/core/sysfillrect.c
+++ b/drivers/video/fbdev/core/sysfillrect.c
@@ -238,6 +238,7 @@ void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 	u32 bpp = p->var.bits_per_pixel;
 	unsigned long *dst;
 	int dst_idx, left;
+	long dst_offset;
 
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
@@ -277,6 +278,11 @@ void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 		}
 		while (height--) {
 			dst += dst_idx >> (ffs(bits) - 1);
+			dst_offset = (unsigned long)dst - (unsigned long)p->screen_base;
+			if (dst_offset < 0 || dst_offset >= p->fix.smem_len) {
+				pr_err("dst offset out of bound: dst_offset(%ld)", dst_offset);
+				return;
+			}
 			dst_idx &= (bits - 1);
 			fill_op32(p, dst, dst_idx, pat, width*bpp, bits);
 			dst_idx += p->fix.line_length*8;
-- 
2.43.0

