Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0777E342049
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 15:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410276EA39;
	Fri, 19 Mar 2021 14:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE1E6EA39;
 Fri, 19 Mar 2021 14:56:28 +0000 (UTC)
IronPort-SDR: 5wVcO7b/7vd/FRDueQK0VnyVjp/w4GwmEsgn5zLfL/TXaptzH6YTTWZXo0QPCeLFKiN9KDYd1x
 /zbKTdl0T5oA==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="209931456"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="209931456"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 07:56:27 -0700
IronPort-SDR: CPIoOIS9/BQ+JNpwVETXumFtv1On7ZiDEPUU7j446BOkA44fDRCiz/FNoNzli7RJxZC0UV7YyV
 0kPbFMOETPzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="450888778"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2021 07:56:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Mar 2021 16:56:24 +0200
Date: Fri, 19 Mar 2021 16:56:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Subject: Re: [PATCH] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <YFS7mINBWsHiYIKm@intel.com>
References: <20210302204132.12058-1-manasi.d.navare@intel.com>
 <20210303104744.2c064f09@eldfell>
 <20210303204433.GA15819@labuser-Z97X-UD5H>
 <20210304104223.6b3490bc@eldfell>
 <20210309005252.GA27491@labuser-Z97X-UD5H>
 <20210309111350.3be0543f@eldfell>
 <CAKMK7uEak_2YNDZpyho5bBhhYCvoXh6MoPNL6FmV9sU8oELGPA@mail.gmail.com>
 <20210318230126.GA1900@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318230126.GA1900@labuser-Z97X-UD5H>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 04:01:26PM -0700, Navare, Manasi wrote:
> So basically we see this warning only in case of bigjoiner when
> drm_atomic_check gets called without setting the state->allow_modeset fla=
g.

Considering the code is 'WARN(!state->allow_modeset, ...' that
fact should be rather obvious.

> =

> So do you think that in i915, in intel_atomic_check_bigjoiner() we should=
 only
> steal the crtc when allow_modeset flag is set in state?

No. If you fully read drm_atomic_check_only() you will observe
that it will reject any commit w/ allow_modeset=3D=3Dfalse which =

needs a modeset. And it does that before the WARN.

So you're barking up the wrong tree here. The problem I think
is that you're just computing requested_crtcs wrong.

> If we add this check there then the affected crtc wont count the slave cr=
tc
> and we wont get this warning.
> =

> Ville, Danvet?
> =

> Manasi
> =

> =

> On Tue, Mar 16, 2021 at 10:35:09PM +0100, Daniel Vetter wrote:
> > On Tue, Mar 9, 2021 at 10:14 AM Pekka Paalanen <ppaalanen@gmail.com> wr=
ote:
> > >
> > > On Mon, 8 Mar 2021 16:52:58 -0800
> > > "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> > >
> > > > On Thu, Mar 04, 2021 at 10:42:23AM +0200, Pekka Paalanen wrote:
> > > > > On Wed, 3 Mar 2021 12:44:33 -0800
> > > > > "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> > > > >
> > > > > > On Wed, Mar 03, 2021 at 10:47:44AM +0200, Pekka Paalanen wrote:
> > > > > > > On Tue,  2 Mar 2021 12:41:32 -0800
> > > > > > > Manasi Navare <manasi.d.navare@intel.com> wrote:
> > > > > > >
> > > > > > > > In case of a modeset where a mode gets split across mutiple=
 CRTCs
