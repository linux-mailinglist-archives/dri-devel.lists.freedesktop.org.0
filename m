Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184CD4AB65D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 09:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741E910E37C;
	Mon,  7 Feb 2022 08:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977D210E37C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 08:14:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F421B83BFB;
 Mon,  7 Feb 2022 09:14:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644221642;
 bh=j3fxoPo6tWfwnicZSsk1VXc0tDaCsPDz5JgBLgSXtag=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oVAIVrrBNQqfERrMrNuIrLGeid/i/bZ2r27E3tcw15gd04+mYYR2vTsxzIRC7CQJt
 Db5XnIYgARX3ZGgAINaIbImK97LzvA6aPWxRwBJGtr4JHkM5b9pGisd5/AJauAkIn+
 ADVUbxmND23sXtpLPQdz+YjuiKQtGqUCZ1cNu/IVbDssCTopJv4WVBkywW9qRR1ueX
 uWygrN0gRwouWCKNmpImMFwo0/04Dr/mQ2j+rZwAZ9RvGgmwv21Exmw86R74sY2P8l
 Q0ltXbcMotdV9hBbpWbO7NYV2BKI6rx8MmxKgb+gtW0mXJ2sq7vTERmn4TUAwM7E4p
 osHiLfkF1vNxQ==
Message-ID: <9a2cc781-3277-7e09-530b-05c7361cdaa8@denx.de>
Date: Mon, 7 Feb 2022 09:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
Content-Language: en-US
To: Liu Ying <victor.liu@oss.nxp.com>, dri-devel@lists.freedesktop.org
References: <20220206185643.275811-1-marex@denx.de>
 <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
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
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/7/22 06:13, Liu Ying wrote:
> Hi Marek,

Hi,

> On Sun, 2022-02-06 at 19:56 +0100, Marek Vasut wrote:
>> The LCDIF controller as present in i.MX6SX/i.MX8M Mini/Nano has a CRC_STAT
>> register, which contains CRC32 of the frame as it was clocked out of the
>> DPI interface of the LCDIF. This is likely meant as a functional safety
>> register.
>>
>> Unfortunatelly, there is zero documentation on how the CRC32 is calculated,
>> there is no documentation of the polynomial, the init value, nor on which
>> data is the checksum applied.
>>
>> By applying brute-force on 8 pixel / 2 line frame, which is the minimum
>> size LCDIF would work with, it turns out the polynomial is CRC32_POLY_LE
>> 0xedb88320 , init value is 0xffffffff , the input data are bitrev32()
>> of the entire frame and the resulting CRC has to be also bitrev32()ed.
> 
> No idea how the HW calculates the CRC value.
> I didn't hear anyone internal tried this feature.

It would be nice if the datasheet could be improved.

There are many blank areas which are undocumented, this LCDIF CRC32 
feature, i.MX8M Mini Arteris NOC at 0x32700000 , the ARM GPV NIC-301 at 
0x32{0,1,2,3,4,5,6,8}00000 and their master/slave port mapping. The NOC 
and NICs were documented at least up to i.MX6QP and then that 
information disappeared from NXP datasheets. I think reconfiguring the 
NOC/NIC QoS would help mitigate this shift issue described below (*).

Do you know if there is some additional NOC/NIC documentation for i.MX8M 
Mini available ?

>> Doing this calculation in software for each frame is unrealistic due to
>> the CPU demand, implement at least a sysfs attribute which permits testing
>> the current frame on demand.
> 
> Why not using the existing debugfs CRC support implemented
> in drivers/gpu/drm/drm_debugfs_crc.c?

I wasn't aware of that, thanks.

>> Unfortunatelly, this functionality has another problem. On all of those SoCs,
>> it is possible to overload interconnect e.g. by concurrent USB and uSDHC
>> transfers, at which point the LCDIF LFIFO suffers an UNDERFLOW condition,
>> which results in the image being shifted to the right by exactly LFIFO size
>> pixels. On i.MX8M Mini, the LFIFO is 76x256 bits = 2432 Byte ~= 810 pixel
>> at 24bpp. In this case, the LCDIF does not assert UNDERFLOW_IRQ bit, the
>> frame CRC32 indicated in CRC_STAT register matches the CRC32 of the frame
>> in DRAM, the RECOVER_ON_UNDERFLOW bit has no effect, so if this mode of
>> failure occurs, the failure gets undetected and uncorrected.
> 
> Hmmm, interesting, no UNDERFLOW_IRQ bit asserted when LCDIF suffers an
> UNDERFLOW condition?

Yes

> Are you sure LCDIF really underflows?

Mostly sure.

This problem occurs also on i.MX6SX which has no DSIM.

The failure is triggered by many short writes into DRAM to different 
addresses (I was successful at triggering it by using i.MX8M Mini with 
ASIX 88772 USB ethernet adapter, running iperf3 on the device, iperf3 -c 
... -t 0 -R -P 16 on the PC). This effectively makes the CI HDRC behave 
as a DRAM thrashing AXI master, since it triggers a lot of short USB qTD 
READs from DRAM and a lot of short ethernet packet WRITEs to DRAM. And 
that either clogs the DRAM itself, or the NOC or DISPLAY/HSIO NIC-301, 
and prevents LCDIF from getting data long enough for this underflow 
condition to happen, LFIFO to underflow, and this shift to appear. And 
the shift does not disappear automatically itself, it just stays there 
until the LCDIF is reinitialized.

And it apparently also happens on iMXRT, where a suggestion was made to 
tweak the QoS settings of the interconnect (which cannot be tested on 
i.MX8M Mini, because neither of that documentation is available, see 
above (*)):
https://community.nxp.com/t5/i-MX-RT/iMXRT1052-LCD-Screen-shifted/td-p/1069978

> If the shifted image is seen on a MIPI DSI display, could that be a
> MIPI DSI or DPHY issue, like wrong horizontal parameter(s)?

No, it happens also on i.MX6SX without DSIM, so this is LCDIF problem.
