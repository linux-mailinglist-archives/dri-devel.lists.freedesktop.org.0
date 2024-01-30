Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4D842110
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25404112F1C;
	Tue, 30 Jan 2024 10:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048B1112F10;
 Tue, 30 Jan 2024 10:20:10 +0000 (UTC)
Received: from 91-155-255-116.elisa-laajakaista.fi ([91.155.255.116]
 helo=RAVPPB-CIM.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rUlDp-00000001Xzd-3l37; Tue, 30 Jan 2024 12:20:08 +0200
Message-ID: <e5baad6a8fa13274375f92a109af4d1dbe433f6d.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 30 Jan 2024 12:20:05 +0200
In-Reply-To: <50d510a6e13735cef10325742bf49b7f6955b970.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <50d510a6e13735cef10325742bf49b7f6955b970.1705410327.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 04/10] drm/dp_mst: switch from drm_debug_printer() to
 device specific drm_dbg_printer()
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 15:07 +0200, Jani Nikula wrote:
> Prefer the device specific debug printer.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 23 +++++++++++--------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 8ca01a6bf645..fba6e37b051b 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -1306,7 +1306,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_m=
st_branch *mstb,
>  	}
>  out:
>  	if (unlikely(ret =3D=3D -EIO) && drm_debug_enabled(DRM_UT_DP)) {
> -		struct drm_printer p =3D drm_debug_printer(DBG_PREFIX);
> +		struct drm_printer p =3D drm_dbg_printer(mgr->dev, DRM_UT_DP,
> +						       DBG_PREFIX);
> =20
>  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>  	}
> @@ -1593,10 +1594,11 @@ topology_ref_type_to_str(enum drm_dp_mst_topology=
_ref_type type)
>  }
> =20
>  static void
> -__dump_topology_ref_history(struct drm_dp_mst_topology_ref_history *hist=
ory,
> +__dump_topology_ref_history(struct drm_device *drm,
> +			    struct drm_dp_mst_topology_ref_history *history,
>  			    void *ptr, const char *type_str)
>  {
> -	struct drm_printer p =3D drm_debug_printer(DBG_PREFIX);
> +	struct drm_printer p =3D drm_dbg_printer(drm, DRM_UT_DP, DBG_PREFIX);
>  	char *buf =3D kzalloc(PAGE_SIZE, GFP_KERNEL);
>  	int i;
> =20
> @@ -1638,15 +1640,15 @@ __dump_topology_ref_history(struct drm_dp_mst_top=
ology_ref_history *history,
>  static __always_inline void
>  drm_dp_mst_dump_mstb_topology_history(struct drm_dp_mst_branch *mstb)
>  {
> -	__dump_topology_ref_history(&mstb->topology_ref_history, mstb,
> -				    "MSTB");
> +	__dump_topology_ref_history(mstb->mgr->dev, &mstb->topology_ref_history=
,
> +				    mstb, "MSTB");
>  }
> =20
>  static __always_inline void
>  drm_dp_mst_dump_port_topology_history(struct drm_dp_mst_port *port)
>  {
> -	__dump_topology_ref_history(&port->topology_ref_history, port,
> -				    "Port");
> +	__dump_topology_ref_history(port->mgr->dev, &port->topology_ref_history=
,
> +				    port, "Port");
>  }
> =20
>  static __always_inline void
> @@ -2824,7 +2826,9 @@ static int process_single_tx_qlock(struct drm_dp_ms=
t_topology_mgr *mgr,
>  	ret =3D drm_dp_send_sideband_msg(mgr, up, chunk, idx);
>  	if (ret) {
>  		if (drm_debug_enabled(DRM_UT_DP)) {
> -			struct drm_printer p =3D drm_debug_printer(DBG_PREFIX);
> +			struct drm_printer p =3D drm_dbg_printer(mgr->dev,
> +							       DRM_UT_DP,
> +							       DBG_PREFIX);
> =20
>  			drm_printf(&p, "sideband msg failed to send\n");
>  			drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> @@ -2869,7 +2873,8 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_=
topology_mgr *mgr,
>  	list_add_tail(&txmsg->next, &mgr->tx_msg_downq);
> =20
>  	if (drm_debug_enabled(DRM_UT_DP)) {
> -		struct drm_printer p =3D drm_debug_printer(DBG_PREFIX);
> +		struct drm_printer p =3D drm_dbg_printer(mgr->dev, DRM_UT_DP,
> +						       DBG_PREFIX);
> =20
>  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>  	}

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
