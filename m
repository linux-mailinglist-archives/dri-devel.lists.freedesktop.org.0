Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890FA39E08C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 17:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6D189E47;
	Mon,  7 Jun 2021 15:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 06B3089E47
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 15:33:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 435B51042;
 Mon,  7 Jun 2021 08:33:03 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.4.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C0633F694;
 Mon,  7 Jun 2021 08:33:00 -0700 (PDT)
Date: Mon, 7 Jun 2021 16:32:47 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210607153247.GA6716@C02TD0UTHF1T.local>
References: <CGME20210602132541eucas1p17127696041c26c00d1d2f50bef9cfaf0@eucas1p1.samsung.com>
 <4d0c8318-bad8-2be7-e292-fc8f70c198de@samsung.com>
 <20210602135123.GD12753@C02TD0UTHF1T.local>
 <130ce34f-460a-0046-f722-00144f2d5502@samsung.com>
 <20210604100114.GC64162@C02TD0UTHF1T.local>
 <0d10411d-49fe-fbca-0479-e2983af16aa8@samsung.com>
 <20210607120118.GC97489@C02TD0UTHF1T.local>
 <20210607130859.GD97489@C02TD0UTHF1T.local>
 <20210607133953.GB7330@willie-the-truck>
 <CAK8P3a0sj0qtC0VpQv4+Ah-C8jyZaGgfqsx326mChuW+e5mvrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0sj0qtC0VpQv4+Ah-C8jyZaGgfqsx326mChuW+e5mvrQ@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 03:57:41PM +0200, Arnd Bergmann wrote:
> On Mon, Jun 7, 2021 at 3:39 PM Will Deacon <will@kernel.org> wrote:
> >
> > [Adding VC4 folks -- please see the KASAN splat below!]
> >
> > Background here is that reducing ARCH_DMA_MINALIGN to 64 on arm64 (queued in
> > -next) is causing vc4 to hang on Rpi3b due to a probable driver bug.
> 
> The great news for the patch that caused it is that this has nothing to
> do with DMA alignment.
> 
> > On Mon, Jun 07, 2021 at 02:08:59PM +0100, Mark Rutland wrote:
> > > On Mon, Jun 07, 2021 at 01:01:18PM +0100, Mark Rutland wrote:
> > > > On Mon, Jun 07, 2021 at 11:58:32AM +0200, Marek Szyprowski wrote:
> 
> > > [    3.728042] BUG: KASAN: slab-out-of-bounds in vc4_atomic_commit_tail+0x1cc/0x910
> > > [    3.728123] Read of size 8 at addr ffff000007360440 by task kworker/u8:0/7
> 
> This is offset 0x40 into struct vc4_hvs_state, which is the
> 'pending_commit' pointer
> for the array index 4, i.e. one after the end of the structure.
> 
> > > [    3.728495]  kasan_report+0x1dc/0x240
> > > [    3.728529]  __asan_load8+0x98/0xd4
> > > [    3.728565]  vc4_atomic_commit_tail+0x1cc/0x910
> 
> It seems to be this loop:
> 
>         for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
>                 struct vc4_crtc_state *vc4_crtc_state =
>                         to_vc4_crtc_state(old_crtc_state);
>                 unsigned int channel = vc4_crtc_state->assigned_channel;
>                 int ret;
> 
>                 if (channel == VC4_HVS_CHANNEL_DISABLED)
>                         continue;
> 
>                 if (!old_hvs_state->fifo_state[channel].in_use)
>                         continue;
> 
>                 ret =
> drm_crtc_commit_wait(old_hvs_state->fifo_state[i].pending_commit);
>                 if (ret)
>                         drm_err(dev, "Timed out waiting for commit\n");
>         }
> 
> I notice that it checks index 'fifos_state[channel].in_use', but then
> uses a different index 'i' for looking at the 'pending_commit' field
> beyond the end of the array.

FWIW, with that drm_crtc_commit_wait() call changed to:

| ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[channel].pending_commit);

... I no longer see a KASAN splat, and I no longer see a hang with
ARCH_DMA_MINALIGN reduced to 64.

Thanks,
Mark.

> 
> This code was introduced by Maxime Ripard in commit 9ec03d7f1ed3
>  ("drm/vc4: kms: Wait on previous FIFO users before a commit").
> 
>     Arnd
