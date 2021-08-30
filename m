Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A03FB3CA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 12:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFCC89CB3;
	Mon, 30 Aug 2021 10:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD2089CB3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 10:25:03 +0000 (UTC)
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 17UAOOwa067341;
 Mon, 30 Aug 2021 19:24:24 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Mon, 30 Aug 2021 19:24:24 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 17UAON0r067260
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 30 Aug 2021 19:24:24 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH V4] fbcon: fix fbcon out-of-bounds write in sys_imageblit
To: Daniel Vetter <daniel@ffwll.ch>
References: <1630294223-7225-1-git-send-email-tcs_kernel@tencent.com>
 <YSyTzlUEhrxD7rU4@phenom.ffwll.local>
Cc: tcs.kernel@gmail.com, willy@infradead.org, george.kennedy@oracle.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, Haimin Zhang <tcs_kernel@tencent.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <f9fda3fa-b2b7-57aa-8c37-69d93ae26045@i-love.sakura.ne.jp>
Date: Mon, 30 Aug 2021 19:24:21 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSyTzlUEhrxD7rU4@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 2021/08/30 17:16, Daniel Vetter wrote:
> On Mon, Aug 30, 2021 at 11:30:23AM +0800, tcs.kernel@gmail.com wrote:
>> From: Haimin Zhang <tcs_kernel@tencent.com>
>>
>> yres and vyres can be controlled by user mode parameters, and cause
>> p->vrows to become a negative value. While this value be passed to real_y
>> function, the ypos will be out of screen range.This is an out-of-bounds
>> write bug.
>> some driver will check xres and yres in fb_check_var callback,but some not
>> so we add a common check after that callback.
>>
>> Signed-off-by: Haimin Zhang <tcs_kernel@tencent.com>
>> Signed-off-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

Please s/Signed-off-by: Tetsuo Handa/Suggested-by: Tetsuo Handa/ .
It is Haimin who debugged this problem and wrote this patch.

> 
> Does this fix a syzbot crash or how was this discovered?

Yes, Haimin's team is running syzkaller locally and found this bug.
Therefore, no Reported-by: syzbot tag for this patch.


-------- Forwarded Message --------
Subject: Re: [PATCH v2] fbcon: fix Out-Of-Bounds write in sys_imageblit
Message-ID: <33fc0e30-b94c-939f-a708-4b939af43100@gmail.com>
Date: Mon, 2 Aug 2021 14:50:24 +0800

hi, Tetsuo Handa

i made a test with your suggested code, it can block the out-of-bound bug.

where to add this check logic, i suggest to add it after the driver's 
fb_check_var callback.because what we plan to add is a common check by 
framework,but some driver can fault-tolerant invalid parameters(like 
yres_virtual > yres)

	/* exist common check */
	if (var->xres < 8 || var->yres < 8)
		return -EINVAL;

        /* callback to drivers, some driver can fix invalid virtual 
xres or virtual yres */
	ret = info->fbops->fb_check_var(var, info);
	if (ret)
		return ret;
	/* we add a more check here, if some drivers can't fix invalid x,y 
virtual values, we return a -EINVAL */
	if (var->yres_virtual < var->yres || var->xres_virtual < var->xres)
		return -EINVAL;

how about this fix ?  i can make a v3 patch.



