Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F284FB0AA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 00:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CABF10F6E0;
	Sun, 10 Apr 2022 22:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5202610F6E0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 22:17:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7C9C183B03;
 Mon, 11 Apr 2022 00:17:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649629055;
 bh=NwVMl8JQoYY9af7Oa9YPGzdvaKFPbc1uEaHSgsHggKc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CmxmMqJ8z+S15nAsb/d8a5Bo3nuf3Srs+cqBL7lupuZTdLrFzESAnVhmg72mzB/Oe
 G3x+QEkL5M5qMzp8bLnSnldLV659UfokZKWQgeC3vA0372lKjTOrbrKe31ulQv6uP/
 E6DolwE0kUvFIO04GbFMCEDcQuNHk/q1g01t7z1VKb2WxZwEp5vIOef3LZe1rL+aqo
 JyfrfPlKrfqKjopeaZmmvpO4wCyvh8/tgwYmxetRok8i5aKOKOoiRdAU7v52tcaRRc
 vQbePN9yRmQ2oOWkPuc6crJljmMF0jMtM/jCZ9hnPWVQ4A9poXlBtqvKKeHz6m3BrU
 n009vh9lAJwrA==
Message-ID: <141af457-18df-13c5-a6d4-08ea1fd2f511@denx.de>
Date: Mon, 11 Apr 2022 00:17:34 +0200
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
 <2e038048-c3ac-4c33-fb98-ba6bec705d5b@denx.de>
 <ef4d8f36a16edda8abf9b6d818cd17f15b0b67cf.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ef4d8f36a16edda8abf9b6d818cd17f15b0b67cf.camel@pengutronix.de>
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

On 4/7/22 11:47, Lucas Stach wrote:
> Am Donnerstag, dem 07.04.2022 um 00:05 +0200 schrieb Marek Vasut:
>> On 4/6/22 21:45, Lucas Stach wrote:
>>> Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
>>>> Move mxsfb_get_fb_paddr() out of the way, away from register IO functions.
>>>> This is a clean up. No functional change.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>> Cc: Robby Cai <robby.cai@nxp.com>
>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>> Cc: Stefan Agner <stefan@agner.ch>
>>>
>>> Hm, I don't see any real benefit, but I also fail to see why it
>>> shouldn't be done so:
>>
>> The entire point of this series is to clean up the mxsfb and isolate
>> lcdif (the original lcdif) from any of the common code.
> 
> Actually, just use drm_fb_cma_get_gem_addr() instead?

That function seems to add only extra code that is executed, but does 
not do away with the !fb check anyway. So, why ? (Also, seems unrelated 
to this patch)
