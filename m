Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD8C2032E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEBB10E96A;
	Thu, 30 Oct 2025 13:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rm+r7BYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6431010E973;
 Thu, 30 Oct 2025 13:20:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0397440A9F;
 Thu, 30 Oct 2025 13:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A52C4CEF1;
 Thu, 30 Oct 2025 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761830423;
 bh=QNwPRdq9FIL873zVet9y61mF8EJEgCNNPAw1BBEXg9Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rm+r7BYVaObM4PlNZcsOzVslm+n1VLDkrmjrCoqvNpJIiDH+7osesTV6r5aZ5cJUc
 1XSPUKZEjyRy65Svl4jjtm0ZXjTPvk1Ksq0yF791oAOsHcwOXyusHc1H+orZ3zPbee
 pJuh2utJsawRli+gLSrwSZBsoTdQBUdOFOVHQfjRvndCdzzxwoCX09MYT4INJggMnT
 4Nh2THR5JgSDzXa3x/M8RloLxV/DmWs/e2wvhJA5bQsnkaVbatUeD36UngDRXjjIXa
 A3iZqfg4sMoARZA3U4pBuiXt+PonuXKyeUH+S2DXb/JzJYGMTfYchiTwEnvchwKHpV
 TM1dBO8UdWbqw==
Date: Thu, 30 Oct 2025 14:20:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, 
 Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Message-ID: <vce4mknkfnycv44vrtz6dlkjylyv2ixgvfzsky6veqau4rsczk@4chlio3vhmhq>
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <Z8Bf9HRqOg7B3W79@ashyti-mobl2.lan>
 <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
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

Hi Christian,

I'm now jumping into this discussion as there have been several
patches from Nitin, Janusz and in igt as well.

On Thu, Feb 27, 2025 at 03:11:39PM +0100, Christian König wrote:
> Am 27.02.25 um 13:52 schrieb Andi Shyti:
> > On Wed, Feb 26, 2025 at 09:25:34PM +0530, Nitin Gote wrote:
> >> Give the scheduler a chance to breath by calling cond_resched()
> >> as some of the loops may take some time on old machines (like apl/bsw/pnv),
> >> and so catch the attention of the watchdogs.
> >>
> >> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> >> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > This patch goes beyond the intel-gfx domain so that you need to
> > add some people in Cc. By running checkpatch, you should add:
> >
> > Sumit Semwal <sumit.semwal@linaro.org> (maintainer:DMA BUFFER SHARING FRAMEWORK)
> > "Christian König" <christian.koenig@amd.com> (maintainer:DMA BUFFER SHARING FRAMEWORK)
> > linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
> > dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK)
> >
> > I added them now, but you might still be asked to resend.
> >
> > Said that, at a first glance, I don't have anything against this
> > patch.
> 
> There has been some push to deprecate cond_resched() cause it is almost always not appropriate.

Yes, there have been ideas and patches, but so far I haven't seen
anything concrete to deprecate cond_resched() and so far I see it
used normally. Or am I missing something?

> Saying that if I'm not completely mistaken that here is also not 100% correct usage.
> 
> Question is why is the test taking 26 (busy?) seconds to complete? That sounds really long even for a very old CPU.
> 
> Do we maybe have an udelay() here which should have been an usleep() or similar?

mmhhh... it doesn't look right, sleeps and cond_resched() are
different kind of beasts, I wouldn't like random sleeps added, as
you explained in Nitin's second patch.

Thanks,
Andi
