Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57A17CEFC
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 16:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477026E23D;
	Sat,  7 Mar 2020 15:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
 [202.108.3.165])
 by gabe.freedesktop.org (Postfix) with SMTP id DA13A6E1C4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 12:04:42 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.130.245.189])
 by sina.com with ESMTP
 id 5E638DD00000C216; Sat, 7 Mar 2020 20:04:40 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 473524629061
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in dmabuffs_dname
Date: Sat,  7 Mar 2020 20:04:23 +0800
Message-Id: <20200307120423.8256-1-hdanton@sina.com>
In-Reply-To: <000000000000d0f3cb05a03d37ec@google.com>
References: 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 07 Mar 2020 15:19:21 +0000
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 06 Mar 2020 21:41:13 -0800
> syzbot found the following crash on:
> 
> HEAD commit:    63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11653ac3e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9833e26bab355358
> dashboard link: https://syzkaller.appspot.com/bug?extid=3643a18836bce555bff6
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this crash yet.
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: use-after-free in dmabuffs_dname+0x4f4/0x560 drivers/dma-buf/dma-buf.c:48
> Read of size 8 at addr ffff8880a6b390e8 by task syz-executor.1/2394
> 
> CPU: 1 PID: 2394 Comm: syz-executor.1 Not tainted 5.6.0-rc3-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x197/0x210 lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
>  __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
>  kasan_report+0x12/0x20 mm/kasan/common.c:641
>  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
>  dmabuffs_dname+0x4f4/0x560 drivers/dma-buf/dma-buf.c:48
>  tomoyo_realpath_from_path+0x165/0x660 security/tomoyo/realpath.c:259
>  tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
>  tomoyo_check_open_permission+0x2a3/0x3e0 security/tomoyo/file.c:771
>  tomoyo_file_open security/tomoyo/tomoyo.c:319 [inline]
>  tomoyo_file_open+0xa9/0xd0 security/tomoyo/tomoyo.c:314
>  security_file_open+0x71/0x300 security/security.c:1529
>  do_dentry_open+0x37a/0x1380 fs/open.c:784
>  vfs_open+0xa0/0xd0 fs/open.c:914
>  do_last fs/namei.c:3490 [inline]
>  path_openat+0x12ee/0x3490 fs/namei.c:3607
>  do_filp_open+0x192/0x260 fs/namei.c:3637
>  do_sys_openat2+0x5eb/0x7e0 fs/open.c:1149
>  do_sys_open+0xf2/0x180 fs/open.c:1165
>  __do_compat_sys_open fs/open.c:1212 [inline]
>  __se_compat_sys_open fs/open.c:1210 [inline]
>  __ia32_compat_sys_open+0x79/0xb0 fs/open.c:1210
>  do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
>  do_fast_syscall_32+0x27b/0xe16 arch/x86/entry/common.c:408
>  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
> RIP: 0023:0xf7fd8e39
> Code: 1d 00 00 00 89 d3 5b 5e 5d c3 8b 04 24 c3 8b 1c 24 c3 8b 3c 24 c3 90 90 90 90 90 90 90 90 90 90 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
> RSP: 002b:00000000f5db2014 EFLAGS: 00000296 ORIG_RAX: 0000000000000005
> RAX: ffffffffffffffda RBX: 00000000f5db204c RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000c09 RDI: 00000000f5db204c
> RBP: 00000000f5db2168 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> 
> Allocated by task 2388:
>  save_stack+0x23/0x90 mm/kasan/common.c:72
>  set_track mm/kasan/common.c:80 [inline]
>  __kasan_kmalloc mm/kasan/common.c:515 [inline]
>  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:488
>  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:529
>  __do_kmalloc mm/slab.c:3656 [inline]
>  __kmalloc+0x163/0x770 mm/slab.c:3665
>  kmalloc include/linux/slab.h:560 [inline]
>  kzalloc include/linux/slab.h:669 [inline]
>  dma_buf_export+0x24d/0xa80 drivers/dma-buf/dma-buf.c:533
>  ion_alloc drivers/staging/android/ion/ion.c:386 [inline]
>  ion_ioctl+0x5a9/0xd20 drivers/staging/android/ion/ion.c:495
>  compat_ptr_ioctl+0x6e/0xa0 fs/ioctl.c:804
>  __do_compat_sys_ioctl fs/ioctl.c:857 [inline]
>  __se_compat_sys_ioctl fs/ioctl.c:808 [inline]
>  __ia32_compat_sys_ioctl+0x245/0x2c0 fs/ioctl.c:808
>  do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
>  do_fast_syscall_32+0x27b/0xe16 arch/x86/entry/common.c:408
>  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
> 
> Freed by task 2380:
>  save_stack+0x23/0x90 mm/kasan/common.c:72
>  set_track mm/kasan/common.c:80 [inline]
>  kasan_set_free_info mm/kasan/common.c:337 [inline]
>  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:476
>  kasan_slab_free+0xe/0x10 mm/kasan/common.c:485
>  __cache_free mm/slab.c:3426 [inline]
>  kfree+0x10a/0x2c0 mm/slab.c:3757
>  dma_buf_release+0x343/0x420 drivers/dma-buf/dma-buf.c:111
>  __fput+0x2ff/0x890 fs/file_table.c:280
>  ____fput+0x16/0x20 fs/file_table.c:313
>  task_work_run+0x145/0x1c0 kernel/task_work.c:113
>  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:164
>  prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
>  syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
>  do_syscall_32_irqs_on arch/x86/entry/common.c:352 [inline]
>  do_fast_syscall_32+0xbbd/0xe16 arch/x86/entry/common.c:408
>  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
> 
> The buggy address belongs to the object at ffff8880a6b39000
>  which belongs to the cache kmalloc-1k of size 1024
> The buggy address is located 232 bytes inside of
>  1024-byte region [ffff8880a6b39000, ffff8880a6b39400)
> The buggy address belongs to the page:
> page:ffffea00029ace40 refcount:1 mapcount:0 mapping:ffff8880aa400c40 index:0x0
> flags: 0xfffe0000000200(slab)
> raw: 00fffe0000000200 ffffea0002346b48 ffffea00022f49c8 ffff8880aa400c40
> raw: 0000000000000000 ffff8880a6b39000 0000000100000002 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffff8880a6b38f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff8880a6b39000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >ffff8880a6b39080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                           ^
>  ffff8880a6b39100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff8880a6b39180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================

