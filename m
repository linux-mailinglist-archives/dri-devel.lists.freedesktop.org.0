Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F489509E7A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC8510F37E;
	Thu, 21 Apr 2022 11:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 640 seconds by postgrey-1.36 at gabe;
 Wed, 20 Apr 2022 13:57:02 UTC
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8513D10F118
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:57:02 +0000 (UTC)
Received: from darkstar.musicnaut.iki.fi (85-76-69-216-nat.elisa-mobile.fi
 [85.76.69.216])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id AD3B7205A6;
 Wed, 20 Apr 2022 16:46:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1650462379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPdeBaZ6eVr/qRTevscI2sSHgl9RZPmaXc8iV1TPOYQ=;
 b=TWxI7Ho2RtsaPS6MDuk2M+E+sq1KJYxSGS4DmJDZp6BP1taIQkAU15m6enkHBtGqJiUXvp
 lXQHG+v4JXQrypyUiMgoBHrh9vRs0uJa78N5cmw1Dkb39AobNvcLF22yj6OlonUngPVdl9
 hg/zZ4gRXP0aP/DTuM9FEXSAfDl6JAk=
Date: Wed, 20 Apr 2022 16:46:15 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 26/41] ARM: omap1: relocate static I/O mapping
Message-ID: <20220420134615.GA1947@darkstar.musicnaut.iki.fi>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-27-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-27-arnd@kernel.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1650462379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPdeBaZ6eVr/qRTevscI2sSHgl9RZPmaXc8iV1TPOYQ=;
 b=H/ymb4ClmH02P6z9wJPj5hwDvA4ML4CAqvyTrTXpyzakXMrwIF7fhncpTt2p+tyb+n415S
 rXswuQZfImMNpPXfbjLG2A2bYft152C7y10qe9zeKLi8GlOcXPiCV9y/0Eijq+J6KgXV6K
 JExPxjG2F+njcVYYdJlNrzaNBE0jppU=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1650462379; a=rsa-sha256; cv=none;
 b=CVy72ecIkI6wF0iqwa+Xy91DJU3aDMoxGNfzuIx9Vt1gzOxFw+Q04asMI9whLP3P8s501X
 P2eVWVYDpVAr6tfbV1PJEm52Z8VQMrb77N573CgDjOg+UHf97HnYPA9FH0wGgHHkmeXpu6
 wtihpIfPU1zC4kkQJy4ZZuJBXIgiXlA=
X-Mailman-Approved-At: Thu, 21 Apr 2022 11:22:59 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 tony@atomide.com, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 19, 2022 at 03:37:08PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The address range 0xfee00000-0xfeffffff is used for PCI and
> PCMCIA I/O port mappings, but OMAP1 has its static mappings
> there as well.
> 
> Move the OMAP1 addresses a little higher to avoid crashing
> at boot.

This has the same problem I reported in 2019, with earlyprintk the
system no longer boots:

	https://marc.info/?t=156530014200005&r=1&w=2

Tested on OSK and SX1/qemu.

A.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig.debug                      | 6 +++---
>  arch/arm/mach-omap1/include/mach/hardware.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 0c9497d549e3..f57b449000f7 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -1837,9 +1837,9 @@ config DEBUG_UART_VIRT
>  	default 0xfec00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
>  	default 0xfec00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
>  	default 0xfef36000 if DEBUG_HIGHBANK_UART
> -	default 0xfefb0000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
> -	default 0xfefb0800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
> -	default 0xfefb9800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
> +	default 0xff000000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
> +	default 0xff000800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
> +	default 0xff009800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
>  	default 0xffd01000 if DEBUG_HIP01_UART
>  	default DEBUG_UART_PHYS if !MMU
>  	depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
> diff --git a/arch/arm/mach-omap1/include/mach/hardware.h b/arch/arm/mach-omap1/include/mach/hardware.h
> index 05c5cd3e95f4..e3522e601ccd 100644
> --- a/arch/arm/mach-omap1/include/mach/hardware.h
> +++ b/arch/arm/mach-omap1/include/mach/hardware.h
> @@ -63,7 +63,7 @@ static inline u32 omap_cs3_phys(void)
>  
>  #endif	/* ifndef __ASSEMBLER__ */
>  
> -#define OMAP1_IO_OFFSET		0x01000000	/* Virtual IO = 0xfefb0000 */
> +#define OMAP1_IO_OFFSET		0x00fb0000	/* Virtual IO = 0xff000000 */
>  #define OMAP1_IO_ADDRESS(pa)	IOMEM((pa) - OMAP1_IO_OFFSET)
>  
>  #include <mach/serial.h>
> -- 
> 2.29.2
> 