diff --git a/drivers/video/fbdev/core/fbmem.c 
b/drivers/video/fbdev/core/fbmem.c
index 1c85514..9fb7e94 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1012,6 +1012,10 @@ static int fb_check_caps(struct fb_info *info, 
struct fb_var_screeninfo *var,

        if (ret)
                return ret;
+
+       /* Virtual resolution cannot be smaller than visible resolution. */
+       if (var->yres_virtual < var->yres || var->xres_virtual < var->xres)
+               return -EINVAL;

        if ((var->activate & FB_ACTIVATE_MASK) != FB_ACTIVATE_NOW)
                return 0;



-------- Forwarded Message --------
Subject: Re: [PATCH]fbcon:fix Out-Of-Bounds write in sys_imageblit
Message-ID: <a0a228b4-d2e2-4d0d-9bfa-074049f4066b@gmail.com>
Date: Wed, 28 Jul 2021 11:10:52 +0800

this is my debug log:

1. environment
linux kernel:  git checkout  a4c30b8691f26c6115db6e11ec837c1fb6073953
qemu version:QEMU emulator version 6.0.90 (v6.1.0-rc0-99-g76bf66b913)
qemu-system-x86_64  -smp 4 -kernel 
linux_allyes/build/arch/x86/boot/bzImage  -m 4G \
-hda /data/h_image/linux_debug/buster1.img -serial stdio \
-append "earlyprintk=serial console=ttyS0 root=/dev/sda nokaslr" \
-enable-kvm -cpu host -display none -net nic -net 
user,hostfwd=tcp::1236-:22 -s -S

1.kasan report:
==================================================================
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x12f4/0x1430
Write of size 4 at addr ffffc9000b8c1fe0 by task syz-executor.7/29927

CPU: 0 PID: 29927 Comm: syz-executor.7 Tainted: G            E 
5.13.0-rc5+ #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
 dump_stack+0x141/0x1d7
 print_address_description.constprop.0.cold+0x5/0x2f8
 kasan_report.cold+0x7c/0xd8
 sys_imageblit+0x12f4/0x1430
 drm_fbdev_fb_imageblit+0x15c/0x350
 soft_cursor+0x514/0xa30
 bit_cursor+0xd07/0x1740
 fbcon_cursor+0x51d/0x630
 hide_cursor+0x85/0x280
 putconsxy+0x1d/0x450
 vcs_write+0x9cf/0xb90
 vfs_write+0x28e/0xa30
 ksys_write+0x12d/0x250
 do_syscall_64+0x3a/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f6c6d34cf59
Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 
f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 
f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007f6c6a832d98 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000000000069c038 RCX: 00007f6c6d34cf59
RDX: 000000000000008d RSI: 0000000020000040 RDI: 0000000000000003
RBP: 000000000069c038 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000069c044
R13: 00007ffd72091c8f R14: 000000000069c038 R15: 0000000000000001


Memory state around the buggy address:
 ffffc9000b8c1e80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000b8c1f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc9000b8c1f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                                                       ^
 ffffc9000b8c2000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000b8c2080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================

in
void sys_imageblit(struct fb_info *p, const struct fb_image *image)
{
	u32 fgcolor, bgcolor, start_index, bitstart, pitch_index = 0;
	u32 bpl = sizeof(u32), bpp = p->var.bits_per_pixel;
	u32 width = image->width;
	u32 dx = image->dx, dy = image->dy;
	void *dst1;

	if (p->state != FBINFO_STATE_RUNNING)
		return;

	bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
	start_index = bitstart & (32 - 1);
	pitch_index = (p->fix.line_length & (bpl - 1)) * 8;

	bitstart /= 8;
	bitstart &= ~(bpl - 1);
	dst1 = (void __force *)p->screen_base + bitstart;  // here is the bug
...
}
 p->screen_base is  alloced by  drm_fb_helper_generic_probe and size is 
0x3000000
(gdb) bt
#0  drm_fb_helper_generic_probe (fb_helper=0xffff888105b17800, 
sizes=<optimized out>) at ../drivers/gpu/drm/drm_fb_helper.c:2342
#1  0xffffffff843f9c6f in drm_fb_helper_single_fb_probe 
(preferred_bpp=32, fb_helper=0xffff888105b17800) at 
../drivers/gpu/drm/drm_fb_helper.c:1668
#2  __drm_fb_helper_initial_config_and_unlock 
(fb_helper=fb_helper@entry=0xffff888105b17800, bpp_sel=bpp_sel@entry=32) 
at ../drivers/gpu/drm/drm_fb_helper.c:1826
#3  0xffffffff843fea05 in drm_fb_helper_initial_config 
(bpp_sel=<optimized out>, fb_helper=0xffff888105b17800) at 
../drivers/gpu/drm/drm_fb_helper.c:1921
#4  drm_fb_helper_initial_config (bpp_sel=<optimized out>, 
fb_helper=0xffff888105b17800) at ../drivers/gpu/drm/drm_fb_helper.c:1913
#5  drm_fbdev_client_hotplug (client=client@entry=0xffff888105b17800) at 
../drivers/gpu/drm/drm_fb_helper.c:2423
#6  0xffffffff84402504 in drm_fbdev_generic_setup 
(dev=dev@entry=0xffff888014632000, preferred_bpp=<optimized out>, 
preferred_bpp@entry=32) at ../drivers/gpu/drm/drm_fb_helper.c:2510
#7  0xffffffff84587e71 in bochs_pci_probe (ent=<optimized out>, 
pdev=<optimized out>) at ../drivers/gpu/drm/bochs/bochs_drv.c:134
#8  bochs_pci_probe (pdev=<optimized out>, ent=<optimized out>) at 
../drivers/gpu/drm/bochs/bochs_drv.c:99
#9  0xffffffff83f7f3d6 in local_pci_probe 
(_ddi=_ddi@entry=0xffffc90000647b98) at ../drivers/pci/pci-driver.c:309
#10 0xffffffff83f842e6 in pci_call_probe (id=<optimized out>, 
dev=0xffff888015a50000, drv=<optimized out>) at 
../drivers/pci/pci-driver.c:366
#11 __pci_device_probe (pci_dev=0xffff888015a50000, drv=<optimized out>) 
at ../drivers/pci/pci-driver.c:391
#12 pci_device_probe (dev=0xffff888015a500c8) at 
../drivers/pci/pci-driver.c:434
#13 0xffffffff845d5b50 in really_probe 
(dev=dev@entry=0xffff888015a500c8, drv=drv@entry=0xffffffff8c21a930 
<bochs_pci_driver+112>) at ../drivers/base/dd.c:576
#14 0xffffffff845d686d in driver_probe_device 
(drv=drv@entry=0xffffffff8c21a930 <bochs_pci_driver+112>, 
dev=dev@entry=0xffff888015a500c8) at ../drivers/base/dd.c:763
#15 0xffffffff845d7397 in device_driver_attach 
(drv=drv@entry=0xffffffff8c21a930 <bochs_pci_driver+112>, 
dev=dev@entry=0xffff888015a500c8) at ../drivers/base/dd.c:1039
#16 0xffffffff845d7556 in __driver_attach (dev=0xffff888015a500c8, 
data=0xffffffff8c21a930 <bochs_pci_driver+112>) at ../drivers/base/dd.c:1117
#17 0xffffffff845cf008 in bus_for_each_dev (bus=<optimized out>, 
start=start@entry=0x0 <fixed_percpu_data>, 
data=data@entry=0xffffffff8c21a930 <bochs_pci_driver+112>, 
fn=fn@entry=0xffffffff845d73d0 <__driver_attach>) at 
../drivers/base/bus.c:305
#18 0xffffffff845d477a in driver_attach 
(drv=drv@entry=0xffffffff8c21a930 <bochs_pci_driver+112>) at 
../drivers/base/dd.c:1133
#19 0xffffffff845d3203 in bus_add_driver 
(drv=drv@entry=0xffffffff8c21a930 <bochs_pci_driver+112>) at 
../drivers/base/bus.c:622
#20 0xffffffff845d95db in driver_register 
(drv=drv@entry=0xffffffff8c21a930 <bochs_pci_driver+112>) at 
../drivers/base/driver.c:171
#21 0xffffffff83f7dcba in __pci_register_driver 
(drv=drv@entry=0xffffffff8c21a8c0 <bochs_pci_driver>, 
owner=owner@entry=0x0 <fixed_percpu_data>, 
mod_name=mod_name@entry=0xffffffff89d9c4c0 "bochs_drm") at 
../drivers/pci/pci-driver.c:1393
#22 0xffffffff8e85e6cb in bochs_init () at 
../drivers/gpu/drm/bochs/bochs_drv.c:191
#23 0xffffffff81002285 in do_one_initcall (fn=0xffffffff8e85e65d 
<bochs_init>) at ../init/main.c:1249
#24 0xffffffff8e7ab5f8 in do_initcall_level 
(command_line=0xffff888135a06c00 "earlyprintk", level=<optimized out>) 
at ../include/linux/compiler.h:234
#25 do_initcalls () at ../init/main.c:1338
#26 do_basic_setup () at ../init/main.c:1358
#27 kernel_init_freeable () at ../init/main.c:1560
#28 0xffffffff8915d45b in kernel_init (unused=<optimized out>) at 
../init/main.c:1447
#29 0xffffffff810046ff in ret_from_fork () at 
../arch/x86/entry/entry_64.S:294
#30 0x0000000000000000 in ?? ()
(gdb) l
2337	
2338		drm_fb_helper_fill_info(fbi, fb_helper, sizes);
2339	
2340		if (drm_fbdev_use_shadow_fb(fb_helper)) {
2341			fbi->screen_buffer = vzalloc(fbi->screen_size);
2342			if (!fbi->screen_buffer)
2343				return -ENOMEM;
2344	
2345			fbi->fbdefio = &drm_fbdev_defio;
2346	
(gdb) p/x  fbi->screen_size
$1 = 0x300000
(gdb) p/x fbi->screen_buffer
$2 = 0xffffc9000c561000
(gdb) p/x fbi->screen_base
$3 = 0xffffc9000c561000


when  run the poc :


Thread 1 hit Breakpoint 2, updatescrollmode 
(info=info@entry=0xffff8881081bd000, vc=vc@entry=0xffff888010479000, 
p=<optimized out>) at ../drivers/video/fbdev/core/fbcon.c:1950
1950	static void updatescrollmode(struct fbcon_display *p,
(gdb) frame 1
#1  0xffffffff8401d9c3 in fbcon_resize (vc=vc@entry=0xffff888010479000, 
width=width@entry=20, height=height@entry=7, user=user@entry=0) at 
../drivers/video/fbdev/core/fbcon.c:2030
2030		updatescrollmode(p, info, vc);
(gdb) p p->vrows
$5 = 48
(gdb) p &p->vrows
$6 = (int *) 0xffffffff90056094 <fb_display+20>
(gdb) frame 0
#0  updatescrollmode (info=info@entry=0xffff8881081bd000, 
vc=vc@entry=0xffff888010479000, p=<optimized out>) at 
../drivers/video/fbdev/core/fbcon.c:1950
1950	static void updatescrollmode(struct fbcon_display *p,
(gdb) n
1954		struct fbcon_ops *ops = info->fbcon_par;
(gdb)
1955		int fh = vc->vc_font.height;
(gdb)
1956		int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
(gdb)
1957		int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
(gdb)
1960		p->vrows = vyres/fh;
(gdb)
1961		if (yres > (fh * (vc->vc_rows + 1)))
(gdb) p info.var.yres_virtual
$8 = 0
(gdb) p info.var.xres_virtual
$9 = 0
(gdb) p info.var.xres
$10 = 160
(gdb) p info.var.yres
$11 = 120
(gdb) p yres
$12 = 120
(gdb) n
1963		if ((yres % fh) && (vyres % fh < yres % fh))
(gdb) n
1964			p->vrows--;

(gdb) x/1wd 0xffffffff90056094
0xffffffff90056094 <fb_display+20>:	-1
(gdb) p vc->vc_font
$19 = {width = 8, height = 16, charcount = 256, data = 
0xffffffff89c532d0 <fontdata_8x16+16> ""}

the kasan backtrace  debug  in gdb

Thread 2 hit Breakpoint 6, sys_imageblit (p=p@entry=0xffff8881081bd000, 
image=image@entry=0xffff888011f85080) at 
../drivers/video/fbdev/core/sysimgblt.c:244
244		u32 width = image->width;
(gdb) n
248		if (p->state != FBINFO_STATE_RUNNING)
(gdb)
251		bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
(gdb)
252		start_index = bitstart & (32 - 1);
(gdb)
253		pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
(gdb)
257		dst1 = (void __force *)p->screen_base + bitstart;
(gdb) n
259		if (p->fbops->fb_sync)
(gdb) p dst1
$23 = (void *) 0xffffc9000c5a1220
(gdb) p p->screen_base
$24 = 0xffffc9000c561000 ""
(gdb) p/x 0xffffc9000c5a1220-0xffffc9000c561000
$25 = 0x40220
(gdb) bt
#0  sys_imageblit (p=p@entry=0xffff8881081bd000, 
image=image@entry=0xffff888011f85080) at 
../drivers/video/fbdev/core/sysimgblt.c:259
#1  0xffffffff843fbbcc in drm_fb_helper_sys_imageblit 
(info=info@entry=0xffff8881081bd000, 
image=image@entry=0xffff888011f85080) at 
../drivers/gpu/drm/drm_fb_helper.c:794
#2  0xffffffff843fc831 in drm_fbdev_fb_imageblit 
(info=0xffff8881081bd000, image=0xffff888011f85080) at 
../drivers/gpu/drm/drm_fb_helper.c:2276
#3  0xffffffff8402eff4 in soft_cursor 
(info=info@entry=0xffff8881081bd000, 
cursor=cursor@entry=0xffffc9001090f9f0) at 
../drivers/video/fbdev/core/softcursor.c:74
#4  0xffffffff8402deb2 in bit_cursor (vc=vc@entry=0xffff888010479000, 
info=info@entry=0xffff8881081bd000, mode=mode@entry=1, fg=<optimized 
out>, bg=bg@entry=0) at ../drivers/video/fbdev/core/bitblit.c:377
#5  0xffffffff84019d5e in fbcon_cursor (vc=0xffff888010479000, mode=1) 
at ../drivers/video/fbdev/core/fbcon.c:1339
#6  0xffffffff842a5155 in set_cursor (vc=0xffff888010479000) at 
../drivers/tty/vt/vt.c:920
#7  set_cursor (vc=0xffff888010479000) at ../drivers/tty/vt/vt.c:911
#8  0xffffffff842a6135 in redraw_screen (vc=vc@entry=0xffff888010479000, 
is_switch=is_switch@entry=0) at ../drivers/tty/vt/vt.c:1037
#9  0xffffffff8401c46c in fbcon_modechanged 
(info=info@entry=0xffff8881081bd000) at 
../drivers/video/fbdev/core/fbcon.c:2651
#10 0xffffffff8401d2da in fbcon_update_vcs 
(info=info@entry=0xffff8881081bd000, all=all@entry=false) at 
../drivers/video/fbdev/core/fbcon.c:2696
#11 0xffffffff83ffa426 in do_fb_ioctl 
(info=info@entry=0xffff8881081bd000, cmd=cmd@entry=17921, 
arg=arg@entry=536870912) at ../drivers/video/fbdev/core/fbmem.c:1110
#12 0xffffffff83ffa577 in fb_ioctl (file=file@entry=0xffff88810e274500, 
cmd=cmd@entry=17921, arg=arg@entry=536870912) at 
../drivers/video/fbdev/core/fbmem.c:1185
#13 0xffffffff81cab763 in vfs_ioctl (arg=536870912, cmd=17921, 
filp=0xffff88810e274500) at ../fs/ioctl.c:51
#14 __do_sys_ioctl (arg=536870912, cmd=17921, fd=3) at ../fs/ioctl.c:1069
#15 __se_sys_ioctl (arg=536870912, cmd=17921, fd=3) at ../fs/ioctl.c:1055
#16 __x64_sys_ioctl (regs=<optimized out>) at ../fs/ioctl.c:1055
#17 0xffffffff89158596 in do_syscall_64 (nr=<optimized out>, 
regs=0xffffc9001090ff58) at ../arch/x86/entry/common.c:47
#18 0xffffffff89200068 in entry_SYSCALL_64 () at 
../arch/x86/entry/entry_64.S:112
#19 0x0000000000000000 in ?? ()

