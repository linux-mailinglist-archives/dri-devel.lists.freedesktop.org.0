Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3652BBC0
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 16:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFD210E301;
	Wed, 18 May 2022 14:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C510D10E48C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 14:15:17 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220518141515euoutp01dbb8bfb9fb365e0cca290e5a7cd31ef5~wOJ5P-ud82827628276euoutp01H
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 14:15:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220518141515euoutp01dbb8bfb9fb365e0cca290e5a7cd31ef5~wOJ5P-ud82827628276euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652883315;
 bh=5G9/RbCaRM5TxQQITzEg41P0za4L8bGRGmp4aFfPzTQ=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=c5zqOmZ2zkpfn2dMZtztMXrhXHy5cKcSU11I+vfkqh+C/dynCjyM7IGdunJdxFxe9
 I/XX+yt51FvfiwCVGkjYlek+VA/vVRJIfRnQLjwRNkg4ovYxCusbLodnYOq1RjZMlt
 c40n90hIrveQib5jqiv907TNN/iMEK1D5XLvZEqs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220518141515eucas1p2832a835ad3169f8e0c168303d38ea538~wOJ43dOw82741427414eucas1p2B;
 Wed, 18 May 2022 14:15:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 15.43.09887.37FF4826; Wed, 18
 May 2022 15:15:15 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220518141514eucas1p18b57f4f474c5477123746d1a3476e4a5~wOJ4YFxN_1671216712eucas1p1i;
 Wed, 18 May 2022 14:15:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220518141514eusmtrp24a49a60eea8d70369c251079f1b318d4~wOJ4Wz9JK2883628836eusmtrp2Y;
 Wed, 18 May 2022 14:15:14 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-9a-6284ff73413e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 48.D9.09522.27FF4826; Wed, 18
 May 2022 15:15:14 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220518141512eusmtip1d43c9f1dedc488d2a26030ec25d4f1af~wOJ2mebdn0513305133eusmtip1d;
 Wed, 18 May 2022 14:15:12 +0000 (GMT)
Message-ID: <b6b7de32-c822-9aba-9ab6-dedc29c6f8f1@samsung.com>
Date: Wed, 18 May 2022 16:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 05/12] drm: bridge: samsung-dsim: Add DSI init in
 bridge pre_enable()
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>
In-Reply-To: <e8e56e98-59aa-62b1-2b96-3a0436e91dac@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGd+69vb3tVrjWdpypmUmdS2TjQ3TxbGO4Lfvj/qO4BHVINr2V
 CzSjxbWwyTYzJl9aOof4QVsXNlcMBRGkAkEldVZjq0QQM6pCa8cgmZZi19INZVHm7d0H//3y
 vO+T531ODoXL68gllEZXyul1bLGKlBK9Vx4NpRjmq9Tp0R4l8o0N4ChgmyHQ1JidRD//ESbR
 NycGRaghUE+gmKOeRPfuDhPo+t6QGO0/2CxGLfVOEjkmvCJknGvFkXnIiaGBXztxdO3ragK5
 DuShqHX8qX7oPomGPVEczf51HX9byZyKBERM+Ha1mDnsuSxiBk1+kjlr9YuZY/ssIsbWfx9j
 Lo/YRIzP208ygTo3xpxp/orpetCHMQe62wAz43hxU8I2aWY+V6z5lNOnZe2QFjms57Bdvy/b
 fdeXWAEOQiOQUJBeCy3N1ZgRSCk5bQcw1HNPxA/kdAzA6TaxMJgB8IjzKGkEVNxhP7pH0FsA
 DB++9c9SBMArQT/g3TI6C3aMmHGeCXolnB1qxwV9EbxqmSR4VtJqGAqNxPXF9Eewr7oqzjid
 BEcnv8d4JunV0DhtJHlW0A0iuDeWxIfhfJjp4XjcIKHXw59OhgjBvBxW9hzD+SVI10ih01cD
 hKLvQVNfDBN4MQy6u8UCL4PzZ/k0vloJfGxeI8i7oXdKOBrSb0Lf4Fy8PU6vgp3n0gT5HTg7
 9xAIzgR4e3qRcEECbOhtxAVZBvfVyIXtl6HV3fFf5sUbN/F6oLIueBTrgvLWBV2s/+f+AIg2
 kMSVGbSFnCFDx32WamC1hjJdYerOEq0DPP2vA0/csT7QEoykugBGAReAFK5SyIC2Si2X5bPl
 n3P6ku36smLO4AJLKUKVJNupOc3K6UK2lPuY43Zx+n+nGCVZUoHZUkxbao2R418szdE/m62R
 t5veXSulL+imfOSt47LwpU2vPRNIfrJh+Gr7eb/4Ytarm6eD2+6scwX3eP9M/q4xPUPB3BlM
 mao939Kqr3w+PzN9rNxL19ndX7KeX9b32x7YC4qc29U5Mc/mxvL597vZiqGJxN+ifnMBvpXM
 HFU+duc60LW0U2/lnTyh+KD0hcqCLZGmcIctrKw9PcF2rTmywtxLvtSwShZwSB71ehQ9Hzoo
 NuqTy6sO7Vj3iu7CjeWJqdbOVnK0zXLz9UsrfsxLz6hltF1eS5MyI9H57SeMRKx+47nx7Ny6
 XPXIQPaZ/U1QU7OBzsI8wVxRDuA2TqoIQxG7OhnXG9i/Ab9PkC8eBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsVy+t/xu7pF/1uSDFrP6lvcuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBanH61ntjjV2Mpicagv2uLTrIdA8ckv2SwunvjEbPH991lmB1GPtR/vs3q8
 v9HK7jHlxBFWj3M9d9k8ds66y+4xu2Mmq8fiPS+ZPI5cXczqcefaHjaP+93HmTw2L6n32Phu
 B5NH35ZVjB6fN8kF8EXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk
 5mSWpRbp2yXoZWyatYup4INMxb07/A2MEyW6GDk4JARMJFZMq+1i5OIQEljKKLF02WP2LkZO
 oLiMxMlpDawQtrDEn2tdbBBF7xklPjZdYwRJ8ArYSay7OoMZxGYRUJX4fn4NM0RcUOLkzCcs
 IAtEBZIkjhzmBwkLC8RJ7GhtASthFhCXuPVkPhOIzSZgKNH1FmK+iMA0Vol7b7+COcwCHxkl
 Lk3ewg6x+R+jxKK7n8BO4hSwlziw+g0LxCgzia6tXYwQtrxE89bZzBMYhWYhOWQWko2zkLTM
 QtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmBa2Xbs5+YdjPNefdQ7xMjEwXiIUYKD
 WUmElzG3JUmINyWxsiq1KD++qDQntfgQoykwNCYyS4km5wMTW15JvKGZgamhiZmlgamlmbGS
 OK9nQUeikEB6YklqdmpqQWoRTB8TB6dUAxPr8qt6zQJM9ZLTS0pP3Ftwa1YPc6/WtzsTqyKv
 Z/a/0tRecqvObOquurRDCx7M6tgQwl2bu8D9/lXJAN2mgBlMoX7/OzxFOXlYD1w+sbog6UPu
 sQUszmv9BBoElWZ17Pf5ZfqDza4773Kwbo71hL7Hq635tmnsFJK/siOoo+V4Y/vUTJuQ9VUK
 RvPZbtfeOnGsNGDrnoo60St7ow8vXBFWMuEWZ9gO4TkuIv/vGJSFCyr/yVsxN8nDyvwa5+Jq
 5hf7jm+Za7nmz5ZVJxmkJzxdETKJ47qx18cY/oCKjheTv9maiD2a4L717v0M7/+vPxirx4XM
 zvb484D57WPDhQulPqYuunPn0Ewzt5liH+KUWIozEg21mIuKEwFCqp+UtAMAAA==
