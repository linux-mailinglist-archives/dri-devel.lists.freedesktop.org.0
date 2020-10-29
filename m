Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09F29EDDF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 15:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C465F6ECD9;
	Thu, 29 Oct 2020 14:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500716ECD8;
 Thu, 29 Oct 2020 14:07:50 +0000 (UTC)
IronPort-SDR: 0ZloXLEnQgJYbCJxL76b/FWoQtja11K+mmRYFakmVnFFTX3MorZNRPxdajPB9VOG9q7UXD1us3
 Y6nxfPWt3hCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="230074479"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="230074479"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 07:07:49 -0700
IronPort-SDR: Lcc21PXGBPbV44XdJgMYOyM5L1YrzCpE6RllJIC+PK8rV78QuweN/otvMK3tCe7rFl6l4BBDrl
 IEVpDPg3F1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="425056547"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 29 Oct 2020 07:07:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 29 Oct 2020 16:07:46 +0200
Date: Thu, 29 Oct 2020 16:07:46 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm: Silence zero EDID carping
Message-ID: <20201029140746.GD6112@intel.com>
References: <20201029110030.9959-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029110030.9959-1-chris@chris-wilson.co.uk>
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

On Thu, Oct 29, 2020 at 11:00:30AM +0000, Chris Wilson wrote:
> We have a few displays in CI that always report their EDID as a bunch of
> zeroes. This is consistent behavioud, so one assumes intentional
> indication of an "absent" EDID. Let us treat is as such by silently
> reporting the zero edid using connector->null_edid_counter, leaving the
> loud carp to EDID that violate their checksums or otherwise return
> unexpected illegal data upon reading. These are more likely to be
> inconsistent bad connections rather than being intended.

I don't think null_edid_counter is actually used by anything.
So apart from wondering why the mode list has turned strange
is there some way I can still see from the logs that the
EDID has become all zeroes?

> =

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 631125b46e04..94549805a204 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1951,7 +1951,7 @@ struct edid *drm_do_get_edid(struct drm_connector *=
connector,
>  			break;
>  		if (i =3D=3D 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
>  			connector->null_edid_counter++;
> -			goto carp;
> +			goto out;
>  		}
>  	}
>  	if (i =3D=3D 4)
> -- =

> 2.20.1
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
