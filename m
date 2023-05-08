Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEAE6FBAD8
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 00:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EADA10E311;
	Mon,  8 May 2023 22:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232AA10E311
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 22:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w2BDjltas+1f5y4nRccckcy8BmBhkxwsgvmK2MdX5H4=; b=p09HOPNrGo94QplPvBZA0xppMd
 Kb2+c25NhCsoymYGNtu7pDNyElwev/EmUVKwUBWmGDyOREHK6s/rA4CH44NFK+svsXLHQlDHYsCXi
 I4KMU920IFAL5grgBy3fthG5jYSdHeJLVO1b8hm1ciklPT+IGJMit+5CYmojBYQLw1DBLk93lt7Of
 HqbQaEF6ktB3sMFEJcTsaQAHRh7/B3PiG56xQ/mWqa6n+0nJheo/pkGYv7JzLif59SZ7zGvfzvwHY
 wWKbkEl4pjQ7UbmIrzjDR+fTJ9MVBnWrM6r23hGn9HmxIYwHfHsRmzCTlb2pMdMOtcxhcAGlWytKj
 wwpJuEsw==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pw93w-004G5s-3p; Tue, 09 May 2023 00:10:32 +0200
Message-ID: <164e2e26-7ed0-853f-c7d5-ad4fbbb61cac@igalia.com>
Date: Mon, 8 May 2023 19:10:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 45/53] drm/tests: helpers: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-46-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230507162616.1368908-46-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On 5/7/23 13:26, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpu/drm/tests/drm_kunit_helpers.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index e98b4150f556..049b98daedbb 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -19,14 +19,13 @@ static int fake_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int fake_remove(struct platform_device *pdev)
> +static void fake_remove(struct platform_device *pdev)
>   {
> -	return 0;
>   }

This function was removed on commit 96c25b03145a. I'm not sure if
we should bring it back.

Best Regards,
- Maíra Canal

>   
>   static struct platform_driver fake_platform_driver = {
>   	.probe	= fake_probe,
> -	.remove	= fake_remove,
> +	.remove_new = fake_remove,
>   	.driver = {
>   		.name	= KUNIT_DEVICE_NAME,
>   	},
