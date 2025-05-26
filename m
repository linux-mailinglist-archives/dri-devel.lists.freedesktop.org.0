Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D7AC3AD7
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 09:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E0110E285;
	Mon, 26 May 2025 07:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Y4ykRYuv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F67A10E285
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 07:44:06 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54Q7hhVl1446791;
 Mon, 26 May 2025 02:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1748245423;
 bh=pfNxNBtxFbE6b5isOFlmebHM/gu4Na0OpYCEd6fKOLo=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Y4ykRYuvtep7ANL8NgvCo/Gd1Y3XuSfhlsTLDmys8WVn/3/WPFKJc56n2AO2XiXqQ
 EfKp72trsCjM7LJrsoa/CEwth68Hi3Phw16tkKb0t5pBetaz6a2knfpNWSKmjTKfoD
 ikT5yK4uUGdP0tgRywalustnZFIfLFb7D4vZv9Hs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54Q7hgSn1960879
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 26 May 2025 02:43:42 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 May 2025 02:43:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 May 2025 02:43:42 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54Q7hZCE2635573;
 Mon, 26 May 2025 02:43:36 -0500
Message-ID: <97764129-e78a-47d2-8f2c-e219b3686f53@ti.com>
Date: Mon, 26 May 2025 13:13:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Doug Anderson
 <dianders@chromium.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <max.krummenacher@toradex.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <kieran.bingham+renesas@ideasonboard.com>,
 <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>, <devarsht@ti.com>
References: <20250508115433.449102-1-j-choudhary@ti.com>
 <CAD=FV=V1mNX-WidTAaENH66-2ExN=F_ovuX818uQGfc+Gsym1Q@mail.gmail.com>
 <cr7int6r6lnpgdyvhhqccccuyrh7ltw5qzh7kj5upznhea4pfh@rn6rwlf7ynqt>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <cr7int6r6lnpgdyvhhqccccuyrh7ltw5qzh7kj5upznhea4pfh@rn6rwlf7ynqt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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

Hello Dmitry, Doug,

Thanks a lot for the review.

On 22/05/25 18:44, Dmitry Baryshkov wrote:
> On Wed, May 21, 2025 at 06:10:59PM -0700, Doug Anderson wrote:
>> Hi,
>>
>> On Thu, May 8, 2025 at 4:54 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>>
>>> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
>>> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
>>> call which was moved to other function calls subsequently.
>>> Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
>>> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
>>> state always return 1 (always connected state)
>>>
>>> Also, with the suspend and resume calls before every register access, the
>>> bridge starts with disconnected state and the HPD state is reflected
>>> correctly only after debounce time (400ms). However, adding this delay
>>> in the detect function causes frame drop and visible glitch in display.
>>>
>>> So to get the detect utility working properly for DP mode without any
>>> performance issues in display, instead of reading HPD state from the
>>> register, rely on aux communication. Use 'drm_dp_dpcd_read_link_status'
>>> to find if we have something connected at the sink.
>>>
>>> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
>>>
>>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
>>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>> ---
>>>
>>> v1 patch link which was sent as RFC:
>>> <https://patchwork.kernel.org/project/dri-devel/patch/20250424105432.255309-1-j-choudhary@ti.com/>
>>>
>>> Changelog v1->v2:
>>> - Drop additional property in bindings and use conditional.
>>> - Instead of register read for HPD state, use dpcd read which returns 0
>>>    for success and error codes for no connection
>>> - Add relevant history for the required change in commit message
>>> - Drop RFC subject-prefix in v2 as v2 is in better state after discussion
>>>    in v1 and Max's mail thread
>>> - Add "Cc:" tag
>>>
>>> This approach does not make suspend/resume no-op and no additional
>>> delay needs to be added in the detect hook which causes frame drops.
>>>
>>> Here, I am adding conditional to HPD_DISABLE bit even when we are
>>> not using the register read to get HPD state. This is to prevent
>>> unnecessary register updates in every resume call.
>>> (It was adding to latency and leading to ~2-3 frame drop every 10 sec)
>>>
>>> Tested and verified on TI's J784S4-EVM platform:
>>> - Display comes up
>>> - Detect utility works with a couple of seconds latency.
>>>    But I guess without interrupt support, this is acceptable.
>>> - No frame-drop observed
>>>
>>> Discussion thread for Max's patch:
>>> <https://patchwork.kernel.org/project/dri-devel/patch/20250501074805.3069311-1-max.oss.09@gmail.com/>
>>>
>>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 ++++++++++-------
>>>   1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> Sorry for the delay in responding. Things got a little crazy over the
>> last few weeks.
>>
>>
>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> index 60224f476e1d..9489e78b6da3 100644
>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> @@ -352,8 +352,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
>>>           * change this to be conditional on someone specifying that HPD should
>>>           * be used.
>>>           */
>>> -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>>> -                          HPD_DISABLE);
>>> +
>>> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
>>> +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>>> +                                  HPD_DISABLE);
>>
>> Given your an Max's testing, I'm totally on-board with the above.
>>
>>>
>>>          pdata->comms_enabled = true;
>>>
>>> @@ -1194,13 +1196,14 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
>>>   {
>>>          struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>>          int val = 0;
>>> +       u8 link_status[DP_LINK_STATUS_SIZE];
>>>
>>> -       pm_runtime_get_sync(pdata->dev);
>>> -       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
>>> -       pm_runtime_put_autosuspend(pdata->dev);
>>> +       val = drm_dp_dpcd_read_link_status(&pdata->aux, link_status);
>>>
>>> -       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
>>> -                                        : connector_status_disconnected;
>>> +       if (val < 0)
>>> +               return connector_status_disconnected;
>>> +       else
>>> +               return connector_status_connected;
>>
>> I'd really rather not do this. It took me a little while to realize
>> why this was working and also not being slow like your 400ms delay
>> was. I believe that each time you do the AUX transfer it grabs a
>> pm_runtime reference and then puts it with "autosuspend". Then you're
>> relying on the fact that detect is called often enough so that the
>> autosuspend doesn't actually hit so the next time your function runs
>> then it's fast. Is that accurate?
>>
>> I'd rather see something like this in the bridge's probe (untested)
>>
>>    if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
>>      pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>>
>>      /*
>>       * In order for DRM_BRIDGE_OP_DETECT to work in a reasonable
>>       * way we need to keep the bridge powered on all the time.
>>       * The bridge takes hundreds of milliseconds to debounce HPD
>>       * and we simply can't wait that amount of time in every call
>>       * to detect.
>>       */
>>      pm_runtime_get_sync(pdata->dev);
>>    }
>>
>> ...obviously you'd also need to find the right times to undo this in
>> error handling and in remove.
> 
> What about:
> - keeping pm_runtime_get()/put_autosuspend() in detect, but..
> - also adding .hpd_enable() / .hpd_disable() callbacks which would also
>    get and put the runtime PM, making sure that there is no additional
>    delay in .detect()?
> 

Keeping a reference alive via hpd_enable() fixes the issue.
Things works with the previous detect logic and I do not need to
rely on reading link status.


In hpd_enable()/disable(), I do not need to add anything else:

+static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+       pm_runtime_get_sync(pdata->dev);
+}
+
+static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+       pm_runtime_put_sync(pdata->dev);
+}
+

Posting v3 with these changes.

Warm Regards,
Jayesh

>>
>> Nicely, this would be the same type of solution needed for if we ever
>> enabled interrupts.
> 
