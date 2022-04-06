Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD84F6EEA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 02:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7195F10E0A4;
	Thu,  7 Apr 2022 00:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E262C10E0A4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 00:00:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9593E83E30;
 Thu,  7 Apr 2022 02:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649289606;
 bh=aA/9oEkF2Ds57zQVjWRxA+XwgkmIXc5IZ3N5ay7Zav4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bEQFyLIY3Dj7qSndFBeajgel+ZjW9HTm2y0+SYF/i2Acicf9rAPdwSZJbdCNV3ltz
 Bj7MXS9aW0+JKNR5y99+/SYhH9GKrQHN1EzJsBWKMwnTitVlGGtZozpV4/ZbiwFx97
 ucCJbtP9jN/G3u8OhYe9IR7OwGU4WdfVzvRZVRcE2kRF/rnNrBuRJv/asnj9nV8ZDq
 rCJPUP9ZLa5cshET7XayRA4p0A07apuMr/Dws5Dty99dRYqxoeDApOr3OD2LGwFVYA
 lKsceyAz6mnoJmLwDeffdiox1t5Yf8gkz5crfkM03kG4B9zJx0t9kV8WHzJ/8PDXU4
 HxMIpBysTIoHg==
Message-ID: <3f46927b-b458-81bf-0b9b-03171e9bbcb5@denx.de>
Date: Thu, 7 Apr 2022 00:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/7] drm: mxsfb: Simplify LCDIF IRQ handling
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-2-marex@denx.de>
 <ffc23134df69d9fe6ba7229e6a3239ebd131e68e.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ffc23134df69d9fe6ba7229e6a3239ebd131e68e.camel@pengutronix.de>
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

On 4/6/22 21:41, Lucas Stach wrote:
> Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
>> The call to drm_crtc_vblank_off(&lcdif->crtc); disables IRQ generation
>> from the LCDIF block already and this is called in mxsfb_load() before
>> request_irq(), so explicitly disabling IRQ using custom function like
>> mxsfb_irq_disable() is not needed, remove it.
>>
> 
> Have you checked that the drm_vblank_off in probe actually results in a
> call to mxsfb_crtc_disable_vblank? From my reading of the core code,
> this should be a no-op without a previous drm_vblank_on, so it would
> not result in the desired masking before the IRQ is requested.

I must've missed the vblank->enabled check, but then, I am also not 
getting any interrupts, so presumably they are already disabled after 
the IP is reset.
