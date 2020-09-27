Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF3527A826
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361886E364;
	Mon, 28 Sep 2020 07:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5E56E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 08:28:35 +0000 (UTC)
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08R8SEm3019762;
 Sun, 27 Sep 2020 17:28:15 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp);
 Sun, 27 Sep 2020 17:28:14 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08R8SDHf019753
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Sun, 27 Sep 2020 17:28:14 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: KASAN: use-after-free Read in bit_putcs
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, deller@gmx.de,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 syzkaller-bugs@googlegroups.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
Message-ID: <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
Date: Sun, 27 Sep 2020 17:28:12 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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

Well, vt_io_ioctl(PIO_FONT) initializes "struct console_font_op op;" with

  op.width = 8;
  op.height = 0;
  op.charcount = 256;

and calls con_font_set() from con_font_op(). But the "/* Need to guess font height [compat] */"
chunk in con_font_set() guesses font's height due to being initialized with op.height = 0.
Then, con_font_set() calls fbcon_set_font() via vc->vc_sw->con_font_set(), and fbcon_set_font()
allocates minimal amount of memory for font data based on font's height calcllated by con_font_set().

Therefore, any attempt to change font's height (like vt_resizex()) larger than font's height
calculated by con_font_set() can cause OOB read of memory block for font data. If we allocate
maximal amount of memory for any font, OOB read of memory block for font data should not happen.

----------------------------------------

static char fontdata[8192] = { 2 };

[  227.065369] bit_putcs: width=1 cellsize=1 count=80 maxcnt=8192 scan_align=0 buf_align=0 image.height=1
[  227.066254] bit_putcs: width=1 cellsize=1 count=80 maxcnt=8192 scan_align=0 buf_align=0 image.height=1
[  227.067642] vc=ffff8880d69b4000 v.v_rows=0 v.v_cols=0 v.v_vlin=1 v.v_clin=9 v.v_vcol=0 v.v_ccol=0 ret=0
[  227.067699] vcp=ffff8880d69b4000 before: ->vc_rows=480 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=1
[  227.067774] vcp=ffff8880d69b4000 after: ->vc_rows=480 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=1 ret=0
[  227.067831] vcp=ffff8880cac4b000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  227.067891] vcp=ffff8880cac4b000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  227.067947] vcp=ffff8880c6180000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  227.068007] vcp=ffff8880c6180000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  227.068063] vcp=ffff8880d6b84000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  227.068123] vcp=ffff8880d6b84000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  227.068179] vcp=ffff8880ca8c0000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  227.068255] vcp=ffff8880ca8c0000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  227.068455] vcp=ffff8880cbd5d000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  227.068515] vcp=ffff8880cbd5d000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  227.084709] ==================================================================
[  227.084729] BUG: KASAN: slab-out-of-bounds in soft_cursor+0x34e/0x4a0
[  227.084748] Read of size 9 at addr ffff8880c98d5930 by task a.out/1662

