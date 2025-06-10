Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2663AD2F10
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1974310E49D;
	Tue, 10 Jun 2025 07:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="QxqUQ39l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF3710E496
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:43:54 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55A7hWmC2222638;
 Tue, 10 Jun 2025 02:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1749541412;
 bh=EpKnCinqiW5Ium/sM9lgT6Fdt1dZKQWiUdDaDX0h6y8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=QxqUQ39lb7skYNIj1xxCq0qaIUbsSxdGRyv3UVYSNXoHunjfjzDTRGKpJfvyAGSS3
 aZn/r5KPQSRxa2dhsGpexQISPhaSii3T4YQY0DU2dTpZcMtn30z7IEAO2DG/0+3iYM
 k86ZSLCS6iaiiCL+sgfu72hMDBa+I8xLHHalW+wU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55A7hVaY1959234
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 10 Jun 2025 02:43:31 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 02:43:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 02:43:31 -0500
Received: from [172.24.227.14] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.14])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55A7hN5o2564104;
 Tue, 10 Jun 2025 02:43:24 -0500
Message-ID: <71c41c44-1c2e-4fee-a1a8-31472c9f838d@ti.com>
Date: Tue, 10 Jun 2025 13:13:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Doug Anderson <dianders@chromium.org>, <ernestvanhoecke@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <max.krummenacher@toradex.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <kieran.bingham+renesas@ideasonboard.com>,
 <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>,
 <devarsht@ti.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20250529110418.481756-1-j-choudhary@ti.com>
 <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
 <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
 <84fdbd23-d694-453f-a225-dbac19b34719@ti.com>
 <CAD=FV=XaR6Pq7E-13zR5PC_u=3SD=sc05_TzxWJR2FS040zESg@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAD=FV=XaR6Pq7E-13zR5PC_u=3SD=sc05_TzxWJR2FS040zESg@mail.gmail.com>
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

Hello Doug,

