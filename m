Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D7598102
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 11:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE23C8C86;
	Thu, 18 Aug 2022 09:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F24EC8AA1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 09:42:22 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 z30-20020a05660217de00b00688bd42dc1dso577757iox.15
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 02:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc;
 bh=RfNlb6EEPdTfanyFDEnkQRakEnqd8CRS3dNcgk2y8TY=;
 b=ggKy8DYSMrApNgVPYdUb+rNSgvK0gp98LDiw+kX2e8iZxNlrO0vSc645mZB/Qlun8i
 iwZrols1Z9VIADqsAq91zRy1iwU/KxX98bgNOHjdCNIdUtXq/ehc1ABWiPBHqUFgMcnL
 U0CXolRa4sZJN0TIDDgmhlm/6SrkfCyObBZf71AqsLCq7RbPo3JxYvgXnIPfIfl+rrth
 yHZIrsnkYd6V4BMlGzi+Xzdj86T04hUlsUcMfmbZRV+zqbsr2nlbYwDhpl3gbvVLhBwm
 b9a2b+6gjWp23bv63E0vsJzaG9MpOyUpE22F5uHmEomiN/IS3rw9tq/vNjrNXhzZbLLq
 2prw==
X-Gm-Message-State: ACgBeo3RoDgM1LkzzMkCHitdULZD8ElDxiSx+xZToRhdaq05O9O7D847
 pdqr1MmsysT8GyIKWN7F3OYnBkf4V8XyLK0Zi2SZslNnaQhu
X-Google-Smtp-Source: AA6agR419vM0BcKVltIU2/azbZPIWTdI2ChgLbJc1gPXUbu5C70NzeInaZiqt9pnzn1PSlmneFLcVqyMbIZ6HQa8KdfAc+UERZ0N
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e09:b0:2de:f22:9cca with SMTP id
 g9-20020a056e021e0900b002de0f229ccamr1105678ila.36.1660815742104; Thu, 18 Aug
 2022 02:42:22 -0700 (PDT)
Date: Thu, 18 Aug 2022 02:42:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000058792a05e680ccff@google.com>
Subject: [syzbot] general protection fault in
 drm_gem_object_handle_put_unlocked
From: syzbot <syzbot+87b9744712425638eaae@syzkaller.appspotmail.com>
To: airlied@linux.ie, christian.koenig@amd.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
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

Hello,

syzbot found the following issue on:

HEAD commit:    7ebfc85e2cd7 Merge tag 'net-6.0-rc1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=143d292d080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=924833c12349a8c0
dashboard link: https://syzkaller.appspot.com/bug?extid=87b9744712425638eaae
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+87b9744712425638eaae@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xf0cffc45c000056c: 0000 [#1] PREEMPT SMP KASAN
KASAN: maybe wild-memory-access in range [0x8680022e00002b60-0x8680022e00002b67]
CPU: 1 PID: 7930 Comm: syz-executor.2 Not tainted 5.19.0-syzkaller-13930-g7ebfc85e2cd7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:582 [inline]
RIP: 0010:__mutex_lock+0xec/0x1350 kernel/locking/mutex.c:747
Code: d0 7c 08 84 d2 0f 85 58 0f 00 00 8b 15 cd e2 99 07 85 d2 75 29 48 8d 7d 60 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 40 0f 00 00 48 3b 6d 60 0f 85 a5 08 00 00 bf 01
RSP: 0018:ffffc90002dbfac8 EFLAGS: 00010217

RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000001
RDX: 10d00045c000056c RSI: 0000000000000000 RDI: 8680022e00002b65
RBP: 8680022e00002b05 R08: ffffffff846dcdd0 R09: 0000000000000000
R10: 00000000ffff8880 R11: 000000000008c07c R12: 0000000000000000
R13: dffffc0000000000 R14: 00000000ffff8880 R15: ffff888020f75004
FS:  000055555631e400(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2f322000 CR3: 000000001cdc5000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 drm_gem_object_handle_put_unlocked+0x90/0x390 drivers/gpu/drm/drm_gem.c:231
 drm_gem_object_release_handle+0xe3/0x110 drivers/gpu/drm/drm_gem.c:259
 idr_for_each+0x113/0x220 lib/idr.c:208
 drm_gem_release+0x22/0x30 drivers/gpu/drm/drm_gem.c:932
 drm_file_free.part.0+0x805/0xb80 drivers/gpu/drm/drm_file.c:281
 drm_file_free drivers/gpu/drm/drm_file.c:248 [inline]
 drm_close_helper.isra.0+0x17d/0x1f0 drivers/gpu/drm/drm_file.c:308
 drm_release+0x1e6/0x530 drivers/gpu/drm/drm_file.c:495
 __fput+0x277/0x9d0 fs/file_table.c:320
 task_work_run+0xdd/0x1a0 kernel/task_work.c:177
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:169 [inline]
 exit_to_user_mode_prepare+0x23c/0x250 kernel/entry/common.c:201
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0x19/0x50 kernel/entry/common.c:294
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f0de2a3bebb
Code: 0f 05 48 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8 63 fc ff ff 8b 7c 24 0c 41 89 c0 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 a1 fc ff ff 8b 44
RSP: 002b:00007ffe90db73b0 EFLAGS: 00000293
 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 00007f0de2a3bebb
RDX: 00007f0de2ba0288 RSI: ffffffffffffffff RDI: 0000000000000003
RBP: 00007f0de2b9d980 R08: 0000000000000000 R09: 00007f0de2ba0290
R10: 00007ffe90db74b0 R11: 0000000000000293 R12: 0000000000058518
R13: 00007ffe90db74b0 R14: 00007f0de2b9bf80 R15: 0000000000000032
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:582 [inline]
RIP: 0010:__mutex_lock+0xec/0x1350 kernel/locking/mutex.c:747
Code: d0 7c 08 84 d2 0f 85 58 0f 00 00 8b 15 cd e2 99 07 85 d2 75 29 48 8d 7d 60 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 40 0f 00 00 48 3b 6d 60 0f 85 a5 08 00 00 bf 01
RSP: 0018:ffffc90002dbfac8 EFLAGS: 00010217

RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000001
RDX: 10d00045c000056c RSI: 0000000000000000 RDI: 8680022e00002b65
RBP: 8680022e00002b05 R08: ffffffff846dcdd0 R09: 0000000000000000
R10: 00000000ffff8880 R11: 000000000008c07c R12: 0000000000000000
R13: dffffc0000000000 R14: 00000000ffff8880 R15: ffff888020f75004
FS:  000055555631e400(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1f7d27af80 CR3: 000000001cdc5000 CR4: 0000000000350ee0
----------------
Code disassembly (best guess):
   0:	d0 7c 08 84          	sarb   -0x7c(%rax,%rcx,1)
   4:	d2 0f                	rorb   %cl,(%rdi)
   6:	85 58 0f             	test   %ebx,0xf(%rax)
   9:	00 00                	add    %al,(%rax)
   b:	8b 15 cd e2 99 07    	mov    0x799e2cd(%rip),%edx        # 0x799e2de
  11:	85 d2                	test   %edx,%edx
  13:	75 29                	jne    0x3e
  15:	48 8d 7d 60          	lea    0x60(%rbp),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 40 0f 00 00    	jne    0xf74
  34:	48 3b 6d 60          	cmp    0x60(%rbp),%rbp
  38:	0f 85 a5 08 00 00    	jne    0x8e3
  3e:	bf                   	.byte 0xbf
  3f:	01                   	.byte 0x1


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
