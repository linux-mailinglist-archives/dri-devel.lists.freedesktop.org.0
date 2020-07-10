Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB521B0AF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED846EBC1;
	Fri, 10 Jul 2020 07:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2882 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jul 2020 06:45:19 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8D96EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 06:45:19 +0000 (UTC)
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06A5v4ww069452;
 Fri, 10 Jul 2020 14:57:04 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Fri, 10 Jul 2020 14:57:04 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06A5v3SS069448
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Fri, 10 Jul 2020 14:57:03 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: fbconsole needs more parameter validations.
To: DRI <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <20200710055329.3759-1-penguin-kernel@I-love.SAKURA.ne.jp>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <b1e7dd6a-fc22-bba8-0abb-d3e779329bce@i-love.sakura.ne.jp>
Date: Fri, 10 Jul 2020 14:56:58 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710055329.3759-1-penguin-kernel@I-love.SAKURA.ne.jp>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzbot <syzbot+017265e8553724e514e8@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
 Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello.

While trying to debug https://syzkaller.appspot.com/bug?extid=017265e8553724e514e8 ,
I noticed that a crash can happen without opening /dev/ttyXX .

For example, while a driver which syzbot is reporting accepts screen with
var.xres = var.yres = 0 (and a crash is not visible until trying to write to
/dev/ttyXX ), a driver for VMware environment which I'm using (dmesg says "fbcon:
svgadrmfb (fb0) is primary device") rejects screen with var.xres = var.yres = 0.
However, specifying var.xres = var.yres = 1 like below reproducer causes a crash
in my VMware environment.

----------
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/fb.h>

int main(int argc, char *argv[])
{
        const int fd = open("/dev/fb0", O_ACCMODE);
        struct fb_var_screeninfo var = { };
        ioctl(fd, FBIOGET_VSCREENINFO, &var);
        var.xres = var.yres = 1;
        ioctl(fd, FBIOPUT_VSCREENINFO, &var);
        return 0;
}
----------

