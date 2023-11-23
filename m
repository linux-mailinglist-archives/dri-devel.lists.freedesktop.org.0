Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B987F5F9D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 13:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECF210E739;
	Thu, 23 Nov 2023 12:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E689910E73B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 12:59:38 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E4ECB66073A8;
 Thu, 23 Nov 2023 12:59:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700744377;
 bh=3Xr5mtXjBYuvRtwd13TkgbpC2/XlGPdDSal/R57xmnw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lNVloRbfl5T9+GS9EOBtK5fMu0JfRdtOslfzqNB9xnHZLa+6Hm+mkQiJMAAaJaZ7X
 prBcRAP8FFRdNkyfqaZBmcZpuWtMMmAZ500Z5yNadLfhvc5z+FCz8yOI2ctWYOHrBI
 RBEKN/HkGAXIHBbkLM19hNZE1MmkI4UJOXfXh3qwKYkXJB/wO6OGHdI/BCJSl+rJNA
 Gi+ZLyF540hQsyTa3nscBlb4bo72oK4IIVEJrqsaYmFokjpkT3g6UU9xU8ZNd9KF14
 6YIKB3rAukwLzVmFQ5l48Qqlcef0sJvWFxAaLESn066h4X/q+zmAE8o8NcctyvODov
 zTbE5xG19/gbg==
Date: Thu, 23 Nov 2023 13:59:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Message-ID: <20231123135933.34d643f7@collabora.com>
In-Reply-To: <1740797f-f3ae-4868-924a-08d6d731e506@collabora.com>
References: <20231123095320.41433-1-angelogioacchino.delregno@collabora.com>
 <20231123113530.46191ded@collabora.com>
 <1740797f-f3ae-4868-924a-08d6d731e506@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Nov 2023 12:15:01 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 23/11/23 11:35, Boris Brezillon ha scritto:
> > On Thu, 23 Nov 2023 10:53:20 +0100
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > wrote:
> >   
> >> Some SoCs may be equipped with a GPU containing two core groups
> >> and this is exactly the case of Samsung's Exynos 5422 featuring
> >> an ARM Mali-T628 MP6 GPU: the support for this GPU in Panfrost
> >> is partial, as this driver currently supports using only one
> >> core group and that's reflected on all parts of it, including
> >> the power on (and power off, previously to this patch) function.
> >>
> >> The issue with this is that even though executing the soft reset
> >> operation should power off all cores unconditionally, on at least
> >> one platform we're seeing a crash that seems to be happening due
> >> to an interrupt firing which may be because we are calling power
> >> transition only on the first core group, leaving the second one
> >> unchanged, or because ISR execution was pending before entering
> >> the panfrost_gpu_power_off() function and executed after powering
> >> off the GPU cores, or all of the above.
> >>
> >> Finally, solve this by changing the power off flow to
> >>   1. Mask and clear all interrupts: we don't need nor want any, as
> >>      we are polling PWRTRANS anyway;
> >>   2. Call synchronize_irq() after that to make sure that any pending
> >>      ISR is executed before powering off the GPU Shaders/Tilers/L2
> >>      hence avoiding unpowered registers R/W; and
> >>   3. Ignore the core_mask and ask the GPU to poweroff both core groups  
> > 
> > Could we split that in two patches? 1+2 in one patch, and 3 in another.
> > These are two orthogonal fixes IMO.
> >   
> 
> My initial idea was exactly that, but I opted for one patch doing 'em all
> because a "full fix" comprises all of 1+2+3: the third one without the
> first two and vice-versa may not fully resolve the issue that was seen
> on the HC1 board.

Guess it depends how you see it. I'd argue that these are 2 orthogonal
bugs, and the suspend fix might be worth backporting to older versions.

> 
> So, while I agree that it'd be slightly more readable as a diff if those
> were two different commits I do have reasons against splitting.....

If we just need a quick fix to avoid PWRTRANS interrupts from kicking
in when we power-off the cores, I think we'd be better off dropping 
GPU_IRQ_POWER_CHANGED[_ALL] from the value we write to GPU_INT_MASK
at [re]initialization time, and then have a separate series that fixes
the problem more generically.

> >> +	gpu_write(pfdev, GPU_INT_MASK, 0);
> >> +	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
> >> +
> >> +	/*
> >> +	 * Make sure that we don't have pending ISRs, otherwise we'll be
> >> +	 * reading and/or writing registers while the GPU is powered off
> >> +	 */
> >> +	synchronize_irq(pfdev->irq);  
> > 
> > Could we move that to a panfrost_gpu_suspend_irq() helper? I'm also not
> > sure making it part of panfrost_gpu_power_off() is a good idea. I'd
> > rather have this panfrost_gpu_suspend_irq() helper called from
> > panfrost_device_[runtime_]suspend(), along with
> > panfrost_{mmu,job}_suspend_irq().
> >   
> 
> Okay I will move that to a helper, but I still want to clarify:
>   - For JOB, we're checking if panfrost_job_is_idle() before trying
>     to runtime_suspend() (hence before trying to power off cores),
>     so implicitly no interrupt can fire I guess? Though there could
>     still be a pending ISR there too.... mmh. Brain ticking :-)

