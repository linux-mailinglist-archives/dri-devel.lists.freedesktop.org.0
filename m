Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E629F26C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 17:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695FD89CA1;
	Thu, 29 Oct 2020 16:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C0C89CA1;
 Thu, 29 Oct 2020 16:59:53 +0000 (UTC)
IronPort-SDR: 7dJanVvqP78n8qPOT42PGHOgXT+toWbmXO4Sb2eQUDSc3cUMN7rTyzlUyClXACMrTYRV65E1a+
 PvHmD4SsIO/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="155439226"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="155439226"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:59:52 -0700
IronPort-SDR: FQ8yC7zRcwJSOcng5SXYwaR0wRpK//Rj3JOzbvMpvO1pViKfNf9WxCQ/jK++XiGsgkrjjySzGz
 7htbE7qLv4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="335160430"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 29 Oct 2020 09:59:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 29 Oct 2020 18:59:48 +0200
Date: Thu, 29 Oct 2020 18:59:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v2] drm: Quieten [zero] EDID carping
Message-ID: <20201029165948.GF6112@intel.com>
References: <20201029110030.9959-1-chris@chris-wilson.co.uk>
 <20201029164417.14487-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029164417.14487-1-chris@chris-wilson.co.uk>
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
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 04:44:17PM +0000, Chris Wilson wrote:
> We have a few displays in CI that always report their EDID as a bunch of
> zeroes. This is consistent behaviour, so one assumes intentional
> indication of an "absent" EDID. Flagging these consistent warnings
> detracts from CI.
> =

> One option would be to ignore the zero EDIDs as intentional behaviour,
> but Ville would like to keep the information available for debugging.
> The simple alternative then is to reduce the loglevel for all the EDID
> dumping from WARN to DEBUG so the information is present but not annoy
> CI. Note that the bad EDID dumping is already only shown if
> drm.debug=3DKMS, it's just the loglevel chosen was set to be caught by CI
> if it ever occurred as it was expected to be an internal error not
> external.

Indeed. That makes this even less controversial.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> =

> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2203
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 631125b46e04..c7363af731b4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1844,7 +1844,7 @@ static void connector_bad_edid(struct drm_connector=
 *connector,
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
>  =

> -	drm_warn(connector->dev, "%s: EDID is invalid:\n", connector->name);
> +	drm_dbg_kms(connector->dev, "%s: EDID is invalid:\n", connector->name);
>  	for (i =3D 0; i < num_blocks; i++) {
>  		u8 *block =3D edid + i * EDID_LENGTH;
>  		char prefix[20];
> @@ -1856,7 +1856,7 @@ static void connector_bad_edid(struct drm_connector=
 *connector,
>  		else
>  			sprintf(prefix, "\t[%02x] GOOD ", i);
>  =

> -		print_hex_dump(KERN_WARNING,
> +		print_hex_dump(KERN_DEBUG,
>  			       prefix, DUMP_PREFIX_NONE, 16, 1,
>  			       block, EDID_LENGTH, false);
>  	}
> -- =

> 2.20.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