----------
[   20.102222] BUG: unable to handle page fault for address: ffffb80500d7b000
[   20.102225] #PF: supervisor write access in kernel mode
[   20.102226] #PF: error_code(0x0002) - not-present page
[   20.102227] PGD 13a48c067 P4D 13a48c067 PUD 13a48d067 PMD 132525067 PTE 0
[   20.102230] Oops: 0002 [#1] SMP
[   20.102232] CPU: 3 PID: 2786 Comm: a.out Not tainted 5.8.0-rc4+ #749
[   20.102233] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
[   20.102237] RIP: 0010:bitfill_aligned+0x87/0x120 [cfbfillrect]
[   20.102238] Code: c3 45 85 db 0f 85 85 00 00 00 44 89 c0 31 d2 41 f7 f1 89 c2 83 f8 07 76 41 8d 48 f8 c1 e9 03 48 83 c1 01 48 c1 e1 06 48 01 f1 <48> 89 3e 48 89 7e 08 48 89 7e 10 48 89 7e 18 48 89 7e 20 48 89 7e
[   20.102239] RSP: 0018:ffffb805012939a8 EFLAGS: 00010206
[   20.102240] RAX: 0000000003fffe70 RBX: 00000000ffff9c20 RCX: ffffb80520982000
[   20.102241] RDX: 0000000003fffe70 RSI: ffffb80500d7b000 RDI: 0000000000000000
[   20.102242] RBP: ffffb805012939b8 R08: 00000000ffff9c20 R09: ffffb80500d7aff8
[   20.102242] R10: 00000000ffffffff R11: 0000000000000000 R12: ffffffffffffffff
[   20.102243] R13: ffff976734c0c000 R14: 0000000000000000 R15: ffffb80500982c80
[   20.102244] FS:  00007f0c9589e740(0000) GS:ffff97673aec0000(0000) knlGS:0000000000000000
[   20.102265] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   20.102265] CR2: ffffb80500d7b000 CR3: 0000000136cdf004 CR4: 00000000001606e0
[   20.102277] Call Trace:
[   20.102281]  cfb_fillrect+0x159/0x340 [cfbfillrect]
[   20.102385]  ? __mutex_unlock_slowpath+0x158/0x2d0
[   20.102493]  ? cfb_fillrect+0x340/0x340 [cfbfillrect]
[   20.102747]  vmw_fb_fillrect+0x12/0x30 [vmwgfx]
[   20.102755]  bit_clear_margins+0x92/0xf0 [fb]
[   20.102760]  fbcon_clear_margins+0x4c/0x50 [fb]
[   20.102763]  fbcon_switch+0x321/0x570 [fb]
[   20.102771]  redraw_screen+0xe0/0x250
[   20.102775]  fbcon_modechanged+0x164/0x1b0 [fb]
[   20.102779]  fbcon_update_vcs+0x15/0x20 [fb]
[   20.102781]  fb_set_var+0x364/0x3c0 [fb]
[   20.102817]  do_fb_ioctl+0x2ff/0x3f0 [fb]
[   20.102894]  ? find_held_lock+0x35/0xa0
[   20.103126]  ? __audit_syscall_entry+0xd8/0x120
[   20.103135]  ? kfree+0x25a/0x2b0
[   20.103139]  fb_ioctl+0x2e/0x40 [fb]
[   20.103141]  ksys_ioctl+0x86/0xc0
[   20.103144]  ? do_syscall_64+0x20/0xa0
[   20.103146]  __x64_sys_ioctl+0x15/0x20
[   20.103148]  do_syscall_64+0x54/0xa0
[   20.103151]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   20.103152] RIP: 0033:0x7f0c953b8307
[   20.103153] Code: Bad RIP value.
[   20.103154] RSP: 002b:00007ffecbdce0f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   20.103155] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f0c953b8307
[   20.103156] RDX: 00007ffecbdce100 RSI: 0000000000004601 RDI: 0000000000000003
[   20.103156] RBP: 0000000000000000 R08: 00007f0c9568be80 R09: 0000000000000000
[   20.103157] R10: 00007ffecbdcdb60 R11: 0000000000000246 R12: 00000000004004f2
[   20.103158] R13: 00007ffecbdce280 R14: 0000000000000000 R15: 0000000000000000
[   20.103162] Modules linked in: mousedev rapl evdev input_leds led_class mac_hid psmouse pcspkr xt_tcpudp ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack sg ebtable_nat af_packet ip6table_nat ip6table_mangle ip6table_raw iptable_nat nf_nat iptable_mangle iptable_raw nf_conntrack rtc_cmos nf_defrag_ipv4 ip_set nfnetlink ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter bpfilter i2c_piix4 vmw_vmci ac intel_agp button intel_gtt ip_tables x_tables ata_generic pata_acpi serio_raw atkbd libps2 vmwgfx drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopyarea fb fbdev ttm drm i2c_core ahci drm_panel_orientation_quirks libahci backlight e1000 agpgart ata_piix libata i8042 serio unix ipv6 nf_defrag_ipv6
[   20.103194] CR2: ffffb80500d7b000
[   20.103196] ---[ end trace b2348f839f6524f9 ]---
[   20.103198] RIP: 0010:bitfill_aligned+0x87/0x120 [cfbfillrect]
[   20.103200] Code: c3 45 85 db 0f 85 85 00 00 00 44 89 c0 31 d2 41 f7 f1 89 c2 83 f8 07 76 41 8d 48 f8 c1 e9 03 48 83 c1 01 48 c1 e1 06 48 01 f1 <48> 89 3e 48 89 7e 08 48 89 7e 10 48 89 7e 18 48 89 7e 20 48 89 7e
[   20.103201] RSP: 0018:ffffb805012939a8 EFLAGS: 00010206
[   20.103202] RAX: 0000000003fffe70 RBX: 00000000ffff9c20 RCX: ffffb80520982000
[   20.103202] RDX: 0000000003fffe70 RSI: ffffb80500d7b000 RDI: 0000000000000000
[   20.103203] RBP: ffffb805012939b8 R08: 00000000ffff9c20 R09: ffffb80500d7aff8
[   20.103204] R10: 00000000ffffffff R11: 0000000000000000 R12: ffffffffffffffff
[   20.103204] R13: ffff976734c0c000 R14: 0000000000000000 R15: ffffb80500982c80
[   20.103205] FS:  00007f0c9589e740(0000) GS:ffff97673aec0000(0000) knlGS:0000000000000000
[   20.103213] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   20.103214] CR2: ffffb80500d7b000 CR3: 0000000136cdf004 CR4: 00000000001606e0
----------

A debug printk() patch

----------
diff --git a/drivers/video/fbdev/core/cfbfillrect.c b/drivers/video/fbdev/core/cfbfillrect.c
index ba9f58b2a5e8..57e4c2d1bcc0 100644
--- a/drivers/video/fbdev/core/cfbfillrect.c
+++ b/drivers/video/fbdev/core/cfbfillrect.c
@@ -321,6 +321,9 @@ void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 			fill_op32 = bitfill_aligned;
 			break;
 		}
+		if (fill_op32 == bitfill_aligned)
+			printk(KERN_DEBUG "height=%lu width=%lu bpp=%u bits=%u bytes=%u dst=%px dst_idx=%u p->fix.line_length=%u\n",
+			       height, width, bpp, bits, bytes, dst, dst_idx, p->fix.line_length);
 		while (height--) {
 			dst += dst_idx >> (ffs(bits) - 1);
 			dst_idx &= (bits - 1);
----------

says that width * bpp was a sane value for normal boot

  [    9.993434] height=16 width=800 bpp=32 bits=64 bytes=8 dst=ffff9864409c2000 dst_idx=21676032 p->fix.line_length=4704
  [   15.494941] height=8 width=800 bpp=32 bits=64 bytes=8 dst=ffff9864409c2000 dst_idx=22278144 p->fix.line_length=4704

but width * bpp was overflowing when the reproducer shown above was executed.

  [   28.164111] height=885 width=4294966497 bpp=32 bits=64 bytes=8 dst=ffff9864409c2000 dst_idx=25600 p->fix.line_length=4704

syzbot has several bug reports which are stalling inside filling functions. I guess
that these reports are unexpectedly longer loops caused by integer overflow/underflow.

Thus, I consider that we need more sanity/constraints checks.
I don't have other devices to test. Please check your drivers.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
