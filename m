Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C75421E8F4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D77A6E90B;
	Tue, 14 Jul 2020 07:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A934A6E29A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 06:16:32 +0000 (UTC)
Received: from fsav402.sakura.ne.jp (fsav402.sakura.ne.jp [133.242.250.101])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06B6GHGH021973;
 Sat, 11 Jul 2020 15:16:17 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav402.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp);
 Sat, 11 Jul 2020 15:16:16 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06B6GBRs021817
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Sat, 11 Jul 2020 15:16:16 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: fbconsole needs more parameter validations.
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200710055329.3759-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <b1e7dd6a-fc22-bba8-0abb-d3e779329bce@i-love.sakura.ne.jp>
 <20200710105637.GB1232395@kroah.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <f80527f4-ffb2-69ef-ebd4-3de92cacfa17@i-love.sakura.ne.jp>
Date: Sat, 11 Jul 2020 15:16:10 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710105637.GB1232395@kroah.com>
Content-Language: en-US
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>,
 Jiri Slaby <jslaby@suse.com>,
 syzbot <syzbot+017265e8553724e514e8@syzkaller.appspotmail.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/07/10 19:56, Greg Kroah-Hartman wrote:
> Where is the over/underflow happening here when we set a size to be so
> small?  We should bound the size somewhere, and as you show, that's not
> really working properly, right?

It is bit_clear_margins() where integer underflow is happening (4294966497 == 1 - 100 * 8),
but the cause of this problem seems to be fbcon_startup() or vc_do_resize().

Since fbcon_modechanged() is doing

  cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
  rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
  cols /= vc->vc_font.width;
  rows /= vc->vc_font.height;
  vc_resize(vc, cols, rows);
  (...snipped...)
  update_screen(vc);

, info->var.xres < vc->vc_font.width makes cols == 0 and info->var.yres < vc->vc_font.height
makes rows == 0. But vc_resize(vc, 0, 0) has a special meaning because vc_do_resize() is doing

  new_cols = (cols ? cols : vc->vc_cols);
  new_rows = (lines ? lines : vc->vc_rows);

which results in new_cols == 100 and new_rows == 37 despite var.xres == var.yres == 1,
and vc_do_resize() returns without actually resizing. Then, fbcon_modechanged() calls
fbcon_switch(vc) via vc->vc_sw->con_switch(vc) via redraw_screen(vc, 0) via update_screen(vc),
and fbcon_switch() calls bit_clear_margins() via fbcon_clear_margins(vc, 0), and integer
underflow happens due to info->var.xres=1 && vc->vc_cols=100 && vc->vc_font.width=8.

And fbcon_modechanged() is too late to return -EINVAL if
info->var.xres < vc->vc_font.width || info->var.yres < vc->vc_font.height at fb_set_var().

----------
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 42d8c67a481f..4af82cabb6c4 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1214,6 +1214,8 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 	new_rows = (lines ? lines : vc->vc_rows);
 	new_row_size = new_cols << 1;
 	new_screen_size = new_row_size * new_rows;
+	printk(KERN_DEBUG "%s: new_cols=%u cols=%u vc->vc_cols=%u new_rows=%u lines=%u vc->vc_rows=%u\n",
+	       __func__, new_cols, cols, vc->vc_cols, new_rows, lines, vc->vc_rows);
 
 	if (new_cols == vc->vc_cols && new_rows == vc->vc_rows)
 		return 0;
diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index ca935c09a261..8d949679bfba 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -221,6 +221,8 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
 		region.dy = 0;
 		region.width = rw;
 		region.height = info->var.yres_virtual;
+		printk(KERN_DEBUG "%s: rw=%u info->var.xres=%u vc->vc_cols=%u vc->vc_font.width=%u\n",
+		       __func__, rw, info->var.xres, vc->vc_cols, vc->vc_font.width);
 		info->fbops->fb_fillrect(info, &region);
 	}
 
@@ -229,6 +231,8 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
 		region.dy = info->var.yoffset + bs;
 		region.width = rs;
 		region.height = bh;
