Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE274AB8DA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 11:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A935410F767;
	Mon,  7 Feb 2022 10:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4170A10F767
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 10:43:10 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D42CC810F3;
 Mon,  7 Feb 2022 11:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644230588;
 bh=WoK+8ikC+1krVIlblmSPiLmCXSJw+Jux31zfGUcLBQc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n2vsrj0zGvPmQ11VxYNT02AXID1esX51cFm5flwqWvFV7RMI4CLLXdHvjG+ebIHxP
 1SO6OK1VFLODd2N86wYYqt00eUiyE2VbMwx3imnbM/OuWXx/Gsc21ishFQePfCA7Tj
 8ZaTAlk0JTMqbrHOq7YeY8Zjs+2UYKxBCwdnZVGOjN0oAAh8OGZBAMqhFbBW4KNvzO
 U05d8UmepgNowkfDvHryjO+2aeuH4b3TdSxy/oN3WvBIptbaSe4HHCH87h0pu5ew/g
 lQmtN8NV5VcHdAhHMJVsTs6y/iGsHqaeT2jIp0AZsE3LZFffgb917kQrvI182re81o
 u4zjtMSUt70zg==
Message-ID: <49519f3a-060d-feb5-891d-adaad10607e2@denx.de>
Date: Mon, 7 Feb 2022 11:43:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
Content-Language: en-US
To: Liu Ying <victor.liu@oss.nxp.com>, dri-devel@lists.freedesktop.org
References: <20220206185643.275811-1-marex@denx.de>
 <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
 <9a2cc781-3277-7e09-530b-05c7361cdaa8@denx.de>
 <1020798373f3f54d1dd7df7174afaeb973ec86ff.camel@oss.nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1020798373f3f54d1dd7df7174afaeb973ec86ff.camel@oss.nxp.com>
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
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Chiras <robert.chiras@nxp.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/7/22 10:18, Liu Ying wrote:

Hi,

>>> On Sun, 2022-02-06 at 19:56 +0100, Marek Vasut wrote:
>>>> The LCDIF controller as present in i.MX6SX/i.MX8M Mini/Nano has a
>>>> CRC_STAT
>>>> register, which contains CRC32 of the frame as it was clocked out
>>>> of the
>>>> DPI interface of the LCDIF. This is likely meant as a functional
>>>> safety
>>>> register.
>>>>
>>>> Unfortunatelly, there is zero documentation on how the CRC32 is
>>>> calculated,
>>>> there is no documentation of the polynomial, the init value, nor
>>>> on which
>>>> data is the checksum applied.
>>>>
>>>> By applying brute-force on 8 pixel / 2 line frame, which is the
>>>> minimum
>>>> size LCDIF would work with, it turns out the polynomial is
>>>> CRC32_POLY_LE
>>>> 0xedb88320 , init value is 0xffffffff , the input data are
>>>> bitrev32()
>>>> of the entire frame and the resulting CRC has to be also
>>>> bitrev32()ed.
>>>
>>> No idea how the HW calculates the CRC value.
>>> I didn't hear anyone internal tried this feature.
>>
>> It would be nice if the datasheet could be improved.
> 
> Agreed.
> 
>>
>> There are many blank areas which are undocumented, this LCDIF CRC32
>> feature, i.MX8M Mini Arteris NOC at 0x32700000 , the ARM GPV NIC-301
>> at
>> 0x32{0,1,2,3,4,5,6,8}00000 and their master/slave port mapping. The
>> NOC
>> and NICs were documented at least up to i.MX6QP and then that
>> information disappeared from NXP datasheets. I think reconfiguring
>> the
>> NOC/NIC QoS would help mitigate this shift issue described below (*).
> 
> I also think the QoS would help if it is configureable.

It is programmable, it's just the port mapping which is undocumented.

>> Do you know if there is some additional NOC/NIC documentation for
>> i.MX8M
>> Mini available ?
> 
> No.

Can you ask someone internally in NXP maybe ?

>>>> Doing this calculation in software for each frame is unrealistic
>>>> due to
>>>> the CPU demand, implement at least a sysfs attribute which
>>>> permits testing
>>>> the current frame on demand.
>>>
>>> Why not using the existing debugfs CRC support implemented
>>> in drivers/gpu/drm/drm_debugfs_crc.c?
>>
>> I wasn't aware of that, thanks.
> 
> No problem.
> 
>>
>>>> Unfortunatelly, this functionality has another problem. On all of
>>>> those SoCs,
>>>> it is possible to overload interconnect e.g. by concurrent USB
>>>> and uSDHC
>>>> transfers, at which point the LCDIF LFIFO suffers an UNDERFLOW
>>>> condition,
>>>> which results in the image being shifted to the right by exactly
>>>> LFIFO size
>>>> pixels. On i.MX8M Mini, the LFIFO is 76x256 bits = 2432 Byte ~=
>>>> 810 pixel
>>>> at 24bpp. In this case, the LCDIF does not assert UNDERFLOW_IRQ
>>>> bit, the
>>>> frame CRC32 indicated in CRC_STAT register matches the CRC32 of
>>>> the frame
>>>> in DRAM, the RECOVER_ON_UNDERFLOW bit has no effect, so if this
>>>> mode of
>>>> failure occurs, the failure gets undetected and uncorrected.
>>>
>>> Hmmm, interesting, no UNDERFLOW_IRQ bit asserted when LCDIF suffers
>>> an
>>> UNDERFLOW condition?
>>
>> Yes
> 
> Did you ever see UNDERFLOW_IRQ bit asserted in any case?

I didn't see the UNDERFLOW_IRQ bit asserted during my tests, either with 
this IRQ enabled (UNDERFLOW_IRQ_EN=1) or with the IRQ disabled 
(UNDERFLOW_IRQ_EN=0) by reading the CTRL1 register in interrupt handler 
when CUR_FRAME_DONE_IRQ triggered the IRQ handler.

I did see a few auto-recoveries of the panel back into non-shifted 
image, that happened once in some 100-200 tests. Mostly the LCDIF does 
not recover automatically.
