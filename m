Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987718C326
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 23:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9B76EA97;
	Thu, 19 Mar 2020 22:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625826EA97;
 Thu, 19 Mar 2020 22:44:40 +0000 (UTC)
IronPort-SDR: aZS+q3YQ09Fw05f/1UjQgiEvKmmLLovTmCBczr7lPvf/eImBME8r2IimV7Rxirag/EFBNj9FKa
 XNvKz58hDvvw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 15:44:39 -0700
IronPort-SDR: GtQMaXqyth5TKsZRlJ/Rg4I2JkwE4kwGgBSGsPZ+iFwbo7ert3QG4kPIBBjG9Bu2kX23h7CsjY
 R5S+b88CLwEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; d="scan'208";a="234324257"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by orsmga007.jf.intel.com with ESMTP; 19 Mar 2020 15:44:39 -0700
Date: Thu, 19 Mar 2020 15:46:16 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/dp: DRM DP helper for reading Ignore MSA from DPCD
Message-ID: <20200319224615.GE11219@intel.com>
References: <20200318063517.3844-1-manasi.d.navare@intel.com>
 <871rpoekc5.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871rpoekc5.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 11:59:38AM +0200, Jani Nikula wrote:
> On Tue, 17 Mar 2020, Manasi Navare <manasi.d.navare@intel.com> wrote:
> > DP sink device sets the Ignore MSA bit in its
> > DP_DOWNSTREAM_PORT_COUNT register to indicate its ability to
> > ignore the MSA video timing paramaters and its ability to support
> > seamless video timing change over a range of timing exposed by
> > DisplayID and EDID.
> > This is required for the sink to indicate that it is Adaptive sync
> > capable.
> >
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > ---
> >  include/drm/drm_dp_helper.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index c6119e4c169a..ccd6e2e988b9 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1315,6 +1315,14 @@ drm_dp_alternate_scrambler_reset_cap(const u8 dp=
cd[DP_RECEIVER_CAP_SIZE])
> >  			DP_ALTERNATE_SCRAMBLER_RESET_CAP;
> >  }
> >  =

> > +/* Ignore MSA timing for Adaptive Sync support on DP 1.4 */
> > +static inline bool
> > +drm_dp_sink_is_capable_without_timing_msa(const u8 dpcd[DP_RECEIVER_CA=
P_SIZE])
> =

> From the department of nitpicks, if you read the name of the function
> aloud, what does it actually mean?
> =

> Is sink capable of *what*?

As per the DP 1.4 spec, it says this indicates sink's ability to ignore MSA=
 video timing
parameters to support seamless video timing change over range of timing exp=
osed in DisplayID and
legacy EDID. This query should occur before enabling dynamic video timing c=
hange
of incoming video stream without valid MSA video timing params.

May be i rename it as: drm_dp_sink_capable_video_without_timing_msa() ?

Manasi

> =

> BR,
> Jani.
> =

> =

> > +{
> > +	return dpcd[DP_DOWN_STREAM_PORT_COUNT] &
> > +		DP_MSA_TIMING_PAR_IGNORED;
> > +}
> > +
> >  /*
> >   * DisplayPort AUX channel
> >   */
> =

> -- =

> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
