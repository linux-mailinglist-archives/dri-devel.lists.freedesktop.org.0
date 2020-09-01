Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8C9258D47
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 13:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F706E3BB;
	Tue,  1 Sep 2020 11:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBB86E39B;
 Tue,  1 Sep 2020 11:15:29 +0000 (UTC)
IronPort-SDR: 9biC4Oaz7opYe8wiP+qkMTEDlvGrnV66uIzLb8D5+6B+YPxs2nwsbT+wNBi+Revw7Sfhe8UFBC
 VttRnEMT07hA==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="157147946"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="157147946"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 04:15:29 -0700
IronPort-SDR: bKudRc8SiEGEvD7bjQd0YpGnbfptHoK6QWVr5bx3B33OFJwqNgz398incRG97plGgvNViNRE/s
 bQv8E8lg29Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="301407779"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 01 Sep 2020 04:15:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Sep 2020 14:15:24 +0300
Date: Tue, 1 Sep 2020 14:15:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v6 2/7] drm/i915: Add support for async flips in I915
Message-ID: <20200901111524.GG6112@intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
 <20200807093551.10673-3-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807093551.10673-3-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 03:05:46PM +0530, Karthik B S wrote:
> Set the Async Address Update Enable bit in plane ctl
> when async flip is requested.
> =

> v2: -Move the Async flip enablement to individual patch (Paulo)
> =

> v3: -Rebased.
> =

> v4: -Add separate plane hook for async flip case (Ville)
> =

> v5: -Rebased.
> =

> v6: -Move the plane hook to separate patch. (Paulo)
>     -Remove the early return in skl_plane_ctl. (Paulo)
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 3 +++
>  drivers/gpu/drm/i915/i915_reg.h              | 1 +
>  2 files changed, 4 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 1ac2e6f27597..ce2b0c14a073 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4768,6 +4768,9 @@ u32 skl_plane_ctl(const struct intel_crtc_state *cr=
tc_state,
>  =

>  	plane_ctl =3D PLANE_CTL_ENABLE;
>  =

> +	if (crtc_state->uapi.async_flip)
> +		plane_ctl |=3D PLANE_CTL_ASYNC_FLIP;

Hmm. We might want to put that into skl_plane_ctl_crtc() since it's
a crtc-wide thing,

> +
>  	if (INTEL_GEN(dev_priv) < 10 && !IS_GEMINILAKE(dev_priv)) {
>  		plane_ctl |=3D skl_plane_ctl_alpha(plane_state);
>  		plane_ctl |=3D PLANE_CTL_PLANE_GAMMA_DISABLE;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index e85c6fc1f3cb..3f88d9ac90a8 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6924,6 +6924,7 @@ enum {
>  #define   PLANE_CTL_TILED_X			(1 << 10)
>  #define   PLANE_CTL_TILED_Y			(4 << 10)
>  #define   PLANE_CTL_TILED_YF			(5 << 10)
> +#define   PLANE_CTL_ASYNC_FLIP			(1 << 9)
>  #define   PLANE_CTL_FLIP_HORIZONTAL		(1 << 8)
>  #define   PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE	(1 << 4) /* TGL+ */
>  #define   PLANE_CTL_ALPHA_MASK			(0x3 << 4) /* Pre-GLK */
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
