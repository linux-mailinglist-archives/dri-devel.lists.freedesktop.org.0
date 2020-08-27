Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14577254CC8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 20:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8318989E06;
	Thu, 27 Aug 2020 18:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 364DF89E06
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 18:18:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35068101E;
 Thu, 27 Aug 2020 11:18:17 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C62533F68F;
 Thu, 27 Aug 2020 11:18:13 -0700 (PDT)
Subject: Re: [PATCH 13/18] iommu/tegra: Add IOMMU_DOMAIN_DMA support
To: Thierry Reding <thierry.reding@gmail.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
 <20200827154502.GA1660457@ulmo>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <f6697e60-286c-f7c7-39d1-fe0784cc3e6d@arm.com>
Date: Thu, 27 Aug 2020 19:18:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827154502.GA1660457@ulmo>
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 digetx@gmail.com, will@kernel.org, hch@lst.de,
 linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, iommu@lists.linux-foundation.org, jonathanh@nvidia.com,
 agross@kernel.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com, kyungmin.park@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-27 16:45, Thierry Reding wrote:
> On Thu, Aug 20, 2020 at 04:08:32PM +0100, Robin Murphy wrote:
>> Now that arch/arm is wired up for default domains and iommu-dma,
>> implement the corresponding driver-side support for DMA domains.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/tegra-smmu.c | 37 +++++++++++++++++++++----------------
>>   1 file changed, 21 insertions(+), 16 deletions(-)
> 
> We can't do that yet because it will currently still break for use-cases
> such as display where we don't properly set up identity mappings during
> boot. The result is that the dma-iommu code will enable translations
> before the driver gets a chance to set up any mappings and if the
> display controller was left on by the bootloader, scanning out a splash
> screen, this causes faults between the point where dma-iommu is being
> set up for the display controller and where the display controller
> starts mapping its own buffers (rather than the ones mapped by the
> bootloader).

Rest assured that I understand the situation all too well ;) As with 
tegra-gart, the unspoken point here is that since tegra-smmu implements 
of_xlate(), then arm_setup_iommu_dma_ops() must already be causing the 
exact same problem, no? This patch only seeks to move any existing 
behaviour over to the common backend, regardless of whether it was ever 
really appropriate in the first place.

> That said, I do have a series that I've been carrying around for longer
> than I've wanted that does exactly this for Tegra SMMU and I'd prefer if
> you could drop this particular change from your series so that I can
> keep working on resolving the identity mapping issues first.

That would mean you'd see a functional change from the final patch, 
wherein nothing would ever be able to get translation unless drivers do 
their own explicit IOMMU API management. If you definitely want that 
change then OK, but it would still be nice to do it "properly" with 
IOMMU_DOMAIN_IDENTITY support, rather than just forcibly failing default 
domain allocation. I'm having a go at reworking the tegra-gart patch in 
that direction, so I can certainly try it for tegra-smmu as well.

Robin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
