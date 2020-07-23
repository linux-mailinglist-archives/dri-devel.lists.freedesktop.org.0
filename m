Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39622BEFA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 09:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E5D6E925;
	Fri, 24 Jul 2020 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jul 2020 11:42:01 UTC
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49CB6E192
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 11:42:01 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0U3a0ySa_1595504212; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0U3a0ySa_1595504212) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 23 Jul 2020 19:36:52 +0800
Date: Thu, 23 Jul 2020 19:36:52 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 2/2] iommu: Add gfp parameter to io_pgtable_ops->map()
Message-ID: <20200723113652.GA104096@VM20190228-100.tbsite.net>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
 <20200714082821.GC4516@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714082821.GC4516@willie-the-truck>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Fri, 24 Jul 2020 07:21:47 +0000
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
Reply-To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, tomeu.vizoso@collabora.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, joro@8bytes.org,
 iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, baolin.wang7@gmail.com, agross@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 matthias.bgg@gmail.com, steven.price@arm.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 09:28:21AM +0100, Will Deacon wrote:
> On Fri, Jun 12, 2020 at 11:39:55AM +0800, Baolin Wang wrote:
> > Now the ARM page tables are always allocated by GFP_ATOMIC parameter,
> > but the iommu_ops->map() function has been added a gfp_t parameter by
> > commit 781ca2de89ba ("iommu: Add gfp parameter to iommu_ops::map"),
> > thus io_pgtable_ops->map() should use the gfp parameter passed from
> > iommu_ops->map() to allocate page pages, which can avoid wasting the
> > memory allocators atomic pools for some non-atomic contexts.
> > 
> > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
> >  drivers/iommu/arm-smmu-v3.c             |  2 +-
> >  drivers/iommu/arm-smmu.c                |  2 +-
> >  drivers/iommu/io-pgtable-arm-v7s.c      | 18 +++++++++---------
> >  drivers/iommu/io-pgtable-arm.c          | 18 +++++++++---------
> >  drivers/iommu/ipmmu-vmsa.c              |  2 +-
> >  drivers/iommu/msm_iommu.c               |  2 +-
> >  drivers/iommu/mtk_iommu.c               |  2 +-
> >  drivers/iommu/qcom_iommu.c              |  2 +-
> >  include/linux/io-pgtable.h              |  2 +-
> >  10 files changed, 26 insertions(+), 26 deletions(-)
> 
> I was a bit nervous about us passing GFP_KERNEL with a spinlock held, but
> it looks like you've checked all the callsites and it looks fine to me, so:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Joerg -- not sure what you want to do with this one, as it's likely to
> conflict (trivially) with unrelated driver changes.

Thanks Will. Joerg, could you apply this 2 patches if no objection from
your side? Thanks.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
