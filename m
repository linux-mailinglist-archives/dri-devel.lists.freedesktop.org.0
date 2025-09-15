Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9DB57A47
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633AC10E2D2;
	Mon, 15 Sep 2025 12:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Co5+sy+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730FB10E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:19:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 200D744138;
 Mon, 15 Sep 2025 12:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476D1C4CEF1;
 Mon, 15 Sep 2025 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757938774;
 bh=MnBwRfTnVKlws2kOlxFS7l9GMj/kw+QrNq5OEgfPKYo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Co5+sy+QHZjcwW9dpqXXywQcZ4Vcr/lkvc46SbgOpgRR99eD6X1l410LI5wK6zQRs
 mhW6eQQ/aOTdSXBqYaz1rbryWAyHBBFA4sT2on91yTiz0iCGefr9cK8WsIAppuALmS
 tvHL6uNzIFti5nHLTpz3OQ5C4DeRi8l380qFVQoZoNhKGllCyxRTmhhnA9q/ICDfcd
 XnwjSfUEAT2SfyDBvb+BPmwNaHAwTiyT7UqJxaFLUHj4rN3OPIb0H/bOBUF7my188/
 GEQ86lKXEAoV26gHZzmkgDePEUid6koMBG4qUOs2jtxnOJTk/eVG24desegOOfJW+5
 Jpa/u1ozR/6IA==
Message-ID: <802c1bad-94e4-4dae-94fe-ced28aebbe2a@kernel.org>
Date: Mon, 15 Sep 2025 14:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fbdev/simplefb: Fix use after free in
 simplefb_detach_genpds()
To: Janne Grunau <j@jannau.net>, Helge Deller <deller@gmx.de>,
 Thierry Reding <treding@nvidia.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Huhardeaux <tech@tootai.net>,
 stable@vger.kernel.org
References: <20250915-simplefb-genpd-uaf-v3-1-5bb51506a5b9@jannau.net>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250915-simplefb-genpd-uaf-v3-1-5bb51506a5b9@jannau.net>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 15-Sep-25 8:36 AM, Janne Grunau wrote:
> The pm_domain cleanup can not be devres managed as it uses struct
> simplefb_par which is allocated within struct fb_info by
> framebuffer_alloc(). This allocation is explicitly freed by
> unregister_framebuffer() in simplefb_remove().
> Devres managed cleanup runs after the device remove call and thus can no
> longer access struct simplefb_par.
> Call simplefb_detach_genpds() explicitly from simplefb_destroy() like
> the cleanup functions for clocks and regulators.
> 
> Fixes an use after free on M2 Mac mini during
> aperture_remove_conflicting_devices() using the downstream asahi kernel
> with Debian's kernel config. For unknown reasons this started to
> consistently dereference an invalid pointer in v6.16.3 based kernels.

Thanks, this v3 patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

I assume that you will push this do drm-misc yourself ?

Regards,

Hans








