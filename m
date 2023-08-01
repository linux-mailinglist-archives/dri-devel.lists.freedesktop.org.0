Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B10A76BF57
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 23:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EC810E153;
	Tue,  1 Aug 2023 21:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2D610E153
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 21:35:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F5678D;
 Tue,  1 Aug 2023 23:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690925685;
 bh=MFrgXENkqlcRfX+EcNkS5B5eqVfsBlbWWD9455+s2wU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pXww2BwiAlcpMLRrthanfJuKSooNTgMfkM8H9jjdg/QIIDYgyM3+vFT+VwNq0kS4T
 10vdRipTLIkDX5qB08/UsjMKX5YmQkrQ8LeyZHoc+CsOhpGarXUBS+eeAt7wnYTMpW
 P+O+/1AYseQWDYT9uBt9OPYCG7IzfuKap7dDMdzc=
Date: Wed, 2 Aug 2023 00:35:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3] drm/bridge: Add debugfs print for bridge chains
Message-ID: <20230801213554.GE8578@pendragon.ideasonboard.com>
References: <20230731-drm-bridge-chain-debugfs-v3-1-7d0739f3efa3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230731-drm-bridge-chain-debugfs-v3-1-7d0739f3efa3@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Mon, Jul 31, 2023 at 03:13:14PM +0300, Tomi Valkeinen wrote:
> DRM bridges are not visible to the userspace and it may not be
> immediately clear if the chain is somehow constructed incorrectly. I
> have had two separate instances of a bridge driver failing to do a
> drm_bridge_attach() call, resulting in the bridge connector not being
> part of the chain. In some situations this doesn't seem to cause issues,
> but it will if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is used.
> 
> Add a debugfs file to print the bridge chains. For me, on this TI AM62
> based platform, I get the following output:
> 
> encoder[39]
> 	bridge[0] type: 0, ops: 0x0
> 	bridge[1] type: 0, ops: 0x0, OF: /bus@f0000/i2c@20000000/dsi@e:toshiba,tc358778
> 	bridge[2] type: 0, ops: 0x3, OF: /bus@f0000/i2c@20010000/hdmi@48:lontium,lt8912b
> 	bridge[3] type: 11, ops: 0x7, OF: /hdmi-connector:hdmi-connector
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v3:
> - Use drm_for_each_bridge_in_chain()
> - Drop extra comment
> - Fix whitespace issue
> - Call drm_bridge_debugfs_init() only if the driver uses modeset
> - Drop #ifdef for drm_bridge_debugfs_init() declaration
> - Link to v2: https://lore.kernel.org/r/20230721-drm-bridge-chain-debugfs-v2-1-76df94347962@ideasonboard.com
> 
> Changes in v2:
> - Fixed compilation issue when !CONFIG_OF
> - Link to v1: https://lore.kernel.org/r/20230721-drm-bridge-chain-debugfs-v1-1-8614ff7e890d@ideasonboard.com
> ---
>  drivers/gpu/drm/drm_bridge.c  | 46 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_debugfs.c |  3 +++
>  include/drm/drm_bridge.h      |  3 +++
>  3 files changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c3d69af02e79..39e68e45bb12 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -27,8 +27,10 @@
>  #include <linux/mutex.h>
>  
>  #include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>  
> @@ -1345,6 +1347,50 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  EXPORT_SYMBOL(of_drm_find_bridge);
>  #endif
>  
> +#ifdef CONFIG_DEBUG_FS
> +static int drm_bridge_chains_info(struct seq_file *m, void *data)
> +{
> +	struct drm_debugfs_entry *entry = m->private;
> +	struct drm_device *dev = entry->dev;
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct drm_mode_config *config = &dev->mode_config;
> +	struct drm_encoder *encoder;
> +	unsigned int bridge_idx = 0;
> +
> +	list_for_each_entry(encoder, &config->encoder_list, head) {
> +		struct drm_bridge *bridge;
> +
> +		drm_printf(&p, "encoder[%u]\n", encoder->base.id);
> +
> +		drm_for_each_bridge_in_chain(encoder, bridge) {
> +			drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
> +				   bridge_idx, bridge->type, bridge->ops);
> +
> +#ifdef CONFIG_OF
> +			if (bridge->of_node)
> +				drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
> +#endif
> +
> +			drm_printf(&p, "\n");
> +
> +			bridge_idx++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
> +	{ "bridge_chains", drm_bridge_chains_info, 0 },
> +};
> +
> +void drm_bridge_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_add_files(minor->dev, drm_bridge_debugfs_list,
> +			      ARRAY_SIZE(drm_bridge_debugfs_list));
> +}
> +#endif
> +
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>  MODULE_DESCRIPTION("DRM bridge infrastructure");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index a3a488205009..3b1de2c61c89 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -31,6 +31,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_auth.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_client.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
> @@ -274,6 +275,8 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  
>  	if (drm_drv_uses_atomic_modeset(dev)) {
>  		drm_atomic_debugfs_init(minor);
> +

You could drop the blank line, up to you.

> +		drm_bridge_debugfs_init(minor);
>  	}
>  
>  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index bf964cdfb330..cb10ee108538 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -949,4 +949,7 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>  }
>  #endif
>  
> +struct drm_minor;

Let's move this to tbe beginning of the file with the other forward
declarations. With this addressedn

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +void drm_bridge_debugfs_init(struct drm_minor *minor);
> +
>  #endif
> 
> ---
> base-commit: a0c64d153d687756c8719b8d10e609d62e1cb6fd
> change-id: 20230721-drm-bridge-chain-debugfs-0bbc1522f57a

-- 
Regards,

Laurent Pinchart
