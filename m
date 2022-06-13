Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E725549EAA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66BF10F822;
	Mon, 13 Jun 2022 20:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D4E10F820
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=CF9UJrdeWimgjo6b+3sLXnRZ+YKpG34Hd87mZaFsWOQ=; b=c7khjL9wMhgkexLmyAP5JznkUn
 VxdBdmEKdzpLyXSV9VSwQobUMXr98PHFoytDWiQ3HIhBlu694lInFw+iOU7AnJf/nW+gz5S9kJ11G
 SCoCRG5b1TjhHYBX4qaK92eN62Kt76eunJAA/aEgAf11AkTBq1iM/rhvPErEdPacMTQVFH70dhvb4
 vlrHgpxrZYLBjXB9VHFcUeLsq640SfT4uzfotwf+a9hfdMe0MvLN0qnEEzsqT9SLr/PpswCycaTIA
 r/Ujr7d4yuDkHzfFA9xKaomERUPE1mbxc9qUI9TWS/YLPX3BX+X3TDWnUnQ4BbxeUICwJXWQ9RVC2
 fe3jX5OQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o0qS4-007f8t-8C; Mon, 13 Jun 2022 20:14:23 +0000
Message-ID: <4aef2e48-9717-1aca-b716-5f9486bf320e@infradead.org>
Date: Mon, 13 Jun 2022 13:14:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 08/15] mfd: mt6370: Add Mediatek MT6370 support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-9-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220613111146.25221-9-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ChiYuan Huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/13/22 04:11, ChiaEn Wu wrote:
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3b59456f5545..d9a7524a3e0e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -937,6 +937,19 @@ config MFD_MT6360
>  	  PMIC part includes 2-channel BUCKs and 2-channel LDOs
>  	  LDO part includes 4-channel LDOs
>  
> +config MFD_MT6370
> +	tristate "Mediatek MT6370 SubPMIC"
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	depends on I2C
> +	help
> +	  Say Y here to enable MT6370 SubPMIC functional support.
> +	  It integrate single cell battery charger with adc monitoring, RGB

	     integrates                                 ADC  (?)

> +	  LEDs, dual channel flashlight, WLED backlight driver, display bias
> +	  voltage supply, one general purpose LDO, and cc logic

	                                               CC   (?)
What is CC?

> +	  controller with USBPD commmunication capable.

	                                       capability.

-- 
~Randy
