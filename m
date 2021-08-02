Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6143DD45F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 12:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1891189F9F;
	Mon,  2 Aug 2021 10:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF1D89F9F;
 Mon,  2 Aug 2021 10:55:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99A0860FD8;
 Mon,  2 Aug 2021 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627901751;
 bh=FydgtdwsRp9EnGLAnZNQbni8BGi4iPlFDNZ5+Emj/bA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MvBW1mFBfhWkp0RBKF+6rg70GNMqy/Ec+rGLHr9Ib+LS8A4Wn5wG+szv9Xfj8Z6QI
 6fUU9w5xm+BMjbL9SbQ0Oso5xWOJ89CdZuCx2EF1mHeGKGSqOKSWyyDXtlZiM+X7VM
 l6LHTB6s9uL2CWcNTxtbGafHUBYmR24zuSfY+KRQOVaCTmDzulBFvuP5vqjUPF/STf
 GZAlfD1MvRTjG2fhXvc6VcceLei2ZKbtfdSkQxmg6r2vWyg1rKF4+s7Bvl1XGDyY76
 nqYofb5tXVzNHKDJ1m7EUsm3XyckKGDN1FlCa2R4Sqn1VxZZvZ7cMat6rEfaDEADzU
 kXlX2gcQrkz5Q==
Date: Mon, 2 Aug 2021 11:55:45 +0100
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Georgi Djakov <djakov@kernel.org>, isaacm@codeaurora.org,
 David Airlie <airlied@linux.ie>, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Kristian H Kristensen <hoegsberg@google.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, freedreno <freedreno@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters to use
 system cache
Message-ID: <20210802105544.GA27657@willie-the-truck>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b2742c8891abe4fec3664730717a089@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> On 2021-07-28 19:30, Georgi Djakov wrote:
> > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > the memory type setting required for the non-coherent masters to use
> > > system cache. Now that system cache support for GPU is added, we will
> > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > Without this, the system cache lines are not allocated for GPU.
> > > 
> > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > and makes GPU the user of this protection flag.
> > 
> > Thank you for the patchset! Are you planning to refresh it, as it does
> > not apply anymore?
> > 
> 
> I was waiting on Will's reply [1]. If there are no changes needed, then
> I can repost the patch.

I still think you need to handle the mismatched alias, no? You're adding
a new memory type to the SMMU which doesn't exist on the CPU side. That
can't be right.

Will
