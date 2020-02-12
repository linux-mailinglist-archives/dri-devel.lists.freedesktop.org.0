Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7554E15AB07
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 15:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8326B6EAC0;
	Wed, 12 Feb 2020 14:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A7B6EAC0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 14:33:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 06:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,433,1574150400"; d="scan'208";a="266686617"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 12 Feb 2020 06:33:55 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Feb 2020 16:33:54 +0200
Date: Wed, 12 Feb 2020 16:33:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2] drm/tidss: dispc: Rewrite naive plane positioning code
Message-ID: <20200212143354.GC13686@intel.com>
References: <20200212135936.31326-1-jsarha@ti.com>
 <397e6686-40de-4205-e958-8592b1c3cc6e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <397e6686-40de-4205-e958-8592b1c3cc6e@ti.com>
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
Cc: praneeth@ti.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 04:08:11PM +0200, Jyri Sarha wrote:
> On 12/02/2020 15:59, Jyri Sarha wrote:
> > The old implementation of placing planes on the CRTC while configuring
> > the planes was naive and relied on the order in which the planes were
> > configured, enabled, and disabled. The situation where a plane's zpos
> > was changed on the fly was completely broken. The usual symptoms of
> > this problem was scrambled display and a flood of sync lost errors,
> > when a plane was active in two layers at the same time, or a missing
> > plane, in case when a layer was accidentally disabled.
> > =

> > The rewrite takes a more straight forward approach when HW is
> > concerned. The plane positioning registers are in the CRTC (actually
> > OVR) register space and it is more natural to configure them in one go
> > while configuring the CRTC. To do this we need to make sure we have
> > all the planes on updated CRTCs in the new atomic state to be
> > committed. This is done by calling drm_atomic_add_affected_planes() in
> > crtc_atomic_check().
> > =

> > Signed-off-by: Jyri Sarha <jsarha@ti.com>
> > ---
> >  drivers/gpu/drm/tidss/tidss_crtc.c  | 55 ++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/tidss/tidss_dispc.c | 55 +++++++++++------------------
> >  drivers/gpu/drm/tidss/tidss_dispc.h |  5 +++
> >  3 files changed, 79 insertions(+), 36 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss=
/tidss_crtc.c
> > index 032c31ee2820..f7c5fd1094a8 100644
> > --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> > +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> ...
> > @@ -108,7 +110,54 @@ static int tidss_crtc_atomic_check(struct drm_crtc=
 *crtc,
> >  		return -EINVAL;
> >  	}
> >  =

> > -	return dispc_vp_bus_check(dispc, hw_videoport, state);
> > +	ret =3D dispc_vp_bus_check(dispc, hw_videoport, state);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Add unchanged planes on this crtc to state for zpos update. */
> > +	return drm_atomic_add_affected_planes(state->state, crtc);
> =

> Is this a correct way to use drm_atomic_add_affected_planes()?
> =

> I saw that some other drivers implement their own mode_config
> atomic_check() and have this call there in
> for_each_new_crtc_in_state()-loop, but I thought it should be fine to
> call it in crtc_atomic_check().

You seem to be using drm_atomic_helper_check_planes(), which means
crtc.atomic_check() gets called after plane.atomic_check(). So this
might be good or bad depending on whether you'd like the planes you
add here to go through their .atomic_check() or not.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
