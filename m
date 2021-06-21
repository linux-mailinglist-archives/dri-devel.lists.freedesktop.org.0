Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6503AF037
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 18:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BDB6E216;
	Mon, 21 Jun 2021 16:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0262C6E216
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 16:45:03 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AAC6480EC6;
 Mon, 21 Jun 2021 18:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624293902;
 bh=szqf8fN0n4wSqeVlUUFTvOS01CcVvsb11fBAS5zzsz0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GvcfbTZAKM2W9bR5RQ99s0+VEWsJlNpclehVOjwqRFgaRQ+YnM7hDf0OwVnxlPOpe
 bvkLBRM/KVRJ9VNum/bqQkfvQirZCqwBb+qYtrBoXZkoleDXIGc+NGVWw9Lha7kOrx
 3khFRpjSISqucGGVzXJwXhmm+pWkzRBTu4RMErq+2LCMpdnADZv6h4bHWJ2s8VE0hS
 sZmcDhGYWvQS63nV7+rEULmGgdT2QK/OMdN3prT5PXvRW9+LjpFEzW3j+74kWtoRJ+
 PoM4adakJp1o1pXbq+g7zG6qKbkdq/FFnqjejcPTBqEuxxXB242lhhtGDHfsjn8DYW
 haQkf5WwfuEMQ==
Subject: Re: [PATCH] drm: mxsfb: Increase number of outstanding requests on V4
 and newer HW
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20210620224759.189351-1-marex@denx.de>
 <71e8d748b8dff1ecbf9e8905213a5b15e1019c4c.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <30887d0b-9d32-1d91-542f-12f3312cb854@denx.de>
Date: Mon, 21 Jun 2021 18:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <71e8d748b8dff1ecbf9e8905213a5b15e1019c4c.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, ch@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/21/21 2:08 PM, Lucas Stach wrote:
> Am Montag, dem 21.06.2021 um 00:47 +0200 schrieb Marek Vasut:
>> In case the DRAM is under high load, the MXSFB FIFO might underflow
>> and that causes visible artifacts. This could be triggered on i.MX8MM
>> using e.g. "$ memtester 128M" on a device with 1920x1080 panel. The
>> first "Stuck Address" test of the memtester will completely corrupt
>> the image on the panel and leave the MXSFB FIFO in odd state.
>>
>> To avoid this underflow, increase number of outstanding requests to
>> DRAM from 2 to 16, which is the maximum. This mitigates the issue
>> and it can no longer be triggered.
>>
> I see the obvious benefit of this change, but I'm not sure if enabling
> this on older SoCs is without any drawbacks. The newer SoCs have a good
> transaction scheduling on the NOC (i.MX8M) or at least a somewhat okay
> one in the DRAM controller (i.MX6). I'm not so sure about the older
> SoCs, where I could imagine too many outstanding transactions to delay
> memory traffic for other masters on the SoC.
> 
> You don't happen to have any experience with this on the older SoCs, do
> you?

The only older SoC which would be affected by this, except for the ones 
you already listed, is MX28. And the MX28 has rather decent DRAM 
controller, so I wouldn't expect problems there either.

You can look at it the other way around too however, if the DRAM gets 
saturated, the LCDIF controller suffers from FIFO underflows and that 
completely messes up the FIFO state, at which point the image on the 
display is distorted, shifted, wrapped around, or any other such odd 
effect. The underflow auto-recovery bit helps with it, but with this 
patch in place you are unlikely to run into those effects at all.
