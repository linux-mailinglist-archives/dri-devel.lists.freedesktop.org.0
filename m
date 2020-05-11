Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3D1CDAC0
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 15:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6836E45F;
	Mon, 11 May 2020 13:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF196E459;
 Mon, 11 May 2020 13:05:45 +0000 (UTC)
IronPort-SDR: 66nntVXWFwjQPiXUWU8fJ8SSfCWAe+ikVnmuB+nfGxlIZHuiQPW3mhEtyUnBSyBn4foBI827Rz
 OllqbB8y/J9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 06:05:16 -0700
IronPort-SDR: czWtYUcdtIzQmDbozwO30CWXEpq19bMYy+nvT1MOlTO3jsfBOQVEdoX89iVavUbcNSRHmk84Eg
 Pwxa6QIDFK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; d="scan'208";a="250542938"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 11 May 2020 06:05:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 11 May 2020 16:05:07 +0300
Date: Mon, 11 May 2020 16:05:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Fix page flip ioctl format check
Message-ID: <20200511130507.GK6112@intel.com>
References: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
 <20200417152310.GQ3456981@phenom.ffwll.local>
 <20200417154313.GO6112@intel.com>
 <CAKMK7uGBWyPtm0dva=Ndk6xJx7nUKJ20kn8S37iFB8s85WWmdw@mail.gmail.com>
 <20200417182834.GS6112@intel.com>
 <20200508170840.GE1219060@intel.com>
 <CAKMK7uHm+CmM6noHbMnmW9bSzk0dZ=9-CTpu+hxUwFbXmMkZ4g@mail.gmail.com>
 <20200511123715.GI6112@intel.com>
 <CAKMK7uFxObdsNM7PETpipr0AJs_qfTY8NEpQ6M+x9NPC5gUuEg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFxObdsNM7PETpipr0AJs_qfTY8NEpQ6M+x9NPC5gUuEg@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 02:41:13PM +0200, Daniel Vetter wrote:
> On Mon, May 11, 2020 at 2:37 PM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Sat, May 09, 2020 at 12:13:02PM +0200, Daniel Vetter wrote:
> > > On Fri, May 8, 2020 at 7:09 PM Rodrigo Vivi <rodrigo.vivi@intel.com> =
wrote:
> > > >
> > > > On Fri, Apr 17, 2020 at 09:28:34PM +0300, Ville Syrj=E4l=E4 wrote:
> > > > > On Fri, Apr 17, 2020 at 08:10:26PM +0200, Daniel Vetter wrote:
> > > > > > On Fri, Apr 17, 2020 at 5:43 PM Ville Syrj=E4l=E4
> > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > >
> > > > > > > On Fri, Apr 17, 2020 at 05:23:10PM +0200, Daniel Vetter wrote:
> > > > > > > > On Thu, Apr 16, 2020 at 08:04:20PM +0300, Ville Syrjala wro=
te:
> > > > > > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > > > > >
> > > > > > > > > Revert back to comparing fb->format->format instead fb->f=
ormat for the
> > > > > > > > > page flip ioctl. This check was originally only here to d=
isallow pixel
> > > > > > > > > format changes, but when we changed it to do the pointer =
comparison
> > > > > > > > > we potentially started to reject some (but definitely not=
 all) modifier
> > > > > > > > > changes as well. In fact the current behaviour depends on=
 whether the