Add a completion for dmabuf releaser to wait those who are either
holding the resv lock or aquiring it.


--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -334,6 +334,9 @@ struct dma_buf {
 
 		__poll_t active;
 	} cb_excl, cb_shared;
+
+	atomic_t resv_user;
+	struct completion done;
 };
 
 /**
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -45,11 +45,20 @@ static char *dmabuffs_dname(struct dentr
 	size_t ret = 0;
 
 	dmabuf = dentry->d_fsdata;
+	if (!dmabuf)
+		goto print_name;
+
+	atomic_inc(&dmabuf->resv_user);
+
 	dma_resv_lock(dmabuf->resv, NULL);
 	if (dmabuf->name)
 		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
 	dma_resv_unlock(dmabuf->resv);
 
+	if (atomic_dec_and_test(&dmabuf->resv_user))
+		complete(&dmabuf->done);
+
+print_name:
 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
 			     dentry->d_name.name, ret > 0 ? name : "");
 }
@@ -85,6 +94,10 @@ static int dma_buf_release(struct inode
 		return -EINVAL;
 
 	dmabuf = file->private_data;
+	file->f_path.dentry->d_fsdata = NULL;
+	atomic_inc(&dmabuf->resv_user);
+	if (!atomic_dec_and_test(&dmabuf->resv_user))
+		wait_for_completion(&dmabuf->done);
 
 	BUG_ON(dmabuf->vmapping_counter);
 
@@ -562,6 +575,7 @@ struct dma_buf *dma_buf_export(const str
 
 	mutex_init(&dmabuf->lock);
 	INIT_LIST_HEAD(&dmabuf->attachments);
+	init_completion(&dmabuf->done);
 
 	mutex_lock(&db_list.lock);
 	list_add(&dmabuf->list_node, &db_list.head);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