[  227.084786] CPU: 3 PID: 1662 Comm: a.out Not tainted 5.9.0-rc6+ #639
[  227.084810] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
[  227.084818] Call Trace:
[  227.084830]  dump_stack+0x161/0x1c3
[  227.084842]  ? soft_cursor+0x34e/0x4a0
[  227.084854]  ? soft_cursor+0x34e/0x4a0
[  227.084871]  print_address_description.constprop.0.cold+0xd3/0x4c5
[  227.084884]  ? lock_is_held_type+0xbf/0xf0
[  227.084896]  ? vprintk_func+0xe2/0x155
[  227.084908]  ? soft_cursor+0x34e/0x4a0
[  227.084920]  ? soft_cursor+0x34e/0x4a0
[  227.084932]  kasan_report.cold+0x1f/0x42
[  227.084944]  ? soft_cursor+0x34e/0x4a0
[  227.084957]  check_memory_region+0x152/0x1b0
[  227.084967]  memcpy+0x24/0x60
[  227.084979]  soft_cursor+0x34e/0x4a0
[  227.084990]  bit_cursor+0x7f6/0xce6
[  227.085001]  ? bit_putcs+0x320/0x320
[  227.085016]  ? fb_get_color_depth.part.0+0x57/0xe0
[  227.085031]  ? __sanitizer_cov_trace_switch+0x49/0x80
[  227.085042]  ? bit_putcs+0x320/0x320
[  227.085054]  fbcon_cursor+0x241/0x2c0
[  227.085065]  hide_cursor+0x58/0x150
[  227.085077]  vt_console_print+0x865/0x870
[  227.085089]  ? lock_release+0x480/0x480
[  227.085102]  ? lock_downgrade+0x3e0/0x3e0
[  227.085115]  ? do_raw_spin_lock+0x110/0x1f0
[  227.085128]  ? screen_glyph_unicode+0x140/0x140
[  227.085141]  ? rwlock_bug.part.0+0x50/0x50
[  227.085156]  ? check_preemption_disabled+0x50/0x130
[  227.085169]  ? screen_glyph_unicode+0x140/0x140
[  227.085181]  console_unlock+0x92c/0xb30
[  227.085193]  vt_ioctl.cold+0x182/0x3a2
[  227.085207]  ? complete_change_console+0x1e0/0x1e0
[  227.085219]  ? find_held_lock+0x85/0xa0
[  227.085234]  ? debug_check_no_obj_freed+0x18d/0x276
[  227.085246]  ? lock_downgrade+0x3e0/0x3e0
[  227.085258]  ? find_held_lock+0x85/0xa0
[  227.085271]  ? lock_is_held_type+0xbf/0xf0
[  227.085281]  ? putname+0xa7/0xc0
[  227.085292]  ? putname+0xa7/0xc0
[  227.085302]  ? putname+0xa7/0xc0
[  227.085317]  ? __sanitizer_cov_trace_switch+0x49/0x80
[  227.085332]  ? complete_change_console+0x1e0/0x1e0
[  227.085343]  ? tty_ioctl+0x7c4/0xec0
[  227.085368]  tty_ioctl+0x7c4/0xec0
[  227.085383]  ? kmem_cache_free.part.0+0x1b0/0x1e0
[  227.085394]  ? tty_vhangup+0x30/0x30
[  227.085409]  ? __sanitizer_cov_trace_switch+0x49/0x80
[  227.085421]  ? do_vfs_ioctl+0x224/0xc50
[  227.085434]  ? ioctl_file_clone+0x140/0x140
[  227.085449]  ? rcu_read_lock_sched_held+0xa0/0xd0
[  227.085464]  ? rcu_read_lock_any_held.part.0+0x30/0x30
[  227.085479]  ? check_preemption_disabled+0x50/0x130
[  227.085491]  ? lock_is_held_type+0xbf/0xf0
[  227.085506]  ? syscall_enter_from_user_mode+0x1c/0x60
[  227.085520]  ? rcu_read_lock_sched_held+0xa0/0xd0
[  227.085533]  ? mark_held_locks+0x24/0x90
[  227.085544]  ? tty_vhangup+0x30/0x30
[  227.085556]  __x64_sys_ioctl+0xec/0x140
[  227.085568]  do_syscall_64+0x31/0x70
[  227.085583]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  227.085594] RIP: 0033:0x7f261b69e50b
[  227.085643] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
[  227.085658] RSP: 002b:00007fff1894fb98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  227.085691] RAX: ffffffffffffffda RBX: 0000560076c54220 RCX: 00007f261b69e50b
[  227.085711] RDX: 00007fff1894fbac RSI: 000000000000560a RDI: 0000000000000003
[  227.085731] RBP: 0000000000000003 R08: 0000000000000000 R09: 00007f261b794d50
[  227.085751] R10: 0000000000000000 R11: 0000000000000246 R12: 0000560076c54130
[  227.085771] R13: 00007fff1894fcb0 R14: 0000000000000000 R15: 0000000000000000

