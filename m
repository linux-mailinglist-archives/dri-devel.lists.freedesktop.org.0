Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA14D3710A5
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 05:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE5A6E861;
	Mon,  3 May 2021 03:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431F66E861;
 Mon,  3 May 2021 03:13:14 +0000 (UTC)
IronPort-SDR: Oanb9atMp55jV4XK0oX/zqdwCGjjMoWIRArnuRoDcoJzAzpS9BHoDHiqKj7Siu+b3+Cz2wmteE
 XggAPQ/ZDrsw==
X-IronPort-AV: E=McAfee;i="6200,9189,9972"; a="258941310"
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; d="scan'208";a="258941310"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2021 20:13:12 -0700
IronPort-SDR: DlWEuVc0GsZ3l2+sap/HNaJbO6bnemkBr3ic7xwnaYf3UstWJiIJgYMNDV7JDDnl61Yd449exs
 SRFm40MiPnQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; d="scan'208";a="389370171"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 02 May 2021 20:13:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 May 2021 06:13:08 +0300
Date: Mon, 3 May 2021 06:13:08 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/2] drm/dp: Handle zeroed port counts in
 drm_dp_read_downstream_info()
Message-ID: <YI9qRPkSDGrLAaFg@intel.com>
References: <20210430223428.10514-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430223428.10514-1-lyude@redhat.com>
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
Cc: =?iso-8859-1?B?Suly9G1l?= de Bretagne <jerome.debretagne@gmail.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 06:34:27PM -0400, Lyude Paul wrote:
> While the DP specification isn't entirely clear on if this should be
> allowed or not, some branch devices report having downstream ports present
> while also reporting a downstream port count of 0. So to avoid breaking
> those devices, we need to handle this in drm_dp_read_downstream_info().
> =

> So, to do this we assume there's no downstream port info when the
> downstream port count is 0.
> =

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Tested-by: J=E9r=F4me de Bretagne <jerome.debretagne@gmail.com>
> Bugzilla: https://gitlab.freedesktop.org/drm/intel/-/issues/3416
> Fixes: 3d3721ccb18a ("drm/i915/dp: Extract drm_dp_read_downstream_info()")
> Cc: <stable@vger.kernel.org> # v5.10+
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_hel=
per.c
> index cb56d74e9d38..27c8c5bdf7d9 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -682,7 +682,14 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *a=
ux,
>  	    !(dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT))
>  		return 0;
>  =

> +	/* Some branches advertise having 0 downstream ports, despite also adve=
rtising they have a
> +	 * downstream port present. The DP spec isn't clear on if this is allow=
ed or not, but since
> +	 * some branches do it we need to handle it regardless.
> +	 */
>  	len =3D drm_dp_downstream_port_count(dpcd);
> +	if (!len)
> +		return 0;
> +

Seems sane enough.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  	if (dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DETAILED_CAP_INFO_AVAILABLE)
>  		len *=3D 4;
>  =

> -- =

> 2.30.2
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
