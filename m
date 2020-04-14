Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA11D1A8190
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 17:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762BA89A62;
	Tue, 14 Apr 2020 15:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DED989A62;
 Tue, 14 Apr 2020 15:11:33 +0000 (UTC)
IronPort-SDR: ih9ZlzJWyYLJbDxWstccOjXGgTBl5RZthBvNRNqGsPRqN0bBrxiNUGgDdnPe1gnObNDHJ2EPwB
 SZ3hFB8FAw0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 08:11:33 -0700
IronPort-SDR: sH96fvLLvntuBmGs2Ok3YBYavp7UoyL0c87itB/J04TdxlRFmjl6f7PyoACEhd4LtfZ8oNLsYh
 Pe9iTLdbaCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="245440789"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 14 Apr 2020 08:11:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Apr 2020 18:11:29 +0300
Date: Tue, 14 Apr 2020 18:11:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 15/17] drm/gma500: Stop using mode->private_flags
Message-ID: <20200414151129.GB6112@intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-16-ville.syrjala@linux.intel.com>
 <20200407185653.GL6356@ravnborg.org>
 <20200407190800.GO6112@intel.com>
 <20200407193537.GA28584@ravnborg.org>
 <20200409194952.GZ6112@intel.com>
 <20200409204743.GA29379@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409204743.GA29379@ravnborg.org>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 10:47:43PM +0200, Sam Ravnborg wrote:
> Hi Ville.
> =

> > > > > > index 264d7ad004b4..9e88a37f55e9 100644
> > > > > > --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> > > > > > +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> > > > > > @@ -132,6 +132,8 @@ struct psb_intel_sdvo {
> > > > > >  	/* DDC bus used by this SDVO encoder */
> > > > > >  	uint8_t ddc_bus;
> > > > > >  =

> > > > > > +	u8 pixel_multiplier;
> > > > > > +
> > > > > =

> > > > > There is really no good reason to use an u8 here.
> > > > =

> > > > Wastes less space.
> > > =

> > > When there is a good reason - use the size limited variants.
> > > But in this use case there is no reason to space optimize it.
> > =

> > IMO when it's stuffed into a structure there's no reason not to
> > optimize it. At some point it all starts to add up.
> > =

> > At least i915 suffers a lot from bloated structures (dev_priv
> > and atomic state structs being the prime examples) where we
> > could probably shave dozens if not hundreds of bytes if
> > everything just used the smallest type possible. In fact
> > this series does shave dozens of bytes from the crtc state
> > alone.
> =

> There is a difference between a structure used many times -
> And a structure used once or only a few times.
> If everyone started to optimize the types used, then we
> would end up with code that is hard to maintain.
> =

> The point here is that we have a structure allocated maybe
> once and a field assinged from a int - which using integer promotion
> is then stuffed into an u8. If we one day start to be clever and
> use values above 255 we need to find all the places where a
> u8 was used to optimize size of some random struct.

Never going to happen. The pixel multiplier can only have values <=3D4.
Also a lot of other things here are already size optimized (eg. the
ddc_bus which was even part of the patch context).

> =

> If this was a struct instantiated many times and used all over
> the story was another - but thats not the case here.

That would mostly lead to inconsistencies with the same thing
potentially using multiple different types between different
structs. IMO best to use the smallest type everywhere to make
things consistent. Also helps with refactoring when you don't
have to change types when moving things between structs.

> Here the principle of least suprises hold - do not change the type.
> =

> I try to explain the rationale behind the argument to use int.
> Feel free to disagree.
> =

> > =

> > > =

> > > When in the slightly pedantic mode, using u8 is not consistent.
> > > ddc_bus defined above usese uint8_t.
> > =

> > u8 & co. are preferred in kernel code. Checkpatch even complains when
> > you use the stdint types. The uint8_t here is some old leftovers.
> =

> Mixing coding practice makes code less readable, no matter
> the output of checkpatch.
> The right fix would be to update gma500 to migrate away from the
> stdint types. But that would be a sepearte patch for another day.

Have you actually looked at this file? It's already a mismash of both
types.

> =

> My orginal feedback on the patch has not changed.
> Feel free to move forward with the patch without my r-b.
> =

> 	Sam

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
