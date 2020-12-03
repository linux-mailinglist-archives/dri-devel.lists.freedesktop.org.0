Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D972CD4EC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 12:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBC96E9B7;
	Thu,  3 Dec 2020 11:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6176E9AF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 11:53:17 +0000 (UTC)
Date: Thu, 3 Dec 2020 11:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606996396;
 bh=2j9fWjCkqKCoHT9xIh7hghfL78crppBPjSaMaUXDoYY=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=A0UDfFqlLtETJD75Yl5RAWp1KV5tqcTwRPIopAzSrJR9HvaNG1KREMDyqAwJF5xlZ
 M/yBC5lUKVu9flpaC1awMgw0In4UE75VfsaIyQThiGFt9Je09wNotz6B+c8QPvmt0C
 XTy5HZTVZ63ptNIh2iK7jVirr/msEdzin3ib7rDuhymchQycZlJSWKQZ+OsVk8ZO2b
 scCbjmQ1rOBhGExxE60lO32sX69i4cT/aa9DmiKMK8IkubKLCxhOutiL/MksHnti2f
 ap5kPwsX9zpRCthSiPzo3l6MDx98K3UqiXRRgkaJ05Itd4rdEu9cJT0D0aDVfMq+hY
 eF8gmVdjygfVQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable: Remove tlb_flush_leaf
Message-ID: <20201203115310.GC31188@willie-the-truck>
References: <9844ab0c5cb3da8b2f89c6c2da16941910702b41.1606324115.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9844ab0c5cb3da8b2f89c6c2da16941910702b41.1606324115.git.robin.murphy@arm.com>
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
Cc: tomeu.vizoso@collabora.com, joro@8bytes.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, yong.wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 05:29:39PM +0000, Robin Murphy wrote:
> The only user of tlb_flush_leaf is a particularly hairy corner of the
> Arm short-descriptor code, which wants a synchronous invalidation to
> minimise the races inherent in trying to split a large page mapping.
> This is already far enough into "here be dragons" territory that no
> sensible caller should ever hit it, and thus it really doesn't need
> optimising. Although using tlb_flush_walk there may technically be
> more heavyweight than needed, it does the job and saves everyone else
> having to carry around useless baggage.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Reviewing the Mediatek TLB optimisation patches just left me thinking
> "why do we even have this?"... Panfrost folks, this has zero functional
> impact to you, merely wants an ack for straying outside drivers/iommu.

Thanks, this looks good to me, but I'll defer queuing it until the last
minute so that I can merge all the iommu component branches together
first and then apply this on top. Should happen next week.

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
