Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E862871B33
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77D10FE4C;
	Tue,  5 Mar 2024 10:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZFTxySPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB311129EF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 10:30:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 05AFACE19A9;
 Tue,  5 Mar 2024 10:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA5DC433C7;
 Tue,  5 Mar 2024 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709634625;
 bh=NFHYZPCn1iRdzYwgW5HIMl0T/4npS5nF2/vEjh+JuOs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZFTxySPRZx59XD3uzj19WgnlvWjAgsAma51hEVMdNa1Slm5uVyfvgeeghyi6U/ewx
 nYHtHCFdJ7KfvL0M471EaXSHXN3G8cXXzkL73uuky/BkJEjwZ033+xNMz9DwjrSaiM
 iMYCJCPsV+5mBBsu0Kz1CbGEL7PEeIsRI+OSB4qayHDrNp26r2FXnuK+h0Hpy090dG
 +EUczuIuHBwuUO/1fH8Z/u8K9ZpK5aAU3OUx4JbgnZgwRNiMEtiFyRo1HqaXHPbkfn
 dFTmQ/yQd0qUjctrtxumpJPJHbKUK2ochzOrndK0Gzlpd18jkpewFO/JyAHXnPvUer
 RA2EPQpyTikCA==
From: Lee Jones <lee@kernel.org>
To: andy@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, robin@protonic.nl, javierm@redhat.com, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
In-Reply-To: <20240304163220.19144-1-tzimmermann@suse.de>
References: <20240304163220.19144-1-tzimmermann@suse.de>
Subject: Re: [PATCH v3 00/10] backlight: Replace struct fb_info in interfaces
Message-Id: <170963462254.80615.15102290140369290410.b4-ty@kernel.org>
Date: Tue, 05 Mar 2024 10:30:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Mon, 04 Mar 2024 17:29:45 +0100, Thomas Zimmermann wrote:
> Backlight drivers implement struct backlight_ops.check_fb, which
> uses struct fb_info in its interface. Replace the callback with one
> that does not use fb_info.
> 
> In DRM, we have several drivers that implement backlight support. By
> including <linux/backlight.h> these drivers depend on <linux/fb.h>.
> At the same time, fbdev is deprecated for new drivers and likely to
> be replaced on many systems.
> 
> [...]

Applied, thanks!

[01/10] backlight: Match backlight device against struct fb_info.bl_dev
        commit: 67716b34e1be2beb7464f9b9d0b47b2cc7dbc208
[02/10] auxdisplay/ht16k33: Remove struct backlight_ops.check_fb
        commit: 747554336b46a26fcdf47e2e48044c7e175b6a5f
[03/10] hid/hid-picolcd: Fix initialization order
        commit: d55b578e3b0cd6abdc52e2c34d88dd3487bb10a2
[04/10] hid/hid-picolcd: Remove struct backlight_ops.check_fb
        commit: 09ca774d2e87f9b086b23354b1605709fb50205f
[05/10] backlight/aat2870-backlight: Remove struct backlight.check_fb
        commit: 61e837e975abcb4d278c3427d927e1cbaaed0090
[06/10] backlight/pwm-backlight: Remove struct backlight_ops.check_fb
        commit: 9c2be31d2951c8dce90950db000c095330406f94
[07/10] fbdev/sh_mobile_lcdc_fb: Remove struct backlight_ops.check_fb
        commit: a2a8fbdb54a78fd18850cd0b74b465657ffb1e0c
[08/10] fbdev/ssd1307fb: Init backlight before registering framebuffer
        commit: 5500326bd33e52230866f50770ca822ce400a4ab
[09/10] fbdev/ssd1307fb: Remove struct backlight_ops.check_fb
        commit: d1b82cc44fd8be4013538992814c45f0e55c02b4
[10/10] backlight: Add controls_device callback to struct backlight_ops
        commit: 7e508af663e20e9e40003bb30e06b926c754159b

--
Lee Jones [李琼斯]

