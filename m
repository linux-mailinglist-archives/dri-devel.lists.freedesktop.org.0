Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D4F3392E7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 17:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AC86E120;
	Fri, 12 Mar 2021 16:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BB706E120;
 Fri, 12 Mar 2021 16:18:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B392E1FB;
 Fri, 12 Mar 2021 08:18:33 -0800 (PST)
Received: from [10.57.52.136] (unknown [10.57.52.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A040A3F7D7;
 Fri, 12 Mar 2021 08:18:30 -0800 (PST)
Subject: Re: [PATCH 14/17] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
To: Christoph Hellwig <hch@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-15-hch@lst.de>
 <1658805c-ed28-b650-7385-a56fab3383e3@arm.com> <20210310091501.GC5928@lst.de>
 <20210310092533.GA6819@lst.de> <fdacf87a-be14-c92c-4084-1d1dd4fc7766@arm.com>
 <20210311082609.GA6990@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <dff8eb80-8f74-972b-17e9-496c1fc0396f@arm.com>
Date: Fri, 12 Mar 2021 16:18:24 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311082609.GA6990@lst.de>
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
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-msm@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-11 08:26, Christoph Hellwig wrote:
> On Wed, Mar 10, 2021 at 06:39:57PM +0000, Robin Murphy wrote:
>>> Actually... Just mirroring the iommu_dma_strict value into
>>> struct iommu_domain should solve all of that with very little
>>> boilerplate code.
>>
>> Yes, my initial thought was to directly replace the attribute with a
>> common flag at iommu_domain level, but since in all cases the behaviour
>> is effectively global rather than actually per-domain, it seemed
>> reasonable to take it a step further. This passes compile-testing for
>> arm64 and x86, what do you think?
> 
> It seems to miss a few bits, and also generally seems to be not actually
> apply to recent mainline or something like it due to different empty
> lines in a few places.

Yeah, that was sketched out on top of some other development patches, 
and in being so focused on not breaking any of the x86 behaviours I did 
indeed overlook fully converting the SMMU drivers... oops!

(my thought was to do the conversion for its own sake, then clean up the 
redundant attribute separately, but I guess it's fine either way)

> Let me know what you think of the version here:
> 
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/iommu-cleanup
> 
> I'll happily switch the patch to you as the author if you're fine with
> that as well.

I still have reservations about removing the attribute API entirely and 
pretending that io_pgtable_cfg is anything other than a SoC-specific 
private interface, but the reworked patch on its own looks reasonable to 
me, thanks! (I wasn't too convinced about the iommu_cmd_line wrappers 
either...) Just iommu_get_dma_strict() needs an export since the SMMU 
drivers can be modular - I consciously didn't add that myself since I 
was mistakenly thinking only iommu-dma would call it.

Robin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
