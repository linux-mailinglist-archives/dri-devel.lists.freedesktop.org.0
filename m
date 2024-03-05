Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198FA8719B4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC7D11298C;
	Tue,  5 Mar 2024 09:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ctFC1+e5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AA611298C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:36:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 492EE6148E;
 Tue,  5 Mar 2024 09:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3AEC433C7;
 Tue,  5 Mar 2024 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709631398;
 bh=JKisc/w7E/vIUGFzAVoD8hmtzh/whmZyLQbF+nWTv28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ctFC1+e57EJzmEJCTPoP2Sfaf0angHBcyEZKKw6ystDKWE8QEPHEc6bL6Vpqn+mnq
 gARAdiIOzUgtiofzooCA+CRmgNzaiK32ztiiS80MTdzjFLwwIPi+MnPmF4CnvtNxnX
 0MkEbSAi1hR/rrnVBWf59vrHyeZWqOlJ/+nCjFQxY+a47IJnT62SgmG9gXCNkVZXVr
 duU/HPc3UXrnASo35ixGQ6JRzS/nDUrQr6o/xi/fYlHDXL7SnJQ5E3aB+98Ssr3hH1
 y5uY8jVnpxHQ6MhuwM0n/wKTYOzAvsgixfSdh7WtOWY/wgO2wE+CiDNeiXLM1GhmZn
 uXkUsv6b0c3gA==
Date: Tue, 5 Mar 2024 09:36:32 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: andy@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, robin@protonic.nl, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 00/10] backlight: Replace struct fb_info in interfaces
Message-ID: <20240305093632.GC5206@google.com>
References: <20240304163220.19144-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240304163220.19144-1-tzimmermann@suse.de>
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

On Mon, 04 Mar 2024, Thomas Zimmermann wrote:

> Backlight drivers implement struct backlight_ops.check_fb, which
> uses struct fb_info in its interface. Replace the callback with one
> that does not use fb_info.
> 
> In DRM, we have several drivers that implement backlight support. By
> including <linux/backlight.h> these drivers depend on <linux/fb.h>.
> At the same time, fbdev is deprecated for new drivers and likely to
> be replaced on many systems.
> 
> This patchset is part of a larger effort to implement the backlight
> code without depending on fbdev.
> 
> Patch 1 makes the backlight core match backlight and framebuffer
> devices via struct fb_info.bl_dev. Patches 2 to 9 then go through
> drivers and remove unnecessary implementations of check_fb. Finally,
> patch 10 replaces the check_fb hook with controls_device, which
> uses the framebuffer's Linux device instead of the framebuffer.
> 
> v3:
> 	* hide CONFIG_FB_BACKLIGHT behind fb_bl_device() (Lee)
> 	* if-else cleanups (Andy)
> 	* fix commit message of patch 2 (Andy)
> v2:
> 	* fix hid-picolcd for CONFIG_FB_BACKLIGHT=n
> 	* fixes to commit messages
> 
> Thomas Zimmermann (10):
>   backlight: Match backlight device against struct fb_info.bl_dev
>   auxdisplay/ht16k33: Remove struct backlight_ops.check_fb
>   hid/hid-picolcd: Fix initialization order
>   hid/hid-picolcd: Remove struct backlight_ops.check_fb
>   backlight/aat2870-backlight: Remove struct backlight.check_fb
>   backlight/pwm-backlight: Remove struct backlight_ops.check_fb
>   fbdev/sh_mobile_lcdc_fb: Remove struct backlight_ops.check_fb
>   fbdev/ssd1307fb: Init backlight before registering framebuffer
>   fbdev/ssd1307fb: Remove struct backlight_ops.check_fb
>   backlight: Add controls_device callback to struct backlight_ops
> 
>  drivers/auxdisplay/ht16k33.c             |  8 ------
>  drivers/hid/hid-picolcd_backlight.c      |  7 ------
>  drivers/hid/hid-picolcd_core.c           | 14 +++++------
>  drivers/hid/hid-picolcd_fb.c             |  6 +++++
>  drivers/video/backlight/aat2870_bl.c     |  7 ------
>  drivers/video/backlight/backlight.c      |  8 ++++--
>  drivers/video/backlight/bd6107.c         | 12 ++++-----
>  drivers/video/backlight/gpio_backlight.c | 12 ++++-----
>  drivers/video/backlight/lv5207lp.c       | 12 ++++-----
>  drivers/video/backlight/pwm_bl.c         | 12 ---------
>  drivers/video/fbdev/core/fb_backlight.c  |  5 ++++
>  drivers/video/fbdev/sh_mobile_lcdcfb.c   |  7 ------
>  drivers/video/fbdev/ssd1307fb.c          | 31 +++++++++---------------
>  include/linux/backlight.h                | 16 ++++++------
>  include/linux/fb.h                       |  9 +++++++
>  include/linux/pwm_backlight.h            |  1 -
>  16 files changed, 70 insertions(+), 97 deletions(-)

Which Acks are you missing for us to merge this?

-- 
Lee Jones [李琼斯]
