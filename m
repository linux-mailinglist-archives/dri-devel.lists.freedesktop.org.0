Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE81A522D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45956E32E;
	Sat, 11 Apr 2020 12:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ECA6E235
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 07:59:10 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id h26so4753317ilf.15
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 00:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=nooiccf0bvg2ymiBh4FJBdl7+CwejWp6PZyhC8b5zR0=;
 b=kjiM/z5uarxgFf1QlxnxHZb0RQqTvGFEidD8HfcQ4R7hmvNrhTkmCROkZ/NwgxW2/K
 nEXjEo2RodjOC+bnWgLPrWsjHASumLWTpdqEsff+HritNmWTN1ciSr6vrtY/570MzGji
 yui4k5/O/N0S/AgauGxqk5Km7yfCY+/jIsQbrz2B5necMcV+EhF2WieDz4r+WNhkZ9Wv
 epSARsHcUCe8ifqIPjmUWJlWX/VK8x5rmxeQ89Geyxxlp8P056NsAwjDz/vRp2M86NSS
 BhRW5KtdXavexl+Li4o3NwGUJobpKE7ci4+EJSglaj/khExCGECi0Am41+clBHJi72xB
 KI1A==
X-Gm-Message-State: AGi0PuZi/HBI141pjvD/iBzVfJsZLPut9yAqWzdwd1kjCqKqAVr6zJFh
 mzWB50tBnlT2Pit6+ZhBB/vZx52XNcnGQVTHOUJ8O6DMdeY6
X-Google-Smtp-Source: APiQypIGZsDNN5KpYHm+DmbsaBnPSsgcQ0r43bNVyREYjZiuSYffVtRMd6kPz/kB1nIGxqn5/mWHX6GHHxtivpB4hcn0PCmug5Ig
MIME-Version: 1.0
X-Received: by 2002:a92:89c7:: with SMTP id w68mr9058219ilk.233.1586591949675; 
 Sat, 11 Apr 2020 00:59:09 -0700 (PDT)
Date: Sat, 11 Apr 2020 00:59:09 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000090655b05a2ff399a@google.com>
Subject: memory leak in drm_vma_node_allow
From: syzbot <syzbot+04639d98c75c52e41b8a@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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

syzbot found the following crash on:

HEAD commit:    7e634208 Merge tag 'acpi-5.7-rc1-2' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=156ec43be00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d7f19fdf7ef2f5a4
dashboard link: https://syzkaller.appspot.com/bug?extid=04639d98c75c52e41b8a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=121898ede00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+04639d98c75c52e41b8a@syzkaller.appspotmail.com

2020/04/07 05:10:47 executed programs: 23
2020/04/07 05:10:53 executed programs: 35
2020/04/07 05:11:00 executed programs: 46
2020/04/07 05:11:06 executed programs: 62
BUG: memory leak
unreferenced object 0xffff888104682080 (size 64):
  comm "syz-executor.5", pid 8616, jiffies 4294946318 (age 15.290s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 da bd 03 81 88 ff ff  ................
  backtrace:
    [<00000000cac525e9>] kmalloc include/linux/slab.h:555 [inline]
    [<00000000cac525e9>] drm_vma_node_allow+0x32/0x120 drivers/gpu/drm/drm_vma_manager.c:274
    [<00000000ab055b7c>] drm_gem_handle_create_tail+0xd8/0x250 drivers/gpu/drm/drm_gem.c:403
    [<00000000d1e67364>] vgem_gem_create drivers/gpu/drm/vgem/vgem_drv.c:198 [inline]
    [<00000000d1e67364>] vgem_gem_dumb_create+0x73/0x100 drivers/gpu/drm/vgem/vgem_drv.c:218
    [<00000000dd87232b>] drm_mode_create_dumb+0xbe/0xf0 drivers/gpu/drm/drm_dumb_buffers.c:94
    [<00000000d7ff7e08>] drm_ioctl_kernel+0xcb/0x130 drivers/gpu/drm/drm_ioctl.c:787
    [<0000000080a20f26>] drm_ioctl+0x25c/0x420 drivers/gpu/drm/drm_ioctl.c:887
    [<00000000d53a93ee>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<00000000d53a93ee>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:763
    [<00000000c5492a67>] __do_sys_ioctl fs/ioctl.c:772 [inline]
    [<00000000c5492a67>] __se_sys_ioctl fs/ioctl.c:770 [inline]
    [<00000000c5492a67>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:770
    [<00000000becf688f>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:295
    [<0000000050094727>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