(gdb) frame 0
#0  sys_imageblit (p=p@entry=0xffff8881081bd000, 
image=image@entry=0xffff888011f85080) at 
../drivers/video/fbdev/core/sysimgblt.c:259
259		if (p->fbops->fb_sync)
(gdb) p image.dy
$29 = 64
(gdb) p image.dx
$30 = 136
(gdb) frame 1
#1  0xffffffff843fbbcc in drm_fb_helper_sys_imageblit 
(info=info@entry=0xffff8881081bd000, 
image=image@entry=0xffff888011f85080) at 
../drivers/gpu/drm/drm_fb_helper.c:794
794		sys_imageblit(info, image);
(gdb) p info.screen_
screen_base    screen_buffer  screen_size
(gdb) p info.screen_size
$31 = 3145728
(gdb) p/x  info.screen_size
$32 = 0x300000

(gdb) frame 4
#4  0xffffffff8402deb2 in bit_cursor (vc=vc@entry=0xffff888010479000, 
info=info@entry=0xffff8881081bd000, mode=mode@entry=1, fg=<optimized 
out>, bg=bg@entry=0) at ../drivers/video/fbdev/core/bitblit.c:377
377			soft_cursor(info, &cursor);
(gdb) p ops->p.vrows
$38 = -1
(gdb) p &ops->p.vrows
$39 = (int *) 0xffffffff90056094 <fb_display+20>


