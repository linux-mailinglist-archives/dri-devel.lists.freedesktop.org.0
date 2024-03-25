Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E9188ACE0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 19:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8572710E9F4;
	Mon, 25 Mar 2024 18:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Mk2OecYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5476610E9F4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711389735;
 bh=nYbdZ4ictZQFx6vln0lyu+bABuGInDpvS+wUKxsDtBk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Mk2OecYHZnEYB8KeMj5fwnRlI/G71So6ghfOEKkaj/ZSwEgwIgVp0smSKUUc7+2MN
 Ef49/yKeuD4R3rJeDqUXuKn59WLOf9U3UY4RHuZAHmedd/5xcSGxaQgOVraeef0bfL
 KMSzKG3bQuU0wrUhvgFYf6F3C5jwEmQNc+uhtZGLhZFYl7dXdw4QsXgq6VY9GGrX+d
 sFaNeWVJAM6N5rhGJ9E1VhABuDAQM+0PbcfdqBzO0X4QXXcGMFCInsjh5pDcbtROlc
 ylAGf/2S8Zoh3EJOZ2nyohY8WOY3+Hj8FB43bsNwtHnyULET4V1lLF/bgogPXDgggT
 ABJoHgChqI9YQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0383A37810C0;
 Mon, 25 Mar 2024 18:02:14 +0000 (UTC)
Date: Mon, 25 Mar 2024 19:02:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 2/3] drm/panthor: Fix ordering in _irq_suspend()
Message-ID: <20240325190213.6393be47@collabora.com>
In-Reply-To: <ZgGxYOJxeb3EAO6s@e110455-lin.cambridge.arm.com>
References: <20240325135705.3717293-1-boris.brezillon@collabora.com>
 <20240325135705.3717293-2-boris.brezillon@collabora.com>
 <ZgGxYOJxeb3EAO6s@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Mar 2024 17:16:16 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Mon, Mar 25, 2024 at 02:57:04PM +0100, Boris Brezillon wrote:
> > Make sure we set suspended=true last to avoid generating an irq storm
> > in the unlikely case where an IRQ happens between the suspended=true
> > assignment and the _INT_MASK update.
> > 
> > v2:
> > - New patch
> > 
> > Reported-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index 7ee4987a3796..3a930a368ae1 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -325,7 +325,7 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
> >  {												\
> >  	int cookie;										\
> >  												\
> > -	atomic_set(&pirq->suspended, true);							\
> > +	pirq->mask = 0;										\  
> 
> I think you might still have a race between _irq_suspend() and _irq_threaded_handler() where the
> status will be zero due to pirq->mask being zero, so no interrupt will be cleared but they will
> be masked (kind of the opposite problem to patch 3/3).

Right, but I'm trying to find a case where this is an issue. Yes, we
might lose events, but at the same time, when _irq_suspend() is called,
we are supposed to be idle, so all this mask=0 assignment does is
speed-up the synchronization with the irq-thread. If there's anything
we need to be done before suspending the IRQ, this should really use
its own synchronization model.

> 
> I'm starting to think that pirq->mask should be local to _irq_threaded_handler() and not be messed
> with in the other functions.

It kinda is, as we don't modify panthor_irq::mask outside the
suspend/resume (and now unplug) path, and each of these accesses has a
reason to exist:

- in the resume path, we know all IRQs are masked, and we reset the
  SW-side mask to the interrupts we want to accept before updating
  _INT_MASK. No risk of race in that one
- in the unplug path, I don't think we care about unhandled interrupts,
  because the device will become unusable after that point, so updating
  the panthor_irq::mask early and losing events should be okay.
- the suspend case has been described above. As explained, I don't think
  it matters if we lose events there, because really, if there's any
  synchronization needed, it should have happened explicitly before
  _irq_suspend() is called. The synchronize_irq() we have is just here
  to make sure there's nothing accessing registers when we turn the
  device clk/power-domain off.

> 
> >  												\
> >  	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
> >  		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\  
> 
> If you move the line above before the if condition, do you still need patch 3/3?

The whole point of the drm_dev_enter/exit() section was to prevent
access to registers after the device has been unplugged, so, if I move
the gpu_write() outside of this block, I'd rather drop the entire
drm_dev_enter/exit() section (both here and in _irq_resume()). That
should be safe actually, as I don't expect the PM hooks or the reset
handler to be called after the device and its resource have been
removed, and those are the two only paths where _irq_suspend/resume()
can be called.
