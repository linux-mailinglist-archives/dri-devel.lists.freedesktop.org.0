Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55EF67B87E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 18:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8266010E027;
	Wed, 25 Jan 2023 17:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D1010E027
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 17:27:38 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 02B5F856D2;
 Wed, 25 Jan 2023 18:27:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674667656;
 bh=mKeBXM5NYZAL7n1CXK8qeUt4oWmXhpL0hxj2dlk3G0c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EzQfkdHAI3S7I6gB8mwcy1TWYYEdHip3z7c6aBwwWttO6rcFM4ZQdbTQRtCdDm6Mt
 mhmMTWMZGn4bmS8frP2VrseJhPaawhEtTTM9fml8cg4cr4iG7mxI2PLnlTyULe/ggw
 JJ37qogJAb0Y8kPXeyTxsw/DLRbt9mrvtwpgylb6opReG7NUGEtv5EP++Z5wMPm0d6
 GN3udMOkr0YiQ0b/grU/zmWM/aizOyHRYYC5eUk3W/K1YtGJUYFpStUFjcYg/2I9FG
 mpd9rHrofLNl0MkLPZqerWm9KmdQW1Sj9SNl1npOjBmZf6XaPSCkunoRGkgueuUKW1
 4CZd9C4ekTu0A==
Message-ID: <a756fd20-28e4-85e7-3947-4c468bf3366d@denx.de>
Date: Wed, 25 Jan 2023 18:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com>
 <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
 <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
 <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
 <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de>
 <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
 <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de>
 <CAMty3ZAh7J6_X9NkE+-mBrHBFx+KfuQXPBUYyL5g2vu_Y5X9iw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZAh7J6_X9NkE+-mBrHBFx+KfuQXPBUYyL5g2vu_Y5X9iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/23 18:12, Jagan Teki wrote:
> On Wed, Jan 25, 2023 at 10:16 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 1/25/23 15:04, Jagan Teki wrote:
>>> On Wed, Jan 25, 2023 at 7:23 PM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 1/25/23 07:54, Jagan Teki wrote:
>>>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>>>>
>>>>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>>>>>
>>>>>>> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>
>>>>>>>> On 1/24/23 22:01, Jagan Teki wrote:
>>>>>>>>> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>>>
>>>>>>>>>> On 1/23/23 16:12, Jagan Teki wrote:
>>>>>>>>>>> Enable and disable of te_gpio's are Exynos platform specific
>>>>>>>>>>> irq handling, so add the exynos based irq operations and hook
>>>>>>>>>>> them for exynos plat_data.
>>>>>>>>>>
>>>>>>>>>> If this is just an optional generic GPIO IRQ, why not keep it in the
>>>>>>>>>> core code ? TE (tearing enable?) should be available on MX8M too.
>>>>>>>>>
>>>>>>>>> So far the discussion (since from initial versions) with Marek
>>>>>>>>> Szyprowski, seems to be available in Exynos. So, I keep it separate
>>>>>>>>> from the DSIM core.
>>>>>>>>
>>>>>>>> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
>>>>>>
>>>>>> I will check this.
>>>>>
>>>>> In order to use TE_GPIO we need te handler implementation, right now
>>>>> Exynos CRTC DRM drivers have implementation for this. That is the main
>>>>> reason to keep the TE_GPIO handling in exynos, maybe if we handle that
>>>>> generically then it is a viable option to move TE_GPIO to the DSIM
>>>>> core.
>>>>
>>>> I think you can do this exactly the same way exynos does it -- check
>>>> whether te_handler() callback is implemented by the glue code (the one
>>>> you already have for various exynos and imx8mm/imx8mm SoCs) and if so,
>>>> call it. If it is not implemented, do not call anything in the TE IRQ
>>>> handler.
>>>
>>> I need to understand how i.MX8MM handles this on TE IRQ in the DSIM
>>> host side, Can I do this in future patch set as it might involve
>>> bindings changes as well if it's part of DSIM?
>>
>> Why not leave an empty te_handler implementation on MX8M for now ?
>> You can fill that implementation in future patchset, but the generic
>> part of the code would be in place .
> 
> Look like we have one issue to move regster te_irq into samsung-dsim.
> 
> exynos_dsi_register_te_irq is done after the bridge attach is done in
> Exynos, here bridge attach is triggered in the component ops bind
> call, since samsung-dsim is a pure bridge w/o any component ops.
> https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1527
> https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L112
> 
> Any suggestion on how to handle this?

Why isn't the generic code calling drm_bridge_attach() in 
samsung_dsim_host_attach(), like the exynos one ?
