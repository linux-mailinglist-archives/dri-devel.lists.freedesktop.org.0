Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480522A6158
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 11:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE1F6E0C1;
	Wed,  4 Nov 2020 10:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E3856E0C1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:15:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F301A13D5;
 Wed,  4 Nov 2020 02:15:51 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BDDB3F66E;
 Wed,  4 Nov 2020 02:15:50 -0800 (PST)
Subject: Re: use of dma_direct_set_offset in (allwinner) drivers
To: Maxime Ripard <maxime@cerno.tech>, Christoph Hellwig <hch@lst.de>
References: <20201103095538.GA19136@lst.de>
 <20201104081411.bnt5kixgunaczbzj@gilmour.lan>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9623c346-c86c-e3ce-332b-95492576a859@arm.com>
Date: Wed, 4 Nov 2020 10:15:49 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104081411.bnt5kixgunaczbzj@gilmour.lan>
Content-Language: en-GB
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
Cc: devel@driverdev.osuosl.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Yong Deng <yong.deng@magewell.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-04 08:14, Maxime Ripard wrote:
> Hi Christoph,
> 
> On Tue, Nov 03, 2020 at 10:55:38AM +0100, Christoph Hellwig wrote:
>> Linux 5.10-rc1 switched from having a single dma offset in struct device
>> to a set of DMA ranges, and introduced a new helper to set them,
>> dma_direct_set_offset.
>>
>> This in fact surfaced that a bunch of drivers that violate our layering
>> and set the offset from drivers, which meant we had to reluctantly
>> export the symbol to set up the DMA range.
>>
>> The drivers are:
>>
>> drivers/gpu/drm/sun4i/sun4i_backend.c
>>
>>    This just use dma_direct_set_offset as a fallback.  Is there any good
>>    reason to not just kill off the fallback?
>>
>> drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
>>
>>    Same as above.
> 
> So, the history of this is:
> 
>    - We initially introduced the support for those two controllers
>      assuming that there was a direct mapping between the physical and
>      DMA addresses. It turns out it didn't and the DMA accesses were
>      going through a secondary, dedicated, bus that didn't have the same
>      mapping of the RAM than the CPU.
> 
>      4690803b09c6 ("drm/sun4i: backend: Offset layer buffer address by DRAM starting address")
> 
>    - This dedicated bus is undocumented and barely used in the vendor
>      kernel so this was overlooked, and it's fairly hard to get infos on
>      it for all the SoCs we support. We added the DT support for it
>      though on some SoCs we had enough infos to do so:
> 
>      c43a4469402f ("dt-bindings: interconnect: Add a dma interconnect name")
>      22f88e311399 ("ARM: dts: sun5i: Add the MBUS controller")
> 
>      This explains the check on the interconnect property
> 
>    - However, due to the stable DT rule, we still need to operate without
>      regressions on older DTs that wouldn't have that property (and for
>      SoCs we haven't figured out). Hence the fallback.

How about having something in the platform code that keys off the 
top-level SoC compatible and uses a bus notifier to create offsets for 
the relevant devices if an MBUS description is missing? At least that 
way the workaround could be confined to a single dedicated place and 
look somewhat similar to other special cases like sta2x11, rather than 
being duplicated all over the place.

Robin.

>> drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
>>
>>    This driver unconditionally sets the offset.  Why can't we do this
>>    in the device tree?
>>
>> drivers/staging/media/sunxi/cedrus/cedrus_hw.c
>>
>>    Same as above.
>>
> 
> We should make those two match the previous ones, but we'll have the
> same issue here eventually. Most likely they were never ran on an SoC
> for which we have the MBUS figured out.
> 
> Maxime
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
