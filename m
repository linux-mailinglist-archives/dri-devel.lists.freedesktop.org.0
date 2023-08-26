Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B41B7897B0
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 17:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5182310E0D5;
	Sat, 26 Aug 2023 15:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6755810E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 15:18:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 55F978620C;
 Sat, 26 Aug 2023 17:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1693063101;
 bh=y0N2srksY3HhqZlflju+nVO6NB5Apxm1yc3eEVolUq4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YrnIEQoGuDj4TNd+XUkdnhcatV5S7/MsFsiKSuvDTZ5G3jwqq7eXjC/fscGbCKnp6
 8VEjdECCZdE5gDC2WylZjRuWkcCqLqXEptwER1Pq0crOjuYcNM8fmVz5uxGrQKorxS
 scj92CE7U2kg+D+DXbi+9lF4uX+3SfMSr1G8GnUPILTmojGag/HkuUz1RUaj3+WGkp
 1yIiRD4T8gAF0Vnp8yF8Zc8K+vTRGtGuVSZqb69zeWr0uD/o1gIooZgktammblOBsO
 UZ8pj1cwvMsI9UUV+PFvzJ7cVo8uhTczgqL8ggM2lhjVkBeXQumbLu+72jRRRePkUS
 8Amq5BT0G0P0A==
Message-ID: <f8d2bbfd-0f9c-31d8-729c-b316025b5b65@denx.de>
Date: Sat, 26 Aug 2023 17:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] drm/panel/panel-sitronix-st7701: Move init sequence from
 prepare() to enable()
To: Mimoja <git@mimoja.de>, dri-devel@lists.freedesktop.org,
 mimoja@aachen.ccc.de, alu@fffuego.com
References: <20230826095516.81387-1-git@mimoja.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230826095516.81387-1-git@mimoja.de>
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
Cc: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/26/23 11:55, Mimoja wrote:
> The struct drm_panel_funcs are offering a prepare() and an enable()
> entrypoint for panels. According to drm/panel.h:
> 
> "The .prepare() function is typically called before the display controller
> starts to transmit video data."
> and
> "After the display controller has started transmitting video data, it's safe
>   to call the .enable() function."
> 
> The st7701 driver currently does not respect this, queing DSI control commands
> during enable.

DSI commands are not DSI video, so this should be OK ?

> While generally fine this can lead to a fillup of the transmission queue before
> the transmission is set up on certain dsi bridges.
> This issue can also be seen on downstream imx8m* kernels.

Can you reproduce this with current mainline Linux or linux-next tree ?
I recall the display pipeline in the NXP downstream stuff is very 
different from mainline .

Which SoC does have this problem ?