> > > > > > > > > driver overrides the format info for a specific format+mo=
difier combo.
> > > > > > > > > Eg. on i915 this now rejects compression vs. no compressi=
on changes but
> > > > > > > > > does not reject any other tiling changes. That's just inc=
onsistent
> > > > > > > > > nonsense.
> > > > > > > > >
> > > > > > > > > The main reason we have to go back to the old behaviour i=
s to fix page
> > > > > > > > > flipping with Xorg. At some point Xorg got its atomic rig=
hts taken away
> > > > > > > > > and since then we can't page flip between compressed and =
non-compressed
> > > > > > > > > fbs on i915. Currently we get no page flipping for any ga=
mes pretty much
> > > > > > > > > since Mesa likes to use compressed buffers. Not sure how =
compositors are
> > > > > > > > > working around this (don't use one myself). I guess they =
must be doing
> > > > > > > > > something to get non-compressed buffers instead. Either t=
hat or
> > > > > > > > > somehow no one noticed the tearing from the blit fallback.
> > > > > > > >
> > > > > > > > Mesa only uses compressed buffers if you enable modifiers, =
and there's a
> > > > > > > > _loooooooooooot_ more that needs to be fixed in Xorg to ena=
ble that for
> > > > > > > > real. Like real atomic support.
> > > > > > >
> > > > > > > Why would you need atomic for modifiers? Xorg doesn't even ha=
ve
> > > > > > > any sensible framework for atomic and I suspect it never will.
> > > > > >
> > > > > > Frankly if no one cares about atomic in X I don't think we shou=
ld do
> > > > > > work-arounds for lack of atomic in X.
> > > > > >
> > > > > > > > Without modifiers all you get is X tiling,
> > > > > > > > and that works just fine.
> > > > > > > >
> > > > > > > > Which would also fix this issue here you're papering over.
> > > > > > > >
> > > > > > > > So if this is the entire reason for this, I'm inclined to n=
ot do this.
> > > > > > > > Current Xorg is toast wrt modifiers, that's not news.
> > > > > > >
> > > > > > > Works just fine. Also pretty sure modifiers are even enabled =
by
> > > > > > > default now in modesetting.
> > > > > >
> > > > > > Y/CSS is harder to scan out, you need to verify with TEST_ONLY =
whether
> > > > > > it works. Otherwise good chances for some oddball black screens=
 on
> > > > > > configurations that worked before. Which is why all non-atomic
> > > > > > compositors reverted modifiers by default again.
> > > > >
> > > > > Y alone is hard to scanout also, and yet we do nothing to reject =
that.
> > > > > It's just an inconsistent mess.
> > > > >
> > > > > If we really want to keep this check then we should rewrite it
> > > > > to be explicit:
> > > > >
> > > > > if (old_fb->format->format !=3D new_fb->format->format ||
> > > > >     is_ccs(old_fb->modifier) !=3D is_ccs(new_fb->modifier))
> > > > >     return -EINVAL;
> > > > >
> > > > > Now it's just a random thing that may even stop doing what it's
> > > > > currently doing if anyone touches their .get_format_info()
> > > > > implementation.
> > > > >
> > > > > >
> > > > > > > And as stated the current check doesn't have consistent behav=
iour
> > > > > > > anyway. You can still flip between different modifiers as lon=
g a the
> > > > > > > driver doesn't override .get_format_info() for one of them. T=
he *only*
> > > > > > > case where that happens is CCS on i915. There is no valid rea=
son to
> > > > > > > special case that one.
> > > > > >
> > > > > > The thing is, you need atomic to make CCS work reliably enough =
for
> > > > > > compositors and distros to dare enabling it by default.
> > > > >
> > > > > If it's not enabled by default then there is no harm in letting p=
eople
> > > > > explicitly enable it and get better performance.
> > > > >
> > > > > > CCS flipping
> > > > > > works with atomic. I really see no point in baking this in with=
 as
> > > > > > uapi.
> > > > >
> > > > > It's just going back to the original intention of the check.
> > > > > Heck, the debug message doesn't even match what it's doing now.
> > > > >
> > > > > > Just fix Xorg.
> > > > >
> > > > > Be serious. No one is going to rewrite all the randr code to be a=
tomic.
> > > >
> > > > I fully understand Daniel's concern here, but I also believe this w=
on't be
> > > > done so soon at least. Meanwhile would it be acceptable to have a c=
omment
> > > > with the code /* XXX: Xorg blah... */ or /* FIXME: After Xorg blah.=
. */
> > > > ?
> > >
> > > Here's a few numbers:
> > >
> > > - skl shipped in Aug 2015, so about 5 years. Since then would we like
> > > to have modifiers enabled for intel, because it costs us quite a bit
> > > of performance. This isn't new at all.
> > > - the last Xorg release is from May 2018, so two years. Meanwhile even
> > > patches to fix some of the atomic mixups in -modesetting landed, but
> > > they never shipped so not useful.
> > > - I spent a few hours (which really is nothing) reading Xorg code
> > > yesterday, and I concur with Daniel Stone's napkin estimate that this
> > > will take about half to one year to fix properly. It's not happening,
> > > no one is working on that.
> > >
> > > Conclusion: No one cares about modifiers on Xorg-modesetting. I don't
> > > see why the kernel should bend over for that.
> > >
> > > Once that has changed (I'm not betting on that) and there's clear
> > > effort behind modifiers for Xorg-modesetting I guess we can look into
> > > stop-gap measures, but meanwhile the best imo is to not disturb the
> > > dead.
> >
> > The alternative interpretation is that the current kernel code is
> > just nonsense, and since no one is depending on the current nonsense
> > behaviour we can safely change it it back to make sense.
> >
> > Would allow people to at least test modifier plumbing via dri3/etc.
> > Also those of us who know what they're doing and want to actually
> > play games on Intel GPUs can flip it on for a a bit extra performance.
> > In the meantime I'll just have to keep carrying this patch in my own
> > kernels.
> =

> You can also carry a one-liner for -modesetting to re-enable atomic on
> master (it's fixed up there, simply never released, why we've had to
> take it away). And then you can also play with modifiers.

Nah. I prefer to carry the obviously corect fix rather than something
that may or may not have unknown issues.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
