Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB9F1F89A8
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jun 2020 18:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828BD893A2;
	Sun, 14 Jun 2020 16:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066B7893A2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5jYI5ruJOlajyoqMQwZPA4P/sClQ2nY4TQqTvMp2pKI=; b=O40jEqKuALTAbi3uVXOA9z7skD
 4/nqyicwYXlNs+rRH00e/v6QewB1tBfgDzUQmTothY1SzAKFksJ2CJIIUTjhJkVSodINY3XBcreAb
 9KPuxouZePv9Wn9GSpoEKutjBaPcONGRWGMxyTiLBpdE/NZpvKMdA3+owzk47dqfIqFZtCqFh6NOF
 a0yceKfw/SyuKA9f6x0tu/gsNKldaKAS3SjszRlIexCHm1QJkCJ9J3YtydfLeHvEw1FqHmOAt0/pC
 xTBkqY8x+KMVi0lm6XmFKA8vRj5oOsyB2U+egQJqM2V7a0t+JnqCW2e8eMkXE9vlhDeTnTPDN67ar
 6UIoUmlw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49773
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jkVce-0006F6-MN; Sun, 14 Jun 2020 18:36:40 +0200
Subject: Re: [RFC PATCH 0/4] DSI/DBI and TinyDRM driver
To: Paul Cercueil <paul@crapouillou.net>,
 Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20200607133832.1730288-1-paul@crapouillou.net>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
Date: Sun, 14 Jun 2020 18:36:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200607133832.1730288-1-paul@crapouillou.net>
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
Cc: od@zcrc.me, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 07.06.2020 15.38, skrev Paul Cercueil:
> Hi,
> 
> Here's a follow-up on the previous discussion about the current state of
> DSI/DBI panel drivers, TinyDRM, and the need of a cleanup.
> 
> This patchset introduces the following:
> * It slightly tweaks the MIPI DSI code so that it supports MIPI DBI over
>   various buses. This patch has been tested with a non-upstream DRM
>   panel driver for a ILI9331 DBI/8080 panel, written with the DSI
>   framework (and doesn't include <drm/drm_mipi_dbi.h>), and non-upstream
>   DSI/DBI host driver for the Ingenic SoCs.
> 
> * A SPI DBI host driver, using the current MIPI DSI framework. It allows
>   MIPI DSI/DBI drivers to be written with the DSI framework, even if
>   they are connected over SPI, instead of registering as SPI device
>   drivers. Since most of these panels can be connected over various
>   buses, it permits to reuse the same driver independently of the bus
>   used.
> 
> * A TinyDRM driver for DSI/DBI panels, once again independent of the bus
>   used; the only dependency (currently) being that the panel must
>   understand DCS commands.
> 
> * A DRM panel driver to test the stack. This driver controls Ilitek
>   ILI9341 based DBI panels, like the Adafruit YX240QV29-T 320x240 2.4"
>   TFT LCD panel. This panel was converted from
>   drivers/gpu/drm/tiny/ili9341.c.
> 
> I would like to emphasize that while it has been compile-tested, I did
> not test it with real hardware since I do not have any DBI panel
> connected over SPI. I did runtime-test the code, just without any panel
> connected.
> 
> Another thing to note, is that it does not break Device Tree ABI. The
> display node stays the same:
> 
> display@0 {
> 	compatible = "adafruit,yx240qv29", "ilitek,ili9341";
> 	reg = <0>;
> 	spi-max-frequency = <32000000>;
> 	dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
> 	reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
> 	rotation = <270>;
> 	backlight = <&backlight>;
> };
> 
> The reason it works, is that the "adafruit,yx240qv29" device is probed
> on the SPI bus, so it will match with the SPI/DBI host driver. This will
> in turn register the very same node with the DSI bus, and the ILI9341
> DRM panel driver will probe. The driver will detect that no controller
> is linked to the panel, and eventually register the DBI/DSI TinyDRM
> driver.
> 
> I can't stress it enough that this is a RFC, so it still has very rough
> edges.
> 

I don't know bridge and dsi drivers so I can't comment on that, but one
thing I didn't like is that the DT compatible string has to be added to
2 different modules.

As an example, a MI0283QT panel (ILI9341) supports these interface options:

1. SPI
   Panel setup/control and framebuffer upload over SPI

2. SPI + DPI
   Panel setup/control over SPI, framebuffer scanout over DPI

3. Parallel bus
   Panel setup/control and framebuffer upload over parallel bus

My suggestion is to have one panel driver module that can support all of
these like this:

For 1. and 2. a SPI driver is registered and if I understand your
example correctly of_graph_get_port_by_id() can be used during probe to
distinguish between the 2 options and register a full DRM driver for 1.
and add a DRM panel for 2.

For 3. a DSI driver is registered (adapted for DBI use like you're
suggesting).

Note that the interface part of the controller initialization will
differ between these, the panel side init will be the same I assume.

Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
