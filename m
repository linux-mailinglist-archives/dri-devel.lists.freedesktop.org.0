Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30300ACACF3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5919210E1D8;
	Mon,  2 Jun 2025 11:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="R3a1o+Od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CAB10E1D8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 11:05:57 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 552B5fc93183884;
 Mon, 2 Jun 2025 06:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1748862341;
 bh=5pCecJy0ufmK5ZMNaGwZtfPTzX1m8T3Av071M/fu1kk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=R3a1o+Od2odDHP9/0CN/PppO2hIq5m2DjDRtKVXiTEg9+7q0Uw4sEG5M9a4oi9zLG
 Pi/7aPzHpBTMVVP+pd6jvl2AH5Y9IKAY4sH0emPhFRt/FjYtdE/Qh0+wMQnhYv057C
 yIB4Qc5Ch9LUG/JQkHm+L+rWetG9ndTAas/cG0ek=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 552B5eSJ2763027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 2 Jun 2025 06:05:40 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Jun 2025 06:05:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Jun 2025 06:05:38 -0500
Received: from [172.24.227.14] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.14])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 552B5Vu72844262;
 Mon, 2 Jun 2025 06:05:31 -0500
Message-ID: <84fdbd23-d694-453f-a225-dbac19b34719@ti.com>
Date: Mon, 2 Jun 2025 16:35:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Geert Uytterhoeven <geert@linux-m68k.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>
CC: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <max.krummenacher@toradex.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <kieran.bingham+renesas@ideasonboard.com>,
 <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>,
 <devarsht@ti.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 <ernestvanhoecke@gmail.com>
References: <20250529110418.481756-1-j-choudhary@ti.com>
 <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
 <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hello Geert, Krzysztof,

(continuing discussion from both patches on this thread...)

On 30/05/25 13:25, Geert Uytterhoeven wrote:
> Hi Jayesh,
> 
> CC devicetree
> 
> On Fri, 30 May 2025 at 04:54, Jayesh Choudhary <j-choudhary@ti.com> wrote:
>> On 29/05/25 16:34, Jayesh Choudhary wrote:
>>> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
>>> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
>>> call which was moved to other function calls subsequently.
>>> Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
>>> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
>>> state always return 1 (always connected state).
>>>
>>> Set HPD_DISABLE bit conditionally based on "no-hpd" property.
>>> Since the HPD_STATE is reflected correctly only after waiting for debounce
>>> time (~100-400ms) and adding this delay in detect() is not feasible
>>> owing to the performace impact (glitches and frame drop), remove runtime
>>> calls in detect() and add hpd_enable()/disable() bridge hooks with runtime
>>> calls, to detect hpd properly without any delay.
>>>
>>> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
>>>
>>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
>>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>> ---
>>>
>>> Changelog v2->v3:
>>> - Change conditional based on no-hpd property to address [1]
>>> - Remove runtime calls in detect() with appropriate comments
>>> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
>>> - Not picking up "Tested-by" tag as there are new changes
>>>
>>> v2 patch link:
>>> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>
>>>
>>> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/>
> 
> Thanks for your patch!
> 
>>> This would also require dts changes in all the nodes of sn65dsi86
>>> to ensure that they have no-hpd property.
>>
>> DTS patch is posted now:
>> <https://lore.kernel.org/all/20250529112423.484232-1-j-choudhary@ti.com/>
> 
> On all Renesas platforms handled by that patch, the DP bridge's HPD pin
> is wired to the HPD pin on the mini-DP connector.  What am I missing?

If the bridge's HPD is connected to that of the connector, then I am
pretty certain HPD will not work for renesas platform. The detect hook
always gives "connected" state in the driver (even if it is unplugged).
Do you have different observation on your end?
If not, then we do need something like this patch while addressing the
backwards-compatibility concerns.

During v1 RFC[2], I did observe that renesas also have DisplayPort 
connector type and might require hpd, but since the support was
already there and no issue was raised, I assumed it does not require
HPD.

[2]: 
https://lore.kernel.org/all/01b43a16-cffa-457f-a2e1-87dd27869d18@ti.com/


> 
> Regardless, breaking backwards-compatibility with existing DTBs is
> definitely a no-go.


Got it.
Let me try to figure out a way to fix it without messing it up.

Warm Regards,
Jayesh


> 
>>>    drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++++++++++++++++++----
>>>    1 file changed, 35 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> index 60224f476e1d..e9ffc58acf58 100644
>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> @@ -190,6 +190,7 @@ struct ti_sn65dsi86 {
>>>        u8                              ln_assign;
>>>        u8                              ln_polrs;
>>>        bool                            comms_enabled;
>>> +     bool                            no_hpd;
>>>        struct mutex                    comms_mutex;
>>>
>>>    #if defined(CONFIG_OF_GPIO)
>>> @@ -352,8 +353,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
>>>         * change this to be conditional on someone specifying that HPD should
>>>         * be used.
>>>         */
>>> -     regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>>> -                        HPD_DISABLE);
>>> +
>>> +     if (pdata->no_hpd)
>>> +             regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>>> +                                HPD_DISABLE);
>>>
>>>        pdata->comms_enabled = true;
>>>
>>> @@ -1195,9 +1198,17 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
>>>        struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>>        int val = 0;
>>>
>>> -     pm_runtime_get_sync(pdata->dev);
>>> +     /*
>>> +      * The chip won't report HPD right after being powered on as
>>> +      * HPD_DEBOUNCED_STATE reflects correct state only after the
>>> +      * debounce time (~100-400 ms).
>>> +      * So having pm_runtime_get_sync() and immediately reading
>>> +      * the register in detect() won't work, and adding delay()
>>> +      * in detect will have performace impact in display.
>>> +      * So remove runtime calls here.
>>> +      */
>>> +
>>>        regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
>>> -     pm_runtime_put_autosuspend(pdata->dev);
>>>
>>>        return val & HPD_DEBOUNCED_STATE ? connector_status_connected
>>>                                         : connector_status_disconnected;
>>> @@ -1220,6 +1231,20 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
>>>        debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
>>>    }
>>>
>>> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
>>> +{
>>> +     struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>> +
>>> +     pm_runtime_get_sync(pdata->dev);
>>> +}
>>> +
>>> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
>>> +{
>>> +     struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>> +
>>> +     pm_runtime_put_sync(pdata->dev);
>>> +}
>>> +
>>>    static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>>>        .attach = ti_sn_bridge_attach,
>>>        .detach = ti_sn_bridge_detach,
>>> @@ -1234,6 +1259,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>>>        .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>>        .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>>        .debugfs_init = ti_sn65dsi86_debugfs_init,
>>> +     .hpd_enable = ti_sn_bridge_hpd_enable,
>>> +     .hpd_disable = ti_sn_bridge_hpd_disable,
>>>    };
>>>
>>>    static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
>>> @@ -1322,7 +1349,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>>>                           ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
>>>
>>>        if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
>>> -             pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>>> +             pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
>>> +                                 DRM_BRIDGE_OP_HPD;
>>>
>>>        drm_bridge_add(&pdata->bridge);
>>>
>>> @@ -1935,6 +1963,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
>>>                return dev_err_probe(dev, PTR_ERR(pdata->refclk),
>>>                                     "failed to get reference clock\n");
>>>
>>> +     pdata->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
>>> +
>>>        pm_runtime_enable(dev);
>>>        pm_runtime_set_autosuspend_delay(pdata->dev, 500);
>>>        pm_runtime_use_autosuspend(pdata->dev);
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
