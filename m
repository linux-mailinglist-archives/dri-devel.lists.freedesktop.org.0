Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75068549EB7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7580510F82A;
	Mon, 13 Jun 2022 20:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1322B10F82A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=b8nNT/xprutxuiBevYoYuq5d2FkteRl+uXtHRkddO1w=; b=Yww0fYQTyEmxuLew3Ionpx8OMF
 +g7pCz3zRQQ2OjT74EOB/aK/dKBfXJ737MYvDCWwla+U3+2mtAsnmAiqEJ+m8MN+Y8xvD/dr8Kk7+
 CTHDzxZHuUbX84iCMrvOenFQ90E0I7QbBDBpbpRcv9DHuB1PBMnj3fkLJuLOL7pAOAjKHnv/fZxcZ
 qBUgYfDwZbaAcDkLi/88MIc3QnzcG8sfkbK8gFuVv69yiLOeqZvVFHbgOvfC464+3bKiyAnRQs1T7
 zAg+DPfZjGpXLgfVKZtkDdrn2AUTr2iAOHaX3ptXEXn0pcM/4bla3HnDKKuUovF0Gd78dX+qMf6AS
 p+bpoqHg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o0qTP-007fBI-DS; Mon, 13 Jun 2022 20:15:44 +0000
Message-ID: <31b588e9-2233-3b40-e452-83f0f6bfb744@infradead.org>
Date: Mon, 13 Jun 2022 13:15:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 10/15] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-11-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220613111146.25221-11-peterwu.pub@gmail.com>
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
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index cbe0f96ca342..dcb6866dab53 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -804,6 +804,14 @@ config REGULATOR_MT6360
>  	  2-channel buck with Thermal Shutdown and Overload Protection
>  	  6-channel High PSRR and Low Dropout LDO.
>  
> +config REGULATOR_MT6370
> +	tristate "MT6370 SubPMIC Regulator"
> +	depends on MFD_MT6370
> +	help
> +	  Say Y here to enable MT6370 regulator support.
> +	  This driver support the control for DisplayBias voltages and one

	              supports

> +	  general purpose LDO which commonly used to drive the vibrator.

	                      which is commonly used to drive the vibrator.


-- 
~Randy