在 2021/7/27 23:10, Tetsuo Handa 写道:
> OK, test.c was generated by syzkaller, and I guess that
> your team is running syzkaller in your environment.
> 
> It seems that test.c is doing
> 
>    struct fb_var_screeninfo var = { ... };
>    int fd_fb0 = open("/dev/fb0", O_RDONLY);
>    ioctl(fd_fb0, FBIOPUT_VSCREENINFO, &var);
> 
>    int fd_vcs = open("/dev/vcsa5", O_WRONLY|O_NOCTTY|O_NONBLOCK);
>    write(fd_vcs, "\16\272P\323\236\3\377\231\34\0\0\0", 12);
> 
> in parallel and hitting some race.
> 
> I don't have environment to test with KASAN now. But syzbot dashboard
> indicates that crash in sys_imageblit is not happening recently.
> 
>    KASAN: vmalloc-out-of-bounds Write in sys_imageblit
>    https://syzkaller.appspot.com/bug?id=d2e785fe8b66425f3a2be0a209b08456f8200b53
> 
>    BUG: unable to handle kernel paging request in sys_imageblit
>    https://syzkaller.appspot.com/bug?id=26d6ef43f58d17c6899c63a53544ee9bb26d0bfd
> 
> You need to provide more information.
> Are you seeing this problem with v5.14-rc3 ? Please provide full oops report.
> Please show a URL for this problem if this problem was reported somewhere.
> 

