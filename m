Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2B72735B5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 00:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC8889D9A;
	Mon, 21 Sep 2020 22:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CA989D9A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 22:24:40 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2157523A63;
 Mon, 21 Sep 2020 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600727080;
 bh=1PUJ5hNzZTNJHRrWsG3qH9Ptt+duX4WCMYgHNreOFF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x1+tx4t5xnc8rNe7UWv5d0zvDRXkj6XToXs0Pyf/+5XHpb3DF5wqgSaHpgyzmVx3V
 7ZoJ+jLyb8mOgdPTOYNlXScX9cHDSUghI946B+JsMOUk0PvUp1YpH3s62uCof9b8Jf
 XGpyPrxLFD8nYYIX4fWIYYzjfp/D1vv/F9ThLdAA=
Date: Mon, 21 Sep 2020 23:24:34 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Support coherency for Mali LPAE
Message-ID: <20200921222434.GB4409@willie-the-truck>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d2a3ddb17b3270e268e2f1adf7682ea938823941.1600213517.git.robin.murphy@arm.com>
 <20200921175717.GF3141@willie-the-truck>
 <71cc6c53-7bd1-da1a-05fa-8172510b33d8@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71cc6c53-7bd1-da1a-05fa-8172510b33d8@arm.com>
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
Cc: tomeu.vizoso@collabora.com, narmstrong@baylibre.com, khilman@baylibre.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 10:53:23PM +0100, Robin Murphy wrote:
> On 2020-09-21 18:57, Will Deacon wrote:
> > On Wed, Sep 16, 2020 at 12:51:05AM +0100, Robin Murphy wrote:
> > > Midgard GPUs have ACE-Lite master interfaces which allows systems to
> > > integrate them in an I/O-coherent manner. It seems that from the GPU's
> > > viewpoint, the rest of the system is its outer shareable domain, and so
> > > even when snoop signals are wired up, they are only emitted for outer
> > > shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
> > > indeed get coherent pagetable walks working nicely for the coherent
> > > T620 in the Arm Juno SoC.
> > 
> > I can't help but think some of this commentary deserves to be in the code
> > as well.
> 
> Sure, if you want.

Yes, please.

> > Do you know if this sort of thing is done for other SoCs too, or is this
> > just a Juno quirk?
> 
> Yup, this is a "Midgard working as designed" thing. Juno is the coherent
> example I have to hand, but off the top of my head I believe some of the
> Exynos SoCs can also use their GPUs coherently if a switch is flipped in the
> interconnect to change routing between the CCI and a direct-to-RAM path; I
> expect there are probably further Midgard examples that I'm not aware of.
> Then there are definitely coherent Bifrost GPUs like the Amlogic S922/A311
> that prompted me to revive this patch, which we currently drive in "Legacy"
> mode and thus behave the same way as Midgard (Bifrost's "AArch64" mode
> realigns Ish and Osh with the rest of the system, and instead invents a new
> "Internal Shareable" value in between Nsh and Ish to represent the
> shareability between cores within the GPU for which Midgard hijacked Ish).

That is more than I wanted to know :) "Internal Shareable", jeez...

Thanks,

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
