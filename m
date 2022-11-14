Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEC6274DC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 04:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF3710E05F;
	Mon, 14 Nov 2022 03:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B0310E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 03:16:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 21F90839E1;
 Mon, 14 Nov 2022 04:16:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1668395788;
 bh=E0IhM/uCwD4sS9QR1hj1RvZ0InbjI+h1E2fJC/qgA3E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EArG/AK3iWzy90EETcWzpuGjQA2H1lWhudTcSAIbA5nRWE/9ZogYfxKWnMDeZuRSf
 TohCPFNbiiZt1MalupM0R3dLfB6uGZPtTuElPQd0yo/kkwebhE5hsyqhBoFWllV1yF
 LCwYnQaFCu97EH4Y5y1sLQ2fl+WNvWwfEzGA/vX7yZWAetcOlII1z61oNEDBXG4YnR
 C0aqg4RTQFEk/UevXPfJWolrAglErwY67W3Vv2C93MH+D288P4U7NWS3+CwjABD/nN
 JMVIPHWUx7YEcWSpdOqq/8PvOX6QLBVc6Arw9PTKzHmHPQxIHck7kMLG0XtWrkInhA
 cy1Ktg2i7JYtQ==
Message-ID: <ef265fa0-dea9-f7c6-3800-ad0353a838b8@denx.de>
Date: Mon, 14 Nov 2022 04:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com>
 <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
 <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
 <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
 <c82a77f3-17a1-1b59-96da-924daae3678c@denx.de>
 <CANMq1KBMJDcfcbfYGtRj+MDJgFKg_i5Rw6ZJuoZy0D_kzkob3Q@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CANMq1KBMJDcfcbfYGtRj+MDJgFKg_i5Rw6ZJuoZy0D_kzkob3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/14/22 02:11, Nicolas Boichat wrote:
> On Sun, Nov 13, 2022 at 8:29 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 11/11/22 13:12, Nicolas Boichat wrote:
>>
>> [...]
>>
>>>>> BTW, are you sure DSIM_HSE_MODE is correct now?
>>>>
>>>> Yes, we have tested in imx8m platforms as well. Sébastien Szymanski
>>>> initially observed this issue on the imx8m platform.
>>>
>>> I'll repeat, are you sure about HSE specifically? You invert the
>>> polarity for HBP, HFP, and HSA, which makes sense given your patch
>>> 02/14.
>>>
>>> I'm concerned about HSE. Is the bit really a disable bit?
>>> MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
>>> should not do `reg |= DSIM_HSE_DISABLE;`, probably.
>>
>> I suspect the HSE bit is a misnomer, but its handling in the driver is
>> correct.
>>
>> i.MX 8M Plus Applications Processor Reference Manual, Rev. 1, 06/2021
>> Page 5436
>>
>> 23 HseDisableMode
>>
>> In Vsync pulse and Vporch area, MIPI DSI master transfers only Hsync
>> start packet to MIPI DSI slave at MIPI DSI spec 1.1r02. This bit
>> transfers Hsync end packet in Vsync pulse and Vporch area (optional).
>>
>> 0 = Disables transfer
>> 1 = Enables transfer
>>
>> In command mode, this bit is ignored.
> 
> Okay. I'd suggest adding a comment in the code, it'd be so tempting to
> attempt to "fix" this as the if/or pattern looks different from the
> others.
> 
> But it's up to you all.

I agree. Clearly the discrepancy is confusing and leads to mistakes.
