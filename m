Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF0752CF9F
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6E4112674;
	Thu, 19 May 2022 09:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770CE112674
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:45:18 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6258D83BDB;
 Thu, 19 May 2022 11:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652953516;
 bh=EVLGttC4nmw8Q9IevZuZbfbxpnpEmPQp3w3u1xWRC4c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pXdD7Oso3ogyZPWNA7+pRP3RslLgu8JcIHes4WhiXXOvZkJAhkw5pbAt+R+5lfcjF
 57asBLO5f1nOMbZQGRY3e4vg8mJf7HnlHXJvpf35uDJp8MuzBLjxTqmIBRDo14JpH6
 vzJSIEE1b+tXMhk/Tw7nwM6DbwO/3b9dTeNombk91cMIyJBSUNGMiyr5LDVg1deTBE
 TzP1L+X/VsnHGaXchyZxXRFHjM9FmsdAXRBwv1QOa8SwJ4ucrCbNkI1jwMGQDheYbj
 YNTV6p35Z81DPjJz6AAuGT2SQHlNigVlzWr6rbfAAaxtih1Ff4l9GcyMKqfUxWP2aL
 tdXUjlESP+Upg==
Message-ID: <8cec9a37-b11b-9a04-8933-66058e140f1e@denx.de>
Date: Thu, 19 May 2022 11:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] drm/bridge: tc358767: Handle dsi_lanes == 0 as invalid
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220518233602.248185-1-marex@denx.de>
 <cdaf30cf5090dedd2cf5a4145fa2137e1c7df859.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <cdaf30cf5090dedd2cf5a4145fa2137e1c7df859.camel@pengutronix.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/19/22 09:50, Lucas Stach wrote:
> Am Donnerstag, dem 19.05.2022 um 01:36 +0200 schrieb Marek Vasut:
>> Handle empty data-lanes = < >; property, which translates to
>> dsi_lanes = 0 as invalid.
>>
> I'm having a hard time imagining a situation where on would add a empty
> data-lanes property to the DT.

Like when you make a typo for example .
