Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9C472CAC3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E2610E2B1;
	Mon, 12 Jun 2023 15:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E8710E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=tcWQA5H4cR6MataMzwJ5cbMtnnuXfycrMduhjpzg6mY=;
 b=l1dEhqZiVA11X8jRcxeaKLJVjbDp1IRR3pJ4vE8vdNDGEvR2qJW7d/btnEtqBSHr12W03ZpTSUMQH
 pJJdyB6y+KYujR2IqTqp2Oqt9GwjtpTgWEIFtXT+8KSZw6nAeNMbIjmP2go2tjnZTdT9Cx4IW6k+TH
 NTHVUG7yceI70VZjPYzQBoMmdVBpwiO4toZLqtcuqLcjJmsjPXWzuMW47LezJD+qlOOVbqJi9DifB5
 81u/Z9WRP70LlJgfi+SI8UI+7Kz1S/qC8kWvnlxURG6QYxdoEpqHELukBMTyOsRM4w6it6w6G8xWdA
 b3hsmV19baTbyVJxqlVekNr1JjywSGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=tcWQA5H4cR6MataMzwJ5cbMtnnuXfycrMduhjpzg6mY=;
 b=aSgCOaxOGroedAbPmjXgq95MpFal+EdzSiNZWiLk9LijKWg9Injw7SY6uYrEM/GK/EsF5kiKeJIu9
 7OdWa67AQ==
X-HalOne-ID: a08419ff-0939-11ee-921f-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id a08419ff-0939-11ee-921f-b90637070a9d;
 Mon, 12 Jun 2023 15:56:03 +0000 (UTC)
Date: Mon, 12 Jun 2023 17:56:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/38] fbdev: Make userspace interfaces optional
Message-ID: <20230612155601.GC1243864@ravnborg.org>
References: <20230612141352.29939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-1-tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, michael.j.ruhl@intel.com,
 linux-omap@vger.kernel.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Nice series, quite some preparations.

On Mon, Jun 12, 2023 at 04:07:38PM +0200, Thomas Zimmermann wrote:
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
>   fbdev/sh7760fb: Use hardware device with dev_() output during probe
>   fbdev/sm501fb: Output message with fb_err()
>   fbdev/tdfxfb: Set i2c adapter parent to hardware device
The above are all:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>   fbdev/smscufx: Detect registered fb_info from refcount
I did not try to understand the code, so others must review.

>   fbdev/ep93xx-fb: Alloc DMA memory from hardware device
>   fbdev/sh7760fb: Alloc DMA memory from hardware device
This smells like bug-fixes, and I do not see what impact the change has.
So again, someone else needs to provide review here.

The rest are already reviewed or got a dedicated reply.

	Sam
