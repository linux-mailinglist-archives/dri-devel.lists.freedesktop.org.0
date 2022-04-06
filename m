Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363774F6EED
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 02:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7957510E0D7;
	Thu,  7 Apr 2022 00:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF3F10E04F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 00:00:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BEBE483E3A;
 Thu,  7 Apr 2022 02:00:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649289607;
 bh=kvBuJvm4JAsIW3ZA+9Jyx7OXPt81kmzRLrju/IoXSxY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dnh/6YsH6gJIfspV6kZFu/J13TT4veibY4KVqnFSC1uu1AiXcUG6yMeLj8pHr7IJA
 sB6OsrezmZWg4DTpM98I4lDnnzDJRTJRDOyE1XsOI+252lyKnInL9gAMclzFti9kbe
 I0UJkUInVXKkCPDVk3FhdLMOFy0sNJAUSKArdowUYT5wUwTMJLBVV+xQZrpPaKgPXG
 fb7wIoO1SOv9+4Y+c+T9B/zNn/v9/eRJLFa7UaVfF7GXXYpkNkguhrUjzrSc3GvLdT
 bkiszVsfFnDGfZgGD+R+7Ygt4tErglP4vKjHOW55loMtfqAC/Jg2MIY0Cf3nqwIrTN
 1b2VW6+TTl8fg==
Message-ID: <2e038048-c3ac-4c33-fb98-ba6bec705d5b@denx.de>
Date: Thu, 7 Apr 2022 00:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/7] drm: mxsfb: Move mxsfb_get_fb_paddr() away from
 register IO functions
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-4-marex@denx.de>
 <5f7eb7a214ec0f219c4c9ce87e6c8c87bc7f0aeb.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5f7eb7a214ec0f219c4c9ce87e6c8c87bc7f0aeb.camel@pengutronix.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/22 21:45, Lucas Stach wrote:
> Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
>> Move mxsfb_get_fb_paddr() out of the way, away from register IO functions.
>> This is a clean up. No functional change.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Robby Cai <robby.cai@nxp.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Stefan Agner <stefan@agner.ch>
> 
> Hm, I don't see any real benefit, but I also fail to see why it
> shouldn't be done so:

The entire point of this series is to clean up the mxsfb and isolate 
lcdif (the original lcdif) from any of the common code.
