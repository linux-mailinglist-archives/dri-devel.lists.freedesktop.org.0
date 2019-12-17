Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B8612381C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 21:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D3F6E13F;
	Tue, 17 Dec 2019 20:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233BE6E139;
 Tue, 17 Dec 2019 20:57:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 12:57:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="212500089"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com) ([10.54.75.49])
 by fmsmga007.fm.intel.com with ESMTP; 17 Dec 2019 12:57:21 -0800
Date: Tue, 17 Dec 2019 12:58:53 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm: Handle connector tile support only for modes
 that match tile size
Message-ID: <20191217205852.GB24921@intel.com>
References: <20191211212433.18185-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211212433.18185-1-manasi.d.navare@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 01:24:32PM -0800, Manasi Navare wrote:
> DRM Fb driver expects multiple CRTCs if it sees connector->has_tile
> is set, but we need to handle tile support and look for multiple CRTCs
> only for the modes that match the tile size. The other modes should
> be able to be displayed without tile support or uisng single CRTC.
> =

> This patch adds the check to match the tile size with requested mode
> to handle the tile support.
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>

Capturing Dave Airlie's r-b from IRC:

Reviewed-by: Dave Airlie <airlied@redhat.com>

Manasi

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index fb9bff0f4581..4978363714a9 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1558,7 +1558,9 @@ static int drm_fb_helper_single_fb_probe(struct drm=
_fb_helper *fb_helper,
>  		for (j =3D 0; j < mode_set->num_connectors; j++) {
>  			struct drm_connector *connector =3D mode_set->connectors[j];
>  =

> -			if (connector->has_tile) {
> +			if (connector->has_tile &&
> +			    desired_mode->hdisplay =3D=3D connector->tile_h_size &&
> +			    desired_mode->vdisplay =3D=3D connector->tile_v_size) {
>  				lasth =3D (connector->tile_h_loc =3D=3D (connector->num_h_tile - 1));
>  				lastv =3D (connector->tile_v_loc =3D=3D (connector->num_v_tile - 1));
>  				/* cloning to multiple tiles is just crazy-talk, so: */
> -- =

> 2.19.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
