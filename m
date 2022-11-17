Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2CE62DC3A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 14:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527BD10E103;
	Thu, 17 Nov 2022 13:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CD510E103
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:04:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221117130423euoutp026a615845244fecfd5fdeb2ae52722397~oYPQBJAP30952909529euoutp02o
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:04:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221117130423euoutp026a615845244fecfd5fdeb2ae52722397~oYPQBJAP30952909529euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668690263;
 bh=xGDVxvKfwa3R0oyCPonq7H0nvZ7sLY54dyqnEqQZHus=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=sGunYvHpOQW9+RWQby6RAkrUwynE7sPxijpd0ztFcoTKwPmU2U7vgKkYu8z+QR1pa
 x+BgvJ9LSXRFGf1d5GxvJ1zXebclDn7KY5Z57CKbcJBh4p97urocxKxojutZm6pLHK
 91YtvOYouHE8aRZG1p/80b7r8fcPqmlubhM5uxJ0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221117130422eucas1p110f565a061b17fd4b11704a77003b2f6~oYPPrd3Sj0742107421eucas1p1H;
 Thu, 17 Nov 2022 13:04:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AD.DE.10112.65136736; Thu, 17
 Nov 2022 13:04:22 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221117130422eucas1p26fc0059d4c58441fdffa54650455c678~oYPPPDWgV2561125611eucas1p2n;
 Thu, 17 Nov 2022 13:04:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221117130422eusmtrp19d04f685c5e20489bac1b8f8d899a872~oYPPOMZl92607426074eusmtrp1e;
 Thu, 17 Nov 2022 13:04:22 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-0f-63763156fb0d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D7.68.08916.65136736; Thu, 17
 Nov 2022 13:04:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221117130421eusmtip21abbda0c12132896cbc3fd9a86e5c3fc~oYPON3vQ-0238802388eusmtip2g;
 Thu, 17 Nov 2022 13:04:21 +0000 (GMT)
Message-ID: <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
Date: Thu, 17 Nov 2022 14:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim
 Harvey <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1BUZRie79z2sOPCYbH4ArNaJ4ZwAunifI261tTUKS/DdNEZRd0zu6eV
 2gXa5SYxI5dCWMBZZSs8FJFArBpxEQgbdUZuC26wQYQOYidCQQlt2EVXkSQPJ4t/z/u8z/s+
 7/PNR+Pqz6kwOiExhbckciYNpSRau+96nt0Wm6ZfU+dfhUYvuXEkVvkI9OclJ4WGbv1FoZKa
 fhIdFu0Emm2yU+jabwME6sudVqDCQ9UKVGs/S6Gm8WES2eaO4ajMcxZD0/k5ALn/qMfR+ZxP
 CTTo6KCQVxh70C29TqGBHi+O/Pf68JcfZetmRJKtEHoI1tHTSbL9xZcp9pRwWcGWFxwh2arT
 1zG289cqkh0dPk2xYpELY09W72cbb7Zh7MHm44D1Na2MC9yhXG/gTQlpvCVGq1Pu7VrwEcni
 kxmdF86DbNASbgMBNGRegN6KPNwGlLSacQLYWXmHkItZAHOPngFy4QOwr2CCfDjS0HcBkxu1
 AM6dXPh3ZAZAzzURSCoVo4UlYiEmYYJ5GtrdFzGZD4a9R64QEn6EMcBvmiWepkMYHRzp/Vii
 cSYUjlz5etFgOVNHwu6fZhcNcMmg+M4YLqkoJhbabtgoCQcw62D7uBOTp5+AeS3li4kg85kS
 Oju6SMkBMq/B8ltQjhACp1zNChmvgO7SYkLWHwCw8p6IyYUdwOzJESCr1sHR/jlKWoQzz8D6
 H2Nk+hVY1nufkvcHwos3guUbAuHh1i9wmVbBgny1rI6Aguv7/2zP/TyI24FGWPIswpL8wpI0
 wv++lYA4DkL5VKvZyFufS+TTo62c2ZqaaIzWJ5mbwIOv677vmm0DtVMz0e0Ao0E7gDSuWa4y
 D6Tq1SoDty+TtyTtsaSaeGs7CKcJTaiKKovSqxkjl8J/yPPJvOVhF6MDwrIx0j05VpQjlK6u
 2Iw51pasZJIm9u2aJxpzCu3qNV+90Vy+cfqHc7enBhXYY1mtDa4e9belWm8N2Ja1xenn6p9v
 M2s3Fb0zqb76we5hEGVE73YYyduRQV3rR/foX4/RaVsaK7n3TMFv/mIaj/8u6MuEuA2oNWKX
 QeU58+pUS+7mq7Qh7EQ4HUet3ekPC9mwyuO4eaJwh6+ho+z9SQfnT8os2Y7Rjfx8sidPPV38
 lDYSj39r6/yLWEZNYG+ms3pntzc/fOylSF1A/NDvKctEOi19YjxrmS9ixcLbHz2erjiU61W6
 j9Ibt2/dn2FffXfkVLbG9neQ8eDuA66hYzaG/0Sn0xDWvVxsFG6xcv8AaFYkcykEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsVy+t/xe7phhmXJBnePsFncuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBZv2hoZLU4/Ws9scaqxlcXi0pTDbBafZj0Eyk5+yWZx8cQnZovvv88yO4h5
 rP14n9Vj3qwTLB5TThxh9TjXc5fNY+esu+wesztmsnos3vOSyePI1cWsHneu7WHzuN99nMlj
 85J6j43vdjB59G1ZxejxeZNcAF+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWR
 qZK+nU1Kak5mWWqRvl2CXsbR/59ZCu4rVBy5foqxgXGrdBcjJ4eEgInEhrPXmUBsIYGljBLL
 zqlBxGUkTk5rYIWwhSX+XOti62LkAqp5zyjxd+EqNpAEr4CdRO/9TrBmFgFViQmnbzBBxAUl
 Ts58wtLFyMEhKpAise5IFIgpLJAgcetkNUgFs4C4xK0n85lARooIbGSVeP6kjxnEYRb4yChx
 afIWdohl/xglVvedYgRpYRMwlOh62wW2mFPAWuLQ4xVMEKPMJLq2djFC2PISzVtnM09gFJqF
 5I5ZSDbOQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIEpZtuxn5t3MM579VHv
 ECMTB+MhRgkOZiUR3tyLpclCvCmJlVWpRfnxRaU5qcWHGE2BgTGRWUo0OR+Y5PJK4g3NDEwN
 TcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpikDauDai9U/ZxwfJYM09O0I3mp
 czl6HT3nOp72a/6709HDef6Jk5lnj7w+6vrQ9fnl8t0qvH5/qtkjbun/maNbmKclrDn5xq9P
 /nabi/4m8aXkve9VOazzzHba/ol77l4IndM97UZt+4uNH2obK3YddHC49C7//XOVcIacuXE9
 NvF7j+eq11l75xYlalbxPb8rr7i64NMer9LnlhYrBKx6M95NWRk365xG6P/IXQfWuk1PK38z
 n0Hs7M1zhm53IqZaWJice1Ytv3bz32nZ334d6ZafEb3pTWR0gsy/HS0nF1sWJ5nPiLhn1Ro4
 6a5vteXDi73f07jVLW4acbqxzCifNfNtaUl/ZIOygyhXproSS3FGoqEWc1FxIgBCMXafugMA
 AA==
