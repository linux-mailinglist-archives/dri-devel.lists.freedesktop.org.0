Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA53111A8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 21:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7483F6F4C2;
	Fri,  5 Feb 2021 20:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F476F4C2;
 Fri,  5 Feb 2021 20:01:12 +0000 (UTC)
IronPort-SDR: 3ocFvq4K/W2l7ouHVCvY2bUVWTUQuC6OYOIm63OqM7pUb79R0Lte+H4KHnDcnBUueAlxD+ICGw
 9/1bvvLhsIRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="177976881"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="177976881"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 12:01:11 -0800
IronPort-SDR: /QjyOT5Pf2Q7d3tA0D+ZWL0zWOreb2LKdmn5x9c58hJcsDzeVlEYkTCTBtvB6kDGxxk221JJfr
 Cm2jItMWt5hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="373662782"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 05 Feb 2021 12:01:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Feb 2021 22:01:08 +0200
Date: Fri, 5 Feb 2021 22:01:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 3/3] i915/display: Remove FRL related code from disable
 DP sequence for older platforms
Message-ID: <YB2kBL/zIYJaTbIo@intel.com>
References: <20210204064842.11595-1-ankit.k.nautiyal@intel.com>
 <20210204064842.11595-4-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204064842.11595-4-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 12:18:42PM +0530, Ankit Nautiyal wrote:
> Remove code for resetting frl related members from intel_disable_dp, as
> this is not applicable for older platforms.
> =

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 --
>  1 file changed, 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 1962d6dd8641..9d94bdf5f517 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2387,8 +2387,6 @@ static void intel_disable_dp(struct intel_atomic_st=
ate *state,
>  	intel_edp_backlight_off(old_conn_state);
>  	intel_dp_set_power(intel_dp, DP_SET_POWER_D3);
>  	intel_pps_off(intel_dp);
> -	intel_dp->frl.is_trained =3D false;
> -	intel_dp->frl.trained_rate_gbps =3D 0;

If we don't need it in the ddi path we don't need it here.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  }
>  =

>  static void g4x_disable_dp(struct intel_atomic_state *state,
> -- =

> 2.29.2

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
