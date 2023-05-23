Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C2070D377
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 07:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E53F10E0B5;
	Tue, 23 May 2023 05:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B8910E0B5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:58:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34N5vQws007257;
 Tue, 23 May 2023 00:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1684821446;
 bh=fLhXm7MAl34Q5I5NLYYhvJbO/6H/V++mvuilVVfegw0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=pROeYgfcgxo3Bu9JRW2d6n+sF3OiEyAxL+5H4Qy8iilHxdcbnEx+d9hz8E8aOvcbc
 5ewFdv5TRX1cc9bqt+BaBYuoL+kZ7+qu5YEgUhqjdfXBCI0B2/5QqaJmepUpCkOonf
 HL1eHqnEs2yb0Z0cu1SIx9+beBXb6vQM3tvJaPRQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34N5vQOX027712
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 May 2023 00:57:26 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 May 2023 00:57:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 May 2023 00:57:26 -0500
Received: from [172.24.216.116] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34N5vJpd018318;
 Tue, 23 May 2023 00:57:20 -0500
Message-ID: <1eb4b838-4f9c-6e95-925a-69487060ec55@ti.com>
Date: Tue, 23 May 2023 11:27:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 4/8] drm/bridge: mhdp8546: Set input_bus_flags from
 atomic_check
To: <neil.armstrong@linaro.org>, Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha
 <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Francesco Dolcini
 <francesco@dolcini.it>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
 <20230509093036.3303-5-a-bhatia1@ti.com>
 <b43f0808-8ac8-746f-6cbc-5396722261aa@linaro.org>
 <1b95b75d-1b81-806b-7b7f-34cd93c9d0ec@ti.com>
 <cc84cc53-53b6-1ab2-7053-36b3d3d3c423@linaro.org>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <cc84cc53-53b6-1ab2-7053-36b3d3d3c423@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On 22-May-23 13:35, neil.armstrong@linaro.org wrote:
> On 17/05/2023 07:48, Aradhya Bhatia wrote:
>> Hi Neil,
>>
>> On 16-May-23 12:54, Neil Armstrong wrote:
>>> On 09/05/2023 11:30, Aradhya Bhatia wrote:
>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>
>>>> input_bus_flags are specified in drm_bridge_timings (legacy) as well
>>>> as drm_bridge_state->input_bus_cfg.flags
>>>>
>>>> The flags from the timings will be deprecated. Bridges are supposed
>>>> to validate and set the bridge state flags from atomic_check.
>>>>
>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>> [a-bhatia1: replace timings in cdns_mhdp_platform_info by
>>>> input_bus_flags]
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>
>>>> Notes:
>>>>
>>>>       changes from v5:
>>>>       * removed the wrongly addded return statement in tfp410 driver.
>>>>       * replaced the timings field in cdns_mhdp_platform_info by
>>>>         input_bus_flags field, in order to get rid of bridge->timings
>>>>         altogether.
>>>>
>>>>    drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c  | 11
>>>> ++++++++---
>>>>    drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h  |  2 +-
>>>>    drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c |  9 ++++-----
>>>>    drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h |  2 +-
>>>>    4 files changed, 14 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> index 623e4235c94f..a677b1267525 100644
>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> @@ -2189,6 +2189,13 @@ static int cdns_mhdp_atomic_check(struct
>>>> drm_bridge *bridge,
>>>>            return -EINVAL;
>>>>        }
>>>>    +    /*
>>>> +     * There might be flags negotiation supported in future.
>>>> +     * Set the bus flags in atomic_check statically for now.
>>>> +     */
>>>> +    if (mhdp->info)
>>>> +        bridge_state->input_bus_cfg.flags =
>>>> *mhdp->info->input_bus_flags;
>>>> +
>>>>        mutex_unlock(&mhdp->link_mutex);
>>>>        return 0;
>>>>    }
>>>> @@ -2554,8 +2561,6 @@ static int cdns_mhdp_probe(struct
>>>> platform_device *pdev)
>>>>        mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
>>>>                   DRM_BRIDGE_OP_HPD;
>>>>        mhdp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>>>> -    if (mhdp->info)
>>>> -        mhdp->bridge.timings = mhdp->info->timings;
>>>
>>> Won't this cause a breakage because at this point in time
>>> bridge.timings->input_bus_flags
>>> seems to be still used by tidss right ?
>>>
>>
>> tidss was using the bridge.timings->input_bus_flags before the 7th
>> patch[1] in this series.
>>
>> After the patch, it only relies on bridge_state and display_info for bus
>> flags and formats.
> 
> OK thanks, then:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> if you resend a new version, please add this info in the commit message.

Thank you! Will do so.

Regards
Aradhya

> 
> Neil
> 
>>
>>
>> Regards
>> Aradhya
>>
>> [1]: https://lore.kernel.org/all/20230509093036.3303-8-a-bhatia1@ti.com/
>>
>>
>>>
>>>>          ret = phy_init(mhdp->phy);
>>>>        if (ret) {
>>>> @@ -2642,7 +2647,7 @@ static const struct of_device_id mhdp_ids[] = {
>>>>    #ifdef CONFIG_DRM_CDNS_MHDP8546_J721E
>>>>        { .compatible = "ti,j721e-mhdp8546",
>>>>          .data = &(const struct cdns_mhdp_platform_info) {
>>>> -          .timings = &mhdp_ti_j721e_bridge_timings,
>>>> +          .input_bus_flags = &mhdp_ti_j721e_bridge_input_bus_flags,
>>>>              .ops = &mhdp_ti_j721e_ops,
>>>>          },
>>>>        },
>>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>>>> index bedddd510d17..bad2fc0c7306 100644
>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
>>>> @@ -336,7 +336,7 @@ struct cdns_mhdp_bridge_state {
>>>>    };
>>>>      struct cdns_mhdp_platform_info {
>>>> -    const struct drm_bridge_timings *timings;
>>>> +    const u32 *input_bus_flags;
>>>>        const struct mhdp_platform_ops *ops;
>>>>    };
>>>>    diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
>>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
>>>> index dfe1b59514f7..12d04be4e242 100644
>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
>>>> @@ -71,8 +71,7 @@ const struct mhdp_platform_ops mhdp_ti_j721e_ops = {
>>>>        .disable = cdns_mhdp_j721e_disable,
>>>>    };
>>>>    -const struct drm_bridge_timings mhdp_ti_j721e_bridge_timings = {
>>>> -    .input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
>>>> -               DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
>>>> -               DRM_BUS_FLAG_DE_HIGH,
>>>> -};
>>>> +const u32
>>>> +mhdp_ti_j721e_bridge_input_bus_flags =
>>>> DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
>>>> +                       DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
>>>> +                       DRM_BUS_FLAG_DE_HIGH;
>>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
>>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
>>>> index 97d20d115a24..5ddca07a4255 100644
>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
>>>> @@ -14,6 +14,6 @@
>>>>    struct mhdp_platform_ops;
>>>>      extern const struct mhdp_platform_ops mhdp_ti_j721e_ops;
>>>> -extern const struct drm_bridge_timings mhdp_ti_j721e_bridge_timings;
>>>> +extern const u32 mhdp_ti_j721e_bridge_input_bus_flags;
>>>>      #endif /* !CDNS_MHDP8546_J721E_H */
>>>
> 
