Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C427E186081
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AAC6E2CC;
	Sun, 15 Mar 2020 23:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F646E11A
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 09:13:02 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id w16so8247308iot.2
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 02:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=fehXyPD76GCyl5R7ov6y7Hf3HMx60GvaSqGjNkGo7AI=;
 b=L+yzFaORQ85tJkOiBohw42oDc9fKorxS7+tMBZICmIJ1p2MrA4kVlFb8Xc/jceyxiV
 9AN3JQZw3hY8nbDavSz141hI4/1wGsY7Q+PYDbcsvhU8UDZ3cCl/JW0u60rg7yV602Ho
 0vUs98uetEzZFCb7uEWEj0P6zRxbogZJXxvWcypXfxKZgovYE7vC2cZ3emv8GNkks+5q
 LLkW/7VGNtfmInD6RR9pQ9Il4bbG71yPgXUAZr2w+Cm3MeKcFUvMAVYdNwNMhmYk57Eq
 C6NwkyXkawJeBGcPVPykTd+UCUQo2JPZxmwDBQ/zBv7AxSRsywHrVtC/kcLTnNfOqg2t
 DyyA==
X-Gm-Message-State: ANhLgQ0FucOUMs326qtO/FRqhbO2giS/3SWYX9mhgoiqLTaQDVur6LyR
 NO0tHyn9898N2TEyM6OmvJ744kmf363jvTgHiqmLbOvGYWks
X-Google-Smtp-Source: ADFU+vv2891WR4s0bwl6a/z+8zKmjAsGygTo5Ydw9RASenClGGMHV/Cth46q/9iVaEz8Y3XWzsvuErzYfw5bihwf1QLKGLYJq7XJ
MIME-Version: 1.0
X-Received: by 2002:a05:6638:a99:: with SMTP id
 25mr17442914jas.37.1584177182115; 
 Sat, 14 Mar 2020 02:13:02 -0700 (PDT)
Date: Sat, 14 Mar 2020 02:13:02 -0700
In-Reply-To: <CADG63jBKpM1vCzTHjPtTdsifpg_tuatd224BeFgra_ycXFW1ZQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000338c3a05a0ccfedd@google.com>
Subject: Re: WARNING in idr_destroy
From: syzbot <syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com>
To: airlied@linux.ie, anenbupt@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:05 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot has tested the proposed patch but the reproducer still triggered crash:
WARNING in idr_destroy

RBP: 000000000076bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 0000000000000203 R14: 00000000004c3e56 R15: 0000000000000008
------------[ cut here ]------------
WARNING: CPU: 0 PID: 9124 at lib/radix-tree.c:682 radix_tree_free_nodes lib/radix-tree.c:682 [inline]
WARNING: CPU: 0 PID: 9124 at lib/radix-tree.c:682 idr_destroy+0x1ae/0x260 lib/radix-tree.c:1572
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 9124 Comm: syz-executor.0 Not tainted 5.6.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1fb/0x318 lib/dump_stack.c:118
 panic+0x264/0x7a9 kernel/panic.c:221
 __warn+0x209/0x210 kernel/panic.c:582
 report_bug+0x1b6/0x2f0 lib/bug.c:195
 fixup_bug arch/x86/kernel/traps.c:174 [inline]
 do_error_trap+0xcf/0x1c0 arch/x86/kernel/traps.c:267
 do_invalid_op+0x36/0x40 arch/x86/kernel/traps.c:286
 invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:radix_tree_free_nodes lib/radix-tree.c:682 [inline]
RIP: 0010:idr_destroy+0x1ae/0x260 lib/radix-tree.c:1572
Code: 43 5f f9 48 89 df 48 c7 c6 10 83 17 88 e8 ca 5c 4c f9 4c 3b 65 b8 74 57 e8 7f 43 5f f9 4d 89 fc e9 67 ff ff ff e8 72 43 5f f9 <0f> 0b eb d5 89 f9 80 e1 07 38 c1 7c 84 e8 e0 75 9c f9 e9 7a ff ff
RSP: 0018:ffffc900021b7ba0 EFLAGS: 00010293
RAX: ffffffff8817dc0e RBX: ffff8880aa010598 RCX: ffff888096740440
RDX: 0000000000000000 RSI: 0000000000000040 RDI: ffff8880aa010588
RBP: ffffc900021b7be8 R08: ffffffff8817db80 R09: ffffed1011809f91
R10: ffffed1011809f91 R11: 0000000000000000 R12: ffff8880aa010580
R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
 drm_mode_create_lease_ioctl+0x13c9/0x18c0 drivers/gpu/drm/drm_lease.c:587
 drm_ioctl_kernel+0x2cf/0x410 drivers/gpu/drm/drm_ioctl.c:786
 drm_ioctl+0x52f/0x890 drivers/gpu/drm/drm_ioctl.c:886
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl fs/ioctl.c:763 [inline]
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl+0x113/0x190 fs/ioctl.c:770
 __x64_sys_ioctl+0x7b/0x90 fs/ioctl.c:770
 do_syscall_64+0xf7/0x1c0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c479
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f680fc16c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f680fc176d4 RCX: 000000000045c479
RDX: 0000000020000040 RSI: ffffffffffffffc6 RDI: 0000000000000003
RBP: 000000000076bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 0000000000000203 R14: 00000000004c3e56 R15: 0000000000000008
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         7f398516 drm/lease: fix stack variable uninitialized
git tree:       https://github.com/hqj/hqjagain_test.git drm
console output: https://syzkaller.appspot.com/x/log.txt?x=1227a1f9e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cec95cb58b6f6294
dashboard link: https://syzkaller.appspot.com/bug?extid=05835159fe322770fe3d
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
