Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E53111CB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 21:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6CB6F4C5;
	Fri,  5 Feb 2021 20:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C11B6F4C3;
 Fri,  5 Feb 2021 20:02:47 +0000 (UTC)
IronPort-SDR: T7v3dOlspOGiismO/ErEUxNNjyJPYuz8E0SDqqcyt6SeZOMjFMxYIrKNNx40qfzD0vGSyZWO0l
 IFdOg9DbTWWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="181630342"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="181630342"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 12:02:46 -0800
IronPort-SDR: bLTb53TAGzkVIHMF8oiprbl599AXjvVyxjiiZS10BmJdMcedllPRdJ3n7zFlYKfF/5ACDXDnGQ
 tKWEDqdffleA==
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="357810396"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 12:02:46 -0800
Date: Fri, 5 Feb 2021 12:07:41 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] i915/display/intel_dp: Read PCON DSC ENC
 caps only for DPCD rev >= 1.4
Message-ID: <20210205200741.GA911@labuser-Z97X-UD5H>
References: <20210204064842.11595-1-ankit.k.nautiyal@intel.com>
 <20210204064842.11595-2-ankit.k.nautiyal@intel.com>
 <YB2jT9p3N8Py6KUU@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YB2jT9p3N8Py6KUU@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Fri, Feb 05, 2021 at 09:58:07PM +0200, Ville Syrj=E4l=E4 wrote:
> On Thu, Feb 04, 2021 at 12:18:40PM +0530, Ankit Nautiyal wrote:
> > DP-HDMI2.1 PCON has DSC encoder caps defined in registers 0x92-0x9E.
> > Do not read the registers if DPCD rev < 1.4.
> > =

> > Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/2868
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index 8c12d5375607..2b83f0f433a2 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -2489,9 +2489,11 @@ static void intel_dp_get_pcon_dsc_cap(struct int=
el_dp *intel_dp)
> >  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> >  =

> >  	/* Clear the cached register set to avoid using stale values */
> > -
> >  	memset(intel_dp->pcon_dsc_dpcd, 0, sizeof(intel_dp->pcon_dsc_dpcd));
> >  =

> > +	if (intel_dp->dpcd[DP_DPCD_REV] < 0x14)
> > +		return;
> > +
> =

> Can't check the spec, but makes sense that this stuff is only valid
> for recent DCPD revisions.
> =

> Acked-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Yes checked the DP 1.4 spec and this is correct

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> =

> >  	if (drm_dp_dpcd_read(&intel_dp->aux, DP_PCON_DSC_ENCODER,
> >  			     intel_dp->pcon_dsc_dpcd,
> >  			     sizeof(intel_dp->pcon_dsc_dpcd)) < 0)
> > -- =

> > 2.29.2
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