On 10/06/25 03:39, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 2, 2025 at 4:05 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>
>> Hello Geert, Krzysztof,
>>
>> (continuing discussion from both patches on this thread...)
>>
>> On 30/05/25 13:25, Geert Uytterhoeven wrote:
>>> Hi Jayesh,
>>>
>>> CC devicetree
>>>
>>> On Fri, 30 May 2025 at 04:54, Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>>> On 29/05/25 16:34, Jayesh Choudhary wrote:
>>>>> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
>>>>> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
>>>>> call which was moved to other function calls subsequently.
>>>>> Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
>>>>> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
>>>>> state always return 1 (always connected state).
>>>>>
>>>>> Set HPD_DISABLE bit conditionally based on "no-hpd" property.
>>>>> Since the HPD_STATE is reflected correctly only after waiting for debounce
>>>>> time (~100-400ms) and adding this delay in detect() is not feasible
>>>>> owing to the performace impact (glitches and frame drop), remove runtime
>>>>> calls in detect() and add hpd_enable()/disable() bridge hooks with runtime
>>>>> calls, to detect hpd properly without any delay.
>>>>>
>>>>> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
>>>>>
>>>>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
>>>>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
>>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>>>>> ---
>>>>>
>>>>> Changelog v2->v3:
>>>>> - Change conditional based on no-hpd property to address [1]
>>>>> - Remove runtime calls in detect() with appropriate comments
>>>>> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
>>>>> - Not picking up "Tested-by" tag as there are new changes
>>>>>
>>>>> v2 patch link:
>>>>> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>
>>>>>
>>>>> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/>
>>>
>>> Thanks for your patch!
>>>
>>>>> This would also require dts changes in all the nodes of sn65dsi86
>>>>> to ensure that they have no-hpd property.
>>>>
>>>> DTS patch is posted now:
>>>> <https://lore.kernel.org/all/20250529112423.484232-1-j-choudhary@ti.com/>
>>>
>>> On all Renesas platforms handled by that patch, the DP bridge's HPD pin
>>> is wired to the HPD pin on the mini-DP connector.  What am I missing?
>>
>> If the bridge's HPD is connected to that of the connector, then I am
>> pretty certain HPD will not work for renesas platform. The detect hook
>> always gives "connected" state in the driver (even if it is unplugged).
>> Do you have different observation on your end?
>> If not, then we do need something like this patch while addressing the
>> backwards-compatibility concerns.
>>
>> During v1 RFC[2], I did observe that renesas also have DisplayPort
>> connector type and might require hpd, but since the support was
>> already there and no issue was raised, I assumed it does not require
>> HPD.
>>
>> [2]:
>> https://lore.kernel.org/all/01b43a16-cffa-457f-a2e1-87dd27869d18@ti.com/
>>
>>
>>>
>>> Regardless, breaking backwards-compatibility with existing DTBs is
>>> definitely a no-go.
> 
> FWIW, we are in a little bit of a sticky situation here. We were in a
> bit of a bad place from the start because the Linux driver ignored HPD
> from the beginning but we didn't actually document that people should
> be setting the "no-hpd" property until a little bit later. You can see
> some discussion about this in commit 1dbc979172af ("dt-bindings:
> drm/bridge: ti-sn65dsi86: Document no-hpd") where I noted "this is
> somewhat of a backward-incompatible change." ...but, at the time, it
> wasn't really a big deal because there were very few users (the one in
> tree at the time was cheza, which was a dev board used internally at
> Google).
> 
> ...so, as of that change in May of 2020, it was documented that eDP
> users were _supposed_ to be setting NO_HPD. I even remember Bjorn
> requesting the "or is otherwise unusable" phrasing because we pretty
> much wanted to set this property on everyone using sn65dsi86 as eDP
> (even if they have HPD hooked up) because the debouncing time is so
> long that it was better to hardcode the max delay instead of reading
> the HPD line. Of course, even though we documented that they were
> supposed to have the "no-hpd" property didn't necessarily mean that
> everyone did. The code has never enforced it. I don't believe it even
> checks the property...
> 
> So if there are dts files out there that don't set the property and
> they were submitted after the bindings change in 2020, _technically_
> they've been wrong the whole time. We're not changing history by
> adding a new requirement so much as fixing broken DTS files. Although
> the Linux driver always allowed them to get away with being broken,
> technically DTS is separate from Linux so if they've been violating
> the bindings then they've been wrong. :-P That being said, they've
> been working and it would be nice to keep them working if we can, but
> one could make an argument that maybe it would be OK to require them
> to change...
> 
> 
>> Got it.
>> Let me try to figure out a way to fix it without messing it up.
> 
> While a bit on the ugly side, it seems like perhaps you could just do this:
> 
> 1. If enable_comms is called before the bridge probe happens, just go
> ahead and disable HPD.
> 
> 2. When the bridge probe happens, if you notice that HPD should be
> enabled and comms are on you can just enable HPD then (grabbing the
> comms_mutex while doing it).
> 
> 3. Any subsequent enable_comms called after the bridge probe happens
> shouldn't disable HPD.
> 
> ...you'd probably want a comment about the fact that "no-hpd" property
> is unreliable, which is why we can't figure this out in a better way.
> 
> 


Ernest mentioned in v2[3] that when pdata->bridge.type is not
set, the type field is 0 causing issue for eDP when enable_comms
is called before auxiliary_driver probe.

So it should be okay to check the bridge type for
DRM_MODE_CONNECTOR_Unknown (0) OR DRM_MODE_CONNECTOR_eDP (14) and
disable HPD in both case?
Or equivalently using !(DRM_MODE_CONNECTOR_DisplayPort) as this bridge
would support only these 2 connector types???

Then for DP case, it should behave like you mentioned: First disabling
HPD till types is set in auxiliary_driver probe. And once set to 10,
(for DRM_MODE_CONNECTOR_DisplayPort) enabling it for DisplayPort
connector type.


[3]: 
https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/

Warm Regards,
Jayesh

> -Doug

