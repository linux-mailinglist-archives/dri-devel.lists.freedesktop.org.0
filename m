Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2F130400
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 20:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C00895CA;
	Sat,  4 Jan 2020 19:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D4E895CA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 19:20:30 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AE581804EB;
 Sat,  4 Jan 2020 20:20:27 +0100 (CET)
Date: Sat, 4 Jan 2020 20:20:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 2/3] drm: Add support for the LogiCVC display controller
Message-ID: <20200104192026.GA21210@ravnborg.org>
References: <20191203150606.317062-1-paul.kocialkowski@bootlin.com>
 <20191203150606.317062-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203150606.317062-3-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=_jCGCIFR2UvvXztaO4UA:9
 a=CejSvffWiMt_U7KW:21 a=nVbVrdCZduPxFul3:21 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

Good looking driver. Well structured in a number of relevant files.
A few comments in the following.
Some parts I fail to follow - due to my lack of DRM knowledge.
So all in all - only trivial comments.

With these fixed you can add:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Tue, Dec 03, 2019 at 04:06:05PM +0100, Paul Kocialkowski wrote:
> Introduces a driver for the LogiCVC display controller, a programmable
> logic controller optimized for use in Xilinx Zynq-7000 SoCs and other
> Xilinx FPGAs. The controller is mostly configured at logic synthesis
> time so only a subset of configuration is left for the driver to
> handle.
> 
> The following features are implemented and tested:
> - LVDS 4-bit interface;
> - RGB565 pixel formats;
> - Multiple layers and hardware composition;
> - Layer-wide alpha mode;
> 
> The following features are implemented but untested:
> - Other RGB pixel formats;
> - Layer framebuffer configuration for version 4;
> - Lowest-layer used as background color;
> - Per-pixel alpha mode.
> 
> The following features are not implemented:
> - YUV pixel formats;
> - DVI, LVDS 3-bit, ITU656 and camera link interfaces;
> - External parallel input for layer;
> - Color-keying;
> - LUT-based alpha modes.
> 
> Additional implementation-specific notes:
> - Panels are only enabled after the first page flip to avoid flashing a
>   white screen.
> - Depth used in context of the LogiCVC driver only counts color components
>   to match the definition of the synthesis parameters.
> 
> Support is implemented for both version 3 and 4 of the controller.
> 
> With version 3, framebuffers are stored in a dedicated contiguous
> memory area, with a base address hardcoded for each layer. This requires
> using a dedicated CMA pool registered at the base address and tweaking a
> few offset-related registers to try to use any buffer allocated from
> the pool. This is done on a best-effort basis to have the hardware cope
> with the DRM framebuffer allocation model and there is no guarantee
> that each buffer allocated by GEM CMA can be used for any layer.
> In particular, buffers allocated below the base address for a layer are
> guaranteed not to be configurable for that layer. See the implementation of
> logicvc_layer_buffer_find_setup for specifics.
> 
> Version 4 allows configuring each buffer address directly, which
> guarantees that any buffer can be configured.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> ---

MAINTAINERS needs an entry.
Will this driver be supported in drm-misc?
If yes, then yoy need to apply for write access (if you do not have it).

> diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
> new file mode 100644
> index 000000000000..34dacabbb49a
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/Kconfig
> @@ -0,0 +1,8 @@
> +config DRM_LOGICVC
> +       tristate "LogiCVC DRM"
> +       depends on DRM
> +       select DRM_KMS_HELPER
> +       select DRM_KMS_CMA_HELPER
> +       select DRM_GEM_CMA_HELPER
> +       help
> +         DRM display driver for the logiCVC programmable logic block from Xylon
The driver, as far as I can tell, required OF.
So a depends on OF seems missing.

> diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.c b/drivers/gpu/drm/logicvc/logicvc_crtc.c
> new file mode 100644
> index 000000000000..2c07f4594c32
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_crtc.c
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>

Empty line between the include blocks.

> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "logicvc_crtc.h"
> +#include "logicvc_drm.h"
> +#include "logicvc_interface.h"
> +#include "logicvc_layer.h"
> +#include "logicvc_regs.h"

