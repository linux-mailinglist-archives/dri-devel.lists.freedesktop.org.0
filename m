Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9446C2080
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AAB10E2EC;
	Mon, 20 Mar 2023 18:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F3D10E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:56:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F77E617B5;
 Mon, 20 Mar 2023 18:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5613AC433D2;
 Mon, 20 Mar 2023 18:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679338564;
 bh=Dl2tc+KZJCj/AE5gJVzNM08To7rENxRVi1qXDVJVRWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zb06RfCwao+iYy7hdE9caI5q/fN462wvn9CeIQRXoFbCnRnQadgPaFshJueOYzl1o
 Ejv4p8OPnZp4ZBc4D3JD92wTqyeZDpE/vr0MYI9Ngp4Fl8EpZajt91O0JDgCE/qnDW
 dE4yDPcwEM/TaNUeKTGzUCzHS+6JNvsBsuzyyQTzNXw2PhctI7Xp7YvVSe6OqMvMmE
 UB6T/+p4PoYAzKFtGObjvfsQgKvUWGL1ZssHWtKhdYa0B/kf/jMCjbjweOD2fV8wqm
 GeW2XIApMRwUYn1JQ5RAwxAx+Ev7p/FTgdoPAXQPQvtmpAq6tn+FKA0lsRfk7ep9O8
 7252dqYdB7olg==
Date: Mon, 20 Mar 2023 11:56:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 6.3-rc3
Message-ID: <20230320185602.GB615556@dev-arch.thelio-3990X>
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <CAHk-=whXi1qgeDLHbaCyMpZ4XXYqS=fT2daYAmWntEK2rhG25g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=whXi1qgeDLHbaCyMpZ4XXYqS=fT2daYAmWntEK2rhG25g@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 11:49:55AM -0700, Linus Torvalds wrote:
> On Mon, Mar 20, 2023 at 11:26 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Hmm. I do my arm64 allmodconfig builds with gcc, and I'm surprised
> > that gcc doesn't warn about this.
> 
> Side note: I'm also wondering why that TEGRA_HOST1X config has that
> ARM dependency in
> 
>         depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
> 
> because it seems to build just fine at least on x86-64 if I change it to be just
> 
>         depends on ARCH_TEGRA || COMPILE_TEST
> 
> ie there seems to be nothing ARM-specific in there.
> 
> Limiting it to just the tegra platform by default makes 100% sense,
> but that "only do compile-testing on ARM" seems a bit bogus.
> 
> That limit goes back to forever (commit 6f44c2b5280f: "gpu: host1x:
> Increase compile test coverage" back in Nov 2013), so maybe things
> didn't use to work as well back in the dark ages?
> 
> None of this explains why gcc didn't catch it, but at least allowing
> the build on x86-64 would likely have made it easier for people to see
> clang catching this.

I did see a patch fly by to fix that:

https://lore.kernel.org/20230316082035.567520-3-christian.koenig@amd.com/

It seems like the DRM_TEGRA half of it is broken though:

https://lore.kernel.org/202303170635.A2RsQ1Wu-lkp@intel.com/

Cheers,
Nathan
