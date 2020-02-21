Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00CC16839C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 17:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAD96F4CA;
	Fri, 21 Feb 2020 16:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8BA6F4CA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 16:34:48 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id r137so2153668oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdEVxs74jaJmAVPZOZQHibitddc7RX4aMXTN+1q3DTc=;
 b=PwiIpc6w96psNxw4BznrAZvgej4mI4G3a7yaWkK9R22MKvf0sHEHO0dIoIi26RC/w6
 bfafz3qNuDntaqP0VAWBZtCOC1Mohd8NQg6yp5dFy+RK+LgjPf6sswU3Rya5Ifz1oV6H
 bJdxXZeChI3v7I+R+t1XaA+z6dLKpGVxRyNLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdEVxs74jaJmAVPZOZQHibitddc7RX4aMXTN+1q3DTc=;
 b=EA56A0q61LBjjqQYR/BksBKwwS27Jf3kUONe7MPqBz7R4QQoZ8G4XuLqYMIK6ss2uA
 lP7zbqPdsr09A1+JbGMktio5ae/X8b0Ov9xnWCkSzypmlRsYCtp6p/7o1hXt7Zosq8Nw
 yvb0+xe7C1eobUZ8ZDwQ5vPcmy+JVbMcdDRuj4NUs74L/Uy73bV07UdCehXlUQoXXTjf
 3pn5Kx+xgm+eGFETe0u1LAyUB/zQL7ezK7C5H4TlDaM83HPv4Rc1Ilp9wrE6Ly2MYucf
 iCyiGHdpRO/RomfrvqWFeI+hQK1h0pyAnu6jUjg8HYmPNWDwbA8IkwMyPdnDSo6K3Pz5
 y3TQ==
X-Gm-Message-State: APjAAAVTH6tqO/EyqdqPbiiO/ZVcDYSEuSkAA/5OD1x41XKiyqUVJwbz
 gl1DVZuBROnqQN/FVK62PwzfcPaJNkOYF2NRUavIxg==
X-Google-Smtp-Source: APXvYqxypeA9is1s++3ZSKr8irahI0cEQMof4Gat/6/7FPFmY7bfUIBpdmbVDuOqgsBPws1vVMvbLJBMyZiYsl94xIA=
X-Received: by 2002:a05:6808:10b:: with SMTP id
 b11mr2751811oie.110.1582302887403; 
 Fri, 21 Feb 2020 08:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20200221143820.2795039-1-chris@chris-wilson.co.uk>
 <CAKMK7uFXimzbimax1XFkA+7wXNkT6x=_37PxO2UEiZqr3fy5Yg@mail.gmail.com>
 <158229861825.6499.16164240955598458642@skylake-alporthouse-com>
 <158229878618.7320.16836848993505012054@skylake-alporthouse-com>
In-Reply-To: <158229878618.7320.16836848993505012054@skylake-alporthouse-com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 21 Feb 2020 17:34:35 +0100
Message-ID: <CAKMK7uGghdvPuhEE67oD5S+3Mb=uc+gP9wMoFCapiED2QTPx+Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Precheck for a valid dma_fence before acquiring
 the reference
To: Chris Wilson <chris@chris-wilson.co.uk>
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

On Fri, Feb 21, 2020 at 4:26 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Chris Wilson (2020-02-21 15:23:38)
> > Quoting Daniel Vetter (2020-02-21 15:17:24)
> > > On Fri, Feb 21, 2020 at 3:38 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > > dma_fence_get_rcu() is used to acquire a reference to under a dma-fence
> > > > under racey conditions -- a perfect recipe for a disaster. As we know
> > > > the caller may be handling stale memory, use kasan to confirm the
> > > > dma-fence, or rather its memory block, is valid before attempting to
> > > > acquire a reference. This should help us to more quickly and clearly
> > > > identify lost races.
> > >
> > > Hm ... I'm a bit lost on the purpose, and what this does. Fences need
> > > to be rcu-freed, and I have honestly no idea how kasan treats those.
> > > Are we throwing false positives, because kasan thinks the stuff is
> > > freed, but we're still accessing it (while the grace period hasn't
> > > passed, so anything freed is still guaranteed to be at least in the
> > > slab cache somewhere).
> > >
> > > I'm not seeing how this catches lost races quicker, since the refcount
> > > should get to 0 way before we get to the kfree. So the refcount check
> > > on the next line should catch strictly more races than the kasan
> > > check.
> >
> > It's not about the fence itself, but those pointing to the fence. That's
> > where we may find garbage, and by returning NULL the kernel keeps
> > working for a bit longer as you try to piece together the race.
>
> Plus given all the inlining, the kasan warning for the refcount is not
> that clear about where it is called from, which is a bit of a nuisance,
> so an explicit warning was much easier for finding the culprit.

Hm ok, that makes a lot more sense. Can you pls amend the commit
message (paste the above if you feel uninspired, this discussion
explains pretty good what's the point). And maybe a link to bug report
or include an example splat and how it's improved.

With that stuff added Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But maybe get another co-conspirator/bug-hunter to ack this too.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
