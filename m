Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796913FAF26
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 02:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DD589B61;
	Mon, 30 Aug 2021 00:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D286D89B61
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 00:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=TxMmFqca5gXeQ7dxPWlWFLVkZfLTwJ6RMJNE3uZmCGI=; b=PNA3hNwj4VgrHSyYXHaTOJX4va
 aWnT2q7IZcIIN+sETpr7VEZlhpCQSc2au7dDizYWpbG03N8y5SgV4CeyHPAIXQV4im5NVCpf4GHZK
 LFke3dUFNbu7Nww6Xdr/XaMjrL8APiSv/HgAKjTA43f6efX5UCovZ7pjeKqpRBcKIJdqISIZVLNtf
 DUNZTcHPd2bT260psku72iZN5Vm5VQ5IqkVcfOE+5f/WNRf/CfPvlCEofFAai6SaGQxJaBeTBGCw5
 mHNybYnvGNFVB1174L/m7GsiM8L52PQx/j9+EseAclTWzZIZ67w/QXMoa6v29YMOBDj445Ouqbjbw
 IVV2KplA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKV6Z-00GAY6-2O; Mon, 30 Aug 2021 00:24:51 +0000
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_fillrect
To: syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, b.zolnierkie@samsung.com,
 colin.king@canonical.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 syzkaller-bugs@googlegroups.com
References: <000000000000815b9605c70e74f8@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
Date: Sun, 29 Aug 2021 17:24:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <000000000000815b9605c70e74f8@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 7/13/21 10:16 PM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    3dbdb38e Merge branch 'for-5.14' of git://git.kernel.org/p..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1323c402300000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a1fcf15a09815757
> dashboard link: https://syzkaller.appspot.com/bug?extid=04168c8063cfdde1db5e
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11f0e772300000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1114b9b0300000

Here are the fields that are set in the C reproducer for this ioctl:
#define FBIOPUT_VSCREENINFO	0x4601

   *(uint32_t*)0x20000200 = 0x356;	// xres: 854
   *(uint32_t*)0x20000204 = 8;		// yres
   *(uint32_t*)0x20000208 = 0x600;	// xres_virtual: 1536
   *(uint32_t*)0x2000020c = 0x10000000;	// yres_virtual: huge
   *(uint32_t*)0x20000210 = 0;		// xoffset
   *(uint32_t*)0x20000214 = 0;		// yoffset
   *(uint32_t*)0x20000218 = 4;		// bits_per_pixel
   *(uint32_t*)0x2000021c = 0;		// grayscale: false
   *(uint32_t*)0x20000220 = 0x3000000;	// red bitfield
   *(uint32_t*)0x20000224 = 0;		// green bitfield
   *(uint32_t*)0x20000228 = 0;		// blue bitfield
   *(uint32_t*)0x2000022c = 0;		// transp
   *(uint32_t*)0x20000230 = 0;		// nonstd: false
   *(uint32_t*)0x20000234 = 0;		// activate
   *(uint32_t*)0x20000238 = 0;		// height
   *(uint32_t*)0x2000023c = 0;		// width
   *(uint32_t*)0x20000240 = 0;		// accel_flags
   *(uint32_t*)0x20000244 = 0;		// pixclock
   *(uint32_t*)0x20000248 = 0;		// left_margin
   *(uint32_t*)0x2000024c = 0;		// right_margin
   *(uint32_t*)0x20000250 = 0;		// upper_margin
   *(uint32_t*)0x20000254 = 0;		// lower_margin
   *(uint32_t*)0x20000258 = 0;		// hsync_len
   *(uint32_t*)0x2000025c = 0;		// vsync_len
   *(uint32_t*)0x20000260 = 0;		// sync
   *(uint32_t*)0x20000264 = 0;		// vmode
   *(uint32_t*)0x20000268 = 0;		// rotate
   *(uint32_t*)0x2000026c = 0;		// colorspace
   *(uint32_t*)0x20000270 = 0;		// rsvd0
   *(uint32_t*)0x20000274 = 0;		// rsvd1
   *(uint32_t*)0x20000278 = 0;		// rsvd2
   *(uint32_t*)0x2000027c = 0;		// rsvd3
   *(uint32_t*)0x20000280 = 0;		// notdef...
   *(uint32_t*)0x20000284 = 0;
   *(uint32_t*)0x20000288 = 0;
   *(uint32_t*)0x2000028c = 0;
   memset((void*)0x20000290, 0, 16);
   syscall(__NR_ioctl, r[0], 0x4601, 0x20000200ul);

Note that yres_virtual is set to 0x10000000. Is there no practical limit
(hence limit check) that can be used here?

Also, in vga16fb_check_var(), beginning at line 404:

   404		if (yres > vyres)
   405			vyres = yres;
   406		if (vxres * vyres > maxmem) {
   407			vyres = maxmem / vxres;
   408			if (vyres < yres)
   409				return -ENOMEM;
   410		}

