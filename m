Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D439F183
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53AC6EB50;
	Tue,  8 Jun 2021 08:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 700806EB50
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 08:57:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCA1E12FC;
 Tue,  8 Jun 2021 01:57:12 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.5.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74B023F719;
 Tue,  8 Jun 2021 01:57:08 -0700 (PDT)
Date: Tue, 8 Jun 2021 09:57:00 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210608085700.GA9741@C02TD0UTHF1T.local>
References: <20210602135123.GD12753@C02TD0UTHF1T.local>
 <130ce34f-460a-0046-f722-00144f2d5502@samsung.com>
 <20210604100114.GC64162@C02TD0UTHF1T.local>
 <0d10411d-49fe-fbca-0479-e2983af16aa8@samsung.com>
 <20210607120118.GC97489@C02TD0UTHF1T.local>
 <20210607130859.GD97489@C02TD0UTHF1T.local>
 <20210607133953.GB7330@willie-the-truck>
 <CAK8P3a0sj0qtC0VpQv4+Ah-C8jyZaGgfqsx326mChuW+e5mvrQ@mail.gmail.com>
 <20210607151740.moncryl5zv3ahq4s@gilmour>
 <CAK8P3a3h=gOBFB6dRpg93jC7iZOo0f+FxYe0=QsY03fadVPq7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3h=gOBFB6dRpg93jC7iZOo0f+FxYe0=QsY03fadVPq7Q@mail.gmail.com>
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
Cc: emma@anholt.net, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Will Deacon <will@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>,
 Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 05:50:57PM +0200, Arnd Bergmann wrote:
> On Mon, Jun 7, 2021 at 5:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Mon, Jun 07, 2021 at 03:57:41PM +0200, Arnd Bergmann wrote:
> > > On Mon, Jun 7, 2021 at 3:39 PM Will Deacon <will@kernel.org> wrote:
> > > > On Mon, Jun 07, 2021 at 02:08:59PM +0100, Mark Rutland wrote:
> > > > > On Mon, Jun 07, 2021 at 01:01:18PM +0100, Mark Rutland wrote:
> > > > > > On Mon, Jun 07, 2021 at 11:58:32AM +0200, Marek Szyprowski wrote:
> > > I notice that it checks index 'fifos_state[channel].in_use', but then
> > > uses a different index 'i' for looking at the 'pending_commit' field
> > > beyond the end of the array.
> > >
> > > This code was introduced by Maxime Ripard in commit 9ec03d7f1ed3
> > >  ("drm/vc4: kms: Wait on previous FIFO users before a commit").
> >
> > Awesome, I tried to find out that bug a few weeks ago but couldn't
> > reproduce the KASAN spat. You're right, it should be channel here
> > instead of i. Since you did the whole work, do you want to send the
> > patch?
> 
> Marek and Mark did most of the work finding the problem, I just looked
> in the right place a few times (and a bit in the wrong place). I'd suggest
> you send that patch with the corresponding Reported-by/Analyzed-by/
> Tested-by tags.

I've sent:

https://lore.kernel.org/r/20210608085513.2069-1-mark.rutland@arm.com

Thanks,
Mark.
