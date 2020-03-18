Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014418A0CC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 17:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7757D6E924;
	Wed, 18 Mar 2020 16:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE676E924;
 Wed, 18 Mar 2020 16:44:57 +0000 (UTC)
IronPort-SDR: tm6OXW2IvDvDu7AE2vMfyU0Eo30PJp6MR9MdfgCcG2TCrdvasOS1S6+oqjDGfAYhLQDRKK7J0k
 FkcQ1UyevXVA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 09:44:56 -0700
IronPort-SDR: IPHt9AiSbOSES09fNIWAdVVjc4cApX7UhJqkYw9mQyM1rQwwSM/JeHBBlhOxkO4xR5NTxWnX09
 6a257n7NNGUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="279794127"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 18 Mar 2020 09:44:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Mar 2020 18:44:52 +0200
Date: Wed, 18 Mar 2020 18:44:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 7/7] drm: Allow drivers to leave
 encoder->possible_crtcs==0
Message-ID: <20200318164452.GB13686@intel.com>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <20200211162208.16224-8-ville.syrjala@linux.intel.com>
 <20200211170545.GN2363188@phenom.ffwll.local>
 <20200211171450.GZ13686@intel.com>
 <20200212090755.GP2363188@phenom.ffwll.local>
 <20200212090849.GQ2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212090849.GQ2363188@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 10:08:49AM +0100, Daniel Vetter wrote:
> On Wed, Feb 12, 2020 at 10:07:55AM +0100, Daniel Vetter wrote:
> > On Tue, Feb 11, 2020 at 07:14:51PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Tue, Feb 11, 2020 at 06:05:45PM +0100, Daniel Vetter wrote:
> > > > On Tue, Feb 11, 2020 at 06:22:08PM +0200, Ville Syrjala wrote:
> > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > =

> > > > > Let's simplify life of driver by allowing them to leave
> > > > > encoder->possible_crtcs unset if they have no restrictions
> > > > > in crtc<->encoder linkage. We'll just populate possible_crtcs
> > > > > with the full crtc mask when registering the encoder so that
> > > > > userspace doesn't have to deal with drivers not populating
> > > > > this correctly.
> > > > > =

> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > ---
> > > > > We might not actually need/want this, but included it here for
> > > > > future reference if that assumption turns out to be wrong.
> > > > =

> > > > I think this one is most definitely needed. _Lots_ of drivers get t=
his
> > > > toally wrong and just leave the value blank. It's encoded as offici=
al
> > > > fallback in most userspace compositors.
> > > =

> > > OK. It's been a while since I dug around so can't really remmber how
> > > this was being handled. I'll reorder before pushing.
> > =

> > Hm otoh having "works with all crtcs" as default is a bit dangerous,
> > whereas the "cannot be cloned" default for possible_clones is perfectly
> > safe.
> > =

> > So now I'm kinda not sure whether this is a bright idea, and we shouldn=
't
> > just eat the cost of fixing up all the various WARNING backtraces your
> > previous patch triggers. I've done a full review and the following look
> > suspect:
> > =

> > - tegara/sor.c Strangely it's the only one, the other output drivers do
> >   seem to set the possible_crtcs mask to something useful.
> =

> Strike that, it sets it using tegra_output_find_possible_crtcs().
> =

> I think everything is good and we really don't need this patch here to fix
> up possible_crtcs.

Finally pushed the other patches from the series to drm-misc-next.
Thanks for the reviews.

Should the new possible_{crtcs,clones} WARNs start to trigger for
anyone despite our best efforts, please holler and I'll look into
what needs fixing.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
