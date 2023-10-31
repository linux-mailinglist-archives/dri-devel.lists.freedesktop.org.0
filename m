Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689217DCD85
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FC210E4AB;
	Tue, 31 Oct 2023 13:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE1510E4AB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:06:29 +0000 (UTC)
Received: from [192.168.88.20] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36E772E4;
 Tue, 31 Oct 2023 14:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698757571;
 bh=q+8H3mFinDmNoHJJOoT2NoeqoDMN1b5RjruSx3m9kQU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bEpLntGXyiT5QHaeAOwT3+PJh06alhz6HzL8suk1B5uBzIBbRKKU1zZxFBihvPjkQ
 ZFyWuupyWAQV0besxTVD387oxQ7qEO+SuIB3OD36dyBxMMA5ueuRsFODebOHGJOkdr
 S0ghxsDg5gE4s+hZuC56oPDWro4t8mbacu3t4KwM=
Message-ID: <47cbdb30-cbf2-4148-ad14-6dc8a1d06ba3@ideasonboard.com>
Date: Tue, 31 Oct 2023 15:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: tc358767: Support input format negotiation
 hook
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Francesco Dolcini <francesco@dolcini.it>, Sam Ravnborg <sam@ravnborg.org>
References: <20231030192846.27934-1-a-bhatia1@ti.com>
 <fc113f51-35e9-49ff-8299-e7fc11b81c31@siemens.com>
 <9e801f88-a15e-48f1-b103-0305c5807143@ideasonboard.com>
 <3d8af1e1-e969-4489-90dd-59de1050f39e@siemens.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <3d8af1e1-e969-4489-90dd-59de1050f39e@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 "Bajjuri, Praneeth" <praneeth@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/10/2023 14:18, Jan Kiszka wrote:
> On 31.10.23 11:53, Tomi Valkeinen wrote:
>> Hi Jan,
>>
>> On 31/10/2023 08:24, Jan Kiszka wrote:
>>> On 30.10.23 20:28, Aradhya Bhatia wrote:
>>>> With new connector model, tc358767 will not create the connector, when
>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and display-controller driver will
>>>> rely on format negotiation to setup the encoder format.
>>>>
>>>> Add the missing input-format negotiation hook in the
>>>> drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.
>>>>
>>>> Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
>>>> the case with older model.
>>>>
>>>> Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>
>>>> Notes:
>>>>
>>>>     * Since I do not have hardware with me, this was just build
>>>> tested. I would
>>>>       appreciate it if someone could test and review it, especically
>>>> somebody, who
>>>>       uses the bridge for DPI/DSI to eDP format conversion.
>>>>
>>>>     * The Toshiba TC358767 bridge is not enabled in arm64 defconfig by
>>>> default,
>>>>       when it should be. Hence, I sent a quick patch[0] earlier.
>>>>
>>>> [0]:
>>>> https://lore.kernel.org/all/20231030152834.18450-1-a-bhatia1@ti.com/
>>>>
>>>>    drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
>>>>    1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/tc358767.c
>>>> b/drivers/gpu/drm/bridge/tc358767.c
>>>> index ef2e373606ba..0affcefdeb1c 100644
>>>> --- a/drivers/gpu/drm/bridge/tc358767.c
>>>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>>>> @@ -1751,6 +1751,30 @@ tc_dpi_atomic_get_input_bus_fmts(struct
>>>> drm_bridge *bridge,
>>>>        return input_fmts;
>>>>    }
>>>>    +static u32 *
>>>> +tc_edp_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>> +                 struct drm_bridge_state *bridge_state,
>>>> +                 struct drm_crtc_state *crtc_state,
>>>> +                 struct drm_connector_state *conn_state,
>>>> +                 u32 output_fmt,
>>>> +                 unsigned int *num_input_fmts)
>>>> +{
>>>> +    u32 *input_fmts;
>>>> +
>>>> +    *num_input_fmts = 0;
>>>> +
>>>> +    input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
>>>> +                 GFP_KERNEL);
>>>> +    if (!input_fmts)
>>>> +        return NULL;
>>>> +
>>>> +    /* This is the DSI/DPI-end bus format */
>>>> +    input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>>>> +    *num_input_fmts = 1;
>>>> +
>>>> +    return input_fmts;
>>>> +}
>>>> +
>>>>    static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
>>>>        .attach = tc_dpi_bridge_attach,
>>>>        .mode_valid = tc_dpi_mode_valid,
>>>> @@ -1777,6 +1801,7 @@ static const struct drm_bridge_funcs
>>>> tc_edp_bridge_funcs = {
>>>>        .atomic_duplicate_state =
>>>> drm_atomic_helper_bridge_duplicate_state,
>>>>        .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>>>        .atomic_reset = drm_atomic_helper_bridge_reset,
>>>> +    .atomic_get_input_bus_fmts = tc_edp_atomic_get_input_bus_fmts,
>>>>    };
>>>>      static bool tc_readable_reg(struct device *dev, unsigned int reg)
>>>>
>>>> base-commit: c503e3eec382ac708ee7adf874add37b77c5d312
>>>
>>> Doesn't help, callback is never invoked. There must be more missing.
>>>
>>> Regarding test setup: Maybe your colleague Preneeth can help to give you
>>> access, he just received some devices from us. Otherwise, drop me
>>> instrumentation patches.
>>
>> Can you try with this change:
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358767.c
>> b/drivers/gpu/drm/bridge/tc358767.c
>> index 0affcefdeb1c..137a9f5e3cad 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -1579,6 +1579,13 @@ static struct edid *tc_get_edid(struct drm_bridge
>> *bridge,
>>                                  struct drm_connector *connector)
>>   {
>>          struct tc_data *tc = bridge_to_tc(bridge);
>> +       int ret;
>> +
>> +       ret = tc_get_display_props(tc);
>> +       if (ret < 0) {
>> +               dev_err(tc->dev, "failed to read display props: %d\n",
>> ret);
>> +               return 0;
>> +       }
>>   
>>          return drm_get_edid(connector, &tc->aux.ddc);
>>   }
>>
>>   Tomi
>>
> 
> Yep, that does the trick.

Alright, good. I'll send a proper patch.

> Thanks,
> Jan
> 
> PS: Your mail client is mangling tabs - was already suspecting our
> server would reformat again.

Nah, the above was just a quick copy paste from my terminal window, and 
when copying from the terminal it's always just spaces.

  Tomi

