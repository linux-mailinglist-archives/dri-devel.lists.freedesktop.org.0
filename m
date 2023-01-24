Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE7367A4A4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BA810E24F;
	Tue, 24 Jan 2023 21:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354DB10E24F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:12:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0299D8568C;
 Tue, 24 Jan 2023 22:12:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674594732;
 bh=87qDrRSguoOFjqOjbbcXafEuh2fPR3Go5sF00ubCce8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=skKVHJOv2YTJWCkyJatbPORIRiUEDxyNefXO5sr91aY6smtr71xsC8yLQzOKSSwGA
 7H1Y66oObC2fybLTnxhUZzTKoS0k51f+fWamr5ua+QkDWbei+xOxVDOfOaBQeT559b
 UMG4IhC9Ix/mFKMOzLMsQ7j1YNj/Tt8Pfzh9oUuR+qC2G/YSWJD/BOMLgBcxy6zdzP
 /8AnC4exGH2RPVi7ioU9k94kHBACIJT9cB6GdkQnMOSb+RbK5/qy/NecjNu8aDKDxH
 aDwqyHB+p3DWDYefb3NqAHF+Ra/fPL9JLQUQYkRrUvlWHxNiAEed0896yGS7SwZp0d
 XbS/vdsaETGdw==
Message-ID: <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
Date: Tue, 24 Jan 2023 22:12:08 +0100
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
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
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

On 1/24/23 22:01, Jagan Teki wrote:
> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 1/23/23 16:12, Jagan Teki wrote:
>>> Enable and disable of te_gpio's are Exynos platform specific
>>> irq handling, so add the exynos based irq operations and hook
>>> them for exynos plat_data.
>>
>> If this is just an optional generic GPIO IRQ, why not keep it in the
>> core code ? TE (tearing enable?) should be available on MX8M too.
> 
> So far the discussion (since from initial versions) with Marek
> Szyprowski, seems to be available in Exynos. So, I keep it separate
> from the DSIM core.

Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
