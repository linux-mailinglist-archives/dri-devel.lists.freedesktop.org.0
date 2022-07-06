Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800D569B95
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 09:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ADF11B74B;
	Thu,  7 Jul 2022 07:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CD510F6DE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 18:17:21 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 y22-20020a056602215600b00673b11a9cd5so8431241ioy.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 11:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=yr/Dj0dm/9Dq/Ynx8tnyc9XTP29/T0M4vNro1Nx3hDo=;
 b=unOA+4abZSiFr8gvED8vKZGDIeZJ617DyCqIu2FWm8KqnwyJs7JUaAPmh6bEmZCAyR
 D+dgmIhZ2ebWvV0Mb1PUhO5SAAWYyHCStEX4GUnirVHldvfmsnCml+9i044Gz1Bz6FoQ
 N0TazU06v56I3sxFiVD3UaBCgyGZwDR9OsbhaW3QysBh9WoknJYIHewM62l3hCylO373
 fcTMcKratwHm9YwiLqwMtZZpaGNOUHeNoVmetguQzyY7nMPXZl2wn0USmNHCmLMOfogv
 vR49RQR3IDFJElWy1tMCFJ6bsTJv2+6jvhkO0yelFScpHWkkg74UitbohBQkJrmTCB8C
 22mQ==
X-Gm-Message-State: AJIora+zvsOzmDfxkz+mRw1PpgqIJRuqQBOGdeszMyoe3IzM34vw0UFt
 Muw+jfbYrpzrBRWBqNdJIjX//cOcw5uxkAuQb0fCeL3Ida3S
X-Google-Smtp-Source: AGRyM1uf5E4TqGfB06vj9vugXPx49QouG29+Ufp8mxUzufVcZu7xf7skpGDaVQppkoOnZMyLHyGFU2NN93PgTg5Bs1XiHJjLHZQC
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1347:b0:33e:9dd1:d3f6 with SMTP id
 u7-20020a056638134700b0033e9dd1d3f6mr19824538jad.131.1657131441267; Wed, 06
 Jul 2022 11:17:21 -0700 (PDT)
Date: Wed, 06 Jul 2022 11:17:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e72d3c05e326fae4@google.com>
Subject: [syzbot] general protection fault in virtio_gpu_object_create (2)
From: syzbot <syzbot+2f09dba03ce3f3b0a2cf@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 gurchetansingh@chromium.org, kraxel@redhat.com, linux-kernel@vger.kernel.org, 
 olvaffe@gmail.com, syzkaller-bugs@googlegroups.com, 
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 07 Jul 2022 07:29:50 +0000
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

HEAD commit:    089866061428 Merge tag 'libnvdimm-fixes-5.19-rc5' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15ce44ec080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a010dbf6a7af480
dashboard link: https://syzkaller.appspot.com/bug?extid=2f09dba03ce3f3b0a2cf
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13650150080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16687b6c080000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2f09dba03ce3f3b0a2cf@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 3668 Comm: syz-executor918 Not tainted 5.19.0-rc4-syzkaller-00187-g089866061428 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:183 [inline]
RIP: 0010:virtio_gpu_object_create+0x29b/0xd90 drivers/gpu/drm/virtio/virtgpu_object.c:249
Code: 89 de e8 98 3c ed fc 48 85 db 0f 85 9f 03 00 00 e8 2a 40 ed fc 49 8d 7f 0c 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 82
RSP: 0018:ffffc90002e5fad0 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff848c5756 RDI: 0000000000000000
RBP: ffff88802286b800 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffffc90002e5fbd0
R13: ffff88801c4c0010 R14: ffff88801c4c0000 R15: fffffffffffffff4
FS:  0000555556654300(0000) GS:ffff88802c800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa12e2a42a4 CR3: 0000000015c4e000 CR4: 0000000000150ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 virtio_gpu_gem_create drivers/gpu/drm/virtio/virtgpu_gem.c:42 [inline]
 virtio_gpu_mode_dumb_create+0x319/0x5c0 drivers/gpu/drm/virtio/virtgpu_gem.c:90
 drm_mode_create_dumb+0x26c/0x2f0 drivers/gpu/drm/drm_dumb_buffers.c:96
 drm_ioctl_kernel+0x27d/0x4e0 drivers/gpu/drm/drm_ioctl.c:782
 drm_ioctl+0x51e/0x9d0 drivers/gpu/drm/drm_ioctl.c:885
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
RIP: 0033:0x7fa12e24c699
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff25d83428 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fa12e24c699
RDX: 0000000020000000 RSI: 00000000c02064b2 RDI: 0000000000000003
RBP: 00007fff25d83440 R08: 0000000000000002 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 431bde82d7b634db R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:183 [inline]
RIP: 0010:virtio_gpu_object_create+0x29b/0xd90 drivers/gpu/drm/virtio/virtgpu_object.c:249
Code: 89 de e8 98 3c ed fc 48 85 db 0f 85 9f 03 00 00 e8 2a 40 ed fc 49 8d 7f 0c 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 82
RSP: 0018:ffffc90002e5fad0 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff848c5756 RDI: 0000000000000000
RBP: ffff88802286b800 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffffc90002e5fbd0
R13: ffff88801c4c0010 R14: ffff88801c4c0000 R15: fffffffffffffff4
FS:  0000555556654300(0000) GS:ffff88802c800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa12e2a42a4 CR3: 0000000015c4e000 CR4: 0000000000150ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	89 de                	mov    %ebx,%esi
   2:	e8 98 3c ed fc       	callq  0xfced3c9f
   7:	48 85 db             	test   %rbx,%rbx
   a:	0f 85 9f 03 00 00    	jne    0x3af
  10:	e8 2a 40 ed fc       	callq  0xfced403f
  15:	49 8d 7f 0c          	lea    0xc(%r15),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx <-- trapping instruction
  2e:	48 89 f8             	mov    %rdi,%rax
  31:	83 e0 07             	and    $0x7,%eax
  34:	83 c0 03             	add    $0x3,%eax
  37:	38 d0                	cmp    %dl,%al
  39:	7c 08                	jl     0x43
  3b:	84 d2                	test   %dl,%dl
  3d:	0f                   	.byte 0xf
  3e:	85                   	.byte 0x85
  3f:	82                   	.byte 0x82


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