X-CMS-MailID: 20220518141514eucas1p18b57f4f474c5477123746d1a3476e4a5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220504114121eucas1p1aff92a52f2c4e1905b4c9672331b7db6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220504114121eucas1p1aff92a52f2c4e1905b4c9672331b7db6
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <CGME20220504114121eucas1p1aff92a52f2c4e1905b4c9672331b7db6@eucas1p1.samsung.com>
 <20220504114021.33265-6-jagan@amarulasolutions.com>
 <e8e56e98-59aa-62b1-2b96-3a0436e91dac@samsung.com>
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

On 11.05.2022 17:02, Marek Szyprowski wrote:
> On 04.05.2022 13:40, Jagan Teki wrote:
>> Host transfer() in DSI master will invoke only when the DSI commands
>> are sent from DSI devices like DSI Panel or DSI bridges and this
>> host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
>>
>> Handling DSI host initialization in transfer calls misses the
>> controller setup for I2C configured DSI bridges.
>>
>> This patch adds the DSI initialization from transfer to bridge
>> pre_enable as the bridge pre_enable API is invoked by core as
>> it is common across all classes of DSI device drivers.
>>
>> v2:
>> * check initialized state in samsung_dsim_init
>>
>> v1:
>> * keep DSI init in host transfer
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> This doesn't work with Exynos DSI and DSI panels. Here is a bit more 
> detailed explanation and my solution for this:
>
> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/ 
>


I wonder if your modification works on i.MX8MM with a pure DSI-based 
panel/bridge. In your tree I only see that you have tested it with the 
i2c-controlled DSI-to-LVDS converter.


After the comments from the above mentioned thread I've reworked the 
initialization again. It looks that the ultimate solution for both 
worlds is to call samsung_dsim_init() twice, once in pre_enable, then 
before the first host_transfer, see 
https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework-v2

This way at least it works fine on all my Exynos based test boards.

>> ---
>>   drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 60dc863113a0..b9361af5ef2d 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1259,6 +1259,9 @@ static int samsung_dsim_init(struct 
>> samsung_dsim *dsi)
>>   {
>>       const struct samsung_dsim_driver_data *driver_data = 
>> dsi->driver_data;
>>   +    if (dsi->state & DSIM_STATE_INITIALIZED)
>> +        return 0;
>> +
>>       samsung_dsim_reset(dsi);
>>       samsung_dsim_enable_irq(dsi);
>>   @@ -1271,6 +1274,8 @@ static int samsung_dsim_init(struct 
>> samsung_dsim *dsi)
>>       samsung_dsim_set_phy_ctrl(dsi);
>>       samsung_dsim_init_link(dsi);
>>   +    dsi->state |= DSIM_STATE_INITIALIZED;
>> +
>>       return 0;
>>   }
>>   @@ -1290,6 +1295,10 @@ static void 
>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>       }
>>         dsi->state |= DSIM_STATE_ENABLED;
>> +
>> +    ret = samsung_dsim_init(dsi);
>> +    if (ret)
>> +        return;
>>   }
>>     static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>> @@ -1464,12 +1473,9 @@ static ssize_t 
>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>>       if (!(dsi->state & DSIM_STATE_ENABLED))
>>           return -EINVAL;
>>   -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>> -        ret = samsung_dsim_init(dsi);
>> -        if (ret)
>> -            return ret;
>> -        dsi->state |= DSIM_STATE_INITIALIZED;
>> -    }
>> +    ret = samsung_dsim_init(dsi);
>> +    if (ret)
>> +        return ret;
>>         ret = mipi_dsi_create_packet(&xfer.packet, msg);
>>       if (ret < 0)
>
> Best regards

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