All sorted within each block - good.

> +
> +#define logicvc_crtc(c) \
> +	container_of(c, struct logicvc_crtc, drm_crtc)
> +
> +static int logicvc_crtc_atomic_check(struct drm_crtc *drm_crtc,
> +				     struct drm_crtc_state *state)
> +{
> +	struct drm_display_mode *mode = &state->adjusted_mode;
> +
> +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +

> +
> +void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc)
> +{
> +	struct logicvc_crtc *crtc = logicvc->crtc;
> +	struct drm_device *drm = logicvc->drm;
> +	unsigned long flags;
> +
> +	if (!crtc)
> +		return;
> +
> +	drm_crtc_handle_vblank(&crtc->drm_crtc);
> +
> +	spin_lock_irqsave(&drm->event_lock, flags);
> +	if (crtc->event) {
> +		drm_crtc_send_vblank_event(&crtc->drm_crtc, crtc->event);
> +		drm_crtc_vblank_put(&crtc->drm_crtc);
> +		crtc->event = NULL;
> +	}
> +	spin_unlock_irqrestore(&drm->event_lock, flags);
In the other cases you have spin_* inside the block.
No nbeed to take the spinlock if crtc->event equals NULL

> +}
> +
> +int logicvc_crtc_init(struct logicvc_drm *logicvc)
> +{
> +	struct device_node *of_node = logicvc->drm->dev->of_node;
> +	struct logicvc_crtc *crtc;
> +	struct logicvc_layer *layer_primary;
> +	int ret;
> +
> +	crtc = devm_kzalloc(logicvc->drm->dev, sizeof(*crtc), GFP_KERNEL);
> +	if (!crtc)
> +		return -ENOMEM;
> +
> +	crtc->logicvc = logicvc;
> +
> +	layer_primary = logicvc_layer_get_primary(logicvc);
> +	if (!layer_primary) {
> +		DRM_ERROR("Failed to get primary layer\n");
Please use drm_err(logicvc->drm, "...");
This goes for all uses of DRM_ where you have a drm_device available.


> +		return -EINVAL;
> +	}
> +
> +	ret = drm_crtc_init_with_planes(logicvc->drm, &crtc->drm_crtc,
> +					&layer_primary->drm_plane, NULL,
> +					&logicvc_crtc_funcs, NULL);
> +	if (ret) {
> +		DRM_ERROR("Failed to initalize CRTC\n");
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(&crtc->drm_crtc, &logicvc_crtc_helper_funcs);
> +
> +	crtc->drm_crtc.port = of_graph_get_port_by_id(of_node, 1);
> +
> +	logicvc->crtc = crtc;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.h b/drivers/gpu/drm/logicvc/logicvc_crtc.h
> new file mode 100644
> index 000000000000..dfa55c377ac3
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_crtc.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#ifndef _LOGICVC_CRTC_H_
> +#define _LOGICVC_CRTC_H_
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_vblank.h>

Use a forward declaration of drm_pending_vblank_event,
then you can drop the above include.

> +
> +struct logicvc_drm;
> +
> +struct logicvc_crtc {
> +	struct logicvc_drm *logicvc;
> +
> +	struct drm_crtc drm_crtc;
> +	struct drm_pending_vblank_event *event;
> +};
> +
> +void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc);
> +int logicvc_crtc_init(struct logicvc_drm *logicvc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
> new file mode 100644
> index 000000000000..c9a1a6b38692
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -0,0 +1,467 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <drm/drm_atomic_helper.h>
Add empty lines between include blocks (one line up)..

> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_print.h>
> +
> +#include "logicvc_crtc.h"
> +#include "logicvc_drm.h"
> +#include "logicvc_interface.h"
> +#include "logicvc_mode.h"
> +#include "logicvc_layer.h"
> +#include "logicvc_of.h"
> +#include "logicvc_regs.h"
> +
> +DEFINE_DRM_GEM_CMA_FOPS(logicvc_drm_fops);
> +
> +static int logicvc_drm_gem_cma_dumb_create(struct drm_file *file_priv,
> +					   struct drm_device *drm,
> +					   struct drm_mode_create_dumb *args)
> +{
> +	struct logicvc_drm *logicvc = drm->dev_private;
> +
> +	/* Stride is always fixed to its configuration value. */
> +	args->pitch = logicvc->config.row_stride * DIV_ROUND_UP(args->bpp, 8);
> +
> +	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
> +}
> +
> +static struct drm_driver logicvc_drm_driver = {
> +	.driver_features		= DRIVER_GEM | DRIVER_MODESET |
> +					  DRIVER_ATOMIC,
> +
> +	.fops				= &logicvc_drm_fops,
> +	.name				= "logicvc-drm",
> +	.desc				= "Xylon LogiCVC DRM driver",
> +	.date				= "20190319",
2020?

> +	.major				= 1,
> +	.minor				= 0,
> +
> +	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> +	.dumb_create			= logicvc_drm_gem_cma_dumb_create,
> +};
> +

> new file mode 100644
> index 000000000000..cc728d5a4aee
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#ifndef _LOGICVC_DRM_H_
> +#define _LOGICVC_DRM_H_
> +
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <drm/drm_device.h>
> +
> +#define LOGICVC_DISPLAY_INTERFACE_RGB			0
> +#define LOGICVC_DISPLAY_INTERFACE_ITU656		1
> +#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS		2
> +#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA	3
> +#define LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS		4
> +#define LOGICVC_DISPLAY_INTERFACE_DVI			5
> +
> +#define LOGICVC_DISPLAY_COLORSPACE_RGB		0
> +#define LOGICVC_DISPLAY_COLORSPACE_YUV422	1
> +#define LOGICVC_DISPLAY_COLORSPACE_YUV444	2
> +
> +struct logicvc_crtc;
> +struct logicvc_interface;
> +
> +struct logicvc_drm_config {
> +	u32 display_interface;
> +	u32 display_colorspace;
> +	u32 display_depth;
> +	u32 row_stride;
> +	bool dithering;
> +	bool background_layer;
> +	bool layers_configurable;
> +	u32 layers_count;
> +};
> +
> +struct logicvc_drm_caps {
> +	bool layer_address;
> +};
> +
> +struct logicvc_drm {
> +	const struct logicvc_drm_caps *caps;
> +	struct logicvc_drm_config config;
> +	struct drm_device *drm;
Modern drm drivers are expected to embed drm_device.
See example in drm_drv.c

> +	phys_addr_t reserved_mem_base;
> +	struct regmap *regmap;
> +
> +	struct clk *vclk;
> +	struct clk *vclk2;
> +	struct clk *lvdsclk;
> +	struct clk *lvdsclkn;
> +
> +	struct list_head layers_list;
> +	struct logicvc_crtc *crtc;
> +	struct logicvc_interface *interface;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
> new file mode 100644
> index 000000000000..792b1fc2a5f7
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
> @@ -0,0 +1,235 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/types.h>
> +#include <drm/drm_atomic_helper.h>
Empty line
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "logicvc_crtc.h"
> +#include "logicvc_drm.h"
> +#include "logicvc_interface.h"
> +#include "logicvc_regs.h"
> +

> +static int logicvc_connector_get_modes(struct drm_connector *drm_connector)
> +{
> +	struct logicvc_interface *interface =
> +		logicvc_interface_from_drm_connector(drm_connector);
> +
> +	if (interface->drm_panel)
> +		return drm_panel_get_modes(interface->drm_panel);
In drm-misc-next this call takes a connector argument.

> +
> +	return 0;
> +}
> +
> +static const struct drm_connector_helper_funcs logicvc_connector_helper_funcs = {
> +	.get_modes		= logicvc_connector_get_modes,
> +};
> +
> +static void logicvc_connector_destroy(struct drm_connector *drm_connector)
> +{
> +	struct logicvc_interface *interface =
> +		logicvc_interface_from_drm_connector(drm_connector);
> +
> +	if (interface->drm_panel)
> +		drm_panel_detach(interface->drm_panel);
> +
> +	drm_connector_cleanup(drm_connector);
> +}
> +
> +static const struct drm_connector_funcs logicvc_connector_funcs = {
> +	.reset			= drm_atomic_helper_connector_reset,
> +	.fill_modes		= drm_helper_probe_single_connector_modes,
> +	.destroy		= logicvc_connector_destroy,
> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +};
> +

> +int logicvc_interface_init(struct logicvc_drm *logicvc)
> +{
> +	struct logicvc_interface *interface;
> +	struct device_node *of_node = logicvc->drm->dev->of_node;
> +	int encoder_type = logicvc_interface_encoder_type(logicvc);
> +	int connector_type = logicvc_interface_connector_type(logicvc);
The connector is today part of drm_panel, and should not be decided by
the display driver.

> +	bool native_connector = logicvc_interface_native_connector(logicvc);
> +	int ret;
> +
> +	interface = devm_kzalloc(logicvc->drm->dev, sizeof(*interface),
> +				 GFP_KERNEL);
> +	if (!interface) {
> +		ret = -ENOMEM;
> +		goto error_early;
> +	}
> +
> +	interface->logicvc = logicvc;
> +
> +	ret = drm_of_find_panel_or_bridge(of_node, 1, 0, &interface->drm_panel,
> +					  &interface->drm_bridge);
> +	if (ret == -EPROBE_DEFER)
> +		goto error_early;
> +
> +	ret = drm_encoder_init(logicvc->drm, &interface->drm_encoder,
> +			       &logicvc_encoder_funcs, encoder_type, NULL);
> +	if (ret) {
> +		DRM_ERROR("Failed to initalize encoder\n");
> +		goto error_early;
> +	}
> +
> +	drm_encoder_helper_add(&interface->drm_encoder,
> +			       &logicvc_encoder_helper_funcs);
> +
> +	if (native_connector || interface->drm_panel) {
> +		ret = drm_connector_init(logicvc->drm,
> +					 &interface->drm_connector,
> +					 &logicvc_connector_funcs,
> +					 connector_type);
> +		if (ret) {
> +			DRM_ERROR("Failed to initalize connector\n");
> +			goto error_encoder;
> +		}
> +
> +		drm_connector_helper_add(&interface->drm_connector,
> +					 &logicvc_connector_helper_funcs);
> +
> +		ret = drm_connector_attach_encoder(&interface->drm_connector,
> +						   &interface->drm_encoder);
> +		if (ret) {
> +			DRM_ERROR("Failed to attach connector to encoder\n");
> +			goto error_encoder;
> +		}
> +	}
> +
> +	if (interface->drm_panel) {
> +		ret = drm_panel_attach(interface->drm_panel,
> +				       &interface->drm_connector);
> +		if (ret) {
> +			DRM_ERROR("Failed to attach panel to connector\n");
> +			goto error_encoder;
> +		}
> +	}
> +
> +	if (interface->drm_bridge) {
> +		ret = drm_bridge_attach(&interface->drm_encoder,
> +					interface->drm_bridge, NULL);
> +		if (ret) {
> +			DRM_ERROR("Failed to attach bridge to encoder\n");
> +			goto error_encoder;
> +		}
> +	}
> +
> +	logicvc->interface = interface;
> +
> +	return 0;
> +
> +error_encoder:
> +	drm_encoder_cleanup(&interface->drm_encoder);
> +
> +error_early:
> +	return ret;
> +}

> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
> new file mode 100644
> index 000000000000..c7b092d592ad
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> @@ -0,0 +1,594 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/types.h>
> +#include <drm/drm_atomic.h>
Empty lines between blocks of include

> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_print.h>
> +
> +#include "logicvc_crtc.h"
> +#include "logicvc_drm.h"
> +#include "logicvc_layer.h"
> +#include "logicvc_of.h"
> +#include "logicvc_regs.h"
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
