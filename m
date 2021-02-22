Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89115321D9F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 18:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0060E6E183;
	Mon, 22 Feb 2021 17:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4527C6E183
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 17:00:13 +0000 (UTC)
IronPort-SDR: Pc0JY+1ItJHIeHxy6fZZJtsSKPfUszNyIjewuLZcuhZ+xgekk5XlxamhbpdfXhRrReL8EMQBKB
 2sMEOeClN8ZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="269450969"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="269450969"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 09:00:11 -0800
IronPort-SDR: x9cKnOZhTPwzTl6nRCI0W0rdt0dXfk3MJZJlCvlJ8ubRpu4EYO8XFO/iiM3lnqt13Zd7Ep5r4w
 mJ0g/ci4F//A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="380081397"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 22 Feb 2021 09:00:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 22 Feb 2021 19:00:07 +0200
Date: Mon, 22 Feb 2021 19:00:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Subject: Re: [PATCH 2/2] drm/dp_mst: Set CLEAR_PAYLOAD_ID_TABLE as broadcast
Message-ID: <YDPjFzPdfZXJqex8@intel.com>
References: <20210222040027.23505-1-Wayne.Lin@amd.com>
 <20210222040027.23505-3-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222040027.23505-3-Wayne.Lin@amd.com>
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
Cc: eryk.brol@amd.com, qingqing.zhuo@amd.com, stable@vger.kernel.org,
 jerry.zuo@amd.com, dri-devel@lists.freedesktop.org,
 Nicholas.Kazlauskas@amd.com,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 12:00:27PM +0800, Wayne Lin wrote:
> [Why & How]
> According to DP spec, CLEAR_PAYLOAD_ID_TABLE is a path broadcast request
> message and current implementation is incorrect. Fix it.
> =

> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
> index 713ef3b42054..6d73559046e5 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1072,6 +1072,7 @@ static void build_clear_payload_id_table(struct drm=
_dp_sideband_msg_tx *msg)
>  =

>  	req.req_type =3D DP_CLEAR_PAYLOAD_ID_TABLE;
>  	drm_dp_encode_sideband_req(&req, msg);
> +	msg->path_msg =3D true;
>  }
>  =

>  static int build_enum_path_resources(struct drm_dp_sideband_msg_tx *msg,
> @@ -2722,7 +2723,8 @@ static int set_hdr_from_dst_qlock(struct drm_dp_sid=
eband_msg_hdr *hdr,
>  =

>  	req_type =3D txmsg->msg[0] & 0x7f;
>  	if (req_type =3D=3D DP_CONNECTION_STATUS_NOTIFY ||
> -		req_type =3D=3D DP_RESOURCE_STATUS_NOTIFY)
> +		req_type =3D=3D DP_RESOURCE_STATUS_NOTIFY ||
> +		req_type =3D=3D DP_CLEAR_PAYLOAD_ID_TABLE)
>  		hdr->broadcast =3D 1;

Looks correct.
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Hmm. Looks like we're missing DP_POWER_DOWN_PHY and DP_POWER_UP_PHY
here as well. We do try to send them as path requests, but apparently
forget to mark them as broadcast messages.

>  	else
>  		hdr->broadcast =3D 0;
> -- =

> 2.17.1
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
