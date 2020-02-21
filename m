Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF85516816E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 16:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D53E6F47B;
	Fri, 21 Feb 2020 15:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172256F47B;
 Fri, 21 Feb 2020 15:23:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20303838-1500050 for multiple; Fri, 21 Feb 2020 15:23:40 +0000
MIME-Version: 1.0
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAKMK7uFXimzbimax1XFkA+7wXNkT6x=_37PxO2UEiZqr3fy5Yg@mail.gmail.com>
References: <20200221143820.2795039-1-chris@chris-wilson.co.uk>
 <CAKMK7uFXimzbimax1XFkA+7wXNkT6x=_37PxO2UEiZqr3fy5Yg@mail.gmail.com>
Message-ID: <158229861825.6499.16164240955598458642@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] dma-buf: Precheck for a valid dma_fence before acquiring
 the reference
Date: Fri, 21 Feb 2020 15:23:38 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-02-21 15:17:24)
> On Fri, Feb 21, 2020 at 3:38 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > dma_fence_get_rcu() is used to acquire a reference to under a dma-fence
> > under racey conditions -- a perfect recipe for a disaster. As we know
> > the caller may be handling stale memory, use kasan to confirm the
> > dma-fence, or rather its memory block, is valid before attempting to
> > acquire a reference. This should help us to more quickly and clearly
> > identify lost races.
> 
> Hm ... I'm a bit lost on the purpose, and what this does. Fences need
> to be rcu-freed, and I have honestly no idea how kasan treats those.
> Are we throwing false positives, because kasan thinks the stuff is
> freed, but we're still accessing it (while the grace period hasn't
> passed, so anything freed is still guaranteed to be at least in the
> slab cache somewhere).
> 
> I'm not seeing how this catches lost races quicker, since the refcount
> should get to 0 way before we get to the kfree. So the refcount check
> on the next line should catch strictly more races than the kasan
> check.

It's not about the fence itself, but those pointing to the fence. That's
where we may find garbage, and by returning NULL the kernel keeps
working for a bit longer as you try to piece together the race.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
