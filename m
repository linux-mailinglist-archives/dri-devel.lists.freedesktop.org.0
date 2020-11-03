Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4972A3CFF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 07:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFECC6E7E6;
	Tue,  3 Nov 2020 06:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581056E7E6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 06:51:51 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A36n4n8096222;
 Tue, 3 Nov 2020 00:49:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604386144;
 bh=ZwcdfWCCREuC1REgf4+LiouU2icWMDn+kcyDmC5qgtQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=y6XGwP4n4KVXCDSKjzBh4qJU7/zKqa4vvt9xCi6WWhRn72Uo6uXL/4fZkxOFmfi3X
 oqa4C1Ilcrb67HCh/it+s7U6DL7o45icbnYLX2Zvz3fCzyOn+ZIHeQQV2GY6gToQTm
 /BX+ooj98RQzn/tX2KjJqP8eMYVghvTz+POEYeyQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A36n4nI118555
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Nov 2020 00:49:04 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 00:49:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 00:49:04 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A36n15X083859;
 Tue, 3 Nov 2020 00:49:01 -0600
Subject: Re: [PATCH v2] drm/bridge: tpd12s015: Fix irq registering in
 tpd12s015_probe
To: YueHaibing <yuehaibing@huawei.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <sebastian.reichel@collabora.com>, <sam@ravnborg.org>
References: <20201031031648.42368-1-yuehaibing@huawei.com>
 <20201102143024.26216-1-yuehaibing@huawei.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8b1ac1a4-44ef-e0bd-cc4f-4045b10fe1d3@ti.com>
Date: Tue, 3 Nov 2020 08:49:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102143024.26216-1-yuehaibing@huawei.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2020 16:30, YueHaibing wrote:
> gpiod_to_irq() return negative value in case of error,
> the existing code doesn't handle negative error codes.
> If the HPD gpio supports IRQs (gpiod_to_irq returns a
> valid number), we use the IRQ. If it doesn't (gpiod_to_irq
> returns an error), it gets polled via detect(). 
> 
> Fixes: cff5e6f7e83f ("drm/bridge: Add driver for the TI TPD12S015 HDMI level shifter")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: Add checking for >= 0 and update commit message
> ---
>  drivers/gpu/drm/bridge/ti-tpd12s015.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
> index 514cbf0eac75..e0e015243a60 100644
> --- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
> +++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
> @@ -160,7 +160,7 @@ static int tpd12s015_probe(struct platform_device *pdev)
>  
>  	/* Register the IRQ if the HPD GPIO is IRQ-capable. */
>  	tpd->hpd_irq = gpiod_to_irq(tpd->hpd_gpio);
> -	if (tpd->hpd_irq) {
> +	if (tpd->hpd_irq >= 0) {
>  		ret = devm_request_threaded_irq(&pdev->dev, tpd->hpd_irq, NULL,
>  						tpd12s015_hpd_isr,
>  						IRQF_TRIGGER_RISING |
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
