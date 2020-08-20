Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6AC24C66C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 21:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98256E3FE;
	Thu, 20 Aug 2020 19:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10918 seconds by postgrey-1.36 at gabe;
 Thu, 20 Aug 2020 19:56:50 UTC
Received: from hillosipuli.retiisi.org.uk (retiisi.org.uk [95.216.213.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413426E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 19:56:50 +0000 (UTC)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk
 [IPv6:2a01:4f9:c010:4572::80:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 914F6634C87;
 Thu, 20 Aug 2020 22:55:36 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
 (envelope-from <sakari.ailus@retiisi.org.uk>)
 id 1k8qeu-0002rH-B7; Thu, 20 Aug 2020 22:55:36 +0300
Date: Thu, 20 Aug 2020 22:55:36 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
Message-ID: <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
 <20200820165339.GK7145@valkosipuli.retiisi.org.uk>
 <be010209-4abc-ba48-4e31-185427776a13@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be010209-4abc-ba48-4e31-185427776a13@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, digetx@gmail.com,
 s-anna@ti.com, will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 t-kristo@ti.com, kyungmin.park@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 20, 2020 at 06:25:19PM +0100, Robin Murphy wrote:
> On 2020-08-20 17:53, Sakari Ailus wrote:
> > Hi Robin,
> > 
> > On Thu, Aug 20, 2020 at 04:08:36PM +0100, Robin Murphy wrote:
> > > Now that arch/arm is wired up for default domains and iommu-dma, devices
> > > behind IOMMUs will get mappings set up automatically as appropriate, so
> > > there is no need for drivers to do so manually.
> > > 
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > 
> > Thanks for the patch.
> 
> Many thanks for testing so quickly!
> 
> > I haven't looked at the details but it seems that this causes the buffer
> > memory allocation to be physically contiguous, which causes a failure to
> > allocate video buffers of entirely normal size. I guess that was not
> > intentional?
> 
> Hmm, it looks like the device ends up with the wrong DMA ops, which implies
> something didn't go as expected with the earlier IOMMU setup and default
> domain creation. Chances are that either I missed some subtlety in the
> omap_iommu change, or I've fundamentally misjudged how the ISP probing works
> and it never actually goes down the of_iommu_configure() path in the first
> place. Do you get any messages from the IOMMU layer earlier on during boot?

I do get these:

[    2.934936] iommu: Default domain type: Translated 
[    2.940917] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[    2.946899] platform 480bc000.isp: Adding to iommu group 0

-- 
Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
