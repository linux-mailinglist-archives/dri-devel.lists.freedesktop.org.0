Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B740E831633
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 10:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF2610E06E;
	Thu, 18 Jan 2024 09:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A9B10E192
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:51:21 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-7bf5fe1ca9fso28218939f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 01:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705571480; x=1706176280;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LkvdycqJohxztUpLt/7vlWL8dxLjsENTxEfMc11iE9Y=;
 b=hzm5eeER5hmrrwIfG0Q9D/U62Iu8DPkBv1kOgFCsH5Fo7W1FH/M2MSa/mV4NjX7+ed
 SkyuAhNAPuPauYXnrQZt901FhAbf6GkPW1CqG7QrgjlNqiHknf9hDr+0GbcVlvul4Oew
 v3hv51H9hrDkWJySzKt6UtXodg6DnY719n1xvkjWAGpmb/7cXQvPX3GqfyOyXZGZf0Ei
 0pe1MEuq+FLDkpj8wENz7/j7aYsPAOQx9NpFKQdc6WeoS0TKeaF+/gNWdQK/omO4mnRA
 ZJWEi1MUudVCmKDGRbAWHbaYHjmHvB8RpE8B+6PDASeA9r/+FAl8/nuXErZtKumta4mO
 ZtTA==
X-Gm-Message-State: AOJu0Yy5On1gAnNdi9jel3z1vUkJijnEt6yon416cN0VIlgyRPpA0kpQ
 PjaM7o8U2tc7pguYh8sOhpNk2TSfyzrJQ4vHqtHhigRFWbbMk1PbXl2AnCFfug5gKDXwGEwcm+n
 A74VW0SfFWM5LnavMQl5RJnSru/YOL7qeJhahKve+tovSMVyzV5Wof/Q=
X-Google-Smtp-Source: AGHT+IHzouAb2icz5oPAlRYTj81wQ5G3y9Kmz84hi6hFEOvIHRkLembbLk74QIQgZb7D3ntsDph2fxm5vOwhR35W5TCy4GS5pb4j
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2108:b0:46e:aaa7:fdf5 with SMTP id
 n8-20020a056638210800b0046eaaa7fdf5mr38487jaj.0.1705571480364; Thu, 18 Jan
 2024 01:51:20 -0800 (PST)
Date: Thu, 18 Jan 2024 01:51:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000039f237060f354ef7@google.com>
Subject: [syzbot] [dri?] BUG: scheduling while atomic in
 drm_atomic_helper_wait_for_flip_done
From: syzbot <syzbot+06fa1063cca8163ea541@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net, 
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    1b1934dbbdcf Merge tag 'docs-6.8-2' of git://git.lwn.net/l..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1029adbde80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=68ea41b98043e6e8
dashboard link: https://syzkaller.appspot.com/bug?extid=06fa1063cca8163ea541
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/384ffdcca292/non_bootable_disk-1b1934db.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/00b728a4f3de/vmlinux-1b1934db.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5a3fe8452d59/Image-1b1934db.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+06fa1063cca8163ea541@syzkaller.appspotmail.com

