Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5E1EE76A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 17:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF65D6E434;
	Thu,  4 Jun 2020 15:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75FC6E429;
 Thu,  4 Jun 2020 15:09:47 +0000 (UTC)
IronPort-SDR: lbIzoHuLLu8fMs7Zkw6e7xK36Q1TT1Kjjk0cqh5v5yXOjB0jAlzxSIueY/E8WqJeh7o/kSKs0r
 1WC2jTNQlcUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 08:09:47 -0700
IronPort-SDR: 2xCou+/kuVqVagwQqDFq6ocQfkulsV04dggRIS7hDqBHB69jfCaE4sii12ufR60/C8/jAmc8UU
 kf+bKo37o+qw==
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; d="scan'208";a="445535292"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 08:09:45 -0700
Date: Thu, 4 Jun 2020 18:09:42 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/dp_mst: Fix disabling MST on a
 port
Message-ID: <20200604150942.GC15427@ideak-desk.fi.intel.com>
References: <20200603211040.8190-1-imre.deak@intel.com>
 <20200604145530.GS6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604145530.GS6112@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 04, 2020 at 05:55:30PM +0300, Ville Syrj=E4l=E4 wrote:
> On Thu, Jun 04, 2020 at 12:10:38AM +0300, Imre Deak wrote:
> > Currently MST on a port can get enabled/disabled from the hotplug work
> > and get disabled from the short pulse work in a racy way. Fix this by
> > relying on the MST state checking in the hotplug work and just schedule
> > a hotplug work from the short pulse handler if some problem happened
> > during the MST interrupt handling.
> > =

> > This removes the explicit MST disabling in case of an AUX failure, but
> > if AUX fails, then probably the detection will also fail during the
> > scheduled hotplug work and it's not guaranteed that we'll see
> > intermittent errors anyway.
> > =

> > While at it also simplify the error checking of the MST interrupt
> > handler.
> > =

> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 33 +++----------------------
> >  1 file changed, 4 insertions(+), 29 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index 55fda074c0ad..befbcacddaa1 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5604,7 +5604,7 @@ intel_dp_check_mst_status(struct intel_dp *intel_=
dp)
> >  		}
> >  	}
> >  =

> > -	return need_retrain;
> > +	return need_retrain ? -EINVAL : 0;
> >  }
> >  =

> >  static bool
> > @@ -7255,35 +7255,10 @@ intel_dp_hpd_pulse(struct intel_digital_port *i=
ntel_dig_port, bool long_hpd)
> >  	}
> >  =

> >  	if (intel_dp->is_mst) {
> > -		switch (intel_dp_check_mst_status(intel_dp)) {
> > -		case -EINVAL:
> > -			/*
> > -			 * If we were in MST mode, and device is not
> > -			 * there, get out of MST mode
> > -			 */
> > -			drm_dbg_kms(&i915->drm,
> > -				    "MST device may have disappeared %d vs %d\n",
> > -				    intel_dp->is_mst,
> > -				    intel_dp->mst_mgr.mst_state);
> > -			intel_dp->is_mst =3D false;
> > -			drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
> > -							intel_dp->is_mst);
> > -
> > -			return IRQ_NONE;
> > -		case 1:
> > -			return IRQ_NONE;
> > -		default:
> > -			break;
> > -		}
> > -	}
> > -
> > -	if (!intel_dp->is_mst) {
> > -		bool handled;
> > -
> > -		handled =3D intel_dp_short_pulse(intel_dp);
> > -
> > -		if (!handled)
> > +		if (intel_dp_check_mst_status(intel_dp) < 0)
> >  			return IRQ_NONE;
> =

> Since we no longer need the tristate return, can you follow up
> with a conversion to bool return? I'd vote to make it match the
> semantics of intel_dp_short_pulse() so we get one step
> closer to unifying the hpd_irq handling across the board.

Ok, makes sense.

> =

> > +	} else if (!intel_dp_short_pulse(intel_dp)) {
> > +		return IRQ_NONE;
> >  	}
> >  =

> >  	return IRQ_HANDLED;
> > -- =

> > 2.23.1
> > =

> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