> > > > > > > > in the driver specific implementation (bigjoiner in i915) w=
e wrongly count
> > > > > > > > the affected CRTCs based on the drm_crtc_mask and indicate =
the stolen CRTC as
> > > > > > > > an affected CRTC in atomic_check_only().
> > > > > > > > This triggers a warning since affected CRTCs doent match re=
quested CRTC.
> > > > > > > >
> > > > > > > > To fix this in such bigjoiner configurations, we should only
> > > > > > > > increment affected crtcs if that CRTC is enabled in UAPI not
> > > > > > > > if it is just used internally in the driver to split the mo=
de.
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > I think that makes sense to me. Stealing CRTCs that are not c=
urrently
> > > > > > > used by the userspace (display server) should be ok, as long =
as that
> > > > > > > is completely invisible to userspace: meaning that it does no=
t cause
> > > > > > > userspace to unexpectedly e.g. receive or miss per-crtc atomic
> > > > > > > completion events.
> > > > > >
> > > > > > Yes since we are only doing atomic_check_only() here, the stolen
> > > > >
> > > > > But the real not-test-only commit will follow if this test-only c=
ommit
> > > > > succeeds, and keeping the guarantees for the real commit are impo=
rtant.
> > > >
> > > > Hmm well after the actual real commit, since the second crtc is sto=
len
> > > > even though it is not being used for the display output, it is
> > > > used for joiner so the uapi.enable will be true after the real comm=
it.
> > > >
> > > > so actually the assertion would fail in this case.
> > > >
> > > > @Ville @Danvet any suggestions here in that case?
> > =

> > That is very bad. We can't frob uapi state like that. I think that
> > calls for even more checks to make sure kms drivers who try to play
> > clever games don't get it wrong, so we probably need to check uapi
> > enable and active state in another mask before/after ->atomic_check
> > too. Or something like that.
> > =

> > > Hi,
> > >
> > > that is not what I was talking about, but sounds like you found a
> > > different problem. It seems like the problem you are talking about
> > > would be guaranteed to be hit if bigjoiner was used. Have you not
> > > tested this?
> > >
> > > However, I was talking about the real commit itself, not what happens
> > > on commits after it, see below.
> > >
> > > > > > crtc is completely invisible to the userspace and hence that is
> > > > > > indicated by uapi.enable which is not true for this stolen
> > > > > > crtc. However if allow modeset flag set, then it will do a full
> > > > > > modeset and indicate the uapi.enable for this stolen crtc as we=
ll
> > > > > > since that cannot be used for other modeset requested by usersp=
ace.
> > > > > >
> > > > > > >
> > > > > > > Can that also be asserted somehow, or does this already do th=
at?
> > > > > >
> > > > > > Not clear what you want the assertion for? Could you elaborate
> > > > >
> > > > > As assertion that when the real atomic commit happens and then
> > > > > completion events are fired, they match exactly the affected crtc=
s mask.
> > >
> > > This is my concern and a question, although like I say below, only
> > > tangential to this patch.
> > >
> > > However, as this patch aims to allow bigjoiner usage, naturally the
> > > question will arise whether the completion events then match what
> > > userspace expects or not. Userspace does not expect completion events
> > > referring to the stolen CRTCs.
> > =

> > Yeah we also must make sure that we don't send out events for these
> > additional crtc in bigjoiner usage. Sounds like igt testing didn't
> > catch this, I think we need a lot more igts here to make sure all
> > these surprises don't happen.
> > =

> > Plus maybe triple-checking that drm_atomic_uapi.c makes sure we can't
> > send out events for stuff that userspace didn't ask for.
> > -Daniel
> > =

> > >
> > > > > I understand this may be off-topic for this particular patch, but=
 since
> > > > > we are discussing the topic, such checks would be really nice. I'm
> > > > > curious if such checks already exist.
> > >
> > >
> > > Thanks,
> > > pq
> > >
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/drm_atomic.c | 6 ++++--
> > > > > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm=
/drm_atomic.c
> > > > > > > > index 5b4547e0f775..d7acd6bbd97e 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_atomic.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > > > > > > @@ -1358,8 +1358,10 @@ int drm_atomic_check_only(struct drm=
_atomic_state *state)
> > > > > > > >               }
> > > > > > > >       }
> > > > > > > >
> > > > > > > > -     for_each_new_crtc_in_state(state, crtc, new_crtc_stat=
e, i)
> > > > > > > > -             affected_crtc |=3D drm_crtc_mask(crtc);
> > > > > > > > +     for_each_new_crtc_in_state(state, crtc, new_crtc_stat=
e, i) {
> > > > > > > > +             if (new_crtc_state->enable)
> > > > > > > > +                     affected_crtc |=3D drm_crtc_mask(crtc=
);
> > > > > > > > +     }
> > > > > > > >
> > > > > > > >       /*
> > > > > > > >        * For commits that allow modesets drivers can add ot=
her CRTCs to the
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> > =

> > =

> > -- =

> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
