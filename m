Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1BF26DBEF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 14:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334E46EB7F;
	Thu, 17 Sep 2020 12:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325456EA68;
 Thu, 17 Sep 2020 12:46:29 +0000 (UTC)
IronPort-SDR: Lnsm2qwVT6cqvPR79GRZriJUC2MaNUQ1N4g+OXZvh9n9fejMj6XJx/uSMEnwFYqKw20FxRYxFM
 nWMZ2SAioHJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="223863895"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="223863895"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 05:46:27 -0700
IronPort-SDR: yTQB0vpWVrwYsXavhNgl9+vlURL7VR518WOXLpHj6ZvOGSoOONOHXzfm5Hzq1ME8o4D0uLhrgW
 ED+lHmgHaFPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="320213908"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 17 Sep 2020 05:46:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 17 Sep 2020 15:46:24 +0300
Date: Thu, 17 Sep 2020 15:46:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 10/18] drm/dp: Add
 drm_dp_downstream_{min,max}_tmds_clock()
Message-ID: <20200917124623.GX6112@intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
 <20200904115354.25336-11-ville.syrjala@linux.intel.com>
 <de8ddd1a19dc62632f7cac2ddbf4a578f5980f9a.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de8ddd1a19dc62632f7cac2ddbf4a578f5980f9a.camel@redhat.com>
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

On Tue, Sep 08, 2020 at 02:04:56PM -0400, Lyude Paul wrote:
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
> > +		  */
> > +		if ((dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> > DP_DETAILED_CAP_INFO_AVAILABLE) =3D=3D 0)
> > +			return 300000;
> > +		return port_cap[1] * 2500;
> > +	case DP_DS_PORT_TYPE_DVI:
> > +		if ((dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> > DP_DETAILED_CAP_INFO_AVAILABLE) =3D=3D 0)
> > +			return 165000;
> > +		/* FIXME what to do about DVI dual link? */
> > +		return port_cap[1] * 2500;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_dp_downstream_max_tmds_clock);
> > +
> > +/**
> > + * drm_dp_downstream_min_tmds_clock() - extract downstream facing port=
 min
> > TMDS clock
> > + * @dpcd: DisplayPort configuration data
> > + * @port_cap: port capabilities
> > + * @edid: EDID
> > + *
> > + * Returns HDMI/DVI downstream facing port min TMDS clock in kHz on
> > success,
> > + * or 0 if max TMDS clock not defined
> =

> s/max/min/
> =

> Also, I would assume if callers are interested in min they're also intere=
sted
> in max and vice versa, would it maybe make sense to combine the min/max
> functions here?

Returning multiple things in C requires ugly stuff, so I try to avoid
it.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
