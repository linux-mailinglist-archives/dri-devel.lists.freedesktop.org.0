Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA691826F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 15:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA1110E8A5;
	Wed, 26 Jun 2024 13:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="AKFlY8A8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F4210E8AF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 13:31:25 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45QDUmh6003322;
 Wed, 26 Jun 2024 08:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1719408648;
 bh=OnjaqgD5fCB3Kqii6KOFHTmJbJLH6HLUW/2JLcRptY0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=AKFlY8A8c7XPSrDIRWR594GDzZje8alOoOjgch3evoabm0GiKn7nxqrbzl58Nb0TG
 fgUXxiMc1os3e7k9/1Dofn11SIFcKCbYyGhmPlOR3PDc6ytfGEB7jhB3HoSpyeLpyD
 5jGKH7wGTWx5yrqgJitIr3vOpaNN3waC7KO5aRBY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45QDUmWN117989
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Jun 2024 08:30:48 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Jun 2024 08:30:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Jun 2024 08:30:47 -0500
Received: from [172.24.227.31] (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45QDUeX0009465;
 Wed, 26 Jun 2024 08:30:40 -0500
Message-ID: <e62750de-488c-4c5a-b1aa-e431605515c6@ti.com>
Date: Wed, 26 Jun 2024 19:00:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] drm/bridge: cdns-dsi: Fix Phy _init() and _exit()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Dominik Haller <d.haller@phytec.de>, Sam
 Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri
 <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, Devarsh Thakkar
 <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra
 <j-luthra@ti.com>
References: <20240622110929.3115714-1-a-bhatia1@ti.com>
 <20240622110929.3115714-4-a-bhatia1@ti.com>
 <8fcbc541-d7a3-4d0d-ab0f-74d7f1cd63b5@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <8fcbc541-d7a3-4d0d-ab0f-74d7f1cd63b5@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thanks for reviewing the patches!

On 26/06/24 15:55, Tomi Valkeinen wrote:
> Hi,
> 
> On 22/06/2024 14:09, Aradhya Bhatia wrote:
>> Initialize the Phy during the cdns-dsi _resume(), and de-initialize it
>> during the _suspend().
>>
>> Also power-off the Phy from bridge_disable.
>>
>> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> index 5159c3f0853e..d89c32bae2b9 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> @@ -672,6 +672,10 @@ static void cdns_dsi_bridge_disable(struct
>> drm_bridge *bridge)
>>       if (dsi->platform_ops && dsi->platform_ops->disable)
>>           dsi->platform_ops->disable(dsi);
>>   +    phy_power_off(dsi->dphy);
>> +    dsi->link_initialized = false;
>> +    dsi->phy_initialized = false;
>> +
>>       pm_runtime_put(dsi->base.dev);
>>   }
>>   @@ -698,7 +702,6 @@ static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
>>              DPHY_CMN_PDN | DPHY_PLL_PDN,
>>              dsi->regs + MCTL_DPHY_CFG0);
>>   -    phy_init(dsi->dphy);
>>       phy_set_mode(dsi->dphy, PHY_MODE_MIPI_DPHY);
>>       phy_configure(dsi->dphy, &output->phy_opts);
>>       phy_power_on(dsi->dphy);
>> @@ -1120,6 +1123,8 @@ static int __maybe_unused cdns_dsi_resume(struct
>> device *dev)
>>       clk_prepare_enable(dsi->dsi_p_clk);
>>       clk_prepare_enable(dsi->dsi_sys_clk);
>>   +    phy_init(dsi->dphy);
>> +
>>       return 0;
>>   }
>>   @@ -1127,10 +1132,11 @@ static int __maybe_unused
>> cdns_dsi_suspend(struct device *dev)
>>   {
>>       struct cdns_dsi *dsi = dev_get_drvdata(dev);
>>   +    phy_exit(dsi->dphy);
>> +
>>       clk_disable_unprepare(dsi->dsi_sys_clk);
>>       clk_disable_unprepare(dsi->dsi_p_clk);
>>       reset_control_assert(dsi->dsi_p_rst);
>> -    dsi->link_initialized = false;
>>       return 0;
>>   }
>>   
> 
> So with this patch, phy_init/exit will be called in the resume/suspend
> functions. That looks fine.
> 
> But the phy_power_on/phy_power_off looks odd to me. Here you add
> phy_power_off() to cdns_dsi_bridge_disable(), which sounds fine. But
> phy_power_on() is called in cdns_dsi_hs_init(), and that is called in
> cdns_dsi_bridge_enable() (which sounds fine), but also in
> cdns_dsi_bridge_pre_enable().
> 
> So doesn't that mean cdns_dsi_hs_init() call in cdns_dsi_bridge_enable()
> is extra, as it effectively does nothing (it exists right away if
> dsi->phy_initialized == true)?

That's right. When cdns_dsi_hs_init() is called from
cdns_dsi_bridge_enable(), it is simply expected to return since
phy_initialized is true.

I am not aware about the exact reasoning behind this, but this gets
addressed when I convert the _bridge_enable() to _bridge_pre_enable()
and drop the older _bridge_pre_enable() entirely.


Regards
Aradhya
