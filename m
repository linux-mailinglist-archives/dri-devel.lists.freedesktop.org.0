Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC626478B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 15:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDA36E932;
	Thu, 10 Sep 2020 13:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407156E92A;
 Thu, 10 Sep 2020 13:56:15 +0000 (UTC)
IronPort-SDR: I06DLWk0uVw2PqW/iPgQWhwZB5wKf3dW53F4gqBfWRD+VxylRcCTlX1ojINKTAwuo5rdIJAwhC
 CdeZtjS+SRHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="220091765"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="220091765"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:56:14 -0700
IronPort-SDR: pmFERndscfnO4k7O11LN0UgOc3ILnKFyDiApTRvtT3ttO8kWoKy3q1bN49zjwpROTeKaAjvB19
 buPklYTIl44g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="341933269"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 10 Sep 2020 06:56:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Sep 2020 16:55:51 +0300
Date: Thu, 10 Sep 2020 16:55:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 10/18] drm/dp: Add
 drm_dp_downstream_{min,max}_tmds_clock()
Message-ID: <20200910135551.GZ6112@intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
 <20200904115354.25336-11-ville.syrjala@linux.intel.com>
 <d4293cb17ee4ece5820c2513861768e2be2054ee.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4293cb17ee4ece5820c2513861768e2be2054ee.camel@redhat.com>
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

On Tue, Sep 08, 2020 at 02:08:17PM -0400, Lyude Paul wrote:
> On Fri, 2020-09-04 at 14:53 +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Add helpers to get the TMDS clock limits for HDMI/DVI downstream
> > facing ports.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 116 ++++++++++++++++++++++++++++++++
> >  include/drm/drm_dp_helper.h     |   6 ++
> >  2 files changed, 122 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 822a30e609ef..f567428f2aef 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -643,6 +643,114 @@ int drm_dp_downstream_max_dotclock(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE],
> >  }
> >  EXPORT_SYMBOL(drm_dp_downstream_max_dotclock);
> >  =

> > +/**
> > + * drm_dp_downstream_max_tmds_clock() - extract downstream facing port=
 max
> > TMDS clock
> > + * @dpcd: DisplayPort configuration data
> > + * @port_cap: port capabilities
> > + * @edid: EDID
> > + *
> > + * Returns HDMI/DVI downstream facing port max TMDS clock in kHz on
> > success,
> > + * or 0 if max TMDS clock not defined
> > + */
> > +int drm_dp_downstream_max_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZ=
E],
> > +				     const u8 port_cap[4],
> > +				     const struct edid *edid)
> > +{
> > +	if (!drm_dp_is_branch(dpcd))
> > +		return 0;
> > +
> > +	if (dpcd[DP_DPCD_REV] < 0x11) {
> > +		switch (dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> > DP_DWN_STRM_PORT_TYPE_MASK) {
> > +		case DP_DWN_STRM_PORT_TYPE_TMDS:
> > +			return 165000;
> > +		default:
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
> > +	case DP_DS_PORT_TYPE_DP_DUALMODE:
> > +		if (is_edid_digital_input_dp(edid))
> > +			return 0;
> > +		/*
> > +		 * It's left up to the driver to check the
> > +		 * DP dual mode adapter's max TMDS clock.
> > +		 *
> > +		 * Unfortunatley it looks like branch devices
> > +		 * may not fordward that the DP dual mode i2c
> > +		 * access so we just usually get i2c nak :(
> > +		 */
> > +		fallthrough;
> > +	case DP_DS_PORT_TYPE_HDMI:
> > +		 /*
> > +		  * We should perhaps assume 165 MHz when detailed cap
> > +		  * info is not available. But looks like many typical
> > +		  * branch devices fall into that category and so we'd
> > +		  * probably end up with users complaining that they can't
> > +		  * get high resolution modes with their favorite dongle.
> > +		  *
> > +		  * So let's limit to 300 MHz instead since DPCD 1.4
> > +		  * HDMI 2.0 DFPs are required to have the detailed cap
> > +		  * info. So it's more likely we're dealing with a HDMI 1.4
> > +		  * compatible* device here.
> =

> Forgot to mention - not directly related to this series, there's some hid=
den
> i2c bits that I think can also be probed for this sort of information on
> passive adapters, I know amdgpu actually supports this. I wonder how many=
 of
> them also apply to older active adapters...

Something other than the normal DP dual mode stuff?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
