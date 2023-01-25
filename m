Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEA667B3B8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 14:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4F910E00E;
	Wed, 25 Jan 2023 13:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A2410E7C6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 13:53:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C6613851A8;
 Wed, 25 Jan 2023 14:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674654828;
 bh=uEaUp4riWCv7pn9QdMjebBrffleNL6j6TZrtCY1PtqY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=btzHJ8bKbmH8X1h1M0PUY3cyA5jslvFSwes1bdTKsT9rTYouM5Ca63kTY+UAUjoUf
 lpbk8BrRPBJ44O54hV9T310hBCBJ5ngTRUGQoxuNTPshIMWBwNsr341d2/hXn5B8l1
 G7KkonfOp2KWPwuaEi8wvdqEvHVUjMx5PVOMfl8BgEZGLk0/KpEwSNK/4SNeBqs54N
 8haEAgd+MpuqJXPz5tdxoKaABgzZyUjbjooH+2Y1wKdb4zk6TOAPt5hmAmw+b+XtW3
 F+Cyo/8STxSIMqH2zHUA4iT77lw1OQb1WDo+s5W6vekx5ndnj8TAZh5xKrBg5timnR
 NlUshHgjuYSfA==
Message-ID: <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de>
Date: Wed, 25 Jan 2023 14:53:46 +0100
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
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
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
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/23 07:54, Jagan Teki wrote:
> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>
>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>
>>> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 1/24/23 22:01, Jagan Teki wrote:
>>>>> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>
>>>>>> On 1/23/23 16:12, Jagan Teki wrote:
>>>>>>> Enable and disable of te_gpio's are Exynos platform specific
>>>>>>> irq handling, so add the exynos based irq operations and hook
>>>>>>> them for exynos plat_data.
>>>>>>
>>>>>> If this is just an optional generic GPIO IRQ, why not keep it in the
>>>>>> core code ? TE (tearing enable?) should be available on MX8M too.
>>>>>
>>>>> So far the discussion (since from initial versions) with Marek
>>>>> Szyprowski, seems to be available in Exynos. So, I keep it separate
>>>>> from the DSIM core.
>>>>
>>>> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
>>
>> I will check this.
> 
> In order to use TE_GPIO we need te handler implementation, right now
> Exynos CRTC DRM drivers have implementation for this. That is the main
> reason to keep the TE_GPIO handling in exynos, maybe if we handle that
> generically then it is a viable option to move TE_GPIO to the DSIM
> core.

I think you can do this exactly the same way exynos does it -- check 
whether te_handler() callback is implemented by the glue code (the one 
you already have for various exynos and imx8mm/imx8mm SoCs) and if so, 
call it. If it is not implemented, do not call anything in the TE IRQ 
handler.
