Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F80F372827
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 11:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ADF6E0CB;
	Tue,  4 May 2021 09:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582EE6E0CB;
 Tue,  4 May 2021 09:41:53 +0000 (UTC)
IronPort-SDR: HX8T5IP9exPO4/prZVgZun4PSsUzUZCUEutkEHXlhoVz6lwJHN2a77EDhx53FI59Z2E/xb9GC6
 PxTCqgUmxt3w==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="178151899"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="178151899"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 02:41:52 -0700
IronPort-SDR: sU4PVJe6GtdbV7YJEGJRCukzA44tIFHj0qbCVsUAyr5k7WbJdlTTZ7Cu+pW2E3xGVvkyE4Xtkw
 1UmswrcCtc2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="427713958"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 04 May 2021 02:41:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 May 2021 12:41:48 +0300
Date: Tue, 4 May 2021 12:41:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 2/4] Add missing check
Message-ID: <YJEW3J0+RQPo22AD@intel.com>
References: <20210503182148.851790-1-wse@tuxedocomputers.com>
 <20210503182148.851790-3-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503182148.851790-3-wse@tuxedocomputers.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 03, 2021 at 08:21:46PM +0200, Werner Sembach wrote:
> Add a missing check that could potentially lead to an unarchivable mode b=
eing
> validated.
> =

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
> =

> >From 54fa706f0a5f260a32af5d18b9622ceebb94c12e Mon Sep 17 00:00:00 2001
> From: Werner Sembach <wse@tuxedocomputers.com>
> Date: Mon, 3 May 2021 14:42:36 +0200
> Subject: [PATCH 2/4] Add missing check

I guess you did something a bit wonky with git format-patch/send-mail?

> =

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index 576d3d910d06..ce165ef28e88 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1913,7 +1913,7 @@ intel_hdmi_mode_valid(struct drm_connector *connect=
or,
>  		clock *=3D 2;
>  	}
>  =

> -	if (drm_mode_is_420_only(&connector->display_info, mode))
> +	if (connector->ycbcr_420_allowed && drm_mode_is_420_only(&connector->di=
splay_info, mode))

This one shouldn't be necessary. drm_mode_validate_ycbcr420() has
already checked it for us.

>  		clock /=3D 2;
>  =

>  	status =3D intel_hdmi_mode_clock_valid(hdmi, clock, has_hdmi_sink);
> -- =

> 2.25.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
