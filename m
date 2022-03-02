Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5BE4CA865
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 15:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4318210ECC7;
	Wed,  2 Mar 2022 14:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C493310ECC4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 14:45:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8E89D8366F;
 Wed,  2 Mar 2022 15:45:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646232334;
 bh=11wWHYEgk0gpVEHnrwmu6w7eihnqGtkz8yk//XZLPzA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=diX43aTWGohAfeGFx0u87g7arljvZErUSy2EQNC9INcUdGNywxMKkaw2neVUSaTA4
 R3910LShEgKoJdZETf98vh1I6PNZUhuDSimzmv6pIO0MVGMoyzI9gj2sr42PLt7Jjm
 ZSptW+u2OjSXV9YLfbS12nV+60//FWfDIZaTqeZrhZZfQCsCKmr77LN32BLje2p4/v
 QlJ3Mpud11m08Yu3eeNtUgNPwiKifn0at6dl1GLzZdMS8qS6I4h9eT3yUN31Ucv9+i
 nJrLzSQU5tQIHCBBe6NmB872pPjOglvnR2uV4KhTVumaXZuMkKAAnfplaZWwaqb5BU
 9ulFAN9lnOZzg==
Message-ID: <fd6dcf5b-c74f-dba3-4bb1-b18ff05dc974@denx.de>
Date: Wed, 2 Mar 2022 15:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V2 03/12] drm: bridge: icn6211: Add HS/VS/DE polarity
 handling
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-4-marex@denx.de>
 <20220302095906.zevdeadlx2cpyyrx@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220302095906.zevdeadlx2cpyyrx@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/2/22 10:59, Maxime Ripard wrote:
> On Thu, Feb 17, 2022 at 01:25:21AM +0100, Marek Vasut wrote:
>> The driver currently hard-codes HS/VS polarity to active-low and DE to
>> active-high, which is not correct for a lot of supported DPI panels.
>> Add the missing mode flag handling for HS/VS/DE polarity.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Maxime Ripard <maxime@cerno.tech>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> To: dri-devel@lists.freedesktop.org
>> ---
>> V2: Rebase on next-20220214
>> ---
>>   drivers/gpu/drm/bridge/chipone-icn6211.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> index e29e6a84c39a6..2ac8eb7e25f52 100644
>> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
>> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> @@ -165,8 +165,16 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
>>   				  struct drm_bridge_state *old_bridge_state)
>>   {
>>   	struct chipone *icn = bridge_to_chipone(bridge);
>> +	struct drm_atomic_state *state = old_bridge_state->base.state;
>>   	struct drm_display_mode *mode = &icn->mode;
>> +	const struct drm_bridge_state *bridge_state;
>>   	u16 hfp, hbp, hsync;
>> +	u32 bus_flags;
>> +	u8 pol;
>> +
>> +	/* Get the DPI flags from the bridge state. */
>> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
>> +	bus_flags = bridge_state->output_bus_cfg.flags;
>>   
>>   	ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
>>   
>> @@ -206,7 +214,13 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
>>   	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
>>   	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
>>   	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
>> -	ICN6211_DSI(icn, BIST_POL, BIST_POL_DE_POL);
>> +
>> +	/* DPI HS/VS/DE polarity */
>> +	pol = ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIST_POL_HSYNC_POL : 0) |
>> +	      ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? BIST_POL_VSYNC_POL : 0) |
>> +	      ((bus_flags & DRM_BUS_FLAG_DE_HIGH) ? BIST_POL_DE_POL : 0);
> 
> Is there a reason you didn't use bus_flags for all the polarities there?

Because there is no separate HS/VS bus flag, that's why HS/VS is pulled 
from mode flags.
