Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AAE333AC3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BC36EA04;
	Wed, 10 Mar 2021 10:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2120A6E165;
 Wed, 10 Mar 2021 10:55:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0375464FBA;
 Wed, 10 Mar 2021 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615373758;
 bh=l5F4mRFTlCcuvK65v3+ubAAIjsEOKjTToYBZnVrSV8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Snrq3o6NQfFy8T13bWkjeS0t+DUxWxLJ7ItwwsFvYQUN059elyy12JfOlinrWY9b9
 HZXz58NlMVNMAanXaV4jMPtH+wZ63zpj4onuFCjkYAw0y6Itf99qSovicg/AvxjLlu
 dC1gGgjIjClyM+tZEQc82j0YPmrepv2haKqVn9pXRXBSHMvhcAemlq17an5DZjsRLD
 GavAs3RvhjKvztQsc6QzDP7siwQGDfGWNWfSNCMIjao9k51gQwMEycEcBk2+iaZ2FD
 GfnBGnq0Lliwgyj+ZV+DmU7+2pHmPC7dDWTA6KQMdLwYszXdvPO5XE4k7J4bo7MxuP
 Ok+UecEar6NwQ==
Date: Wed, 10 Mar 2021 10:55:51 +0000
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [Freedreno] [PATCH 16/17] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
Message-ID: <20210310105550.GA29270@willie-the-truck>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-17-hch@lst.de>
 <d567ad5c-5f89-effa-7260-88c6d86b4695@arm.com>
 <CAF6AEGtTs-=aO-Ntp0Qn6mYDSv4x0-q3y217QxU7kZ6H1b1fiQ@mail.gmail.com>
 <20210305100012.GB22536@willie-the-truck>
 <20210310085806.GB5928@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310085806.GB5928@lst.de>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Li Yang <leoyang.li@nxp.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 netdev@vger.kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 10, 2021 at 09:58:06AM +0100, Christoph Hellwig wrote:
> On Fri, Mar 05, 2021 at 10:00:12AM +0000, Will Deacon wrote:
> > > But one thing I'm not sure about is whether
> > > IO_PGTABLE_QUIRK_ARM_OUTER_WBWA is something that other devices
> > > *should* be using as well, but just haven't gotten around to yet.
> > 
> > The intention is certainly that this would be a place to collate per-domain
> > pgtable quirks, so I'd prefer not to tie that to the GPU.
> 
> So the overall consensus is to just keep this as-is for now?

Yes, please. If it doesn't see wider adoption then we can revisit it.

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
