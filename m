Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A166D61844A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 17:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391F110E717;
	Thu,  3 Nov 2022 16:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BFF10E709
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=LuUlqEzo0OPo2OKzfkX6TrEu4UYR2Ri7Y6DcewzJiDo=; b=vBdSLQm2ScrC/F19qfTghg8m4Z
 yB3h906OykABRfgw8Tx/gJkEUKwe9fIMVXnbdPplZ+fYHObjhnP0ok4TVKxGv05iZCuI0gQDH3Fen
 3tV+Pw6TIQDa9EExDJCRVTWjKaHS8k+iIuNN/Q3BGHjGKGYEOuePucFze6TiLdLOkAPpubSLu6krZ
 98Gp323cPmkk2iQrMt2L7REeAFO9dXIqFLuL92U18PPXrDfflJsgfblKJUbL43PAcd6L0jeTJdSzu
 KoheCz7X6bmokwq640ljKET1LxpDhff/pmvR92p07J+lce7v6IYHgy5pRoy8oMfQZxg9ImMD7b6no
 Wg7kgJZg==;
Received: from [2601:1c2:d80:3110::a2e7]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oqd2f-000g7r-L4; Thu, 03 Nov 2022 16:26:09 +0000
Message-ID: <f5a46aef-780e-6fec-85b4-82549fb7a7a1@infradead.org>
Date: Thu, 3 Nov 2022 09:26:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm: rcar_du: DRM_RCAR_DU optionally depends on
 RCAR_MIPI_DSI
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org
References: <20221018181828.19528-1-rdunlap@infradead.org>
 <a68a24a0-eda3-8711-21c1-334289eca0d3@infradead.org>
 <166747314442.3962897.9754510086268412956@Monstersaurus>
 <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/3/22 04:53, Javier Martinez Canillas wrote:
> Hello Kieran,
> 
> On 11/3/22 11:59, Kieran Bingham wrote:
>> Hi Randy,
>>
>> Quoting Randy Dunlap (2022-11-03 06:06:45)
>>> ping. I have verified (on linux-next-20221103) that this is still needed.
>>> Thanks.
>>>
>>> On 10/18/22 11:18, Randy Dunlap wrote:
>>>> When CONFIG_DRM_RCAR_DU=y and CONFIG_DRM_RCAR_MIPI_DSI=m, calls
>>>> from the builtin driver to the mipi driver fail due to linker
>>>> errors.
>>>> Since the RCAR_MIPI_DSI driver is not always required, fix the
>>>> build error by making DRM_RCAR_DU optionally depend on the
>>>> RCAR_MIPI_DSI Kconfig symbol. This prevents the problematic
>>>> kconfig combination without requiring that RCAR_MIPI_DSI always
>>>> be enabled.
>>>>
>>>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
>>>> rcar_du_crtc.c:(.text+0x3a18): undefined reference to `rcar_mipi_dsi_pclk_enable'
>>>> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
>>>> rcar_du_crtc.c:(.text+0x47cc): undefined reference to `rcar_mipi_dsi_pclk_disable'
>>>>
>>>> Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>> Cc: LUU HOAI <hoai.luu.ub@renesas.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> ---
>>>>  drivers/gpu/drm/rcar-du/Kconfig |    1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff -- a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
>>>> --- a/drivers/gpu/drm/rcar-du/Kconfig
>>>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
>>>> @@ -4,6 +4,7 @@ config DRM_RCAR_DU
>>>>       depends on DRM && OF
>>>>       depends on ARM || ARM64
>>>>       depends on ARCH_RENESAS || COMPILE_TEST
>>>> +     depends on DRM_RCAR_MIPI_DSI || DRM_RCAR_MIPI_DSI=n
>>
>> Please forgive my ignorance, but I don't understand how this works.
>> Could you explain what this is doing please?
>>
>> I know you've explained above that it fixes it to optionally depend on
>> DRM_RCAR_MIPI_DSI ... but it's not making sense to me.
>>
>> To me - this is saying we depend on DRM_RCAR_MIPI_DSI being enabled, or
>> not being enabled ... ? Which is like saying if (0 || 1) ?
>>
>> I'm guessing I'm missing something obvious :-S

It's kconfig tristate symbols (y/n/m), not boolean. :)

> What this Kconfig expression is saying is that it depends on DRM_RCAR_MIPI_DSI=y
> if DRM_RCAR_DU=y and DRM_RCAR_MIPI_DSI=m if DRM_RCAR_DU=m. But that the it can
> also be satisfied if is not set DRM_RCAR_MIPI_DSI.
> 
> This is usually used to make sure that you don't end with a configuration where
> DRM_RCAR_MIPI_DSI=y and DRM_RCAR_DU=m or DRM_RCAR_MIPI_DSI=m and DRM_RCAR_DU=y.
> 
> Randy, I think that it's more idiomatic though to it express as following:
> 
> depends on DRM_RCAR_MIPI_DSI || !DRM_RCAR_MIPI_DSI

I count just over 200 of each idiom (but my grep strings could be
too crude). I guess that you want a v2 with that change?

Thanks.
-- 
~Randy
