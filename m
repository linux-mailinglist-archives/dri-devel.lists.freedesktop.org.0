Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F9734DC1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D4C10E1B8;
	Mon, 19 Jun 2023 08:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1C010E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:32:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92B586156C;
 Mon, 19 Jun 2023 08:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81387C433C0;
 Mon, 19 Jun 2023 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687163533;
 bh=/WP7Oqb3gUygcJme/Qfhq25/WxnQQHPsXChiAPp7gy4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p1iz1bwUIiae5MlMfwl1PhMaD8NFL9PqEmnIEXxSVu0juHbg0maV+YEchH3iW/j8d
 +ODAPF1kQKCyqhWau6fb/ofLSgswhN1lpbj1uX3ALp8CsX0wTD0wJxMGKR+LUYg+Ci
 qTXhTWk3Ij3zYf2tWIzxOwBqyvQvruh6rJAhyy9fU0IcNCfvDKR9VEDfsIckrG0ykd
 DlW7cYzLkiyEUzrZ2uzanjsxA5dwecKXiJSddTNCEU7avPucSaXbddS/pVykskPxro
 NGUnLtH42t98pAd+nkR8YwMm+Q4H6DTEhKvltPS24MSwQaU9nglCShDkTwh9KfpWBM
 YgFYPx0LvCs1w==
Date: Mon, 19 Jun 2023 09:32:07 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 00/38] fbdev: Make userspace interfaces optional
Message-ID: <20230619083207.GP3635807@google.com>
References: <20230613110953.24176-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 michael.j.ruhl@intel.com, linux-omap@vger.kernel.org, sam@ravnborg.org,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023, Thomas Zimmermann wrote:

> Add the new config option FB_DEVICE. If enabled, fbdev provides
> traditional userspace interfaces in devfs, sysfs and procfs, such
> as /dev/fb0 or /proc/fb.
> 
> Modern Linux distrobutions have adopted DRM drivers for graphics
> output and use fbdev only for the kernel's framebuffer console.
> Userspace has also moved on, with no new fbdev code being written
> and existing support being removed.
> 
> OTOH, fbdev provides userspace a way of accessing kernel or I/O
> memory, which might compromise the system's security. See the recent
> commit c8687694bb1f ("drm/fbdev-generic: prohibit potential
> out-of-bounds access") for an example. Disabling fbdev userspace
> interfaces is therefore a useful feature to limit unnecessary
> exposure of fbdev code to processes of low privilegues.
> 
> Patches 1 to 31 fix various bugs and issues in fbdev-related code.
> In most cases the code uses the fbdev device where it should use
> the Linux hardware device or something else. Most of these patches
> fix existing problems and should therefore be considered in any case.
> 
> Patches 32 to 37 refactor the fbdev core code. The patches move
> support for backlights, sysfs, procfs and devfs into separate files
> and hide it behind simple interfaces. These changes will allow to
> easily build the userspace support conditionally.
> 
> Patch 38 introduces the config option FB_DEVICE and adapts the fbdev
> core to support it. The field struct fb_info.dev is now optional,
> hence the name of the config option.
> 
> Tested on simpledrm and i915, including the device handover.
> 
> Future directions: With the support for disabling fbdev userspace
> interfaces in place, it will be possible to make most fbdev drivers'
> file-I/O code in struct fb_ops optional as well. 
> 
> v3:
> 	* add missing file fb_chrdev.c
> 	* fix typo in Kconfig help (Daniel)
> v2:
> 	* fix fsl-diu-fb and sh7760fb
> 	* split backlight patches
> 	* set 'default y' for FB_CONFIG
> 	* minor fixes and corrections
> 
> Thomas Zimmermann (38):
>   backlight/bd6107: Compare against struct fb_info.device
>   backlight/bd6107: Rename struct bd6107_platform_data.fbdev to 'dev'
>   backlight/gpio_backlight: Compare against struct fb_info.device
>   backlight/gpio_backlight: Rename field 'fbdev' to 'dev'
>   backlight/lv5207lp: Compare against struct fb_info.device
>   backlight/lv5207lp: Rename struct lv5207lp_platform_data.fbdev to
>     'dev'
>   fbdev/atyfb: Reorder backlight and framebuffer init/cleanup
>   fbdev/atyfb: Use hardware device as backlight parent
>   fbdev/aty128fb: Reorder backlight and framebuffer init/cleanup
>   fbdev/aty128fb: Use hardware device as backlight parent
>   fbdev/broadsheetfb: Call device_remove_file() with hardware device
>   fbdev/ep93xx-fb: Alloc DMA memory from hardware device
>   fbdev/ep93xx-fb: Output messages with fb_info() and fb_err()
>   fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
>   fbdev/fsl-diu-fb: Output messages with fb_*() helpers
>   fbdev/mb862xxfb: Output messages with fb_dbg()
>   fbdev/metronomefb: Use hardware device for dev_err()
>   fbdev/nvidiafb: Reorder backlight and framebuffer init/cleanup
>   fbdev/nvidiafb: Use hardware device as backlight parent
>   fbdev/pxa168fb: Do not assign to struct fb_info.dev
>   fbdev/radeonfb: Reorder backlight and framebuffer cleanup
>   fbdev/radeonfb: Use hardware device as backlight parent
>   fbdev/rivafb: Reorder backlight and framebuffer init/cleanup
>   fbdev/rivafb: Use hardware device as backlight parent
>   fbdev/sh7760fb: Use fb_dbg() in sh7760fb_get_color_info()
>   fbdev/sh7760fb: Output messages with fb_dbg()
>   fbdev/sh7760fb: Alloc DMA memory from hardware device
>   fbdev/sh7760fb: Use hardware device with dev_() output during probe
>   fbdev/sm501fb: Output message with fb_err()
>   fbdev/smscufx: Detect registered fb_info from refcount
>   fbdev/tdfxfb: Set i2c adapter parent to hardware device
>   fbdev/core: Pass Linux device to pm_vt_switch_*() functions
>   fbdev/core: Move framebuffer and backlight helpers into separate files
>   fbdev/core: Add fb_device_{create,destroy}()
>   fbdev/core: Move procfs code to separate file
>   fbdev/core: Move file-I/O code into separate file
>   fbdev/core: Rework fb init code
>   fbdev: Make support for userspace interfaces configurable
> 
>  Documentation/gpu/todo.rst                   |  13 +
>  arch/sh/boards/mach-ecovec24/setup.c         |   2 +-
>  arch/sh/boards/mach-kfr2r09/setup.c          |   2 +-
>  drivers/staging/fbtft/Kconfig                |   1 +

>  drivers/video/backlight/bd6107.c             |   2 +-
>  drivers/video/backlight/gpio_backlight.c     |   6 +-
>  drivers/video/backlight/lv5207lp.c           |   2 +-

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
