Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A77512BC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 23:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90DA10E1A3;
	Wed, 12 Jul 2023 21:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1B910E1A3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 21:43:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 23DA784782;
 Wed, 12 Jul 2023 23:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689198207;
 bh=LyDQAM7X4RSCXw6CErdTHghC/dkhNgGBmb8WGdtRzbQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=yhqhiV4c3a+eGnEJLVZ+0iUbyHvyAKIJ/93vFcNAJSzM6C+qJT0yWPoZSf4E8yPkm
 d9sH9G9a5zZ7E9F2dYxdq9Fsbc8VNimD3rMF8jshn6ecRXurj98+njyztVz6DaAlx8
 lHeghFWzzqD09PuPqYZlt+8DjYdZUkcC3twzGHSu0vhfCwMT/t4+2C1YZU6h9PGhly
 GsaoQOkjI32PDwix2chUM+kzaIs+0LeCmZMPF9w/aw6AvQrAUQiM8BZ5sVXnodLmFx
 ELWEFdTLW54db9wrEEH3nS40oILjMpQ8UTFr8zuOHPKm+PlZ/mkUtFbHwGLGyH4EKB
 hKve1HcOiAUcQ==
Message-ID: <3fc5b418-8ec3-7899-9878-05e9cbf883e8@denx.de>
Date: Wed, 12 Jul 2023 23:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: 6.5-rc1 breakage in samsung-dsim
Content-Language: en-US
To: Tim Harvey <tharvey@gateworks.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Adam Ford <aford173@gmail.com>
References: <CAJ+vNU2Nb58wOdm9yROzSceSJgwR0pqfVFDiJWGUG6YN87ZdaQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAJ+vNU2Nb58wOdm9yROzSceSJgwR0pqfVFDiJWGUG6YN87ZdaQ@mail.gmail.com>
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

On 7/12/23 20:52, Tim Harvey wrote:
> Greetings,

Tim,

> I've noticed a regression in 6.5-rc1 that I'm having trouble bisecting
> between 6.4 with regards to imx8mm MIPI DSI.
> 
> I'm testing on an imx8mm-venice-gw72xx-0x with the following display:
>   - Powertip PH800480T013-IDF02 compatible panel
>   - Toshiba TC358762 compatible DSI to DBI bridge
>   - ATTINY based regulator used for backlight controller and panel enable

You mean RPi 7" display wired to non-RPi hardware like many people do ? ;-)

> I'm using a dt overlay to support this [1] which works on 6.4 but on
> 6.5-rc1 I get the following error:
> [    6.110585] samsung-dsim 32e60000.dsi: xfer timed out: 29 06 00 00
> 64 01 05 00 00 00
> [    6.326588] tc358762 32e60000.dsi.0: error initializing bridge (-110)
> 
> I'm trying to bisect this for some reason. Does anyone have any idea
> what may be causing this or how I can debug it?

Try and do something like ...

git revert --no-edit v6.4..v6.5-rc1 -- drivers/gpu/drm/bridge/tc358762.c 
drivers/gpu/drm/bridge/samsung-dsim.c drivers/regulator/*attiny*.c

(I might have the filenames wrong)

Does that start working afterward ?

If so, you can reverse-bisect on the reverts.

I wouldn't be surprised if this was somehow related to the non-burst 
mode delay calculation again, sigh.

[...]
