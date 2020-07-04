Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9AF214475
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 09:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C5A6E08A;
	Sat,  4 Jul 2020 07:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4426E08A
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 07:23:10 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5DA6D804FD;
 Sat,  4 Jul 2020 09:23:07 +0200 (CEST)
Date: Sat, 4 Jul 2020 09:23:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Panic booting qemu-system-sparc64 with bochs_drm
Message-ID: <20200704072305.GA689588@ravnborg.org>
References: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=3GLR1-XzZKwA:10 a=e5mUnYsNAAAA:8 a=20KFwNOVAAAA:8
 a=xbrbO8u3Vp6-dm8ajjMA:9 a=BW1GMov4voK_oxE-:21 a=QBtezZU2M8HmcPbf:21
 a=CjuIK1q_8ugA:10 a=HhJU-AJEKy8A:10 a=61TX3X68ulsA:10
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark.

Thanks for the report and the informative pointers.

On Fri, Jul 03, 2020 at 10:57:46PM +0100, Mark Cave-Ayland wrote:
> Hi all,
> 
> I've been receiving reports that newer sparc64 kernels have started to panic on boot
> under qemu-system-sparc64 with bochs_drm enabled which I was able to confirm locally
> building git master:
> 
> 
> [    9.007161] [drm] Found bochs VGA, ID 0xb0c5.
> [    9.007840] [drm] Framebuffer size 16384 kB @ 0x1ff22000000, mmio @ 0x1ff23000000.
> [    9.012567] [TTM] Zone  kernel: Available graphics memory: 51496 KiB
> [    9.013551] [TTM] Initializing pool allocator
> [    9.032757] [drm] Found EDID data blob.
> [    9.061904] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:01:02.0 on minor 0
> [    9.336819] Unable to handle kernel paging request at virtual address 000001ff221d0000
> [    9.337177] tsk->{mm,active_mm}->context = 0000000000000000
> [    9.337283] tsk->{mm,active_mm}->pgd = fffff80000402000
> [    9.337372]               \|/ ____ \|/
> [    9.337372]               "@'/ .. \`@"
> [    9.337372]               /_| \__/ |_\
> [    9.337372]                  \__U_/
> [    9.337468] kworker/0:0(5): Oops [#1]
> [    9.339359] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.8.0-rc3+ #55
> [    9.341360] Workqueue: events drm_fb_helper_dirty_work
> [    9.341775] TSTATE: 0000000080001605 TPC: 000000000077441c TNPC: 0000000000774420
> Y: 00000000    Not tainted
> [    9.341894] TPC: <memcpy+0x121c/0x13c0>
> [    9.342015] g0: 0000000000000000 g1: 0000000000000000 g2: 0000000000000000 g3:
> fffff800043d2c00
> [    9.342094] g4: fffff8000410eac0 g5: fffff800064cc000 g6: fffff80004124000 g7:
> 0000000000000010
> [    9.342173] o0: 000001ff221d0000 o1: 0000000100220000 o2: 0000000000000000 o3:
> 000001fe21fb0000
> [    9.342254] o4: 000001ff221d0000 o5: 0000000000000000 sp: fffff800041273d1 ret_pc:
> 0000000000805b18
> [    9.342325] RPC: <drm_fb_helper_dirty_work+0xf8/0x180>
> [    9.342591] l0: fffff80007819cc0 l1: fffff800043df8cc l2: 0000000001356200 l3:
> fffff800064cc000
> [    9.342670] l4: fffff80004004200 l5: 0000000000000000 l6: 0000000000000025 l7:
> fffff80004002500
> [    9.342750] i0: fffff800043df8d0 i1: fffff800040106b0 i2: 0000000000000020 i3:
> fffff800043e5500
> [    9.342829] i4: 00000000000001d1 i5: 0000000100220000 i6: fffff80004127491 i7:
> 0000000000481fec
> [    9.342960] I7: <process_one_work+0x18c/0x540>
> [    9.343308] Call Trace:
> [    9.344077] [<0000000000481fec>] process_one_work+0x18c/0x540
> [    9.344267] [<00000000004824c4>] worker_thread+0x124/0x580
> [    9.344310] [<0000000000489758>] kthread+0xf8/0x120
> [    9.344357] [<00000000004060a4>] ret_from_fork+0x1c/0x2c
> [    9.344714] [<0000000000000000>] 0x0
> 
> 
> The error "Unable to handle kernel paging request at virtual address
> 000001ff221d0000" is caused by trying to access the framebuffer using a virtual
> address, rather than using IO accessors which access the framebuffer correctly using
> SPARC ASI_PHYS (physical) loads and stores. In some ways this is similar to the bug I
> reported a couple of years back at
> https://lists.freedesktop.org/archives/dri-devel/2017-June/145793.html which was
> fixed with https://lists.freedesktop.org/archives/dri-devel/2017-July/145935.html.
> 
> According to git bisect the regression is introduced by the following commit:
> 
> $ git bisect bad
> 7a0483ac4ffca4998945c159b28afdde8353cc84 is the first bad commit
> commit 7a0483ac4ffca4998945c159b28afdde8353cc84
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Fri Jan 11 06:37:50 2019 +0100
> 
>     drm/bochs: switch to generic drm fbdev emulation
> 
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>     Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>     Link:
> http://patchwork.freedesktop.org/patch/msgid/20190111053752.4004-15-kraxel@redhat.com
> 
> :040000 040000 1917943277034f620af03ac1a2fa5db48b7b224c
> 6d7a3c316a68efbffd398d6c2b7eebefb47bc92d M      drivers
> 
> 
> The commit following this one at
> https://patchwork.freedesktop.org/patch/276488/?series=54269&rev=4 removes
> bochsfb_ops and the cfb helpers which was the original fix introduced by my second
> patch above, so I'm unsure how to approach fixing this with the switch to
> drm_fbdev_generic_setup().
> 
> Can anyone point me in the right direction?

I tried to take a look at this - came up with the following untested
hack.
The idea is that we in mode_config can specify if we need the cfb
variants. (I do not know what cfb is acronym for?)
Then when we setup the framebuffer we select the relevant fbops.

The oops refers to drm_fb_helper_dirty_work, so I think it is the memcpy
in drm_fb_helper_dirty_blit_real() that hits us.

For now I used fb_memcpy_tofb() - but that is a macro that is
expanded depending on the architecture. I think we can do btter if this
works.

	Sam


diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 853081d186d5..1609ac6efbcb 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -151,6 +151,7 @@ int bochs_kms_init(struct bochs_device *bochs)
 	bochs->dev->mode_config.preferred_depth = 24;
 	bochs->dev->mode_config.prefer_shadow = 0;
 	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
+	bochs->dev->mode_config.use_cfb_for_fbdev = true;
 	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 
 	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 170aa7689110..44e833b2f015 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -382,8 +382,13 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
 	size_t len = (clip->x2 - clip->x1) * cpp;
 	unsigned int y;
 
+	// TODO
 	for (y = clip->y1; y < clip->y2; y++) {
-		memcpy(dst, src, len);
+		if (fb_helper->dev->mode_config.use_cfb_for_fbdev)
+			fb_memcpy_tofb(dst, src, len);
+		else
+			memcpy(dst, src, len);
+
 		src += fb->pitches[0];
 		dst += fb->pitches[0];
 	}
@@ -2017,6 +2022,21 @@ static const struct fb_ops drm_fbdev_fb_ops = {
 	.fb_imageblit	= drm_fb_helper_sys_imageblit,
 };
 
+static const struct fb_ops drm_fbdev_cfb_fb_ops = {
+	.owner		= THIS_MODULE,
+	DRM_FB_HELPER_DEFAULT_OPS,
+	.fb_open	= drm_fbdev_fb_open,
+	.fb_release	= drm_fbdev_fb_release,
+	.fb_destroy	= drm_fbdev_fb_destroy,
+	.fb_mmap	= drm_fbdev_fb_mmap,
+	.fb_read	= drm_fb_helper_sys_read,
+	.fb_write	= drm_fb_helper_sys_write,
+	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
+	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
+	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
+};
+
+
 static struct fb_deferred_io drm_fbdev_defio = {
 	.delay		= HZ / 20,
 	.deferred_io	= drm_fb_helper_deferred_io,
@@ -2057,7 +2077,11 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	if (IS_ERR(fbi))
 		return PTR_ERR(fbi);
 
-	fbi->fbops = &drm_fbdev_fb_ops;
+	if (fb_helper->dev->mode_config.use_cfb_for_fbdev)
+		fbi->fbops = &drm_fbdev_cfb_fb_ops;
+	else
+		fbi->fbops = &drm_fbdev_fb_ops;
+
 	fbi->screen_size = fb->height * fb->pitches[0];
 	fbi->fix.smem_len = fbi->screen_size;
 
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 6c3ef49b46b3..dce9adf7d189 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -865,6 +865,15 @@ struct drm_mode_config {
 	 */
 	bool prefer_shadow_fbdev;
 
+	/**
+	 * @use_cfb_for_fbdev:
+	 *
+	 * Use cfb variants of drm_fb_helper_cfb_{fillrect,copyarea,imageblit}
+	 * The cfb variants are required when the CPU do not allow direct
+	 * access to the framebuffer (for example sparc64)
+	 */
+	bool use_cfb_for_fbdev;
+
 	/**
 	 * @quirk_addfb_prefer_xbgr_30bpp:
 	 *

> 
> 
> Many thanks,
> 
> Mark.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