There's indeed no reason to see job interrupts if we're asked to enter
suspend, but it's mostly a matter of safety/correctness. If, as
expected, there's no pending interrupt, the write(_INT_MASK) +
synchronize_irq() should be relatively cheap.

>   - For MMU, we're not checking anything, but I guess that if there
>     is no job, the mmu can't be doing anything at all?
>     ...but then you also gave me the doubt about that one as well.

Same here, if we've properly flushed all jobs, and handled all pending
interrupts, we shouldn't end up with pending MMU irqs when we're asked
to suspend. But the extra mask+synchronize_irq() buys us extra safety.

> 
> What I think that would be sensible to do is to get this commit as
> a "clear" fix for the "Really power off" one, then have one or more
> additional commit(s) without any fixes tag to improve the IRQ suspend
> with the new mmu/job irq suspend helpers.

If you need a self-contained fix to avoid power transition interrupts
messing up with suspend, then, as I suggested, it might make more sense
to drop GPU_IRQ_POWER_CHANGED[_ALL] when writing GPU_INT_MASK, which
you want anyway, to avoid being interrupted when you do power
transitions.

> 
> Of course *this* commit would introduce the panfrost_gpu_suspend_irq()
> helper directly, instead of moving the logic to a helper in a later one.
> 
> Any reason against? :-)
> 
> >> +
> >> +	/* Now it's safe to request poweroff for Shaders, Tilers and L2 */  
> > 
> > It was safe before too, it's just that we probably don't want to be  
> 
> In theory yes, in practice the Odroid HC1 board crashed :-P

Just to be clear, it's not the accesses to the PWROFF/PWRTRANS
registers in this function that were causing the crash, it's the fact we
were writing to those regs, and leaving the corresponding interrupt
unprocessed before returning from panfrost_device[_runtime]_suspend().

> 
> P.S.: Joking! I understand what you're saying :-)

Okay, but the comment was still inaccurate :P.

> 
> > interrupted, if all we do is ignore the interrupts we receive, hence
> > the suggestion to not use GPU_IRQ_MASK_ALL, and only enable the
> > IRQs we care about instead.
> >   
> >> +	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
> >>   	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
> >>   					 val, !val, 1, 1000);
> >>   	if (ret)
> >> @@ -441,7 +451,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
> >>   	if (ret)
> >>   		dev_err(pfdev->dev, "tiler power transition timeout");
> >>   
> >> -	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);
> >> +	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);  
> > 
> > I really think we should have a helper doing the 'write(PWROFF_{LO,HI} +
> > poll(PWRTRANS_{LO,HI})' sequence, similar to what's done here [1][2],
> > such that, once we got it right for one block, we have it working for
> > all of them. And if there's a fix to apply, it automatically applies
> > to all blocks without having to fix the same bug in each copy.
> >   
> 
> ...technically yes, but practically this driver doesn't currently support any
> GPU that even fills the _LO registers.

Once we have a solution that works for all use cases, it can work for
the limited set we support at the moment :P.

> 
> I guess that we can do that later?

Sure, that was more of a follow-up patch suggestion.

> 
> That's just to (paranoidly) avoid any risk to introduce other regressions in
> this merge window, since we're fixing one that shouldn't have happened in the
> first place...

Agreed, but if that's the goal, then I'd go for the simpler change I
suggested above (dropping GPU_IRQ_POWER_CHANGED[_ALL] from the
interrupt mask altogether). This way you don't have to worry about
receiving power transition interrupts in the first place, and you also
save interrupt context switching time when you power on the various
blocks.

> 
> > Note that these panthor_gpu_block_power_{on,off}() helpers also handle
> > the case where power transitions are already in progress when you ask a
> > new power transition, which I don't think is checked in
> > panfrost_gpu_power_{off,on}().
> >   
> 
> I admit I didn't analyze the panthor driver - but here, the only power transitions
> that may happen are either because of panfrost_gpu_power_on(), or because of
> panfrost_gpu_power_off(), and both are polling and blocking... so from what I
> understand, there's no possibility to have "another" power transition happening
> while calling poweron, or poweroff.

Well yes, in theory there's no reason to have more than one transition
happening at a given time (that's assuming power transition never time
out, or if they do, the system gets back to an idle state before we try
to do the next power transition). It's just that, if it ever happens,
for any reason, we'd be safe against this unexpected situation, for a
cost that's relatively low (just an extra register read if things are in
the expected idle state).

Definitely not saying we should do that in this patch, but I think we
should do anything we can do to improve robustness, assuming the cost
of these extra checks is acceptable (we're not really in a fastpath
here).
