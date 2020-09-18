Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330A826FBFC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1861E6EC89;
	Fri, 18 Sep 2020 12:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7B76EC89;
 Fri, 18 Sep 2020 12:03:50 +0000 (UTC)
IronPort-SDR: jn2ihLM4Zqrx3EZeF45Aexs5k3YD1yzJUrVZIKKNyxQ2ctliw/kkL9o5C+gcnkcm5Y/r6EIGMD
 GP3OU401IpPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="157307842"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="157307842"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 05:03:50 -0700
IronPort-SDR: dmjHVOI8ElHNttPpX1vhbWH6APMuxOYJ/DQlJdr2fy/auWfhP8Ly/l892HvnJmhz+6fvoesAfB
 8e/dAUOrirnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="344723037"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 18 Sep 2020 05:03:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Sep 2020 15:03:45 +0300
Date: Fri, 18 Sep 2020 15:03:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v9 8/8] drm/i915: Enable async flips in i915
Message-ID: <20200918120345.GM6112@intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
 <20200916150824.15749-9-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916150824.15749-9-karthik.b.s@intel.com>
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

On Wed, Sep 16, 2020 at 08:38:24PM +0530, Karthik B S wrote:
> Enable asynchronous flips in i915 for gen9+ platforms.
> =

> v2: -Async flip enablement should be a stand alone patch (Paulo)
> =

> v3: -Move the patch to the end of the series (Paulo)
> =

> v4: -Rebased.
> =

> v5: -Rebased.
> =

> v6: -Rebased.
> =

> v7: -Rebased.
> =

> v8: -Rebased.
> =

> v9: -Rebased.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 6f6edc581e14..e31abf5f1a9d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -18021,6 +18021,9 @@ static void intel_mode_config_init(struct drm_i91=
5_private *i915)
>  =

>  	mode_config->funcs =3D &intel_mode_funcs;
>  =

> +	if (INTEL_GEN(i915) >=3D 9)
> +		mode_config->async_page_flip =3D true;
> +

Should have all we need for those platforms I think.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

The followup to enable it for ilk+ would require a slight change to
bump X-tiled surface alignment to 256KiB. Apart from the actual regiser
smashing part that should be all we need really.

Oh, and the double buffer bit w/a will also be needed on bdw.
I've now tested snb/ivb/hsw/bdw and only bdw needs it. I guess
that's not entirely unsurpising since bdw did introduce one other
fail for the flip done interrupt (the interupt fires immediately =

when the plane was disabled, so can't use flip done to determine
when the plane has actually become visible). Fortunately that
other fail should have no impact on using it for async flip
completion.

>  	/*
>  	 * Maximum framebuffer dimensions, chosen to match
>  	 * the maximum render engine surface size on gen4+.
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
