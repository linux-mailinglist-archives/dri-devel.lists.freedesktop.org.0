Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDCC614E40
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 16:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A17210E3E6;
	Tue,  1 Nov 2022 15:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A495E10E3E6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 15:24:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C046984F20;
 Tue,  1 Nov 2022 16:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667316246;
 bh=7E37dKyJQ207pFj41XJHVm4tfbj6RcEJrxvZ605MShU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dpjGn+sDMpJZ9FRkK6Bm0S9NxS8cbmjlPIZAyFKaiFsxCDr6fOFEGKh3YdKwwzlS+
 BCXpXHZSqXtnlYKzc12hMDXAFqbcRJrOhV/uaRPw6Q8qFeGx8+CyFxgOf+xQdPsyE5
 7S5zlFbrnREsa5Q+9mIZjMyJqW0Ygp9+59sYRcypmygsOQGCSycrxI79O/HhQYD0uz
 qHBEZ56a49smo0e7GXWMb2sZslzbWTB5wGs+jaDhFzz+l9tiE9PShtweEjKOVCuRfw
 MzT0lvSvJe16Zqaqw94zU++2S9OQogCkigaCrK0jpDTaX6+qfoBwVtYoxbMLgpzc4y
 hHusFugKHKhhw==
Message-ID: <e15680d8-3790-4907-0efa-a597b70ed0d0@denx.de>
Date: Tue, 1 Nov 2022 16:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
To: Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
References: <20221026212002.542375-1-marex@denx.de>
 <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
 <9bd9ee85-3a20-f13a-3984-017a439e08cd@denx.de>
 <6398adb972ef8623fd594fd573b5ed6838948516.camel@nxp.com>
 <20221027174748.niz6wi7dqwj3nlyr@pengutronix.de>
 <45837065-f231-8c72-4818-d943133d66a5@denx.de>
 <57059f620dc6dbd63ef289a82c8dae685d048242.camel@nxp.com>
 <20221101140404.pwsxecee3rmot7st@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221101140404.pwsxecee3rmot7st@pengutronix.de>
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/22 15:04, Marco Felsch wrote:
> Hi Marek, Liu,

Hi,

[...]

>>>> Also IMHO the threshold should be taken wisely to not enter panic
>>>> mode
>>>> to early to not block others from the bus e.g. the GPU.
>>>
>>> As far as I understand the PANIC0_THRES, both thresholds are really
>>> watermarks in the FIFO, 0=EMPTY, 1/3=LOW, 2/3=HIGH, 3/3=FULL. Under
>>> normal conditions, the FIFO is filled above 1/3. When the FIFO fill
>>> drops below LOW=1/3, the "PANIC" signal is asserted so the FIFO can
>>> be
>>> refilled faster. When the FIFO fill raises above HIGH=2/3, the
>>> "PANIC"
>>> signal is deasserted so the FIFO refills at normal rate again.
> 
> This matches exactly my picture of the hardware.
> 
>>> It seems to me the LOW=1/3 and HIGH=2/3 thresholds are the kind of
>>> good
>>> balance. The LOW=2/3 and HIGH=FULL=3/3 seems like it would keep the
>>> "PANIC" signal asserted much longer, which could indeed block others
>>> from the bus.
> 
> Also I understood the thresholds in such a way, that the FIFO watermark
> must be higher but there is no place left when it is set to 3/3. In such
> case this means that the PANIC will never left once it was entered.

I think this part is wrong.

Consider that the FIFO fill drops below 2/3 so PANIC signal asserts. 
After a bit of time, the FIFO fill reaches full 3/3 (maybe during 
blanking period, where the data can be read in quickly without being 
scanned out again), and the PANIC signal de-asserts.

So the LCDIF won't be in constant PANIC asserted, but it will be there 
for quite a bit longer.

>>> It also seems to me that tuning these thresholds might be related to
>>> some special use-case of the SoC, and it is most likely not just the
>>> LCDIF thresholds which have been adjusted in such case, I would
>>> expect
>>> the NOC and GPV NIC priorities to be adjusted at that point too.
> 
> As far as I understood, the PANIC signal triggers the NOC to use the
> PANIC signal priorities instead of the normal ones. I found a patch
> laying in our downstream [1] repo which configures the threshold. This
> raises the question which PANIC prio do you use? Do you have a patch for
> this? If I remember correctly some TF-A's like the NXP downstream one
> configure this but the upstream TF-A don't. Which TF-A do you use?

Upstream 2.6 or 2.7 , so this tuning does not apply.

>>> So unless there are further details for that use-case which justify
>>> making this somehow configurable, then maybe we should just stick to
>>> 1/3 and 2/3 for now. And once there is a valid use-case which does
>>> justify making this configurable, then we can add the DT properties
>>> and all.
>>>
>>> What do you think ?
>>
>> No strong opinion from me on using LOW=1/3 and HIGH=2/3 thresholds for
>> now if they satisfy all current users of the upstream kernel.  Tuning
>> them in a certain way will be indeed needed once an usecase comes along
>> and still suffers from the FIFO underflows with those thresholds.
> 
> I think that 1/3 and 2/3 should be fine for now too.

All right, lemme re-test this, send V2, and then we can go from there.

btw. can you resend that [PATCH] drm: lcdif: change burst size to 256B 
with Fixes tag , so it can trickle into stable releases ?