At line 406, the product of vxres * vyres overflows 32 bits (is 0 in this
case/example), so any protection from this block is lost.

But even if yres_virtual (aka vyres) is "only" 0x01000000, so no
multiplication overflow occurs, the resulting value of vyres "seems"
to still be too large and can cause an error [I'm not sure about this
last part -- I need to use a new gcc so that KASAN will work.]


> Bisection is inconclusive: the issue happens on the oldest tested release.
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10fa45d8300000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=12fa45d8300000
> console output: https://syzkaller.appspot.com/x/log.txt?x=14fa45d8300000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com
> 
> BUG: unable to handle page fault for address: ffff888001000050
> #PF: supervisor write access in kernel mode
> #PF: error_code(0x0003) - permissions violation
> PGD 10e01067 P4D 10e01067 PUD 10e02067 PMD 80000000010001e1
> Oops: 0003 [#1] PREEMPT SMP KASAN
> CPU: 1 PID: 8433 Comm: syz-executor067 Tainted: G        W         5.13.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:writeb arch/x86/include/asm/io.h:65 [inline]
> RIP: 0010:vga16fb_fillrect+0x993/0x18d0 drivers/video/fbdev/vga16fb.c:923
> Code: 6c fd 48 63 44 24 10 45 31 f6 48 89 04 24 e8 44 a6 6c fd 31 ff 89 de 31 ed e8 79 ad 6c fd 85 db 4d 89 ec 74 22 e8 2d a6 6c fd <45> 88 34 24 83 c5 01 89 df 49 83 c4 01 89 ee e8 49 ae 6c fd 39 eb
> RSP: 0018:ffffc90000eff848 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 000000000000001b RCX: 0000000000000000
> RDX: ffff88802d949c40 RSI: ffffffff8408e403 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff8408dd8d
> R10: ffffffff8408e3f7 R11: 0000000000000000 R12: ffff888001000050
> R13: ffff888001000050 R14: 0000000000000000 R15: 000000000ffeb7ff
> FS:  0000000001aa2300(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffff888001000050 CR3: 00000000346fb000 CR4: 00000000001506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   bit_clear_margins+0x3f6/0x4b0 drivers/video/fbdev/core/bitblit.c:224
>   fbcon_clear_margins+0x1f1/0x280 drivers/video/fbdev/core/fbcon.c:1315
>   fbcon_switch+0xa8c/0x1620 drivers/video/fbdev/core/fbcon.c:2146
>   redraw_screen+0x2b9/0x740 drivers/tty/vt/vt.c:1021
>   fbcon_modechanged+0x593/0x6d0 drivers/video/fbdev/core/fbcon.c:2651
>   fbcon_update_vcs+0x3a/0x50 drivers/video/fbdev/core/fbcon.c:2696
>   do_fb_ioctl+0x62e/0x690 drivers/video/fbdev/core/fbmem.c:1110
>   fb_ioctl+0xe7/0x150 drivers/video/fbdev/core/fbmem.c:1185
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:1069 [inline]
>   __se_sys_ioctl fs/ioctl.c:1055 [inline]
>   __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:1055
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x43efd9
> Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffc362df848 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000400488 RCX: 000000000043efd9
> RDX: 0000000020000200 RSI: 0000000000004601 RDI: 0000000000000003
> RBP: 0000000000402fc0 R08: 0000000000000000 R09: 0000000000400488
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000403050
> R13: 0000000000000000 R14: 00000000004ac018 R15: 0000000000400488
> Modules linked in:
> CR2: ffff888001000050
> ---[ end trace 39dce64bc5621bd3 ]---
> RIP: 0010:writeb arch/x86/include/asm/io.h:65 [inline]
> RIP: 0010:vga16fb_fillrect+0x993/0x18d0 drivers/video/fbdev/vga16fb.c:923
> Code: 6c fd 48 63 44 24 10 45 31 f6 48 89 04 24 e8 44 a6 6c fd 31 ff 89 de 31 ed e8 79 ad 6c fd 85 db 4d 89 ec 74 22 e8 2d a6 6c fd <45> 88 34 24 83 c5 01 89 df 49 83 c4 01 89 ee e8 49 ae 6c fd 39 eb
> RSP: 0018:ffffc90000eff848 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 000000000000001b RCX: 0000000000000000
> RDX: ffff88802d949c40 RSI: ffffffff8408e403 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff8408dd8d
> R10: ffffffff8408e3f7 R11: 0000000000000000 R12: ffff888001000050
> R13: ffff888001000050 R14: 0000000000000000 R15: 000000000ffeb7ff
> FS:  0000000001aa2300(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffff888001000050 CR3: 00000000346fb000 CR4: 00000000001506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400



-- 
~Randy

