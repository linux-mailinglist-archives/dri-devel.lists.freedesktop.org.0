Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38675E1A4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 13:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1991410E0D8;
	Sun, 23 Jul 2023 11:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171E010E0D8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cIqESiJOre40Df0mljwEkgdug0gJWRxvyJ84yzGVWLU=; b=p9FpJA6Br63Y4M57IfF0YZVvet
 U9qDB9TdRuhvIbzgBbi4n1Dwxx8ZebMRrhOhK87jYVxajmDkSlE7h8m55ZarnZG6NWxtnUUEwFhHh
 9bdLtIMbIK89aPaKKfuwhqnrc3B52jsKNRpOMs/5kT8i8JTTpT2NkMKvUwsPOHoTjSmE3ou4OB/VG
 QvUdVPUP4617jdssp98etBnjY+tTVRc2xI1tCxkpoEmikKfJr+Z5Zy2xWT+JTLzaM87CXFdOAC8ss
 gMUOTPMX2jiZR7/dTktVn1z5qtn+U8bEW2WC7FM7iJSZif5YPMtNSaARyLlHI2DE6r1VCqRb7mB93
 yKLcwgvA==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=43878)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qNXkZ-00Fdk7-M8;
 Sun, 23 Jul 2023 13:59:47 +0200
Message-ID: <08589d8a-1a3a-36ae-31dd-0892dca42e23@tronnes.org>
Date: Sun, 23 Jul 2023 13:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] drm/tiny: panel-mipi-dbi: Allow sharing the D/C
 GPIO
Content-Language: en-US
To: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
 dri-devel@lists.freedesktop.org
References: <20230720102605.67805-1-otto.pflueger@abscue.de>
 <20230720102605.67805-3-otto.pflueger@abscue.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20230720102605.67805-3-otto.pflueger@abscue.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/20/23 12:26, Otto Pflüger wrote:
> Displays that are connected to the same SPI bus may share the D/C GPIO.
> Use GPIOD_FLAGS_BIT_NONEXCLUSIVE to allow access to the same GPIO for
> multiple panel-mipi-dbi instances. Exclusive access to the GPIO during
> transfers is ensured by the locking in drm_mipi_dbi.c.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> index eb9f13f18a02..e616e3890043 100644
> --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> @@ -307,7 +307,8 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
>  	if (IS_ERR(dbi->reset))
>  		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
>  
> -	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);

Please add a comment here that sharing only works when on the same SPI bus.

> +	dc = devm_gpiod_get_optional(dev, "dc",
> +				     GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);

I'd prefer this to be on one line, the 80 column limit has been upped to
a 100 now.

Noralf.

>  	if (IS_ERR(dc))
>  		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
>  
