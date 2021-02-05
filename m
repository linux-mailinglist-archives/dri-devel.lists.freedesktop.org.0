Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE43111E5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 21:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536B989CDD;
	Fri,  5 Feb 2021 20:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427C789CD8;
 Fri,  5 Feb 2021 20:06:53 +0000 (UTC)
IronPort-SDR: Et1tPtK2BF8Ehp37efrGd5QcWIUqcGycdtAQGxmhW4gyZ2v/6/q6aGSo/Xgz5w/ukkA9+xrNYk
 v1Ea+tmP+fxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="169157597"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="169157597"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 12:06:52 -0800
IronPort-SDR: YUqwod6rVkMrT1SrQXPfUocEPnx5mJ9IswPo0e13J/TdSBcuAVBXugrLB8C9PIbW+SgIRJPoZ7
 6nMmw1dbwDQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="393996648"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 05 Feb 2021 12:06:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Feb 2021 22:06:48 +0200
Date: Fri, 5 Feb 2021 22:06:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] i915/display/intel_dp: Read PCON DSC ENC
 caps only for DPCD rev >= 1.4
Message-ID: <YB2lWCmdkj8P7sCM@intel.com>
References: <20210204064842.11595-1-ankit.k.nautiyal@intel.com>
 <20210204064842.11595-2-ankit.k.nautiyal@intel.com>
 <YB2jT9p3N8Py6KUU@intel.com>
 <20210205200741.GA911@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205200741.GA911@labuser-Z97X-UD5H>
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 12:07:41PM -0800, Navare, Manasi wrote:
> On Fri, Feb 05, 2021 at 09:58:07PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Thu, Feb 04, 2021 at 12:18:40PM +0530, Ankit Nautiyal wrote:
> > > DP-HDMI2.1 PCON has DSC encoder caps defined in registers 0x92-0x9E.
> > > Do not read the registers if DPCD rev < 1.4.
> > > =

> > > Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/2868
> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > =

> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/dr=
m/i915/display/intel_dp.c
> > > index 8c12d5375607..2b83f0f433a2 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -2489,9 +2489,11 @@ static void intel_dp_get_pcon_dsc_cap(struct i=
ntel_dp *intel_dp)
> > >  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> > >  =

> > >  	/* Clear the cached register set to avoid using stale values */
> > > -
> > >  	memset(intel_dp->pcon_dsc_dpcd, 0, sizeof(intel_dp->pcon_dsc_dpcd));
> > >  =

> > > +	if (intel_dp->dpcd[DP_DPCD_REV] < 0x14)
> > > +		return;
> > > +
> > =

> > Can't check the spec, but makes sense that this stuff is only valid
> > for recent DCPD revisions.
> > =

> > Acked-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Yes checked the DP 1.4 spec and this is correct

I didn't think this is in the DP spec, but rather some special extra
spec which I do not have.

> =

> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> =

> Manasi
> =

> > =

> > >  	if (drm_dp_dpcd_read(&intel_dp->aux, DP_PCON_DSC_ENCODER,
> > >  			     intel_dp->pcon_dsc_dpcd,
> > >  			     sizeof(intel_dp->pcon_dsc_dpcd)) < 0)
> > > -- =

> > > 2.29.2
> > =

> > -- =

> > Ville Syrj=E4l=E4
> > Intel
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
