Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44990B85D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 19:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A183A10E069;
	Mon, 17 Jun 2024 17:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2807210E069
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 17:42:24 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4W2xzL3b6Fz4wx6g
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 19:42:22 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b49f:13a3:7ee:d02c])
 by baptiste.telenet-ops.be with bizsmtp
 id chiM2C0074amk4u01hiMaR; Mon, 17 Jun 2024 19:42:22 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sJGN3-002KjY-Ik;
 Mon, 17 Jun 2024 19:42:21 +0200
Date: Mon, 17 Jun 2024 19:42:21 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: peng.fan@oss.nxp.com, daniel@ffwll.ch, javierm@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/fbdev-dma: Only set smem_start is enable per module
 option
In-Reply-To: <20240617152843.11886-1-tzimmermann@suse.de>
Message-ID: <2643bb67-e3a6-8ca7-37d1-e98080952589@linux-m68k.org>
References: <20240617152843.11886-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

 	Hi Thomas,

On Mon, 17 Jun 2024, Thomas Zimmermann wrote:
> Only export struct fb_info.fix.smem_start if that is required by the
> user and the memory does not come from vmalloc().
>
> Setting struct fb_info.fix.smem_start breaks systems where DMA
> memory is backed by vmalloc address space. An example error is
> shown below.
>
> [    3.536043] ------------[ cut here ]------------
> [    3.540716] virt_to_phys used for non-linear address: 000000007fc4f540 (0xffff800086001000)
> [    3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/physaddr.c:12 __virt_to_phys+0x68/0x98
> [    3.565455] Modules linked in:
> [    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted 6.6.23-06226-g4986cc3e1b75-dirty #250
> [    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
> [    3.582452] Workqueue: events_unbound deferred_probe_work_func
> [    3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    3.595233] pc : __virt_to_phys+0x68/0x98
> [    3.599246] lr : __virt_to_phys+0x68/0x98
> [    3.603276] sp : ffff800083603990
> [    3.677939] Call trace:
> [    3.680393]  __virt_to_phys+0x68/0x98
> [    3.684067]  drm_fbdev_dma_helper_fb_probe+0x138/0x238
> [    3.689214]  __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
> [    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
> [    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
> [    3.705161]  drm_client_register+0x60/0xb0
> [    3.709269]  drm_fbdev_dma_setup+0x94/0x148
>
> Additionally, DMA memory is assumed to by contiguous in physical
> address space, which is not guaranteed by vmalloc().
>
> Resolve this by checking the module flag drm_leak_fbdev_smem when
> DRM allocated the instance of struct fb_info. Fbdev-dma then only
> sets smem_start only if required (via FBINFO_HIDE_SMEM_START). Also
> guarantee that the framebuffer is not located in vmalloc address
> space.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Peng Fan (OSS) <peng.fan@oss.nxp.com>
> Closes: https://lore.kernel.org/dri-devel/20240604080328.4024838-1-peng.fan@oss.nxp.com/
> Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")

Thanks, this fixes the issue I was seeing on R-Car Gen3/Gen4 with rcar-du.

No regressions on R-Car Gen2 (rcar-du) and R-Mobile A1 (shmobile)
which didn't shown the warning in the first place.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
