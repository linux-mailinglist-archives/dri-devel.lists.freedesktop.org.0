Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86248579A6A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 14:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E442F10E62A;
	Tue, 19 Jul 2022 12:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7834F10FC32
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 12:15:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C9DD083E16;
 Tue, 19 Jul 2022 14:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658232954;
 bh=w2KZifD0G/NbcblCivtpu+gZGsR4PA/SRog6sPkNXCo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YdgZ/x1VNa0VdZTGcIwNgyyOK12LSai7EJTqvM6gqmTELqVEySTeASVCYfdkxB1dK
 1k6hnCXOIDL5GExyySvuKeWcEUDS1oLALYxMXh530nH0aCGaFGLwjGkc7NWeIQC0SV
 jp91xXDi7i9B4ETqz079LNGDCfPXclQ+eMSVunIGews2tLEEtOHj4KGxkHfcZZ+Ymn
 aHe3TR/HFMayO5EcbSB/dNM61TukRGnwSd+2FTg4qPeRdQUsMnuNhtsZBT47wKsdM5
 5CmiabF1l92+hyL2AJOfrwBKOmtlmLxvs6i29hK6GkadAlzXSHRwCCdFRGu9m/uU4x
 ikSwIisaHlOcg==
Message-ID: <4852d4d7-6dd9-9559-bb50-95bb20fa900f@denx.de>
Date: Tue, 19 Jul 2022 14:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/9] drm/panel/panel-sitronix-st7701: Make DSI mode flags
 common to ST7701
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220710194437.289042-1-marex@denx.de>
 <CACRpkdYSh21KbT+egW-0ePP7v8x2tOG6rH2ayCJx1SXNpA46DA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdYSh21KbT+egW-0ePP7v8x2tOG6rH2ayCJx1SXNpA46DA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, robert.foss@linaro.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/19/22 10:39, Linus Walleij wrote:
> On Sun, Jul 10, 2022 at 9:44 PM Marek Vasut <marex@denx.de> wrote:
> 
>> The ST7701 and ST7701S are TFT matrix drivers with integrated multi
>> protocol decoder capable of DSI/DPI/SPI input and 480x360...864 line
>> TFT matrix output. Currently the only supported input is DSI.
>>
>> The protocol decoder is separate from the TFT matrix driver and is
>> always capable of handling all of DSI non-burst mode with sync pulses
>> or sync events as well as DSI burst mode.
>>
>> Move the DSI mode configuration from TFT matrix driver properties to
>> common ST7701 code, because this is common to all TFT matrices.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Guido Günther <agx@sigxcpu.org>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
> 
> All 9 patches applied and pushed for drm-misc-next.

Nice, and I got cleared to submit another panel support which prompted 
this rework, so that's coming soon.
