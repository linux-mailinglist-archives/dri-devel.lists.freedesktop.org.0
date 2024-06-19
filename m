Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7BC90EA29
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 13:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14C710EC8A;
	Wed, 19 Jun 2024 11:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="k0W+7as6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6381410EC6B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 11:56:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45JBuO7Y107694;
 Wed, 19 Jun 2024 06:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718798184;
 bh=kYaOKx8VKBp41d22VvJ3euzGXc/iy+xf/Q65ZhDlRzQ=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=k0W+7as6Ecnd5mBxgOAMAxpvnO3nYNg1eWjUoDg/qml7jrS0Ikd9DpqTcQYItCHin
 YQwsI/fNY5XgJMJVlfjVGm7ku3Bl1W9eFxOs0fTAC10Lp4BVzNTzouLVND7DkHuFTI
 BetYrUEsgzuYJQfpvruyYoLwgK2GmlDzMgMz/TRs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45JBuOgF117398
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 19 Jun 2024 06:56:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 06:56:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 06:56:24 -0500
Received: from [172.24.227.31] (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45JBuGat014422;
 Wed, 19 Jun 2024 06:56:17 -0500
Message-ID: <cfd32e8a-8dcf-43a8-9a1f-38b291fe7a75@ti.com>
Date: Wed, 19 Jun 2024 17:26:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] drm/bridge: cdns-dsi: Fix the phy_initialized
 variable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Dominik Haller <d.haller@phytec.de>, Sam
 Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri
 <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, Devarsh Thakkar
 <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra
 <j-luthra@ti.com>
References: <20240617105311.1587489-1-a-bhatia1@ti.com>
 <20240617105311.1587489-3-a-bhatia1@ti.com>
 <fyxer3rl54uq7qemgjx7htykgsnwgg5ywda2d5f4fhzd6ksjfg@blvkbzdy6op5>
 <41fd6509-33fd-4e7f-9889-e7e9acd928d8@ti.com>
 <CAA8EJpqt5FVjP+MP6kf6KaMi_OtEXQ2FgoqVfJCxRuLGfMOkFg@mail.gmail.com>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <CAA8EJpqt5FVjP+MP6kf6KaMi_OtEXQ2FgoqVfJCxRuLGfMOkFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18/06/24 01:04, Dmitry Baryshkov wrote:
> On Mon, 17 Jun 2024 at 17:16, Aradhya Bhatia <a-bhatia1@ti.com> wrote:
>>
>> Hi Dmitry,
>>
>> Thanks for reviewing the patches!
>>
>> On 17/06/24 17:29, Dmitry Baryshkov wrote:
>>> On Mon, Jun 17, 2024 at 04:23:03PM GMT, Aradhya Bhatia wrote:
>>>> Update the Phy initialized state to "not initialized" when the driver
>>>> (and the hardware by extension) gets suspended. This will allow the Phy
>>>> to get initialized again after resume.
>>>>
>>>> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>> index b016f2ba06bb..42565e253b2d 100644
>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>> @@ -1153,6 +1153,7 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
>>>>      clk_disable_unprepare(dsi->dsi_p_clk);
>>>>      reset_control_assert(dsi->dsi_p_rst);
>>>>      dsi->link_initialized = false;
>>>
>>> Most likely you should also call phy_exit() here. And in _remove() too.
>>
>> I agree that phy_exit should be called here. But why in _remove()?
>> Wouldn't having phy_exit in 2 places mess up the internal ref count?
> 
> If suspend() is going to be called in the teardown path, then it's
> fine to have just one call here. Otherwise you might add one guarded
> with if (phy_initialized) to _remove() too.

Since the _suspend() and _resume() hooks are registered for both, system
sleep PM and runtime PM, the _suspend() hook does get called when I
remove the cdns_dsi module using modprobe. Tested that on my setup.

I believe having phy_exit() only in  _suspend() would suffice for now.

> 
>>
>>>
>>>> +    dsi->phy_initialized = false;
>>>>      return 0;
>>>>  }
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>> --
>> Regards
>> Aradhya
> 
> 
> 

--
Regards
Aradhya
