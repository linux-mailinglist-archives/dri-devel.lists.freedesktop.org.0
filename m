Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B096732E57F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 11:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E769D6EB47;
	Fri,  5 Mar 2021 10:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EA46EB47;
 Fri,  5 Mar 2021 10:00:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9C7C64F56;
 Fri,  5 Mar 2021 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614938418;
 bh=q7+GpxBp+H0eRgTkIdpsEpb4AOMic5EYKdk6TlKfzNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VdQgZNulq90gd29Xtg9/oNfQ2d54P/SpjBprppu6WHUCh5dXm1SSl0GGu+C3Db9Uo
 pzwAKH5nDVAuHW4QcGz/8GQB5Uwy2F1AF4JKaBAKwYloGiPn5yGUdPVMFOmSFrGY4q
 1BFHvZTVShuR2OJT0m5VHBTe69UQAbmD/qup6iCvMDYVTI30coAfWYG48n1Nx0Zwfg
 ff6QcANvdoSlC3az1tKSteLjGyz8Je2PCg+wq1tAcIFASs2XSsNRO2eEn2wRIe4a5a
 tAI98WNSpofbBZCB1IrCBc5S9hoqSYa/Hnq02bUaEneKTqhx6nKn4Ab9WNOF3O7t4d
 jOwVlaHOUjTTQ==
Date: Fri, 5 Mar 2021 10:00:12 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 16/17] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
Message-ID: <20210305100012.GB22536@willie-the-truck>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-17-hch@lst.de>
 <d567ad5c-5f89-effa-7260-88c6d86b4695@arm.com>
 <CAF6AEGtTs-=aO-Ntp0Qn6mYDSv4x0-q3y217QxU7kZ6H1b1fiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtTs-=aO-Ntp0Qn6mYDSv4x0-q3y217QxU7kZ6H1b1fiQ@mail.gmail.com>
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
 netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 04, 2021 at 03:11:08PM -0800, Rob Clark wrote:
> On Thu, Mar 4, 2021 at 7:48 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2021-03-01 08:42, Christoph Hellwig wrote:
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > Moreso than the previous patch, where the feature is at least relatively
> > generic (note that there's a bunch of in-flight development around
> > DOMAIN_ATTR_NESTING), I'm really not convinced that it's beneficial to
> > bloat the generic iommu_ops structure with private driver-specific
> > interfaces. The attribute interface is a great compromise for these
> > kinds of things, and you can easily add type-checked wrappers around it
> > for external callers (maybe even make the actual attributes internal
> > between the IOMMU core and drivers) if that's your concern.
> 
> I suppose if this is *just* for the GPU we could move it into adreno_smmu_priv..
> 
> But one thing I'm not sure about is whether
> IO_PGTABLE_QUIRK_ARM_OUTER_WBWA is something that other devices
> *should* be using as well, but just haven't gotten around to yet.

The intention is certainly that this would be a place to collate per-domain
pgtable quirks, so I'd prefer not to tie that to the GPU.

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
