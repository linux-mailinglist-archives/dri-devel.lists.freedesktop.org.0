Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C641FD106
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 17:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F196E970;
	Wed, 17 Jun 2020 15:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08AE6E96C;
 Wed, 17 Jun 2020 15:30:43 +0000 (UTC)
IronPort-SDR: JW2uv6RINtynCfmNsfqWY/CIAWcUXUPEwSr5TbAXdlwbcl1bxNr/Zl3SKzhVGaihqesDNjtV7F
 PrGvKzDyR3fw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 08:30:43 -0700
IronPort-SDR: FhAnKMQ15C/1Vd/68hiK8SPvcJFr4/B2A3iu9OVMnoHzHYQBkrleKPYBhN2scQD1sbZDpEzxpf
 ipWvoOOQ+W3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="291458662"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 17 Jun 2020 08:30:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 17 Jun 2020 18:30:38 +0300
Date: Wed, 17 Jun 2020 18:30:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v3 1/5] drm/i915: Add enable/disable flip
 done and flip done handler
Message-ID: <20200617153038.GM6112@intel.com>
References: <20200528053931.29282-1-karthik.b.s@intel.com>
 <20200528053931.29282-2-karthik.b.s@intel.com>
 <0c4f01e093ad373bad5449ff01ae41df18e88d56.camel@intel.com>
 <CAKMK7uGHWqReNX9eUPpUyfgUtsNK2neT1wuK3C-tS1eBbDzX=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGHWqReNX9eUPpUyfgUtsNK2neT1wuK3C-tS1eBbDzX=g@mail.gmail.com>
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
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Karthik B S <karthik.b.s@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 11:58:10AM +0200, Daniel Vetter wrote:
> On Wed, Jun 10, 2020 at 03:33:06PM -0700, Paulo Zanoni wrote:
> > Em qui, 2020-05-28 =E0s 11:09 +0530, Karthik B S escreveu:
> > > Add enable/disable flip done functions and the flip done handler
> > > function which handles the flip done interrupt.
> > >
> > > Enable the flip done interrupt in IER.
> > >
> > > Enable flip done function is called before writing the
> > > surface address register as the write to this register triggers
> > > the flip done interrupt
> > >
> > > Flip done handler is used to send the page flip event as soon as the
> > > surface address is written as per the requirement of async flips.
> > > The interrupt is disabled after the event is sent.
> > >
> > > v2: -Change function name from icl_* to skl_* (Paulo)
> > >     -Move flip handler to this patch (Paulo)
> > >     -Remove vblank_put() (Paulo)
> > >     -Enable flip done interrupt for gen9+ only (Paulo)
> > >     -Enable flip done interrupt in power_well_post_enable hook (Paulo)
> > >     -Removed the event check in flip done handler to handle async
> > >      flips without pageflip events.
> > >
> > > v3: -Move skl_disable_flip_done out of interrupt handler (Paulo)
> > >     -Make the pending vblank event NULL in the begining of
> > >      flip_done_handler to remove sporadic WARN_ON that is seen.
> > >
> > > Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_display.c | 10 ++++
> > >  drivers/gpu/drm/i915/i915_irq.c              | 52 ++++++++++++++++++=
++
> > >  drivers/gpu/drm/i915/i915_irq.h              |  2 +
> > >  3 files changed, 64 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/g=
pu/drm/i915/display/intel_display.c
> > > index f40b909952cc..48cc1fc9bc5a 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -15530,6 +15530,13 @@ static void intel_atomic_commit_tail(struct =
intel_atomic_state *state)
> > >
> > >     intel_dbuf_pre_plane_update(state);
> > >
> > > +   for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> > > +           if (new_crtc_state->uapi.async_flip) {
> > > +                   skl_enable_flip_done(&crtc->base);
> > > +                   break;
> > > +           }
> > > +   }
> > > +
> > >     /* Now enable the clocks, plane, pipe, and connectors that we set=
 up. */
