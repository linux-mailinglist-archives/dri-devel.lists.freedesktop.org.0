Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62234311350
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 22:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4EE6F4D5;
	Fri,  5 Feb 2021 21:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EC06F4D5;
 Fri,  5 Feb 2021 21:19:24 +0000 (UTC)
IronPort-SDR: tex09VGJAmWepSCDm5o1pDGU8r0AdALtIVQgXXi5EORkoyyrppTy8mRGYm7xaLCi17io3NY+tx
 9xflPQuiUhPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="181638050"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="181638050"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 13:19:23 -0800
IronPort-SDR: Q4NKSxVz9Ukp+kgY6p9tdLS2LRmJ+yifH+AlW9/jiW8S50pbNFgHDTOvkOOI0vGLjNhY+aOISt
 ZqwiNYoUJxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="360556851"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 05 Feb 2021 13:19:20 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Feb 2021 23:19:20 +0200
Date: Fri, 5 Feb 2021 23:19:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vblank: Avoid storing a timestamp for the same frame
 twice
Message-ID: <YB22V+n2bdIWrH2m@intel.com>
References: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
 <YBwTgHwZwMr8PwMr@phenom.ffwll.local> <YBwY8DZnrPNXYvfy@intel.com>
 <YB1oU6asAR3ki4ZT@phenom.ffwll.local> <YB1xKG317Zp7NogO@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YB1xKG317Zp7NogO@intel.com>
X-Patchwork-Hint: comment
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
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 06:24:08PM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Feb 05, 2021 at 04:46:27PM +0100, Daniel Vetter wrote:
> > On Thu, Feb 04, 2021 at 05:55:28PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Thu, Feb 04, 2021 at 04:32:16PM +0100, Daniel Vetter wrote:
> > > > On Thu, Feb 04, 2021 at 04:04:00AM +0200, Ville Syrjala wrote:
> > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > =

> > > > > drm_vblank_restore() exists because certain power saving states
> > > > > can clobber the hardware frame counter. The way it does this is
> > > > > by guesstimating how many frames were missed purely based on
> > > > > the difference between the last stored timestamp vs. a newly
> > > > > sampled timestamp.
> > > > > =

> > > > > If we should call this function before a full frame has
> > > > > elapsed since we sampled the last timestamp we would end up
> > > > > with a possibly slightly different timestamp value for the
> > > > > same frame. Currently we will happily overwrite the already
> > > > > stored timestamp for the frame with the new value. This
> > > > > could cause userspace to observe two different timestamps
> > > > > for the same frame (and the timestamp could even go
> > > > > backwards depending on how much error we introduce when
> > > > > correcting the timestamp based on the scanout position).
> > > > > =

> > > > > To avoid that let's not update the stored timestamp unless we're
> > > > > also incrementing the sequence counter. We do still want to update
> > > > > vblank->last with the freshly sampled hw frame counter value so
> > > > > that subsequent vblank irqs/queries can actually use the hw frame
> > > > > counter to determine how many frames have elapsed.
> > > > =

> > > > Hm I'm not getting the reason for why we store the updated hw vblank
> > > > counter?
> > > =

> > > Because next time a vblank irq happens the code will do:
> > > diff =3D current_hw_counter - vblank->last
> > > =

> > > which won't work very well if vblank->last is garbage.
> > > =

> > > Updating vblank->last is pretty much why drm_vblank_restore()
> > > exists at all.
> > =

> > Oh sure, _restore has to update this, together with the timestamp.
> > =

> > But your code adds such an update where we update the hw vblank counter,
> > but not the timestamp, and that feels buggy. Either we're still in the
> > same frame, and then we should story nothing. Or we advanced, and then =
we
> > probably want a new timestampt for that frame too.
> =

> Even if we're still in the same frame the hw frame counter may already
> have been reset due to the power well having been turned off. That is
> what I'm trying to fix here.
> =

> Now I suppose that's fairly unlikely, at least with PSR which probably
> does impose some extra delays before the power gets yanked. But at least
> theoretically possible.

Pondering about this a bit further. I think the fact that the current
code takes the round-to-closest approach I used for the vblank handler
is perhaps a bit bad. It could push the seq counter forward if we're
past the halfway point of a frame. I think that rounding behaviour
makes sense for the irq since those tick steadily and so allowing a bit
of error either way seems correct to me. Perhaps round-down might be
the better option for _restore(). Not quites sure, need more thinking
probably.

Another idea that came to me now is that maybe we should actually just
check if the current hw frame counter value looks sane, as in something
like:

diff_hw_counter =3D current_hw_counter-stored_hw_counter
diff_ts =3D (current_ts-stored_ts)/framedur

if (diff_hw_counter ~=3D diff_ts)
	diff =3D diff_hw_counter;
else
	diff =3D diff_ts;

and if they seem to match then just keep trusting the hw counter.
So only if there's a significant difference would we disregard
the diff of the hw counter and instead use the diff based on the
timestamps. Not sure what "significant" is though; One frame, two
frames?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
