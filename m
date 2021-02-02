Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B897130BA0E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6916E8F2;
	Tue,  2 Feb 2021 08:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C106E8F2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:38:19 +0000 (UTC)
IronPort-SDR: pShR0/OVtBQhu1KRSPtEZvI8aJAckfwSSH4Tm0G3SfKesn/UMP37Vsg8fYwsI96Ey99JknmMj3
 E0Wc0octcqvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="244901256"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="244901256"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 00:38:07 -0800
IronPort-SDR: 25nJEXC6Eo2ZVFdDKTpuj8jByfCWS5snTrgr8nHnDtg3g3y/959Cff7F/5fjVv99ICIGuwBIb0
 IVcumXJipUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="391353919"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 02 Feb 2021 00:38:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 Feb 2021 10:38:01 +0200
Date: Tue, 2 Feb 2021 10:38:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zhaoge Zhang <zhangzhaoge@loongson.cn>
Subject: Re: [PATCH] drm: Fix drm_atomic_get_new_crtc_state call error
Message-ID: <YBkPaYiyyYjV/NMH@intel.com>
References: <1612172024-3556-1-git-send-email-zhangzhaoge@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612172024-3556-1-git-send-email-zhangzhaoge@loongson.cn>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 01, 2021 at 05:33:44PM +0800, Zhaoge Zhang wrote:
> This position is to clear the previous mask flags,
> so drm_atomic_get_crtc_state should be used.
> =

> Signed-off-by: Zhaoge Zhang <zhangzhaoge@loongson.cn>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 268bb69..07fe01b 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -313,8 +313,8 @@ drm_atomic_set_crtc_for_connector(struct drm_connecto=
r_state *conn_state,
>  		return 0;
>  =

>  	if (conn_state->crtc) {
> -		crtc_state =3D drm_atomic_get_new_crtc_state(conn_state->state,
> -							   conn_state->crtc);
> +		crtc_state =3D drm_atomic_get_crtc_state(conn_state->state,
> +							conn_state->crtc);

drm_atomic_get_new_crtc_state() should be fine here since
drm_atomic_get_connector_state() will have added the old
crtc to the state already.

>  =

>  		crtc_state->connector_mask &=3D
>  			~drm_connector_mask(conn_state->connector);
> -- =

> 2.7.4
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
