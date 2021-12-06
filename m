Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12FB46A6D8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 21:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF902733EE;
	Mon,  6 Dec 2021 20:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2E0733EE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 20:24:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2729B82F56;
 Mon,  6 Dec 2021 21:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1638822258;
 bh=mn/qrKNT3ngYziBm4AZY+qebtEEbv/YS36Q43CFE6Bw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gAb0poxxm7IRKE3dl466fjZZPrg2ynDxmdL+7fgEi4FV/6gOP0tW+9wYY95Em4MXp
 YVamgppA7MYqGp4nbx9bAGUz7FGIzvWPWB5C1i9m0j4VId7K1WPhA/5wt94Mwme5BM
 KTWA+6Ud8adcKK/l1RP85HRYmHej6pzdRRxW53kyyDmvQPkyHyqI/XnpNZMOtEvtRS
 p4/ts7+hwyDAhvk7TucN+LTI7z3X3M5Ve6/29p+fElAfjVitJmEadgQzHCrKgRwyEq
 cw26iABQCKRUsjP0oFbOLlo/1YqpjNzIX6Q9tGHm1wV0YJzx+37agwW2U1ufMJa7z+
 oSRTIz37KmtYg==
Message-ID: <77d26622-843b-1009-b331-5834d2d195d6@denx.de>
Date: Mon, 6 Dec 2021 21:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/4] drm/bridge: tc358767: Move hardware init to enable
 callback
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20211127032405.283435-1-marex@denx.de>
 <20211127032405.283435-2-marex@denx.de>
 <CAPY8ntAhWH0Wdg4EX2DOMPp-8CKimqmSHpMeJ64QFPpVfp1d2g@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPY8ntAhWH0Wdg4EX2DOMPp-8CKimqmSHpMeJ64QFPpVfp1d2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/6/21 19:01, Dave Stevenson wrote:
> Hi Marek

Hi,

>> The TC358767/TC358867/TC9595 are all capable of operating either from
>> attached Xtal or from DSI clock lane clock. In case the later is used,
>> all I2C accesses will fail until the DSI clock lane is running and
>> supplying clock to the chip.
>>
>> Move all hardware initialization to enable callback to guarantee the
>> DSI clock lane is running before accessing the hardware. In case Xtal
>> is attached to the chip, this change has no effect.
> 
> This puzzles me as there seem to be a couple of ambiguities over how
> it would be used.
> 
> Firstly the DT binding lists the clock as a required property, but
> there isn't one present if deriving the clock from the DSI clock lane.

That's correct, the clock for the internal PLLs are derived from the DSI 
clock lane.

> Secondly the datasheet states that the DSI Reference Clock Source
> Division Selection is done by the MODE1 pin, and switches between
> HSCKBY2 divided by 7 and HSCKBY2 divided by 9. There is a stated
> assumption that HSCK is either 364MHz or 468MHz, thereby ending up
> with 26MHz. To do this we have to be running DSI in burst mode, but
> the support for that in DRM is near zero.

Yes, you have to run the DSI clock lane at either of the two clock 
frequencies, that is rather limiting. The DSI has to be running in 
continuous clock mode, this has nothing to do with burst mode, the burst 
mode is a DSI host setting which is supported by most DSI hosts.

> Can I ask how the chip has actually been configured and run in this mode?

REFCLK Xtal disconnected and HSCKBY2/7 MODE0=H MODE1=L , that should be 
all you need. Do you plan to develop a board with this bridge ?