> [    6.736134] BUG: KASAN: slab-use-after-free in simplefb_detach_genpds+0x58/0x220
> [    6.743545] Read of size 4 at addr ffff8000304743f0 by task (udev-worker)/227
> [    6.750697]
> [    6.752182] CPU: 6 UID: 0 PID: 227 Comm: (udev-worker) Tainted: G S                  6.16.3-asahi+ #16 PREEMPTLAZY
> [    6.752186] Tainted: [S]=CPU_OUT_OF_SPEC
> [    6.752187] Hardware name: Apple Mac mini (M2, 2023) (DT)
> [    6.752189] Call trace:
> [    6.752190]  show_stack+0x34/0x98 (C)
> [    6.752194]  dump_stack_lvl+0x60/0x80
> [    6.752197]  print_report+0x17c/0x4d8
> [    6.752201]  kasan_report+0xb4/0x100
> [    6.752206]  __asan_report_load4_noabort+0x20/0x30
> [    6.752209]  simplefb_detach_genpds+0x58/0x220
> [    6.752213]  devm_action_release+0x50/0x98
> [    6.752216]  release_nodes+0xd0/0x2c8
> [    6.752219]  devres_release_all+0xfc/0x178
> [    6.752221]  device_unbind_cleanup+0x28/0x168
> [    6.752224]  device_release_driver_internal+0x34c/0x470
> [    6.752228]  device_release_driver+0x20/0x38
> [    6.752231]  bus_remove_device+0x1b0/0x380
> [    6.752234]  device_del+0x314/0x820
> [    6.752238]  platform_device_del+0x3c/0x1e8
> [    6.752242]  platform_device_unregister+0x20/0x50
> [    6.752246]  aperture_detach_platform_device+0x1c/0x30
> [    6.752250]  aperture_detach_devices+0x16c/0x290
> [    6.752253]  aperture_remove_conflicting_devices+0x34/0x50
> ...
> [    6.752343]
> [    6.967409] Allocated by task 62:
> [    6.970724]  kasan_save_stack+0x3c/0x70
> [    6.974560]  kasan_save_track+0x20/0x40
> [    6.978397]  kasan_save_alloc_info+0x40/0x58
> [    6.982670]  __kasan_kmalloc+0xd4/0xd8
> [    6.986420]  __kmalloc_noprof+0x194/0x540
> [    6.990432]  framebuffer_alloc+0xc8/0x130
> [    6.994444]  simplefb_probe+0x258/0x2378
> ...
> [    7.054356]
> [    7.055838] Freed by task 227:
> [    7.058891]  kasan_save_stack+0x3c/0x70
> [    7.062727]  kasan_save_track+0x20/0x40
> [    7.066565]  kasan_save_free_info+0x4c/0x80
> [    7.070751]  __kasan_slab_free+0x6c/0xa0
> [    7.074675]  kfree+0x10c/0x380
> [    7.077727]  framebuffer_release+0x5c/0x90
> [    7.081826]  simplefb_destroy+0x1b4/0x2c0
> [    7.085837]  put_fb_info+0x98/0x100
> [    7.089326]  unregister_framebuffer+0x178/0x320
> [    7.093861]  simplefb_remove+0x3c/0x60
> [    7.097611]  platform_remove+0x60/0x98
> [    7.101361]  device_remove+0xb8/0x160
> [    7.105024]  device_release_driver_internal+0x2fc/0x470
> [    7.110256]  device_release_driver+0x20/0x38
> [    7.114529]  bus_remove_device+0x1b0/0x380
> [    7.118628]  device_del+0x314/0x820
> [    7.122116]  platform_device_del+0x3c/0x1e8
> [    7.126302]  platform_device_unregister+0x20/0x50
> [    7.131012]  aperture_detach_platform_device+0x1c/0x30
> [    7.136157]  aperture_detach_devices+0x16c/0x290
> [    7.140779]  aperture_remove_conflicting_devices+0x34/0x50
> ...
> 
> Reported-by: Daniel Huhardeaux <tech@tootai.net>
> Cc: stable@vger.kernel.org
> Fixes: 92a511a568e44 ("fbdev/simplefb: Add support for generic power-domains")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v3:
> - release power-domains on probe errors
> - set par->num_genpds when it's <= 1
> - set par->num_genpds to 0 after detaching
> - Link to v2: https://lore.kernel.org/r/20250908-simplefb-genpd-uaf-v2-1-f88a0d9d880f@jannau.net
> 
> Changes in v2:
> - reworked change due to missed use of `par->num_genpds` before setting
>   it. Missed in testing due to mixing up FB_SIMPLE and SYSFB_SIMPLEFB.
> - Link to v1: https://lore.kernel.org/r/20250901-simplefb-genpd-uaf-v1-1-0d9f3a34c4dc@jannau.net
> ---
>  drivers/video/fbdev/simplefb.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index 1893815dc67f4c1403eea42c0e10a7ead4d96ba9..6acf5a00c2bacfab89c3a63bab3d8b1b091a20a8 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -93,6 +93,7 @@ struct simplefb_par {
>  
>  static void simplefb_clocks_destroy(struct simplefb_par *par);
>  static void simplefb_regulators_destroy(struct simplefb_par *par);
> +static void simplefb_detach_genpds(void *res);
>  
>  /*
>   * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
> @@ -105,6 +106,7 @@ static void simplefb_destroy(struct fb_info *info)
>  
>  	simplefb_regulators_destroy(info->par);
>  	simplefb_clocks_destroy(info->par);
> +	simplefb_detach_genpds(info->par);
>  	if (info->screen_base)
>  		iounmap(info->screen_base);
>  
> @@ -445,13 +447,14 @@ static void simplefb_detach_genpds(void *res)
>  		if (!IS_ERR_OR_NULL(par->genpds[i]))
>  			dev_pm_domain_detach(par->genpds[i], true);
>  	}
> +	par->num_genpds = 0;
>  }
>  
>  static int simplefb_attach_genpds(struct simplefb_par *par,
>  				  struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	unsigned int i;
> +	unsigned int i, num_genpds;
>  	int err;
>  
>  	err = of_count_phandle_with_args(dev->of_node, "power-domains",
> @@ -465,26 +468,35 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
>  		return err;
>  	}
>  
> -	par->num_genpds = err;
> +	num_genpds = err;
>  
>  	/*
>  	 * Single power-domain devices are handled by the driver core, so
>  	 * nothing to do here.
>  	 */
> -	if (par->num_genpds <= 1)
> +	if (num_genpds <= 1) {
> +		par->num_genpds = num_genpds;
>  		return 0;
> +	}
>  
> -	par->genpds = devm_kcalloc(dev, par->num_genpds, sizeof(*par->genpds),
> +	par->genpds = devm_kcalloc(dev, num_genpds, sizeof(*par->genpds),
>  				   GFP_KERNEL);
>  	if (!par->genpds)
>  		return -ENOMEM;
>  
> -	par->genpd_links = devm_kcalloc(dev, par->num_genpds,
> +	par->genpd_links = devm_kcalloc(dev, num_genpds,
>  					sizeof(*par->genpd_links),
>  					GFP_KERNEL);
>  	if (!par->genpd_links)
>  		return -ENOMEM;
>  
> +	/*
> +	 * Set par->num_genpds only after genpds and genpd_links are allocated
> +	 * to exit early from simplefb_detach_genpds() without full
> +	 * initialisation.
> +	 */
> +	par->num_genpds = num_genpds;
> +
>  	for (i = 0; i < par->num_genpds; i++) {
>  		par->genpds[i] = dev_pm_domain_attach_by_id(dev, i);
>  		if (IS_ERR(par->genpds[i])) {
> @@ -506,9 +518,10 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
>  			dev_warn(dev, "failed to link power-domain %u\n", i);
>  	}
>  
> -	return devm_add_action_or_reset(dev, simplefb_detach_genpds, par);
> +	return 0;
>  }
>  #else
> +static void simplefb_detach_genpds(void *res) { }
>  static int simplefb_attach_genpds(struct simplefb_par *par,
>  				  struct platform_device *pdev)
>  {
> @@ -622,18 +635,20 @@ static int simplefb_probe(struct platform_device *pdev)
>  	ret = devm_aperture_acquire_for_platform_device(pdev, par->base, par->size);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Unable to acquire aperture: %d\n", ret);
> -		goto error_regulators;
> +		goto error_genpds;
>  	}
>  	ret = register_framebuffer(info);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Unable to register simplefb: %d\n", ret);
> -		goto error_regulators;
> +		goto error_genpds;
>  	}
>  
>  	dev_info(&pdev->dev, "fb%d: simplefb registered!\n", info->node);
>  
>  	return 0;
>  
> +error_genpds:
> +	simplefb_detach_genpds(par);
>  error_regulators:
>  	simplefb_regulators_destroy(par);
>  error_clocks:
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250901-simplefb-genpd-uaf-352704761a29
> 
> Best regards,

