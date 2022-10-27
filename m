Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC2060F1F7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C141A10E302;
	Thu, 27 Oct 2022 08:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C5B10E302
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:13:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 678B485072;
 Thu, 27 Oct 2022 10:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666858424;
 bh=by9j2ermLOK7nGCu1vwbzx/JAzgrF3aSUCZ2G5sxLWU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YOwaXoJHmJbB0qaGXHQrStvtrtsJrVLzuYODLavsLWwTZpKD8qxoiykCd0j2mepXA
 Twac8TUGlYTYfGVVkdDPqoeae3qExLyGeK2lL3Za4J+z/ObraVLC9ArXgKJ2PogogB
 WncdFJiA1Ik7rR85eIlS+FjQz0enXs+fM6Ka//AtbnZKZBTS7yJBZeZySjEcnhLBIH
 1HI2xkqBczkgJ0kvghbgoLJ6Wz6IxOZixlpODn6UKdPdUfRzD1RFVkxl4YtFJcurqd
 btG8yCQlJIOBgPOvIU8KiH4UzCBkP/kP/x0+CxbfehsWps+ZMgO3O50mwQ03EoyhoL
 M9TuaqCQ1Mdpg==
Message-ID: <d2968795-8d80-7df2-78cc-831ba0f7f927@denx.de>
Date: Thu, 27 Oct 2022 10:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm: lcdif: change burst size to 256B
To: Marco Felsch <m.felsch@pengutronix.de>
References: <20220726094302.2859456-1-m.felsch@pengutronix.de>
 <a2e1a3b8-7fb0-5d53-f590-429453f9c569@denx.de>
 <20221027080443.k3zsv7qimcvem7s6@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221027080443.k3zsv7qimcvem7s6@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/22 10:04, Marco Felsch wrote:
> Hi Marek,

Hi,

> On 22-10-26, Marek Vasut wrote:
>> On 7/26/22 11:43, Marco Felsch wrote:
>>> FIFO underruns are seen if a AXI bus master with a higher priority do a
>>> lot of memory access. Increase the burst size to 256B to avoid such
>>> underruns and to improve the memory access efficiency.
>>>
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>
>> Uh, this fell through the cracks, sorry.
>>
>> Can you please collect my RB, add:
>>
>> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
>>
>> and send V2 ?
>>
>> btw. the Panic mode seems to work on this IP with 4k displays and HDMI.
> 
> Sounds interesting, how did you verified that?

I plugged in a 4k panel into MX8MP HDMI port and saw this flicker, with 
the panic regs programmed correctly, there is no more flicker, see the 
commit messages of patch I posted yesterday for details, you were on CC:

[PATCH] drm: lcdif: Set and enable FIFO Panic threshold