BUG: scheduling while atomic: syz-executor.0/29225/0x00000002
Modules linked in:
CPU: 1 PID: 29225 Comm: syz-executor.0 Not tainted 6.7.0-syzkaller-10085-g1b1934dbbdcf #0
Hardware name: linux,dummy-virt (DT)
Call trace:
 dump_backtrace+0x94/0xec arch/arm64/kernel/stacktrace.c:291
 show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:298
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x48/0x60 lib/dump_stack.c:106
 dump_stack+0x18/0x24 lib/dump_stack.c:113
 __schedule_bug+0x50/0x68 kernel/sched/core.c:5943
 schedule_debug kernel/sched/core.c:5970 [inline]
 __schedule+0x7f4/0x8a8 kernel/sched/core.c:6620
 __schedule_loop kernel/sched/core.c:6802 [inline]
 schedule+0x34/0xc8 kernel/sched/core.c:6817
 schedule_timeout+0x8c/0x100 kernel/time/timer.c:2183
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common kernel/sched/completion.c:116 [inline]
 wait_for_common kernel/sched/completion.c:127 [inline]
 wait_for_completion_timeout+0x74/0x16c kernel/sched/completion.c:167
 drm_atomic_helper_wait_for_flip_done+0x6c/0xc4 drivers/gpu/drm/drm_atomic_helper.c:1719
 vkms_atomic_commit_tail+0x60/0xd0 drivers/gpu/drm/vkms/vkms_drv.c:81
 commit_tail+0xa4/0x18c drivers/gpu/drm/drm_atomic_helper.c:1832
 drm_atomic_helper_commit+0x164/0x178 drivers/gpu/drm/drm_atomic_helper.c:2072
 drm_atomic_commit+0xa8/0xe0 drivers/gpu/drm/drm_atomic.c:1514
 drm_client_modeset_commit_atomic+0x210/0x270 drivers/gpu/drm/drm_client_modeset.c:1051
 drm_client_modeset_commit_locked+0x5c/0x188 drivers/gpu/drm/drm_client_modeset.c:1154
 drm_client_modeset_commit+0x30/0x58 drivers/gpu/drm/drm_client_modeset.c:1180
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:251 [inline]
 __drm_fb_helper_restore_fbdev_mode_unlocked+0xa8/0xe8 drivers/gpu/drm/drm_fb_helper.c:230
 drm_fb_helper_set_par+0x30/0x4c drivers/gpu/drm/drm_fb_helper.c:1344
 fb_set_var+0x21c/0x488 drivers/video/fbdev/core/fbmem.c:312
 fbcon_switch+0x214/0x4d0 drivers/video/fbdev/core/fbcon.c:2110
 flush_scrollback drivers/tty/vt/vt.c:912 [inline]
 csi_J+0x254/0x260 drivers/tty/vt/vt.c:1527
 do_con_trol drivers/tty/vt/vt.c:2408 [inline]
 do_con_write+0x1a30/0x1e2c drivers/tty/vt/vt.c:2905
 con_write+0x18/0x68 drivers/tty/vt/vt.c:3251
 gsmld_write+0x64/0xd0 drivers/tty/n_gsm.c:3724
 iterate_tty_write drivers/tty/tty_io.c:1021 [inline]
 file_tty_write.constprop.0+0x134/0x28c drivers/tty/tty_io.c:1092
 tty_write+0x14/0x20 drivers/tty/tty_io.c:1113
 call_write_iter include/linux/fs.h:2085 [inline]
 new_sync_write fs/read_write.c:497 [inline]
 vfs_write+0x1dc/0x2f4 fs/read_write.c:590
 ksys_write+0x70/0x104 fs/read_write.c:643
 __do_sys_write fs/read_write.c:655 [inline]
 __se_sys_write fs/read_write.c:652 [inline]
 __arm64_sys_write+0x1c/0x28 fs/read_write.c:652
 __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
 invoke_syscall+0x48/0x114 arch/arm64/kernel/syscall.c:51
 el0_svc_common.constprop.0+0x40/0xe0 arch/arm64/kernel/syscall.c:136
 do_el0_svc+0x1c/0x28 arch/arm64/kernel/syscall.c:155
 el0_svc+0x34/0xd8 arch/arm64/kernel/entry-common.c:678
 el0t_64_sync_handler+0x100/0x12c arch/arm64/kernel/entry-common.c:696
 el0t_64_sync+0x19c/0x1a0 arch/arm64/kernel/entry.S:595
BUG: scheduling while atomic: syz-executor.0/29225/0x00000000
Modules linked in:
CPU: 0 PID: 29225 Comm: syz-executor.0 Tainted: G        W          6.7.0-syzkaller-10085-g1b1934dbbdcf #0
Hardware name: linux,dummy-virt (DT)
Call trace:
 dump_backtrace+0x94/0xec arch/arm64/kernel/stacktrace.c:291
 show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:298
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x48/0x60 lib/dump_stack.c:106
 dump_stack+0x18/0x24 lib/dump_stack.c:113
 __schedule_bug+0x50/0x68 kernel/sched/core.c:5943
 schedule_debug kernel/sched/core.c:5970 [inline]
 __schedule+0x7f4/0x8a8 kernel/sched/core.c:6620
 __schedule_loop kernel/sched/core.c:6802 [inline]
 schedule+0x34/0xc8 kernel/sched/core.c:6817
 futex_wait_queue+0x70/0x9c kernel/futex/waitwake.c:370
 __futex_wait+0xc8/0x15c kernel/futex/waitwake.c:669
 futex_wait+0x84/0x108 kernel/futex/waitwake.c:697
 do_futex+0xf8/0x1a0 kernel/futex/syscalls.c:102
 __do_sys_futex kernel/futex/syscalls.c:179 [inline]
 __se_sys_futex kernel/futex/syscalls.c:160 [inline]
 __arm64_sys_futex+0x7c/0x1a4 kernel/futex/syscalls.c:160
 __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
 invoke_syscall+0x48/0x114 arch/arm64/kernel/syscall.c:51
 el0_svc_common.constprop.0+0x40/0xe0 arch/arm64/kernel/syscall.c:136
 do_el0_svc+0x1c/0x28 arch/arm64/kernel/syscall.c:155
 el0_svc+0x34/0xd8 arch/arm64/kernel/entry-common.c:678
 el0t_64_sync_handler+0x100/0x12c arch/arm64/kernel/entry-common.c:696
 el0t_64_sync+0x19c/0x1a0 arch/arm64/kernel/entry.S:595


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
