Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF863914E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 23:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AB510E027;
	Fri, 25 Nov 2022 22:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515A710E027
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 22:14:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 03B288524A;
 Fri, 25 Nov 2022 23:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1669414458;
 bh=wI3J0mlr5h+qq2aRWmQ8lPDd3WqWNnKhUjad4gkQv+4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=v5LmsyBCZhT3NDqvIe6FIeMApmcw8c92Z1kPUPf4HCDqjuZXu2O0PuRUkZTL4zGAO
 wGxlRq5ecxiA8W1efezXOLhyPRJuzsQQNsSnf1d0QLx0WmIphslAFuEfieRZKgBRC1
 PQX1P7vfRdhtIUaghK1Et/rp2iGkGWKZ2a/QBWsScUI7PSdJNO6sT8KHMIuzWZZvzx
 k7XTtGVOxtHbO5KCejhzTWEJ/tChrimfg0+eumoGzbtyzKRlPGz3IVebVkrK06oX60
 nxavHkZOYwmRW2vDw6DTunqOAjMmJ8awU5LIGkaFfDO3KqU7p+Qn/BbAt+b7yrQCMh
 l7Xmi8tdw5TFQ==
Message-ID: <58671662-9242-c7ef-53ef-60f9cdc3399a@denx.de>
Date: Fri, 25 Nov 2022 23:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com>
 <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
 <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
 <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de>
 <CAMty3ZBfAY86fp7XxS9frrBiT9FRkJaNSRY-4CVpqGOvdpn1fw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBfAY86fp7XxS9frrBiT9FRkJaNSRY-4CVpqGOvdpn1fw@mail.gmail.com>
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

On 11/23/22 21:09, Jagan Teki wrote:
> On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 11/17/22 14:04, Marek Szyprowski wrote:
>>> On 17.11.2022 05:58, Marek Vasut wrote:
>>>> On 11/10/22 19:38, Jagan Teki wrote:
>>>>> DSI host initialization handling in previous exynos dsi driver has
>>>>> some pitfalls. It initializes the host during host transfer() hook
>>>>> that is indeed not the desired call flow for I2C and any other DSI
>>>>> configured downstream bridges.
>>>>>
>>>>> Host transfer() is usually triggered for downstream DSI panels or
>>>>> bridges and I2C-configured-DSI bridges miss these host initialization
>>>>> as these downstream bridges use bridge operations hooks like pre_enable,
>>>>> and enable in order to initialize or set up the host.
>>>>>
>>>>> This patch is trying to handle the host init handler to satisfy all
>>>>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
>>>>> flag to ensure that host init is also done on first cmd transfer, this
>>>>> helps existing DSI panels work on exynos platform (form Marek
>>>>> Szyprowski).
>>>>>
>>>>> v8, v7, v6, v5:
>>>>> * none
>>>>>
>>>>> v4:
>>>>> * update init handling to ensure host init done on first cmd transfer
>>>>>
>>>>> v3:
>>>>> * none
>>>>>
>>>>> v2:
>>>>> * check initialized state in samsung_dsim_init
>>>>>
>>>>> v1:
>>>>> * keep DSI init in host transfer
>>>>>
>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>> ---
>>>>>     drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
>>>>>     include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>     2 files changed, 20 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> index bb1f45fd5a88..ec7e01ae02ea 100644
>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct
>>>>> samsung_dsim *dsi)
>>>>>         disable_irq(dsi->irq);
>>>>>     }
>>>>>     -static int samsung_dsim_init(struct samsung_dsim *dsi)
>>>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int
>>>>> flag)
>>>>>     {
>>>>>         const struct samsung_dsim_driver_data *driver_data =
>>>>> dsi->driver_data;
>>>>>     +    if (dsi->state & flag)
>>>>> +        return 0;
>>>>> +
>>>>>         samsung_dsim_reset(dsi);
>>>>> -    samsung_dsim_enable_irq(dsi);
>>>>> +
>>>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>> +        samsung_dsim_enable_irq(dsi);
>>>>>           if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
>>>>>             samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>>>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
>>>>> samsung_dsim *dsi)
>>>>>         samsung_dsim_set_phy_ctrl(dsi);
>>>>>         samsung_dsim_init_link(dsi);
>>>>>     +    dsi->state |= flag;
>>>>> +
>>>>>         return 0;
>>>>>     }
>>>>>     @@ -1269,6 +1276,10 @@ static void
>>>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>>>         }
>>>>>           dsi->state |= DSIM_STATE_ENABLED;
>>>>> +
>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>> +    if (ret)
>>>>> +        return;
>>>>>     }
>>>>>       static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>>>> @@ -1458,12 +1469,9 @@ static ssize_t
>>>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>>>>>         if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>>             return -EINVAL;
>>>>>     -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>>>>> -        ret = samsung_dsim_init(dsi);
>>>>> -        if (ret)
>>>>> -            return ret;
>>>>> -        dsi->state |= DSIM_STATE_INITIALIZED;
>>>>> -    }
>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
>>>>
>>>> This triggers full controller reset and reprogramming upon first
>>>> command transfer, is such heavy handed reload really necessary ?
>>>
>>> Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM
>>> DSI. If this is a real issue for you, then maybe the driver could do the
>>> initialization conditionally, in prepare() callback in case of IMX and
>>> on the first transfer in case of Exynos?
>>
>> That's odd , it does actually break panel support for me, without this
>> double reset the panel works again. But I have to wonder, why would such
>> a full reset be necessary at all , even on the exynos ?
> 
> Is it breaking samsung_dsim_reset from host_transfer? maybe checking
> whether a reset is required before calling it might fix the issue.  I
> agree with double initialization is odd but it seems it is required on
> some panels in Exynos, I think tweaking them and adjusting the panel
> code might resolve this discrepancy.

Can someone provide further details on the exynos problem ?
