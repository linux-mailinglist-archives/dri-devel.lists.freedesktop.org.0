Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468D05721FA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 19:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D5610E7C2;
	Tue, 12 Jul 2022 17:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4CC11BF23
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 17:52:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C5D1483FEA;
 Tue, 12 Jul 2022 19:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657648374;
 bh=2obYrQPPzSnDMU4P57Hf1csuPidBNFq/PsfNmre2Pw0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HOkLVN18qOCkG646X7Qw9+X984jfGTpR/QxFcQbZuxx4AZXoHndgFb0qoFWYcUBry
 9yJgC/P6VNtQ99JI4QcMbOrO6LmXp6t5pwHkaA8PUyQqj9iTl9nJDCFpBvW8LUfVYT
 c+fojDgmsIaUfbOt1UJzxberkOE7z9qQHgrmYEtJqzgU36aDJD0s0D3XKw2nSVV25E
 F6gcqAYlvQElDVYGo1Bql/QFiFt9sT8Msj6iztcvFByl+/rTQbT3BHOcl6phSgfEa5
 mihzyNY2Z9kFYCD/v4l7QKV+VxmxAtbLzDUoRoc1k372TRgi9p77nkWRJlxv7owf/F
 r5Zk210qzEpPA==
Message-ID: <e4d17bef-0896-c4cb-fa1e-63556ce4ef2d@denx.de>
Date: Tue, 12 Jul 2022 19:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/9] drm/panel/panel-sitronix-st7701: Make DSI mode flags
 common to ST7701
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220710194437.289042-1-marex@denx.de>
 <CACRpkdaQuvvgNNrTM6pcsoW=fKRwWRMGdSiOk2isFT6v-E-Ugw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdaQuvvgNNrTM6pcsoW=fKRwWRMGdSiOk2isFT6v-E-Ugw@mail.gmail.com>
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

On 7/11/22 15:17, Linus Walleij wrote:
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
> All very nice patches
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Tell me if you need me to apply them to drm-misc as well.

Sure, thank you.
