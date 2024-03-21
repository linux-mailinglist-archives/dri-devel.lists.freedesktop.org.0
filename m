Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89965885D18
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 17:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C2010EEC8;
	Thu, 21 Mar 2024 16:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o6zvo+K0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CDE10EEAF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 16:12:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8655ACE1382;
 Thu, 21 Mar 2024 16:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D381C43390;
 Thu, 21 Mar 2024 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711037569;
 bh=6NPow3V/0Wt+lAq16jw5Ca4MIxYnRXOGaHoibGDMLas=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o6zvo+K0z+pthjZ1rv6n6C6QkLMLKSKM2m1xQZmtsoZLeZe26l7Xg0v6zgdenfeST
 +FiZQeUsfbyMDZk/sAsYu0fS01skXvmUXQW9YJ4ho8Any/kw2K+DRzw0BSeAVIkQ97
 YUcDnn95rFH+LWuaqmd5033Gi6VrGLFYJ1VBXfsqF53sbn8p7yttSksCBesdctu46T
 nE3GZik+UOEfPMxXitw8aRBOeCOHxcbvWLRzNg8bQgZI3MIQkK1B8axnS2JqCLn0Cu
 H9WvM3ahpkpNOCxYW0/m39nDz/knHPt9vsEn2eXyM46wpzxmx2bduXUikq0vVeUdtC
 ZCs9gbiaK3K2w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, andy@kernel.org, daniel.thompson@linaro.org, 
 jingoohan1@gmail.com, deller@gmx.de, robin@protonic.nl, javierm@redhat.com, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
In-Reply-To: <20240305162425.23845-1-tzimmermann@suse.de>
References: <20240305162425.23845-1-tzimmermann@suse.de>
Subject: Re: [PATCH v4 00/10] backlight: Replace struct fb_info in interfaces
Message-Id: <171103756721.89062.17090257592751026195.b4-ty@kernel.org>
Date: Thu, 21 Mar 2024 16:12:47 +0000
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

On Tue, 05 Mar 2024 17:22:33 +0100, Thomas Zimmermann wrote:
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
        commit: f1ecddf747f0d734682152b37c927aa958a51497
[02/10] auxdisplay/ht16k33: Remove struct backlight_ops.check_fb
        commit: dddfda7d5f12a7b48aeca6c3840167529c8cd34a
[03/10] hid/hid-picolcd: Fix initialization order
        commit: a951a15002da620871d8f3d8218c043cdc4c2471
[04/10] hid/hid-picolcd: Remove struct backlight_ops.check_fb
        commit: b3c52552f8d8a816bda2bda984411c73f4dd0b87
[05/10] backlight/aat2870-backlight: Remove struct backlight.check_fb
        commit: 0e03c96046405281fb072c05a7810d2661a2f334
[06/10] backlight/pwm-backlight: Remove struct backlight_ops.check_fb
        commit: 78534967e7cb3c2fbfcb2d37820b51a80c570f90
[07/10] fbdev/sh_mobile_lcdc_fb: Remove struct backlight_ops.check_fb
        commit: b853c08cd6598b3b3ff91cb2bba336bfef9c0ac4
[08/10] fbdev/ssd1307fb: Init backlight before registering framebuffer
        commit: d5ae81e965953da27cf46db6281d6a6a28eaaccb
[09/10] fbdev/ssd1307fb: Remove struct backlight_ops.check_fb
        commit: ec5925ef4a2dfd7ee060f4fd2a2e8036f8a94e8e
[10/10] backlight: Add controls_device callback to struct backlight_ops
        commit: 2e427743de015c1ac047036ef495c3f004105439

--
Lee Jones [李琼斯]

