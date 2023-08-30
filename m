Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283DA78D663
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFB710E475;
	Wed, 30 Aug 2023 14:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F49010E475
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:07:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B00BB660725E;
 Wed, 30 Aug 2023 15:06:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693404419;
 bh=A3VDCwRgVDh2cgHqZsgWxTKSX9l2JJRyQqQ+6OAQ9Sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X0AjblGvYvr8w3ahsdj6QEozMSx2qI0VKiEsRVz10byvi82ahuDsqHEwx8TDX+vIY
 WN7qn6iv+YmJKfpQ7YGjUgHUP7YY830Ws2M/tWimCThtnYZWZeWHSu5GvC2esXMDY1
 httsQiymRnau1HeFNNa1Yxx2wENzOca7GP6ZlD1RRhmvES1XdYdWpwkd+CVehSqSRT
 Jr+xMG8Q7U0IoKIJFIjRJjhyEmdEVQjnzyFblDZc+i6XUzYA4na7RWsEQCyHx7D7Ht
 OETu/6yu/KdWLaO607umanNlGeF2d94vxAn2ERtDs0Bl0A1e5sQvI/bFK3oPdpAqXD
 n8g8b1aBCrQYA==
Date: Wed, 30 Aug 2023 16:06:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 04/15] drm/panthor: Add the device logical block
Message-ID: <20230830160655.125f30f6@collabora.com>
In-Reply-To: <1a556763-dc7e-e20b-071c-cc379b7c6f8d@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-5-boris.brezillon@collabora.com>
 <73cbc1ea-5e2e-b201-b717-4ceef37e490d@arm.com>
 <20230829160035.1992834b@collabora.com>
 <1a556763-dc7e-e20b-071c-cc379b7c6f8d@arm.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Aug 2023 14:17:57 +0100
Steven Price <steven.price@arm.com> wrote:

> >>> +static void panthor_device_reset_work(struct work_struct *work)
> >>> +{
> >>> +	struct panthor_device *ptdev = container_of(work, struct panthor_device, reset.work);
> >>> +	int ret, cookie;
> >>> +
> >>> +	if (!drm_dev_enter(&ptdev->base, &cookie))
> >>> +		return;
> >>> +
> >>> +	panthor_sched_pre_reset(ptdev);
> >>> +	panthor_fw_pre_reset(ptdev, true);
> >>> +	panthor_mmu_pre_reset(ptdev);
> >>> +	panthor_gpu_soft_reset(ptdev);
> >>> +	panthor_gpu_l2_power_on(ptdev);
> >>> +	panthor_mmu_post_reset(ptdev);
> >>> +	ret = panthor_fw_post_reset(ptdev);
> >>> +	if (ret)
> >>> +		goto out;
> >>> +
> >>> +	atomic_set(&ptdev->reset.pending, 0);
> >>> +	panthor_sched_post_reset(ptdev);
> >>> +	drm_dev_exit(cookie);
> >>> +
> >>> +out:
> >>> +	if (ret) {    
> >>
> >> This looks like a race condition too - is there a need for a
> >> drm_dev_exit_and_unplug() function?  
> > 
> > drm_dev_exit() is just releasing the read-lock. drm_dev_unplug()
> > waits for all readers to be done and sets the unplugged value to true.
> > So we only get readers/writer synchronization here, but nothing doing
> > writer/writer sync. I guess the drm core leaves that to drivers, given
> > drm_dev_unplug() is usually called from xxx_driver->remove() hook, on
> > which serialization is guaranteed by the device-model.
> > 
> > TLDR; yes, it's racy, but I don't think drm_dev_exit_and_unplug() would
> > help solve the existing race.  
> 
> Yeah, I hadn't really thought through the reader/writer locks.
> 
> > It's worth noting that we currently have only 2 paths calling
> > panthor_device_unplug(): the platform_driver->remove() hook and the
> > reset worker. Calling drm_dev_unplug() might not be the right thing to
> > do, I just thought it was a good match to reflect the fact the device
> > becomes inaccessible, without adding yet another kind of device-lost
> > field.  
> 
> I quite liked the unplugged approach, it hides the complexities of the
> GPU breaking nicely.
> 
> However I do think this path needs fixing in some way, because of the
> "goto out" we end up calling panthor_device_unplug() while in the
> drm_dev_enter() section. Which, unless I'm mistaken, means
> panthor_device_unplug() will call drm_dev_unplug() in that section -
> which should produce a lockdep warning at the very least, if not an
> actual deadlock.
> 
> Given it's only a read lock - I think simply moving drm_dev_exit() below
> the "out:" label fixes the deadlock without making any races worse.

Oh, yeah, I didn't realize this is what you were complaining about. We
definitely need to move the out label before drm_dev_exit().

> Whether the race here actually matters I'm not sure.

It does if we want to be safe against removal. Maybe what we should do
instead is synchronize the reset work in the platform->remove() path,
and make sure it can't be scheduled after the synchronization happened.
This way we don't have to worry about concurrent calls to
panthor_device_unplug(), and we can keep the existing is_unplugged
check.


> >>> +
> >>> +/**
> >>> + * PANTHOR_IRQ_HANDLER() - Define interrupt handlers and the interrupt
> >>> + * registration function.
> >>> + *
> >>> + * The boiler-plate to gracefully deal with shared interrupts is
> >>> + * auto-generated. All you have to do is call PANTHOR_IRQ_HANDLER()
> >>> + * just after you actual handler. The handler prototype is:    
> >> s/you/your/ or probably s/you/the/ since we don't expect people to be
> >> adding more ;)
> >>  
> >>> + *
> >>> + * void (*handler)(struct panthor_device *, u32 status);
> >>> + */
> >>> +#define PANTHOR_IRQ_HANDLER(__name, __reg_prefix, __handler)					\
> >>> +static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)			\
> >>> +{												\
> >>> +	struct panthor_irq *pirq = data;							\
> >>> +	struct panthor_device *ptdev = pirq->ptdev;						\    
> >>
> >> Maybe I'm missing something, but I was expecting a check here for if the
> >> irq has been suspended and to avoid the register reads if it was.  
> > 
> > Thought the INT_MASK=0 + synchronize_irq() in panthor_xxx_irq_suspend()
> > would guarantee that the handler can't be called after
> > panthor_xxx_irq_suspend() was called.  
> 
> If the IRQ is shared then Linux doesn't know which device caused the
> interrupt, so another device's (shared) interrupt could cause our
> handler to be run.

Uh, that's correct. We definitely need to check the ->suspended value
before reading the register...

> 
> >> Otherwise I'm not entirely sure I follow what all this code is for.  
> > 
> > Not entirely sure which code we're talking about. The reason we
> > don't use the default raw IRQ handler is because it doesn't work if the
> > irq line is shared. In that case, we need to mask all interrupts to
> > make sure other handlers on the same irq line don't get spammed with
> > our IRQs.  
> 
> What I'm not following is why we need all this extra infrastructure for
> IRQs. The 'setting the mask to 0' during suspend is simple enough and
> could be included in code which now calls panthor_xxx_irq_suspend()
> (equally for restoring the mask on resume). But there's a loads more
> code here.

It's not just setting the mask to 0, but also making sure all pending
interrupts have been processed, otherwise we might have our threaded
handler called after we've supposedly suspended the IRQ (set _INT_MASK
to 0), which might trigger access to HW after it's been suspended. It's
pretty easy to forget to do things in the suspend/resume path, even if
those things are supposed to be trivial/obvious (I learnt it the hard
way). By having helpers, we reduce the risk of doing silly mistakes,
and we control that in a central place.

> 
> My initial thought when I looked at this was that you were trying to
> solve the issue of a shared IRQ where Mali might get powered off, but
> the IRQ is then triggered by another device. In that case touching the
> Mali registers would be problematic, so I was expecting some code in
> _irq_raw_handler() to check whether the IRQ couldn't possibly be for us
> (i.e. mask==0) and early out with IRQ_NONE. kbase has a concept like
> this "gpu_powered" for exactly this reason.

Yeah, that was one the goals, just didn't really think of that
case where the IRQ line is shared by different devices, not just the
GPU-related irqs being muxed on one line. In this case, the regs
are still accessible until the clk driving the APB interface is
disabled, which happens when all GPU irqs have been suspended.

> 
> But I can't see anything in the code to handle that case. And the
> "spamming" of other drivers during suspend shouldn't really happen
> (there's something odd going on if the hardware is generating interrupts
> when it's meant to be suspended).

The masking is here to make sure we don't receive interrupts after
calling synchronize_irq(). After that point, we just want to ignore any
IRQs until the device is resumed. As for spamming other drivers or
other GPU components, it can still happen between the moment we suspend
the IRQ, and the moment the device is actually shut down.

> 
> But maybe I'm just missing something - it's a while since I've dealt
> with interrupt code in Linux.

No, you're not missing anything, it's really just about irq
synchronization in the suspend/resume path, which might appear trivial
to you, but is very easy to get wrong in subtle ways.
