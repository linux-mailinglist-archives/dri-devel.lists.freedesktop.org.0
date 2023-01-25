Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1906867B728
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 17:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AAF10E0A6;
	Wed, 25 Jan 2023 16:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BDA10E0A6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 16:46:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9BCA0856CA;
 Wed, 25 Jan 2023 17:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674665204;
 bh=ELe7sNCIKhzIhAIEvK/gbGq94iiKiM0v2v0PvH85gc0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oz8XbnxCu2ZV30t6/kQEk5rYvTgHME+DYJnAsThYPGJ0XIoITi45VS2UV/mMxbEH9
 li4X3z/C5ihPYKMksanzsojAI+iteGg9X3798kM3x+wuf8wa+VMwFr6b6hZ1UZ2WXO
 OKlj9zv1ZTesft9RGiMXpCiF4wI9NQR9gvpuNGH+SYdVBSOmbZeq0U+FB5ShH2tH9W
 m4j+cEZ+i32tCIgByfsIBeNNwwkmKRLsCvIMdhkGMHcLljAkscD0mLw3hzATHupZRZ
 JdFfBLx61gccRCnAAsEikcvix6uALOkCn+vAO4UN4xlqCBjMxJJ6MLWBbFG0GWDh48
 yHWRse7IFay3Q==
Message-ID: <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de>
Date: Wed, 25 Jan 2023 17:46:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
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

On 1/25/23 15:04, Jagan Teki wrote:
> On Wed, Jan 25, 2023 at 7:23 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 1/25/23 07:54, Jagan Teki wrote:
>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>>
>>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>>>
>>>>> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>
>>>>>> On 1/24/23 22:01, Jagan Teki wrote:
>>>>>>> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>
>>>>>>>> On 1/23/23 16:12, Jagan Teki wrote:
>>>>>>>>> Enable and disable of te_gpio's are Exynos platform specific
>>>>>>>>> irq handling, so add the exynos based irq operations and hook
>>>>>>>>> them for exynos plat_data.
>>>>>>>>
>>>>>>>> If this is just an optional generic GPIO IRQ, why not keep it in the
>>>>>>>> core code ? TE (tearing enable?) should be available on MX8M too.
>>>>>>>
>>>>>>> So far the discussion (since from initial versions) with Marek
>>>>>>> Szyprowski, seems to be available in Exynos. So, I keep it separate
>>>>>>> from the DSIM core.
>>>>>>
>>>>>> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
>>>>
>>>> I will check this.
>>>
>>> In order to use TE_GPIO we need te handler implementation, right now
>>> Exynos CRTC DRM drivers have implementation for this. That is the main
>>> reason to keep the TE_GPIO handling in exynos, maybe if we handle that
>>> generically then it is a viable option to move TE_GPIO to the DSIM
>>> core.
>>
>> I think you can do this exactly the same way exynos does it -- check
>> whether te_handler() callback is implemented by the glue code (the one
>> you already have for various exynos and imx8mm/imx8mm SoCs) and if so,
>> call it. If it is not implemented, do not call anything in the TE IRQ
>> handler.
> 
> I need to understand how i.MX8MM handles this on TE IRQ in the DSIM
> host side, Can I do this in future patch set as it might involve
> bindings changes as well if it's part of DSIM?

Why not leave an empty te_handler implementation on MX8M for now ?
You can fill that implementation in future patchset, but the generic 
part of the code would be in place .
