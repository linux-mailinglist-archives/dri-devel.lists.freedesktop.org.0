Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3A14A7CB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 17:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347DB6E4CA;
	Mon, 27 Jan 2020 16:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887AF6E4A6;
 Mon, 27 Jan 2020 16:08:13 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 08:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,370,1574150400"; d="scan'208";a="261097470"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 27 Jan 2020 08:08:11 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 Jan 2020 18:08:10 +0200
Date: Mon, 27 Jan 2020 18:08:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/3] drm/i915: Include the AUX CH name in the debug
 messages
Message-ID: <20200127160810.GE13686@intel.com>
References: <20200123154542.12271-1-ville.syrjala@linux.intel.com>
 <20200123154542.12271-2-ville.syrjala@linux.intel.com>
 <20200123171904.GG2244136@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123171904.GG2244136@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 09:19:04AM -0800, Matt Roper wrote:
> On Thu, Jan 23, 2020 at 05:45:41PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > To make it easier to figure out what caused a particular debug
> > message let's print out aux->name.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> It might be worth adding commas to some of these messages too while
> we're at it (e.g., "not started, status").  But either way, this is a
> really helpful cleanup.

Good idea. The first one of these already uses
"%s: blah (status 0x%x)" as the format, so I went ahead and
converted the rest to follow the same style.

> =

> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

2-3 pushed to dinq. Thanks for the review.

> =

> =

> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index 1795963e1866..941f0f6d55c1 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -1186,7 +1186,7 @@ intel_dp_aux_wait_done(struct intel_dp *intel_dp)
> >  	trace_i915_reg_rw(false, ch_ctl, status, sizeof(status), true);
> >  =

> >  	if (!done)
> > -		DRM_ERROR("%s did not complete or timeout within %ums (status 0x%08x=
)\n",
> > +		DRM_ERROR("%s: did not complete or timeout within %ums (status 0x%08=
x)\n",
> >  			  intel_dp->aux.name, timeout_ms, status);
> >  #undef C
> >  =

> > @@ -1373,8 +1373,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  		const u32 status =3D intel_uncore_read(uncore, ch_ctl);
> >  =

> >  		if (status !=3D intel_dp->aux_busy_last_status) {
> > -			WARN(1, "dp_aux_ch not started status 0x%08x\n",
> > -			     status);
> > +			WARN(1, "%s: not started status 0x%08x\n",
> > +			     intel_dp->aux.name, status);
> >  			intel_dp->aux_busy_last_status =3D status;
> >  		}
> >  =

> > @@ -1435,7 +1435,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	}
> >  =

> >  	if ((status & DP_AUX_CH_CTL_DONE) =3D=3D 0) {
> > -		DRM_ERROR("dp_aux_ch not done status 0x%08x\n", status);
> > +		DRM_ERROR("%s: not done status 0x%08x\n",
> > +			  intel_dp->aux.name, status);
> >  		ret =3D -EBUSY;
> >  		goto out;
> >  	}
> > @@ -1445,7 +1446,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	 * Timeouts occur when the sink is not connected
> >  	 */
> >  	if (status & DP_AUX_CH_CTL_RECEIVE_ERROR) {
> > -		DRM_ERROR("dp_aux_ch receive error status 0x%08x\n", status);
> > +		DRM_ERROR("%s: receive error status 0x%08x\n",
> > +			  intel_dp->aux.name, status);
> >  		ret =3D -EIO;
> >  		goto out;
> >  	}
> > @@ -1453,7 +1455,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	/* Timeouts occur when the device isn't connected, so they're
> >  	 * "normal" -- don't fill the kernel log with these */
> >  	if (status & DP_AUX_CH_CTL_TIME_OUT_ERROR) {
> > -		DRM_DEBUG_KMS("dp_aux_ch timeout status 0x%08x\n", status);
> > +		DRM_DEBUG_KMS("%s: timeout status 0x%08x\n",
> > +			      intel_dp->aux.name, status);
> >  		ret =3D -ETIMEDOUT;
> >  		goto out;
> >  	}
> > @@ -1468,8 +1471,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	 * drm layer takes care for the necessary retries.
> >  	 */
> >  	if (recv_bytes =3D=3D 0 || recv_bytes > 20) {
> > -		DRM_DEBUG_KMS("Forbidden recv_bytes =3D %d on aux transaction\n",
> > -			      recv_bytes);
> > +		DRM_DEBUG_KMS("%s: Forbidden recv_bytes =3D %d on aux transaction\n",
> > +			      intel_dp->aux.name, recv_bytes);
> >  		ret =3D -EBUSY;
> >  		goto out;
> >  	}
> > -- =

> > 2.24.1
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
> (916) 356-2795

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
