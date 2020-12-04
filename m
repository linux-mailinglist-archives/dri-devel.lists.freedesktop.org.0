Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD02CEC5C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 11:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA206E134;
	Fri,  4 Dec 2020 10:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930BC6E134
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 10:42:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3C6D31F45F5F;
 Fri,  4 Dec 2020 10:42:48 +0000 (GMT)
Date: Fri, 4 Dec 2020 11:42:44 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH v4 4/7] drm/bridge: mhdp8546: Set input_bus_flags from
 atomic_check
Message-ID: <20201204114244.3754309b@collabora.com>
In-Reply-To: <20201201121830.29704-5-nikhil.nd@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-5-nikhil.nd@ti.com>
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

On Tue, 1 Dec 2020 17:48:27 +0530
Nikhil Devshatwar <nikhil.nd@ti.com> wrote:

> input_bus_flags are specified in drm_bridge_timings (legacy) as well
> as drm_bridge_state->input_bus_cfg.flags
> 
> The flags from the timings will be deprecated. Bridges are supposed
> to validate and set the bridge state flags from atomic_check.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++++
>  drivers/gpu/drm/bridge/ti-tfp410.c                  | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 2cd809eed827..9c17e4bb517e 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2121,6 +2121,12 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * There might be flags negotiation supported in future
> +	 * Set the bus flags in atomic_check statically for now
> +	 */
> +	bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;

I'd go even further and replace the timings field in
cdns_mhdp_platform_info by an input_bus_flags field, you'll then
have the following assignment here.

	if (mhdp->info)
		bridge_state->input_bus_cfg.flags = mhdp->info->input_bus_flags;

This way you no rely on the bridge->timings presence and can
get rid of the mhdp->bridge.timings assignment in the probe path.


> +
>  	mutex_unlock(&mhdp->link_mutex);
>  	return 0;
>  }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
