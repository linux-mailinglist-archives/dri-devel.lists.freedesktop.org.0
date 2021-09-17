Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E35640F6C8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 13:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E136EC29;
	Fri, 17 Sep 2021 11:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E728F6EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 09:22:22 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 s14-20020a92ae0e000000b00240b2b67a5dso17619858ilh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 02:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=+pjv963NVKwgxuXPNBd5iR2KeT18UVqlRyrWIcJtYTk=;
 b=e0svIzDrz1tVaP6bCEycT3frQUl7muE1WN+/pjx3SaPgZMBBAMINbaP4su8MDHiD1K
 T6A92FYt5FlbULu1iIHgqOXNy6DqMSxaR0z1ngAV7Tjzzr+1Zh6GmE8gvK0AKCaMWzq1
 bU6GAc/3M9dN4v69iOz8UBvFQGXvB9lXYRQDf2UgrmocTXl4g6faDtKb7E0PsJbmvIvS
 XzX28bMX5cssxRxhiSLXB2OtRvl4L8cqcmdYwJfFgpLwJ2r9gBedk5LDww98RoMibn8L
 L4J3/f4Q/B0JpTj0OSZmcOVZ5BYaHRYI3QtI4pfKiVRHZQo5fM1iF3VTwRXw8EMSSTg8
 310w==
X-Gm-Message-State: AOAM530Sruvb/WdHvqapS+8MWsDXQX6AWHoZLJGk7sbNlGlSr1uUFSat
 7BmrdBTKrBHtXWP4sJJZRB6Fj2ao+mvEAIyi1B8qztA8KX6+
X-Google-Smtp-Source: ABdhPJwfwr742mMLZxlF5D2Wtjfg2jTaGV5+lNNfcpFM47G+lkIaDvAFLRJ9ZNvzghKwlWVdkQ25HzHXV7MBsZZN244VQMNHDiWb
MIME-Version: 1.0
X-Received: by 2002:a05:6638:372a:: with SMTP id
 k42mr7890370jav.71.1631870542312; 
 Fri, 17 Sep 2021 02:22:22 -0700 (PDT)
Date: Fri, 17 Sep 2021 02:22:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fe7dd005cc2d77c0@google.com>
Subject: [syzbot] kernel BUG in vmf_insert_pfn_prot
From: syzbot <syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com>
To: airlied@linux.ie, christian.koenig@amd.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 17 Sep 2021 11:37:19 +0000
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

HEAD commit:    9004fd387338 Add linux-next specific files for 20210917
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17ecf0ad300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45d5ac72f31f29f3
dashboard link: https://syzkaller.appspot.com/bug?extid=2d4f8693f438d2bd4bdb
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at mm/memory.c:2103!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 8279 Comm: syz-executor.0 Not tainted 5.15.0-rc1-next-20210917-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:vmf_insert_pfn_prot+0x248/0x450 mm/memory.c:2103
Code: 0f 0b e8 6b d0 ca ff 4d 89 f7 bf 20 00 00 00 41 83 e7 28 4c 89 fe e8 b7 d5 ca ff 49 83 ff 20 0f 85 a5 fe ff ff e8 48 d0 ca ff <0f> 0b 49 be ff ff ff ff ff ff 0f 00 e8 37 d0 ca ff 4d 21 ee 4c 89
RSP: 0000:ffffc90005f47bd0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 1ffff92000be8f7c RCX: 0000000000000000
RDX: ffff888050adb900 RSI: ffffffff81ab3e18 RDI: 0000000000000003
RBP: ffff88807e3bcc60 R08: 0000000000000020 R09: ffffc90005f47bb7
R10: ffffffff81ab3e09 R11: 1ffffffff1ebb3fc R12: 000000002001d000
R13: 0000000000145dc3 R14: 0000000008140476 R15: 0000000000000020
FS:  0000555555f1e400(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005608abbf4250 CR3: 000000006e072000 CR4: 00000000001506f0
Call Trace:
 drm_gem_shmem_fault+0x1e3/0x290 drivers/gpu/drm/drm_gem_shmem_helper.c:564
 __do_fault+0x10d/0x4d0 mm/memory.c:3848
 do_cow_fault mm/memory.c:4184 [inline]
 do_fault mm/memory.c:4285 [inline]
 handle_pte_fault mm/memory.c:4541 [inline]
 __handle_mm_fault+0x370e/0x5120 mm/memory.c:4676
 handle_mm_fault+0x1c8/0x790 mm/memory.c:4774
 do_user_addr_fault+0x48b/0x11c0 arch/x86/mm/fault.c:1390
 handle_page_fault arch/x86/mm/fault.c:1475 [inline]
 exc_page_fault+0x9e/0x180 arch/x86/mm/fault.c:1531
 asm_exc_page_fault+0x1e/0x30 arch/x86/include/asm/idtentry.h:568
RIP: 0033:0x7f1096c04d5a
Code: 30 48 8b 34 24 48 85 f6 74 17 8b 44 24 18 0f c8 89 c0 48 89 44 24 18 48 83 fe 01 0f 85 a1 01 00 00 48 8b 44 24 10 8b 74 24 18 <89> 30 e9 d2 fc ff ff 48 8b 44 24 10 8b 10 48 8b 04 24 48 85 c0 0f
RSP: 002b:00007ffd0b939970 EFLAGS: 00010246
RAX: 000000002001d000 RBX: 00007f109716c000 RCX: 0000000000000000
RDX: 182c4ff2a4394aee RSI: 0000000000000001 RDI: 0000555555f1e2f0
RBP: 00007ffd0b939a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000004 R11: 00000000e900f6d2 R12: 00000000001760c0
R13: 00000000000003e8 R14: 00007f1096d67f80 R15: 0000000000176064
Modules linked in:
---[ end trace 1a78047d43092735 ]---
RIP: 0010:vmf_insert_pfn_prot+0x248/0x450 mm/memory.c:2103
Code: 0f 0b e8 6b d0 ca ff 4d 89 f7 bf 20 00 00 00 41 83 e7 28 4c 89 fe e8 b7 d5 ca ff 49 83 ff 20 0f 85 a5 fe ff ff e8 48 d0 ca ff <0f> 0b 49 be ff ff ff ff ff ff 0f 00 e8 37 d0 ca ff 4d 21 ee 4c 89
RSP: 0000:ffffc90005f47bd0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 1ffff92000be8f7c RCX: 0000000000000000
RDX: ffff888050adb900 RSI: ffffffff81ab3e18 RDI: 0000000000000003
RBP: ffff88807e3bcc60 R08: 0000000000000020 R09: ffffc90005f47bb7
R10: ffffffff81ab3e09 R11: 1ffffffff1ebb3fc R12: 000000002001d000
R13: 0000000000145dc3 R14: 0000000008140476 R15: 0000000000000020
FS:  0000555555f1e400(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffb730a0718 CR3: 000000006e072000 CR4: 00000000001506e0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
