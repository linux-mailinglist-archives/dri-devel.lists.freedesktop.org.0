Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B843B2CEC40
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 11:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092A86E138;
	Fri,  4 Dec 2020 10:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915946E138
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 10:31:50 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 07BF81F45F4E;
 Fri,  4 Dec 2020 10:31:49 +0000 (GMT)
Date: Fri, 4 Dec 2020 11:31:44 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH v5] drm/bridge: tfp410: Set input_bus_flags in atomic_check
Message-ID: <20201204113144.05f0e202@collabora.com>
In-Reply-To: <20201203125048.28943-1-nikhil.nd@ti.com>
References: <20201201121830.29704-3-nikhil.nd@ti.com>
 <20201203125048.28943-1-nikhil.nd@ti.com>
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

On Thu, 3 Dec 2020 18:20:48 +0530
Nikhil Devshatwar <nikhil.nd@ti.com> wrote:

> input_bus_flags are specified in drm_bridge_timings (legacy) as well
> as drm_bridge_state->input_bus_cfg.flags
> 
> The flags from the timings will be deprecated. Bridges are supposed
> to validate and set the bridge state flags from atomic_check.
> 
> Implement atomic_check hook for the same.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> 
> Notes:
>     changes from v4:
>     * fix a warning Reported-by: kernel test robot <lkp@intel.com>
> 
>  drivers/gpu/drm/bridge/ti-tfp410.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index 3def9acba86b..92963d12106b 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -233,6 +233,20 @@ static u32 *tfp410_get_input_bus_fmts(struct drm_bridge *bridge,
>  	return input_fmts;
>  }
>  
> +static int tfp410_atomic_check(struct drm_bridge *bridge,
> +		    struct drm_bridge_state *bridge_state,
> +		    struct drm_crtc_state *crtc_state,
> +		    struct drm_connector_state *conn_state)
> +{
> +	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
> +
> +	/*
> +	 * There might be flags negotiation supported in future
> +	 * Set the bus flags in atomic_check statically for now
> +	 */
> +	bridge_state->input_bus_cfg.flags = dvi->timings.input_bus_flags;

The return statement is still missing :-).

> +}
> +
>  static const struct drm_bridge_funcs tfp410_bridge_funcs = {
>  	.attach		= tfp410_attach,
>  	.detach		= tfp410_detach,
> @@ -243,6 +257,7 @@ static const struct drm_bridge_funcs tfp410_bridge_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_get_input_bus_fmts = tfp410_get_input_bus_fmts,
> +	.atomic_check = tfp410_atomic_check,
>  };
>  
>  static const struct drm_bridge_timings tfp410_default_timings = {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
