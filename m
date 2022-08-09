Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938C58E157
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 22:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50172BF099;
	Tue,  9 Aug 2022 20:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15CEBEED8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 20:48:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D39DE84118;
 Tue,  9 Aug 2022 22:48:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1660078106;
 bh=JJSsrT4UZcBVA5DIFP1raBwefaSZaZyJk2glWhpxivs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aFS4m4ZE9Ly8UCyoLnCPQVvMqymsfuTVDdNSqcLafX7h2Ph/MRFBTYw4yDA7XqJst
 BfcQbH3vUq+3yDGWEZyKZB03hUSxnP3NJgHY2Bsdg959QW4k+zd1gfbD87Kj4T8XsK
 cWxdhlkWx5A9yL/iCyaUOxJuvTHIxqrTJPJUjLKzsSGqCYb17R+DkSLtHEDyv23Re/
 a2qn7998sfsTmLhBq2685I4En9lWWyBBEoQrtmrRqfaoGlaKbh85N394FBLMgu9Jr6
 mxmcAYsenvMSidtAQzyfkcNGI6GH1RfNBkgeEoNetHJx0QuS8ze3QpbcuFrQ/psgG8
 reV3HMrekpQFw==
Message-ID: <b8b87371-4c23-a40a-f58b-a49140494963@denx.de>
Date: Tue, 9 Aug 2022 22:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] drm/bridge: tc358767: disable main link PHYs on main
 link disable
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
References: <20220706132812.2171250-1-l.stach@pengutronix.de>
 <20220706132812.2171250-3-l.stach@pengutronix.de>
 <CAG3jFytKthxb27FHRG7wPvtU6T=t314Nw-SCo75qFxTe3ij_OA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAG3jFytKthxb27FHRG7wPvtU6T=t314Nw-SCo75qFxTe3ij_OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/22 15:42, Robert Foss wrote:
> On Wed, 6 Jul 2022 at 15:28, Lucas Stach <l.stach@pengutronix.de> wrote:
>>
>> Disable the main link PHYs and put them into reset when the main link
>> is disabled. When the PHYs stay enabled while the rest of the DP link
>> circuits are disabled there is some noise on the data lanes, which some
>> displays try to lock onto, waking them up from their low power state.
>>
>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> ---
>>   drivers/gpu/drm/bridge/tc358767.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>> index fd4936215b55..615b4988bf34 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -1249,7 +1249,13 @@ static int tc_main_link_disable(struct tc_data *tc)
>>          if (ret)
>>                  return ret;
>>
>> -       return regmap_write(tc->regmap, DP0CTL, 0);
>> +       ret = regmap_write(tc->regmap, DP0CTL, 0);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return regmap_update_bits(tc->regmap, DP_PHY_CTRL,
>> +                                 PHY_M0_RST | PHY_M1_RST | PHY_M0_EN,
>> +                                 PHY_M0_RST | PHY_M1_RST);
>>   }
>>
>>   static int tc_dsi_rx_enable(struct tc_data *tc)
>> --
>> 2.30.2
>>
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Do you want me to apply this ?
