Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 308961A3B81
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 22:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FB46EC24;
	Thu,  9 Apr 2020 20:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFC46EC24;
 Thu,  9 Apr 2020 20:47:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8E9B820029;
 Thu,  9 Apr 2020 22:47:45 +0200 (CEST)
Date: Thu, 9 Apr 2020 22:47:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 15/17] drm/gma500: Stop using mode->private_flags
Message-ID: <20200409204743.GA29379@ravnborg.org>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-16-ville.syrjala@linux.intel.com>
 <20200407185653.GL6356@ravnborg.org>
 <20200407190800.GO6112@intel.com>
 <20200407193537.GA28584@ravnborg.org>
 <20200409194952.GZ6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409194952.GZ6112@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=WlxNldc-yDntvwyGQAkA:9 a=CjuIK1q_8ugA:10
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville.

> > > > > index 264d7ad004b4..9e88a37f55e9 100644
> > > > > --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> > > > > +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> > > > > @@ -132,6 +132,8 @@ struct psb_intel_sdvo {
> > > > >  	/* DDC bus used by this SDVO encoder */
> > > > >  	uint8_t ddc_bus;
> > > > >  
> > > > > +	u8 pixel_multiplier;
> > > > > +
> > > > 
> > > > There is really no good reason to use an u8 here.
> > > 
> > > Wastes less space.
> > 
> > When there is a good reason - use the size limited variants.
> > But in this use case there is no reason to space optimize it.
> 
> IMO when it's stuffed into a structure there's no reason not to
> optimize it. At some point it all starts to add up.
> 
> At least i915 suffers a lot from bloated structures (dev_priv
> and atomic state structs being the prime examples) where we
> could probably shave dozens if not hundreds of bytes if
> everything just used the smallest type possible. In fact
> this series does shave dozens of bytes from the crtc state
> alone.

There is a difference between a structure used many times -
And a structure used once or only a few times.
If everyone started to optimize the types used, then we
would end up with code that is hard to maintain.

The point here is that we have a structure allocated maybe
once and a field assinged from a int - which using integer promotion
is then stuffed into an u8. If we one day start to be clever and
use values above 255 we need to find all the places where a
u8 was used to optimize size of some random struct.

If this was a struct instantiated many times and used all over
the story was another - but thats not the case here.
Here the principle of least suprises hold - do not change the type.

I try to explain the rationale behind the argument to use int.
Feel free to disagree.

> 
> > 
> > When in the slightly pedantic mode, using u8 is not consistent.
> > ddc_bus defined above usese uint8_t.
> 
> u8 & co. are preferred in kernel code. Checkpatch even complains when
> you use the stdint types. The uint8_t here is some old leftovers.

Mixing coding practice makes code less readable, no matter
the output of checkpatch.
The right fix would be to update gma500 to migrate away from the
stdint types. But that would be a sepearte patch for another day.

My orginal feedback on the patch has not changed.
Feel free to move forward with the patch without my r-b.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
