Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C31A34FF1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 21:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6575510EBA1;
	Thu, 13 Feb 2025 20:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rOQzpPjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C3110EBA1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:51:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3452CA41FE3;
 Thu, 13 Feb 2025 20:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED96C4CED1;
 Thu, 13 Feb 2025 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739479879;
 bh=512cv4Hj1Kz9k8u6r5KTAHRKubmEdQ2373KIf+8y/nQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOQzpPjrf+SK50+lfxnvf1j6ydyFhRq+h3/1SS37zqLNdyguRVlBObbP1/wRV0at/
 +cca9LNWhv8GMr4NpXlWyHwjN2EsM3Zze84WS+MnVfh5DDswhAOygzmSDUKi4RNEMw
 W9XTcRCyXaqAiS0YlOjJ93ByT9I6kNGLTbYgKNCFtL2uFjH6E3cpzuaQHLZrq5Fh43
 meI4vmlfv8CvQzjCMKOzSD9/HcXIvAWoRS+Zs0aZLI5YIsWmaBcg8f/mx+LgeXocUJ
 GwMtsdYdGuWko8E5Vr4XkKGEcj8pddoYRhOHKbgd6vfPEcY5H+KykSlOKqAoh7HEqH
 nTNI4vN7xs7jQ==
Date: Thu, 13 Feb 2025 20:51:13 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 2/3] backlight: apple_dwi_bl: Add Apple DWI
 backlight driver
Message-ID: <Z65bQeITMp1mpHp8@aspen.lan>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
 <20250203115156.28174-3-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203115156.28174-3-towinchenmi@gmail.com>
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

On Mon, Feb 03, 2025 at 07:50:33PM +0800, Nick Chan wrote:
> Add driver for backlight controllers attached via Apple DWI 2-wire
> interface, which is found on some Apple iPhones, iPads and iPod touches
> with a LCD display.
>
> Although there is an existing apple_bl driver, it is for backlight
> controllers on Intel Macs attached via PCI, which is completely different
> from the Samsung-derived DWI block.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/video/backlight/Kconfig        |  12 +++
>  drivers/video/backlight/Makefile       |   1 +
>  drivers/video/backlight/apple_dwi_bl.c | 123 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/video/backlight/apple_dwi_bl.c
>
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 3614a5d29c71..c6168727900a 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -290,6 +290,18 @@ config BACKLIGHT_APPLE
>  	  If you have an Intel-based Apple say Y to enable a driver for its
>  	  backlight.
>
> +config BACKLIGHT_APPLE_DWI
> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	default y

Sorry to pick this up late and on a resend but... I can't come up with
any justification for "default y" in this driver.

Other than that this is a really tidy driver so with that changed please
add:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
