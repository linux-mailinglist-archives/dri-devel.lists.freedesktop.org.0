Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0272A5824A0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 12:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F88311BE36;
	Wed, 27 Jul 2022 10:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13D68FA5A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 10:41:05 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B3F0883E4C;
 Wed, 27 Jul 2022 12:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658918463;
 bh=eDeInP4VKg2WjLqUEfwEpQ1B7avS6jcUUs9Ko8y0csM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vK3W3BFdNOMrWJDtmO81aGKnj03BO+ekpGCqGtcdjYRCnCYAd3EEtlxUf+jQhKdoZ
 20cqgrJvIp+bUb3KTaxZ+1IjD6xUW+Mfh1NR7CTGaqVGvB1JngvDW/6a6pE82wQRag
 /54aPmv1QIEqi06EMME/Tji/lf0m9sgVR1FmpdRX0nikDgFcMg8Iv9F89gO7PRVHzO
 3pE2py2Xjr9W2l/XtxUqLqWs3XPJz22dMdNnjOOVtMMvM/75Fkd6XtYAG/GuapqogP
 AP8FOKIkB7BaTOY1dpoxBvHRGD6rh9Pvz28Id01p/wt4wMQStIP9xKxs837BYvgRFA
 FM1YiiJIlFULQ==
Message-ID: <9977c88d-d94f-15ea-2e59-b2953b01d85e@denx.de>
Date: Wed, 27 Jul 2022 12:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm: lcdif: change burst size to 256B
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@oss.nxp.com>
References: <20220726094302.2859456-1-m.felsch@pengutronix.de>
 <28dc6dfd-08a2-a207-4644-074fb7fee2f1@denx.de>
 <22f34394e6f12c633594572a64d5c6bb40ff4476.camel@oss.nxp.com>
 <20220727035618.skhhwd5hja6cvqgx@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220727035618.skhhwd5hja6cvqgx@pengutronix.de>
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
 kernel@pengutronix.de, sam@ravnborg.org, jian.li@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/22 05:56, Marco Felsch wrote:
> Hi Marek, Liu,

Hi,

> On 22-07-26, Liu Ying wrote:
>> On Tue, 2022-07-26 at 16:19 +0200, Marek Vasut wrote:
>>> On 7/26/22 11:43, Marco Felsch wrote:
>>>> FIFO underruns are seen if a AXI bus master with a higher priority
>>>> do a
>>>> lot of memory access. Increase the burst size to 256B to avoid such
>>>> underruns and to improve the memory access efficiency.
>>>
>>> Sigh, this again ...
> 
> I know.. we also tried the PANIC mode but this somehow didn't worked as
> documented. So this was the only way to reduce the underruns without
> adapting the interconnect prio for the hdmi-lcdif.

Right, the PANIC watermark didn't work on mxsfb for me either when it 
came to FIFO underruns.

[...]

>>>> +	 * are two known values:
>>>> +	 *  1 - 128Byte
>>>> +	 *  2 - 256Byte
>>>> +	 *
>>>> +	 * Downstream has set the burst size to 256Byte to improve the
>>>> memory
>>>> +	 * efficiency so set it here too. This also reduces the FIFO
>>>> underrun
>>>> +	 * possibility.
>>>> +	 */
>>>> +	ctrl = CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
>>>> +	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb-
>>>>> pitches[0]);
>>>> +	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
>>
>> Nit: I would write the register directly, instead of caching the value
>> in ctrl.
> 
> IMHO it's more readable that way.

I agree, and we can also add to the variable in case there are more 
undocumented bits.