> > >     dev_priv->display.commit_modeset_enables(state);
> > >
> > > @@ -15551,6 +15558,9 @@ static void intel_atomic_commit_tail(struct i=
ntel_atomic_state *state)
> > >     drm_atomic_helper_wait_for_flip_done(dev, &state->base);
> > >
> > >     for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> > > +           if (new_crtc_state->uapi.async_flip)
> > > +                   skl_disable_flip_done(&crtc->base);
> > > +
> > >             if (new_crtc_state->hw.active &&
> > >                 !needs_modeset(new_crtc_state) &&
> > >                 !new_crtc_state->preload_luts &&
> > > diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i=
915_irq.c
> > > index efdd4c7b8e92..632e7b1deb87 100644
> > > --- a/drivers/gpu/drm/i915/i915_irq.c
> > > +++ b/drivers/gpu/drm/i915/i915_irq.c
> > > @@ -1295,6 +1295,23 @@ display_pipe_crc_irq_handler(struct drm_i915_p=
rivate *dev_priv,
> > >                          u32 crc4) {}
> > >  #endif
> > >
> > > +static void flip_done_handler(struct drm_i915_private *dev_priv,
> > > +                         unsigned int pipe)
> > > +{
> > > +   struct intel_crtc *crtc =3D intel_get_crtc_for_pipe(dev_priv, pip=
e);
> > > +   struct drm_crtc_state *crtc_state =3D crtc->base.state;
> > > +   struct drm_pending_vblank_event *e =3D crtc_state->event;
> > > +   struct drm_device *dev =3D &dev_priv->drm;
> > > +   unsigned long irqflags;
> > > +
> > > +   crtc_state->event =3D NULL;
> > > +
> > > +   spin_lock_irqsave(&dev->event_lock, irqflags);
> > > +
> > > +   drm_crtc_send_vblank_event(&crtc->base, e);
> >
> > I don't think this is what we want. With this, the events the Kernel
> > sends us all have the same sequence and timestamp. In fact, the IGT
> > test you submitted fails because of this.
> >
> > In my original hackish proof-of-concept patch I had changed
> > drm_update_vblank_count() to force diff=3D1 in order to always send
> > events and I also changed g4x_get_vblank_counter() to get the counter
> > from FLIPCOUNT (which updates every time there's a flip) instead of
> > FRMCOUNT (which doesn't seem to increment when you do async flips).
> > That is a drastic change, but the patch was just a PoC so I didn't care
> > about keeping anything else working.
> >
> > One thing that confused me a little bit when dealing the the
> > vblank/flip event interface from drm.ko is that "flips" and "vblanks"
> > seem to be changed interchangeably, which is confusing for async flips:
> > if you keep forever doing async flips in the very first few scanlines
> > you never actually reach the "vblank" period, yet you keep flipping
> > your frame. Then, what should your expectation regarding events be?
> =

> Hm vblank should keep happening I thought (this isn't VRR or DRRS or PSR
> where that changes), no idea why we can't keep sending out vblank
> interrupts.
> =

> Now flip events look maybe conflated in drm.ko code with vblank events
> since most of the time a flip complete happens at exactly the same time
> the vblank event. But for async flip this is not the case.
> =

> Probably worth it to have new helpers/function in drm_vblank.c for
> async flips, so that this is less confusing. Plus good documentation.

We're going to need three different ways to calculate the flip
timestamps: sync flip, vrr sync flip, async flip.

First one we handle just fine currently since we know know when
the timestamp was sampled and when the vblank ends so we can do
the appropriate correction.

VRR is going to be a bit more interesting since we don't really know how
long the vblank will be. I think we may have to use the frame timestamp
and current timestamp counter to first convert the monotonic timestamp
to correlate with the start of the vblank exit, and then we can move it
forward by the fixed (I think) length of the vblank exit procedure.

For async flip I think we may want to do something similar with the
flip done timestamp and current timestamp (apart from adding the
fixed length of the vblank exit procedure of course, since there
is no vblank exit). Although I'm not entirely sure what we should do
if we do the async flip during the vblank. If we want to maintain
that the timestamp always correlates with the first pixel actually
getting scanned out then we should still correct the timestamp to
point past the end of vblank. And even with the corrections there =

will be some amount of error due to the old data first having to
drain out of the FIFO. That error I think we're just going to
have to accept.

Not sure how much surgery all that is going to require to the vblank
timestamping code.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
