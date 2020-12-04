Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8F2CEC47
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 11:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D786D6E13A;
	Fri,  4 Dec 2020 10:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A61D6E13A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 10:33:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EDED41F45F59;
 Fri,  4 Dec 2020 10:33:57 +0000 (GMT)
Date: Fri, 4 Dec 2020 11:33:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH v4 3/7] drm/bridge: mhdp8546: Add minimal format
 negotiation
Message-ID: <20201204113347.3db9ee1e@collabora.com>
In-Reply-To: <20201201121830.29704-4-nikhil.nd@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-4-nikhil.nd@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 1 Dec 2020 17:48:26 +0530
Nikhil Devshatwar <nikhil.nd@ti.com> wrote:

> With new connector model, mhdp bridge will not create the connector and
> SoC driver will rely on format negotiation to setup the encoder format.
> 
> Support minimal format negotiations hooks in the drm_bridge_funcs.
> Complete format negotiation can be added based on EDID data.
> This patch adds the minimal required support to avoid failure
> after moving to new connector model.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
> 
> Notes:
>     changes from v1:
>     * cosmetic fixes, commit message update
> 
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d0c65610ebb5..2cd809eed827 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2078,6 +2078,30 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge *bridge)
>  	return &cdns_mhdp_state->base;
>  }
>  
> +static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state,
> +				      u32 output_fmt,
> +				      unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +	u32 default_bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
> +
> +	*num_input_fmts = 0;
> +
> +	if (output_fmt != MEDIA_BUS_FMT_FIXED)
> +		return NULL;
> +
> +	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = default_bus_format;

Why not 

	input_fmts[0] = MEDIA_BUS_FMT_RGB121212_1X36;

?

This way you could get rid of the default_bus_format variable.

> +	return input_fmts;
> +}
> +
>  static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *bridge_state,
>  				  struct drm_crtc_state *crtc_state,
> @@ -2142,6 +2166,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>  	.atomic_duplicate_state = cdns_mhdp_bridge_atomic_duplicate_state,
>  	.atomic_destroy_state = cdns_mhdp_bridge_atomic_destroy_state,
>  	.atomic_reset = cdns_mhdp_bridge_atomic_reset,
> +	.atomic_get_input_bus_fmts = cdns_mhdp_get_input_bus_fmts,
>  	.detect = cdns_mhdp_bridge_detect,
>  	.get_edid = cdns_mhdp_bridge_get_edid,
>  	.hpd_enable = cdns_mhdp_bridge_hpd_enable,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
