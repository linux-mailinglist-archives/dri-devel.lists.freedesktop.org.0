Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7187D45957A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 20:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2474C89B01;
	Mon, 22 Nov 2021 19:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBB6089B01
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 19:21:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B096BED1;
 Mon, 22 Nov 2021 11:21:20 -0800 (PST)
Received: from [10.57.56.56] (unknown [10.57.56.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E26303F73B;
 Mon, 22 Nov 2021 11:21:18 -0800 (PST)
Message-ID: <ef51bd05-0a83-0097-19ac-9df6591451ac@arm.com>
Date: Mon, 22 Nov 2021 19:21:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
Content-Language: en-GB
To: Alex Bee <knaerzche@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <73c57643-a0db-e7e7-174d-3cb6a978d98a@gmail.com>
 <20211122081008.GR6556@pengutronix.de>
 <0f975419-f3a6-8c5d-f700-904957eea3e6@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <0f975419-f3a6-8c5d-f700-904957eea3e6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-22 17:47, Alex Bee wrote:
> Am 22.11.21 um 09:10 schrieb Sascha Hauer:
>> Hi Alex,
>>
>> On Mon, Nov 22, 2021 at 12:18:47AM +0100, Alex Bee wrote:
>>> Hi Sascha,
>>>
>>> Am 17.11.21 um 15:33 schrieb Sascha Hauer:
>>>> This series adds initial graphics support for the Rockchip RK356[68]
>>>> SoCs.  Graphics support is based around the VOP2 controller which
>>>> replaces the VOP controller found on earlier Rockchip SoCs. The driver
>>>> has been tested with HDMI support included in this series and MIPI-DSI
>>>> which is not included because it needs some more work. The driver is
>>>> taken from the downstream Rockchip kernel and heavily polished, most non
>>>> standard features have been removed for now. I tested the driver with
>>>> the libdrm modetest utility and also with weston with both pixman and
>>>> panfrost driver support. Michael Riesch reported the driver to work on
>>>> the RK3566 as well, but device tree support for this SoC is not yet
>>>> included in this series.
>>>>
>>>> The HDMI changes are based on patches from Benjamin Gaignard, but
>>>> modified a bit as I found out that the HDMI port on the RK3568 only
>>>> needs one additional clock, not two. Also I added regulator support
>>>> which is needed to get the HDMI up on the rk3568-EVB board.
>>>>
>>>> All review and testing feedback welcome
>>>
>>> thanks for working on that - it's very (very,very) much appreciated.
>>>
>>> It took me some time to figure it out: It seems rk3568-iommu driver s
>>> broken - I did only get "white noise" when using it alongside vop
>>> (similar like it was reported here before). However: removing the
>>> iommu-property from vop makes it working for me with HDMI output on
>>> quartz64 as well. Could you check if you have the iommu driver in kernel
>>> enabled if it works for you, if the property is present in DT? (I used
>>> 5.16-rc1 + this series + [0]).
>> I have the iommu driver enabled and it works for me. I get this during
>> boot:
>>
>> [0.263287] rockchip-vop2 fe040000.vop: Adding to iommu group 0
>>
>> So I expect it is indeed used.
>>
>>> Also vop mmu seems to have the
>>> power-domain missing in your series (same as downstream) - however
>>> adding that doesn't help much currently.
>> Probably the power domain gets enabled anyway when the VOP is activated,
>> so adding it to the iommu won't help anything. Nevertheless it seems
>> correct to add the property, I'll do so in the next round.
>>
>>> As a sidenote: I verfied this with using Ezequiel's vpu addtion for
>>> RK356x: It did only work when removing the iommu there as well (getting
>>> tons of page faults otherwise) - so iommu driver really seems to broken,
>>> at least for RK3566. (Or I'm a missing a option in kernel config, which
>>> wasn't required for the older iommu version?)
>> I don't think so. I started from defconfig and disabled other
>> architectures and unneeded drivers, but I did not enable anything
>> specific to iommu.
> 
> I've found out now that I can make it work with iommu, by limiting the
> available memory to something below 4G (I have a 8G board). So there is
> something wrong in the driver or somewhere in memory mapping, iommu api
> (since it works when using CMA), ... however: it does clearly not relate
> to your patch.

FWIW it doesn't surprise me that there might still be bugs lurking in 
the IOMMU driver's relatively recent changes for packing 40-bit physical 
addresses into 32-bit pagetable entries and registers - that sort of 
thing is always tricky to get right. You're correct that that's 
something that wants debugging in its own right, though.

Robin.
