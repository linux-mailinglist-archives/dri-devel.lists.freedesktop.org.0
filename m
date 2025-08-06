Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D500B1CE6F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 23:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAC710E319;
	Wed,  6 Aug 2025 21:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="fTO/3fjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 967 seconds by postgrey-1.36 at gabe;
 Wed, 06 Aug 2025 21:31:24 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7639E10E319
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202412;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ddX/DjsBs2qi2hukb3Gz4Oru+RoXIy8V6GpCBPdc0jc=; b=f
 TO/3fjIi4Thj4FdrJaQ8LDc2dDJYc+Wd5w4zvhK1GgFqMs8uXuGTsx+2nlPh0UKATy+xGUjkHM/BN
 08NmwU+Xm35DGtGZDj2NHk65hpgrliHcJeMMdsiaalbsZOCXTwO/UDjuxR/aBCSSOnm5wnaDaGPTx
 CSSLQruYAk+noStpF8/s+eZwQn+rh3Vn3V60WO9090HJXxP8TFuTYdF0ExDMwZrqhtb0v5puJ3u6L
 F4O2eCe2yxzU/N3Vm+qqb5T3eObGS3w5siCjisY8iBIbq/dSGT8evekkaC1dLLqE8/iH4oK3R7Xdh
 VwvldoOgTHwZebIEA+77sDICqpcuXQjMg==;
Received: from smtp by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 id 1ujlTf-008jhX-AS; Wed, 06 Aug 2025 23:15:15 +0200
Message-ID: <127b677c-505b-43b8-a05e-58e13592e5cb@tronnes.org>
Date: Wed, 6 Aug 2025 23:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: GPU acceleration with SPI displays (TinyDRM)
To: =?UTF-8?Q?Josef_Lu=C5=A1tick=C3=BD?= <josef.lusticky@braiins.cz>,
 dri-devel@lists.freedesktop.org
Cc: Alex Lanzano <lanzano.alex@gmail.com>
References: <CACnTymakHbAH1eSP8y99_yOp08R4mV=M922ym9YGdT-V-xdKfQ@mail.gmail.com>
Content-Language: nb-NO
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <CACnTymakHbAH1eSP8y99_yOp08R4mV=M922ym9YGdT-V-xdKfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

Hi,

At what speed are you running the SPI bus?

Theoretical fps for a 176x220 RGB565 display at 32MHZ:
32*1024*1024/176/220/16 = 54fps

Try modetest to see max fps:
https://github.com/notro/panel-mipi-dbi/wiki/Debugging#modetest

I don't remember the command line switch to have it run continously
showing the fps.

Noralf.


Den 04.08.2025 09:54, skrev Josef Luštický:
> Hello,
> is it possible to use GPU acceleration with TinyDRM drivers?
> I am testing on STM32MP157c SoC with Vivante GC400 GPU and I use
> Mesa3D 24.0.9 (rootfs generated with Buildroot 2025.02.3) and kernel
> 5.10.176.
>
> To compare, I also have the same system but with a MIPI DSI display.
> While kmscube renders at 60 fps with the MIPI DSI display, I get only
> 11 fps with the SPI display (TinyDRM driver).
>
> Is there some architectural limitation, either in Mesa, kernel, or HW-related?
> I suppose both setups use kernel's KMS as renderer only (kmsro), thus
> it should render at the same framerate into framebuffer.
> The difference in HW is the peripheral the displays use - MIPI DSI
> display utilizes LTDC peripheral (kmscube loads
> /usr/lib/dri/stm_dri.so) vs. SPI display uses just SPI (ksmcube loads
> /usr/lib/dri/ili9225_dri.so). Both .so files are hard links.
> Both open /dev/dri/renderD128 (GPU).
>
> The MIPI DSI display is connected to the DSI Host peripheral which
> just transcodes the parallel RGB pixel stream from the LTDC (LCD
> Timing Display Controller) peripheral of the STM SoC.
> The display driver is drivers/gpu/drm/panel/panel-sitronix-st7703.c (DRM panel).
>
> The SPI display driver uses the kernel's TinyDRM API and its driver is
> drivers/gpu/drm/tiny/ili9225.c , but I can change to any other driver
> if needed (eventually to the generic panel-mipi-dbi-spi).
> Could rewriting the TinyDRM driver to a panel driver in
> drivers/gpu/drm/panel/ help?
>
> I also tried software rendering "softpipe" (disabled GPU in
> device-tree) and it renders 7 fps on both systems. Thus, I suppose,
> that some form of GPU acceleration is already used.
>
> Mesa reports the same loaded GL-extensions on both systems and apart
> from loaded .so files everything seems to be the same.
>
> Best regards
> Josef Lusticky
