Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9822591687E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693E710E646;
	Tue, 25 Jun 2024 12:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Mq+oHoCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD32510E28E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:59:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A6F0188477;
 Tue, 25 Jun 2024 14:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719320378;
 bh=JKDFEcOFWSMrRhfxL6rujBx8p/v0kA1VnY43vrQNqSw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Mq+oHoCBGdGFOqFc0um5nbHizNHFQUw7rvbDBS7zs+6/4aK6st6zDLCptcwv2GmHb
 Oujgm6bjOumOqldofqbnPd06A255WtmrZI1HqfYVwvboc9pHhMyb3Hh4s4qqnPDFf5
 bqEHCJ+m3orrpdXtH9IlECK5LpeAjveS/1tlntNt53EmX7WtufZlWdoAuwUL7PTJw2
 scdklFFatQefRg5oz1yhzIoialiJNVUUklkl5VZ+vkddDpcBCvYmce942/F6TKfOZ2
 wHBTM9Vc20f0H1bL3P6yokE1Q2ece6nnH/+gDOU1WKk2eNS0MWZTZKMrear1wYz2OB
 ILCgFSSgX4q4Q==
Message-ID: <1bd96b2b-2a49-4904-bf0e-4e239b775b32@denx.de>
Date: Tue, 25 Jun 2024 14:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: bridge: samsung-dsim: Initialize bridge on attach
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240513021849.129136-1-marex@denx.de>
 <6163202.ElGaqSPkdT@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6163202.ElGaqSPkdT@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/16/24 8:51 AM, Alexander Stein wrote:
> Hi Marek,
> 
> thanks for the patch.
> 
> Am Montag, 13. Mai 2024, 04:16:27 CEST schrieb Marek Vasut:
>> Initialize the bridge on attach already, to force lanes into LP11
>> state, since attach does trigger attach of downstream bridges which
>> may trigger (e)DP AUX channel mode read.
>>
>> This fixes a corner case where DSIM with TC9595 attached to it fails
>> to operate the DP AUX channel, because the TC9595 enters some debug
>> mode when it is released from reset without lanes in LP11 mode. By
>> ensuring the DSIM lanes are in LP11, the TC9595 (tc358767.c driver)
>> can be reset in its attach callback called from DSIM attach callback,
>> and recovered out of the debug mode just before TC9595 performs first
>> AUX channel access later in its attach callback.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Adam Ford <aford173@gmail.com>
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
>> Cc: Inki Dae <inki.dae@samsung.com>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Michael Walle <mwalle@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: kernel@dh-electronics.com
>> ---
>>   drivers/gpu/drm/bridge/samsung-dsim.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 95fedc68b0ae5..56093fc3d62cc 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1622,9 +1622,21 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
>>   			       enum drm_bridge_attach_flags flags)
>>   {
>>   	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dsi->dev);
>> +	if (ret < 0)
>> +		return ret;
>>   
>> -	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
>> -				 flags);
>> +	ret = samsung_dsim_init(dsi);
>> +	if (ret < 0)
>> +		goto err;
>> +
>> +	ret = drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
>> +				flags);
>> +err:
>> +	pm_runtime_put_sync(dsi->dev);
>> +	return ret;
>>   }
>>   
>>   static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
>>
> 
> It seems the right thing to do. But if 'samsung,burst-clock-frequency' is
> not specified for DSIM I get a DSI PLL configuration failure. There is no
> mode yet, thus samsung_dsim_enable_clock() tries to configure the PLL for
> 0Hz. There is another reconfiguration while pre_enabling the chain targeting
> the correct clock (891000000Hz for 1920x1080), so this seems fine.
> But I'm not sure if the 1st config error has any negative side effects.

Will be fixed in V2, thanks for pointing this out.
