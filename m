Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E037B3710A1
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 05:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900356E860;
	Mon,  3 May 2021 03:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633646E860;
 Mon,  3 May 2021 03:06:34 +0000 (UTC)
IronPort-SDR: 03cY7jcknWFgxJdaGcOXZjMowgK4pAnrLNpodYFAMTc0LdeZp1Df9Iofy1XpUzIJ7L/AKs1Ftg
 yAxVaRgnL/2A==
X-IronPort-AV: E=McAfee;i="6200,9189,9972"; a="283048892"
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; d="scan'208";a="283048892"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2021 20:06:33 -0700
IronPort-SDR: HHVWRGq5bZuAXY29a6hCV4j1XzWO7JuSFxlqcKcEXJAHeQS+MyF1NqHR05hYoCVII25I/w0+FF
 EEbzpKVTipYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; d="scan'208";a="457034607"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 02 May 2021 20:06:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 May 2021 06:06:30 +0300
Date: Mon, 3 May 2021 06:06:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/dp: Drop open-coded
 drm_dp_is_branch() in drm_dp_read_downstream_info()
Message-ID: <YI9otSh/ftvLqMxb@intel.com>
References: <20210430223428.10514-1-lyude@redhat.com>
 <20210430223428.10514-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430223428.10514-2-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 06:34:28PM -0400, Lyude Paul wrote:
> Noticed this while fixing another issue in drm_dp_read_downstream_info(),
> the open coded DP_DOWNSTREAMPORT_PRESENT check here just duplicates what =
we
> already do in drm_dp_is_branch(), so just get rid of it.
> =

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_hel=
per.c
> index 27c8c5bdf7d9..0f84df8798ab 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -677,9 +677,7 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *au=
x,
>  	memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
>  =

>  	/* No downstream info to read */
> -	if (!drm_dp_is_branch(dpcd) ||
> -	    dpcd[DP_DPCD_REV] < DP_DPCD_REV_10 ||
> -	    !(dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT))
> +	if (!drm_dp_is_branch(dpcd) || dpcd[DP_DPCD_REV] < DP_DPCD_REV_10)

BTW that DPCD_REV check looks rather wrong.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  		return 0;
>  =

>  	/* Some branches advertise having 0 downstream ports, despite also adve=
rtising they have a
> -- =

> 2.30.2
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