+		printk(KERN_DEBUG "%s: bh=%u info->var.yres=%u vc->vc_rows=%u vc->vc_font.height=%u\n",
+		       __func__, bh, info->var.yres, vc->vc_rows, vc->vc_font.height);
 		info->fbops->fb_fillrect(info, &region);
 	}
 }
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index e2a490c5ae08..f83525a58137 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2983,6 +2983,8 @@ static void fbcon_modechanged(struct fb_info *info)
 
 	if (con_is_visible(vc)) {
 		var_to_display(p, &info->var, info);
+		printk(KERN_DEBUG "%s: ops->rotate=%d info->var.xres=%u, info->var.yres=%u vc->vc_font.width=%u vc->vc_font.height=%u\n",
+		       __func__, ops->rotate, info->var.xres, info->var.yres, vc->vc_font.width, vc->vc_font.height);
 		cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
 		rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 		cols /= vc->vc_font.width;
----------

----------
[   21.854895][ T2790] fbcon_modechanged: ops->rotate=0 info->var.xres=1, info->var.yres=1 vc->vc_font.width=8 vc->vc_font.height=16
[   21.854900][ T2790] vc_do_resize: new_cols=100 cols=0 vc->vc_cols=100 new_rows=37 lines=0 vc->vc_rows=37
[   21.854909][ T2790] bit_clear_margins: rw=4294966497 info->var.xres=1 vc->vc_cols=100 vc->vc_font.width=8
[   21.855743][ T2790] BUG: unable to handle page fault for address: ffffb54440d3b000
[   21.855745][ T2790] #PF: supervisor write access in kernel mode
[   21.855746][ T2790] #PF: error_code(0x0002) - not-present page
[   21.855747][ T2790] PGD 13a48c067 P4D 13a48c067 PUD 13a48d067 PMD 13251c067 PTE 0
[   21.855751][ T2790] Oops: 0002 [#1] SMP
[   21.855753][ T2790] CPU: 0 PID: 2790 Comm: a.out Not tainted 5.8.0-rc4+ #753
[   21.855754][ T2790] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
[   21.855758][ T2790] RIP: 0010:bitfill_aligned+0x87/0x120 [cfbfillrect]
[   21.855759][ T2790] Code: c3 45 85 db 0f 85 85 00 00 00 44 89 c0 31 d2 41 f7 f1 89 c2 83 f8 07 76 41 8d 48 f8 c1 e9 03 48 83 c1 01 48 c1 e1 06 48 01 f1 <48> 89 3e 48 89 7e 08 48 89 7e 10 48 89 7e 18 48 89 7e 20 48 89 7e
[   21.855760][ T2790] RSP: 0018:ffffb5444124b9a0 EFLAGS: 00010206
[   21.855761][ T2790] RAX: 0000000003fffe70 RBX: 00000000ffff9c20 RCX: ffffb54460942000
[   21.855762][ T2790] RDX: 0000000003fffe70 RSI: ffffb54440d3b000 RDI: 0000000000000000
[   21.855763][ T2790] RBP: ffffb5444124b9b0 R08: 00000000ffff9c20 R09: ffffb54440d3aff8
[   21.855763][ T2790] R10: 00000000ffffffff R11: 0000000000000000 R12: ffffffffffffffff
[   21.855764][ T2790] R13: ffffa0d534c32800 R14: 0000000000000000 R15: ffffb54440942c80
[   21.855765][ T2790] FS:  00007f9cef82a740(0000) GS:ffffa0d53ae00000(0000) knlGS:0000000000000000
[   21.855785][ T2790] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   21.855786][ T2790] CR2: ffffb54440d3b000 CR3: 000000013766d006 CR4: 00000000001606f0
[   21.855797][ T2790] Call Trace:
[   21.855801][ T2790]  cfb_fillrect+0x159/0x340 [cfbfillrect]
[   21.855806][ T2790]  ? vprintk_func+0x5a/0x10d
[   21.855808][ T2790]  ? cfb_fillrect+0x340/0x340 [cfbfillrect]
[   21.855821][ T2790]  vmw_fb_fillrect+0x12/0x30 [vmwgfx]
[   21.855828][ T2790]  bit_clear_margins+0xe0/0xf0 [fb]
[   21.855832][ T2790]  fbcon_clear_margins+0x4c/0x50 [fb]
[   21.855835][ T2790]  fbcon_switch+0x321/0x570 [fb]
[   21.855843][ T2790]  redraw_screen+0xe0/0x250
[   21.855847][ T2790]  fbcon_modechanged+0x1a3/0x1f0 [fb]
[   21.855851][ T2790]  fbcon_update_vcs+0x15/0x20 [fb]
[   21.855853][ T2790]  fb_set_var+0x364/0x3c0 [fb]
[   21.855863][ T2790]  do_fb_ioctl+0x2ff/0x3f0 [fb]
[   21.855866][ T2790]  ? find_held_lock+0x35/0xa0
[   21.855870][ T2790]  ? __audit_syscall_entry+0xd8/0x120
[   21.855888][ T2790]  ? kfree+0x25a/0x2b0
[   21.855944][ T2790]  fb_ioctl+0x2e/0x40 [fb]
[   21.855947][ T2790]  ksys_ioctl+0x86/0xc0
[   21.855950][ T2790]  ? do_syscall_64+0x20/0xa0
[   21.855952][ T2790]  __x64_sys_ioctl+0x15/0x20
[   21.855954][ T2790]  do_syscall_64+0x54/0xa0
[   21.855957][ T2790]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   21.855959][ T2790] RIP: 0033:0x7f9cef344307
[   21.855959][ T2790] Code: Bad RIP value.
[   21.855960][ T2790] RSP: 002b:00007ffddb6f2e48 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   21.855962][ T2790] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f9cef344307
[   21.855962][ T2790] RDX: 00007ffddb6f2e50 RSI: 0000000000004601 RDI: 0000000000000003
[   21.855963][ T2790] RBP: 0000000000000000 R08: 00007f9cef617e80 R09: 0000000000000000
[   21.855964][ T2790] R10: 00007ffddb6f28a0 R11: 0000000000000246 R12: 00000000004004f2
[   21.855964][ T2790] R13: 00007ffddb6f2fd0 R14: 0000000000000000 R15: 0000000000000000
[   21.855969][ T2790] Modules linked in: mousedev rapl evdev input_leds led_class mac_hid psmouse pcspkr xt_tcpudp af_packet ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_nat ip6table_mangle ip6table_raw iptable_nat nf_nat iptable_mangle iptable_raw nf_conntrack rtc_cmos nf_defrag_ipv4 ip_set vmw_vmci nfnetlink ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter bpfilter sg ac button i2c_piix4 intel_agp intel_gtt ip_tables x_tables ata_generic pata_acpi serio_raw atkbd libps2 vmwgfx drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopyarea fb fbdev ttm drm ahci libahci i2c_core drm_panel_orientation_quirks backlight ata_piix e1000 agpgart libata i8042 serio unix ipv6 nf_defrag_ipv6
[   21.856040][ T2790] CR2: ffffb54440d3b000
[   21.856042][ T2790] ---[ end trace 083bab4cc8751a86 ]---
[   21.856044][ T2790] RIP: 0010:bitfill_aligned+0x87/0x120 [cfbfillrect]
----------

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
