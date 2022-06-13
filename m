Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF08549ED7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8DD10F83C;
	Mon, 13 Jun 2022 20:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BC110F83C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=fBWi7QPO/F0ytmVW1WCvq92sKKuPA3DpoLxZ9CDOG/k=; b=P1VppJRSb+oHRmLr0pSpjezyww
 g2/6H9CewlIn9zZRkKrtbcQTPeE8uAqzG/2pPtz8cx+eX9/1EIKU5uu27T/j+zf8PAEq52J1Qf+HD
 qs9bH+cATvW4OI9AbR09GYH7TZFbFh1xn73nTAADt0Mie3mIhQ2Cqu8IDNfjMzcObV1KmTkvvfNsu
 Ji3pKltRIyqjnx3TreMEMhYTSRfuvzSI1OAwFOFnGskM+2YHfWASqe+qHrFBhlz6ArtvGEed2gMEH
 8Yd/bxVP+/1X1BojLJMzjqa/28vDKTpqNsjyo0f9qqR1kUzbpUDJigHN1QWRwVsW+sMXssao+NKH0
 XvAZL72w==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o0qVC-007fDz-Il; Mon, 13 Jun 2022 20:17:37 +0000
Message-ID: <915871e4-b156-ab19-043f-b719e03a5711@infradead.org>
Date: Mon, 13 Jun 2022 13:17:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 11/15] iio: adc: mt6370: Add Mediatek MT6370 support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-12-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220613111146.25221-12-peterwu.pub@gmail.com>
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
 dri-devel@lists.freedesktop.org, ChiaEn Wu <chiaen_wu@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/13/22 04:11, ChiaEn Wu wrote:
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 71ab0a06aa82..09576fb478ad 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -737,6 +737,15 @@ config MEDIATEK_MT6360_ADC
>  	  is used in smartphones and tablets and supports a 11 channel
>  	  general purpose ADC.
>  
> +config MEDIATEK_MT6370_ADC
> +	tristate "Mediatek MT6370 ADC driver"
> +	depends on MFD_MT6370
> +	help
> +	  Say Y here to enable MT6370 ADC support.
> +
> +	  Integrated for System Monitoring includes is used in smartphones

Please try again on the help text. I can't decode that.

> +	  and tablets and supports a 9 channel general purpose ADC.

-- 
~Randy