[  227.085791] Allocated by task 1662:
[  227.085803]  kasan_save_stack+0x1f/0x40
[  227.085817]  __kasan_kmalloc.constprop.0+0xbf/0xd0
[  227.085828]  __kmalloc+0x57d/0x9d0
[  227.085840]  fbcon_set_font+0x1a6/0x4a0
[  227.085852]  con_font_op+0x8e2/0xac0
[  227.085863]  vt_ioctl+0x1186/0x21a0
[  227.085874]  tty_ioctl+0x7c4/0xec0
[  227.085886]  __x64_sys_ioctl+0xec/0x140
[  227.085898]  do_syscall_64+0x31/0x70
[  227.085913]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

[  227.085940] The buggy address belongs to the object at ffff8880c98d5800
[  227.085957]  which belongs to the cache kmalloc-512 of size 512
[  227.085974] The buggy address is located 304 bytes inside of
[  227.085992]  512-byte region [ffff8880c98d5800, ffff8880c98d5a00)
[  227.086007] The buggy address belongs to the page:
[  227.086033] page:00000000022668f3 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xc98d5
[  227.086047] flags: 0xfffe0000000200(slab)
[  227.086081] raw: 00fffe0000000200 ffffea00032c4b08 ffffea0003205748 ffff8880d6840600
[  227.086104] raw: 0000000000000000 ffff8880c98d5000 0000000100000004 ffff8880d2419241
[  227.086121] page dumped because: kasan: bad access detected
[  227.086136] page->mem_cgroup:ffff8880d2419241

[  227.086158] Memory state around the buggy address:
[  227.086179]  ffff8880c98d5800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  227.086201]  ffff8880c98d5880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  227.086222] >ffff8880c98d5900: 00 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  227.086237]                                      ^
[  227.086258]  ffff8880c98d5980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  227.086279]  ffff8880c98d5a00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  227.086301] ==================================================================

----------------------------------------

static char fontdata[8192] = { 2, 3 };

[  464.415205] vcp=ffff8880d69b4000 before: ->vc_rows=240 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=1 ->vc_font.height=9 save_font_height=2
[  464.415265] vcp=ffff8880d69b4000 after: ->vc_rows=240 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=1 ->vc_font.height=9 save_font_height=2 ret=0

[  464.431257] bit_putcs: width=1 cellsize=9 count=68 maxcnt=910 scan_align=0 buf_align=0 image.height=9
[  464.431279] ==================================================================
[  464.431299] BUG: KASAN: slab-out-of-bounds in bit_putcs.cold+0x570/0x5aa
[  464.431319] Read of size 1 at addr ffff8880ca0ccb43 by task a.out/1757

----------------------------------------

static char fontdata[8192] = "0123456789abcdef0123456789abcdef";

[  300.610119] bit_putcs: width=1 cellsize=32 count=80 maxcnt=256 scan_align=0 buf_align=0 image.height=32
[  300.630932] bit_putcs: width=1 cellsize=32 count=80 maxcnt=256 scan_align=0 buf_align=0 image.height=32
[  300.652194] vc=ffff8880d69b4000 v.v_rows=0 v.v_cols=0 v.v_vlin=1 v.v_clin=9 v.v_vcol=0 v.v_ccol=0 ret=0
[  300.652249] vcp=ffff8880d69b4000 before: ->vc_rows=15 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=32
[  300.652308] vcp=ffff8880d69b4000 after: ->vc_rows=15 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=32 ret=0
[  300.652500] vcp=ffff8880d55ba000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  300.652559] vcp=ffff8880d55ba000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  300.652613] vcp=ffff8880d4d87000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  300.652690] vcp=ffff8880d4d87000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  300.652767] vcp=ffff8880d546b000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  300.652849] vcp=ffff8880d546b000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  300.652926] vcp=ffff8880c8f85000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  300.653008] vcp=ffff8880c8f85000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  300.653085] vcp=ffff8880d55db000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
[  300.653167] vcp=ffff8880d55db000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
[  300.665421] bit_putcs: width=1 cellsize=9 count=68 maxcnt=910 scan_align=0 buf_align=0 image.height=9
[  300.665450] bit_putcs: width=1 cellsize=9 count=46 maxcnt=910 scan_align=0 buf_align=0 image.height=9

----------------------------------------

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
