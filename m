Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FE7407A21
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 20:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153766EC14;
	Sat, 11 Sep 2021 18:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4166EC14
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Sep 2021 18:40:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6B53A83853;
 Sat, 11 Sep 2021 20:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631385656;
 bh=UECCOBS7xX1FRbQ2hWV9VfO2PrYzdXOlf9p/yOxKoqA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PKUGuT4v30Ga2ZnsM3HuornSwmZR0uD849ENjdhS9oL74SCUD4szxVHRS8l61OY43
 /SIRrsRx00lPP6h0tJGisQvVRlaExXM8r5ZI6g5zbZlKdVzx+3q5bLLcMc5DftEoeQ
 zKyEkJbQ7601Fjv46JcwYgQSkPo02PjfwObEYOmzAtMI95nu89YMIdDyky/15lH3uz
 MYbSY+oa1UIWvzoZZzTqLK6JU8ZRQye9GhCCdjpDAFAbptyFRTFJy03IWqwTV2KEOT
 w7rSB9ew0C1TiKhk/DPQvu0czOSGgMerYKYzig+5kGGD7uDN9/EDHzh76Z8pF0qUuA
 79nfaUwVBysdw==
Subject: Re: [PATCH V2] video: backlight: Drop maximum brightness override for
 brightness zero
To: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 stable@vger.kernel.org, Meghana Madhyastha <meghana.madhyastha@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, Lee Jones <lee.jones@linaro.org>
References: <20210713191633.121317-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <072e01b7-8554-de4f-046a-da11af3958d6@denx.de>
Date: Sat, 11 Sep 2021 20:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210713191633.121317-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

On 7/13/21 9:16 PM, Marek Vasut wrote:
> The note in c2adda27d202f ("video: backlight: Add of_find_backlight helper
> in backlight.c") says that gpio-backlight uses brightness as power state.
> This has been fixed since in ec665b756e6f7 ("backlight: gpio-backlight:
> Correct initial power state handling") and other backlight drivers do not
> require this workaround. Drop the workaround.
> 
> This fixes the case where e.g. pwm-backlight can perfectly well be set to
> brightness 0 on boot in DT, which without this patch leads to the display
> brightness to be max instead of off.
> 
> Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper in backlight.c")
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: <stable@vger.kernel.org> # 5.4+
> Cc: <stable@vger.kernel.org> # 4.19.x: ec665b756e6f7: backlight: gpio-backlight: Correct initial power state handling
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Thierry Reding <treding@nvidia.com>
> ---
> V2: Add AB/RB, CC stable
> ---
>   drivers/video/backlight/backlight.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 537fe1b376ad7..fc990e576340b 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -688,12 +688,6 @@ static struct backlight_device *of_find_backlight(struct device *dev)
>   			of_node_put(np);
>   			if (!bd)
>   				return ERR_PTR(-EPROBE_DEFER);
> -			/*
> -			 * Note: gpio_backlight uses brightness as
> -			 * power state during probe
> -			 */
> -			if (!bd->props.brightness)
> -				bd->props.brightness = bd->props.max_brightness;
>   		}
>   	}
>   
> 

Any news on this ?

Expanding CC list.
