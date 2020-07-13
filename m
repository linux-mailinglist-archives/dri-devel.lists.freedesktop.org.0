Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 548DF21E8F8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEAC6E90F;
	Tue, 14 Jul 2020 07:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551766E10C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 02:58:26 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3628DE0009133F1570D6;
 Mon, 13 Jul 2020 10:58:20 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Jul 2020
 10:58:18 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <b.zolnierkie@samsung.com>
Subject: [PATCH] vgacon: Fix an out-of-bounds in vgacon_scrollback_update()
Date: Mon, 13 Jul 2020 10:57:30 +0000
Message-ID: <20200713105730.550334-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I got a slab-out-of-bounds report when I doing fuzz test.

[  334.989515] ==================================================================
[  334.989577] BUG: KASAN: slab-out-of-bounds in vgacon_scroll+0x57a/0x8ed
[  334.989588] Write of size 1766 at addr ffff8883de69ff3e by task test/2658
[  334.989593]
[  334.989608] CPU: 3 PID: 2658 Comm: test Not tainted 5.7.0-rc5-00005-g152036d1379f #789
[  334.989617] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
[  334.989624] Call Trace:
[  334.989646]  dump_stack+0xe4/0x14e
[  334.989676]  print_address_description.constprop.5+0x3f/0x60
[  334.989699]  ? vgacon_scroll+0x57a/0x8ed
[  334.989710]  __kasan_report.cold.8+0x92/0xaf
[  334.989735]  ? vgacon_scroll+0x57a/0x8ed
[  334.989761]  kasan_report+0x37/0x50
[  334.989789]  check_memory_region+0x1c1/0x1e0
[  334.989806]  memcpy+0x38/0x60
[  334.989824]  vgacon_scroll+0x57a/0x8ed
[  334.989876]  con_scroll+0x4ef/0x5e0
[  334.989904]  ? lockdep_hardirqs_on+0x5e0/0x5e0
[  334.989934]  lf+0x24f/0x2a0
[  334.989951]  ? con_scroll+0x5e0/0x5e0
[  334.989975]  ? find_held_lock+0x33/0x1c0
[  334.990005]  do_con_trol+0x313/0x5ff0
[  334.990027]  ? lock_downgrade+0x730/0x730
[  334.990045]  ? reset_palette+0x440/0x440
[  334.990070]  ? _raw_spin_unlock_irqrestore+0x4b/0x60
[  334.990095]  ? notifier_call_chain+0x120/0x170
[  334.990132]  ? __atomic_notifier_call_chain+0xf0/0x180
[  334.990160]  do_con_write.part.16+0xb2b/0x1b20
[  334.990238]  ? do_con_trol+0x5ff0/0x5ff0
[  334.990258]  ? mutex_lock_io_nested+0x1280/0x1280
[  334.990269]  ? rcu_read_unlock+0x50/0x50
[  334.990315]  ? __mutex_unlock_slowpath+0xd9/0x670
[  334.990340]  ? lockdep_hardirqs_on+0x3a2/0x5e0
[  334.990368]  con_write+0x36/0xc0
[  334.990389]  do_output_char+0x561/0x780
[  334.990414]  n_tty_write+0x58e/0xd30
[  334.990478]  ? n_tty_read+0x1800/0x1800
[  334.990500]  ? prepare_to_wait_exclusive+0x300/0x300
[  334.990525]  ? __might_fault+0x17a/0x1c0
[  334.990557]  tty_write+0x430/0x960
[  334.990568]  ? n_tty_read+0x1800/0x1800
[  334.990600]  ? tty_release+0x1280/0x1280
[  334.990622]  __vfs_write+0x81/0x100
[  334.990648]  vfs_write+0x1ce/0x510
[  334.990676]  ksys_write+0x104/0x200
[  334.990691]  ? __ia32_sys_read+0xb0/0xb0
[  334.990708]  ? trace_hardirqs_on_thunk+0x1a/0x1c
[  334.990725]  ? trace_hardirqs_off_caller+0x40/0x1a0
[  334.990744]  ? do_syscall_64+0x3b/0x5e0
[  334.990775]  do_syscall_64+0xc8/0x5e0
[  334.990798]  entry_SYSCALL_64_after_hwframe+0x49/0xb3
[  334.990811] RIP: 0033:0x44f369
[  334.990827] Code: 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
[  334.990834] RSP: 002b:00007ffe9ace0968 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  334.990848] RAX: ffffffffffffffda RBX: 0000000000400418 RCX: 000000000044f369
[  334.990856] RDX: 0000000000000381 RSI: 0000000020003500 RDI: 0000000000000003
[  334.990865] RBP: 00007ffe9ace0980 R08: 0000000020003530 R09: 00007ffe9ace0980
[  334.990873] R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000402110
[  334.990881] R13: 0000000000000000 R14: 00000000006bf018 R15: 0000000000000000
[  334.990937]
[  334.990943] The buggy address belongs to the page:
[  334.990962] page:ffffea000f79a400 refcount:1 mapcount:0 mapping:000000002bff47b3 index:0x0 head:ffffea000f79a400 order:4 compound_mapcount:0 compound_pincount:0
[  334.990973] flags: 0x2fffff80010000(head)
[  334.990992] raw: 002fffff80010000 dead000000000100 dead000000000122 0000000000000000
[  334.991006] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
[  334.991013] page dumped because: kasan: bad access detected
[  334.991017]
[  334.991023] Memory state around the buggy address:
[  334.991034]  ffff8883de6a0000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  334.991044]  ffff8883de6a0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  334.991054] >ffff8883de6a0100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc
[  334.991061]                                                              ^
[  334.991071]  ffff8883de6a0180: fc fc fc fc fc fc 00 00 00 00 00 00 00 00 00 00
[  334.991082]  ffff8883de6a0200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  334.991088] ==================================================================

Because vgacon_scrollback_cur->tail plus memcpy size is greater than
vgacon_scrollback_cur->size. Fix this by checking the memcpy size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/video/console/vgacon.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 998b0de1812f..b51ffb9a208d 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -243,6 +243,7 @@ static void vgacon_scrollback_startup(void)
 static void vgacon_scrollback_update(struct vc_data *c, int t, int count)
 {
 	void *p;
+	int size;
 
 	if (!vgacon_scrollback_cur->data || !vgacon_scrollback_cur->size ||
 	    c->vc_num != fg_console)
@@ -251,13 +252,17 @@ static void vgacon_scrollback_update(struct vc_data *c, int t, int count)
 	p = (void *) (c->vc_origin + t * c->vc_size_row);
 
 	while (count--) {
+		size = vgacon_scrollback_cur->size - vgacon_scrollback_cur->tail;
+		if (size > c->vc_size_row)
+			size = c->vc_size_row;
+
 		scr_memcpyw(vgacon_scrollback_cur->data +
 			    vgacon_scrollback_cur->tail,
-			    p, c->vc_size_row);
+			    p, size);
 
 		vgacon_scrollback_cur->cnt++;
-		p += c->vc_size_row;
-		vgacon_scrollback_cur->tail += c->vc_size_row;
+		p += size;
+		vgacon_scrollback_cur->tail += size;
 
 		if (vgacon_scrollback_cur->tail >= vgacon_scrollback_cur->size)
 			vgacon_scrollback_cur->tail = 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
