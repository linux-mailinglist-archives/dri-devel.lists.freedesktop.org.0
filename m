Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E325045E3
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 03:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE8510E64A;
	Sun, 17 Apr 2022 01:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FDB10E64A
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 01:04:43 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 225B183DB7;
 Sun, 17 Apr 2022 03:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650157481;
 bh=PMZvZ4UOMxPHBhQTeX5OKVoNv3vHmTX+9mqQR3mAIYY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zHPO07LXeWUv+7vyEQYItH6rXsThnQPp7ODyVX3FzClVC6+U8QhOJdv2MaTHAOIhG
 FzBZo6/oaJn6JAw48aZEIrsxv0aFKkROUXKciXOw7BkyOr2c63tBGh/k0DqFHeuyEz
 h1GdoIY1qo7nCFx2WfV5Rg9hvfPObdfaJW+EwOsmdKYQ42dxGXujgMOxYE1o9yt15R
 xnmCNFKIOQA0GJyY69tq762BoYz0bjHBEUVe8lfQAAodCadukDXuLd0Mqs9ge3959z
 Oybt2tG7F+QjELurJCdjI9UVzwojiazEUpSh//9nsdZAHoYUcvAzuh0LUvdXD/eI1n
 QWgBYK1fb+0YA==
Message-ID: <4f9948fb-c7d3-367f-48d0-3e44deee6188@denx.de>
Date: Sun, 17 Apr 2022 03:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/7] drm: mxsfb: Simplify LCDIF IRQ handling
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-2-marex@denx.de>
 <ffc23134df69d9fe6ba7229e6a3239ebd131e68e.camel@pengutronix.de>
 <3f46927b-b458-81bf-0b9b-03171e9bbcb5@denx.de>
 <b48364e7e0b0d9fc925ec8edf2b03adafe77a30b.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b48364e7e0b0d9fc925ec8edf2b03adafe77a30b.camel@pengutronix.de>
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

On 4/7/22 10:01, Lucas Stach wrote:
> Am Donnerstag, dem 07.04.2022 um 00:03 +0200 schrieb Marek Vasut:
>> On 4/6/22 21:41, Lucas Stach wrote:
>>> Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
>>>> The call to drm_crtc_vblank_off(&lcdif->crtc); disables IRQ generation
>>>> from the LCDIF block already and this is called in mxsfb_load() before
>>>> request_irq(), so explicitly disabling IRQ using custom function like
>>>> mxsfb_irq_disable() is not needed, remove it.
>>>>
>>>
>>> Have you checked that the drm_vblank_off in probe actually results in a
>>> call to mxsfb_crtc_disable_vblank? From my reading of the core code,
>>> this should be a no-op without a previous drm_vblank_on, so it would
>>> not result in the desired masking before the IRQ is requested.
>>
>> I must've missed the vblank->enabled check, but then, I am also not
>> getting any interrupts, so presumably they are already disabled after
>> the IP is reset.
> 
> Yep, it should be the default for every peripheral to not send any
> unsolicited interrupts. But then I don't see explicit reset of the IP
> in the driver probe. So maybe this is a workaround for situation where
> something running before Linux has already enabled the display
> controller and for whatever reason also enabled the interrupt
> requests?
> 
> Either we should have a proper reset of the block in the probe path, or
> this interrupt masking must be kept in one form or the other. My vote
> would be on just masking the IRQs and dropping the useless
> drm_vblank_off.

I can just discard this patch, OK.
