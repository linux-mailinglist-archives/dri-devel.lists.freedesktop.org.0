Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3782F55891C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 21:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342E310E088;
	Thu, 23 Jun 2022 19:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F2A10E088
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=9CGM3MAz5VIB06lBzNjGngOQOoE0/I7wEi8Zke9gm+w=; b=eQsA4dsC7zy0gZGxnWzQsATNue
 4RNWA+fhmA3erPfzk5dxeMQCaD5Lf11f9oQOKkk8CzdloSz0KwOEP+HRM4wMgGPP8ofcZCZ2qDmwT
 xfiupW9UG4h8v6ZC3HM8LRHIplQ2b0UahGQFsyNwJUOONvAmQaW+GT7DlYixlYzdJoIae9dvTqpeU
 gy/FAvkyHsCJjzMv7Un5R+xfx0R5N1LCz8GpdTxJ5A4fM7tBl8UkLYkl8Zu3L9BNeakPSWLUWDFoM
 lRie2OS7t8onKtNzBXKfM4zQiHwHss/qcyL+N+8jD2XviMbsj2Yz1eEDOSE48nGWdf9/GLVllbreJ
 XSnwtsig==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o4SWU-00Bssw-NX; Thu, 23 Jun 2022 19:30:38 +0000
Message-ID: <bcc5b395-7fd8-f1a0-1b9f-62c9948287af@infradead.org>
Date: Thu, 23 Jun 2022 12:29:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-13-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220623115631.22209-13-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/23/22 04:56, ChiaEn Wu wrote:
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a49979f..a8c58c3 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -244,6 +244,17 @@ config LEDS_MT6323
>  	  This option enables support for on-chip LED drivers found on
>  	  Mediatek MT6323 PMIC.
>  
> +config LEDS_MT6370_RGB
> +	tristate "LED Support for Mediatek MT6370 PMIC"
> +	depends on LEDS_CLASS
> +	depends on MFD_MT6370
> +	select LINEAR_RANGE
> +	help
> +	  Say Y here to enable support for MT6370_RGB LED device.
> +	  In MT6370, there are four channel current-sink LED drivers that
> +	  support hardware pattern for const current, PWM, and breath mode.

Spell out "constant" (if that is what "const" means here). ?

> +	  Isink4 channel can also be used as a CHG_VIN power good indicator.

-- 
~Randy