X-CMS-MailID: 20221117130422eucas1p26fc0059d4c58441fdffa54650455c678
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com>
 <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.11.2022 05:58, Marek Vasut wrote:
> On 11/10/22 19:38, Jagan Teki wrote:
>> DSI host initialization handling in previous exynos dsi driver has
>> some pitfalls. It initializes the host during host transfer() hook
>> that is indeed not the desired call flow for I2C and any other DSI
>> configured downstream bridges.
>>
>> Host transfer() is usually triggered for downstream DSI panels or
>> bridges and I2C-configured-DSI bridges miss these host initialization
>> as these downstream bridges use bridge operations hooks like pre_enable,
>> and enable in order to initialize or set up the host.
>>
>> This patch is trying to handle the host init handler to satisfy all
>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
>> flag to ensure that host init is also done on first cmd transfer, this
>> helps existing DSI panels work on exynos platform (form Marek
>> Szyprowski).
>>
>> v8, v7, v6, v5:
>> * none
>>
>> v4:
>> * update init handling to ensure host init done on first cmd transfer
>>
>> v3:
>> * none
>>
>> v2:
>> * check initialized state in samsung_dsim_init
>>
>> v1:
>> * keep DSI init in host transfer
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>>   drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
>>   include/drm/bridge/samsung-dsim.h     |  5 +++--
>>   2 files changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index bb1f45fd5a88..ec7e01ae02ea 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct 
>> samsung_dsim *dsi)
>>       disable_irq(dsi->irq);
>>   }
>>   -static int samsung_dsim_init(struct samsung_dsim *dsi)
>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int 
>> flag)
>>   {
>>       const struct samsung_dsim_driver_data *driver_data = 
>> dsi->driver_data;
>>   +    if (dsi->state & flag)
>> +        return 0;
>> +
>>       samsung_dsim_reset(dsi);
>> -    samsung_dsim_enable_irq(dsi);
>> +
>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
>> +        samsung_dsim_enable_irq(dsi);
>>         if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
>>           samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct 
>> samsung_dsim *dsi)
>>       samsung_dsim_set_phy_ctrl(dsi);
>>       samsung_dsim_init_link(dsi);
>>   +    dsi->state |= flag;
>> +
>>       return 0;
>>   }
>>   @@ -1269,6 +1276,10 @@ static void 
>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>       }
>>         dsi->state |= DSIM_STATE_ENABLED;
>> +
>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>> +    if (ret)
>> +        return;
>>   }
>>     static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>> @@ -1458,12 +1469,9 @@ static ssize_t 
>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>>       if (!(dsi->state & DSIM_STATE_ENABLED))
>>           return -EINVAL;
>>   -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>> -        ret = samsung_dsim_init(dsi);
>> -        if (ret)
>> -            return ret;
>> -        dsi->state |= DSIM_STATE_INITIALIZED;
>> -    }
>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
>
> This triggers full controller reset and reprogramming upon first 
> command transfer, is such heavy handed reload really necessary ?

Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM 
DSI. If this is a real issue for you, then maybe the driver could do the 
initialization conditionally, in prepare() callback in case of IMX and 
on the first transfer in case of Exynos?


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

