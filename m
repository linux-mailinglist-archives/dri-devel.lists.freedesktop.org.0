Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD845652DF1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5090C10E43A;
	Wed, 21 Dec 2022 08:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2247A10E37D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:52:52 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FD8E56D;
 Tue, 20 Dec 2022 13:52:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671540770;
 bh=ngEJeRNMDCWfBcQzbRwgtK4TyhXN4zaXVQfYnPHfFfU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=odxsXkB8AmitJbcAHZlBAGr9RyX1dSt8GuaIF3Obm703TrRPN4EYtxk7A8uyIqXoa
 bmc4L5nYCJwu8qQ7MXSVmHjpS07nIc2Zf6q1n+UAckDHwXBSNcKGD0VYK2nHuYX6Oc
 aKFQTLhjicA08xCIcdAK5lkhy7k0YgiFUyWCFdac=
Message-ID: <7feda5ce-5cff-3838-94ec-c2a1ef831398@ideasonboard.com>
Date: Tue, 20 Dec 2022 14:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 3/5] drm/tidss: Add support to configure OLDI mode for
 am625-dss.
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221119173019.15643-1-a-bhatia1@ti.com>
 <20221119173019.15643-4-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221119173019.15643-4-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 21 Dec 2022 08:29:21 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/11/2022 19:30, Aradhya Bhatia wrote:
> The newer version of DSS (AM625-DSS) has 2 OLDI TXes at its disposal.
> These can be configured to support the following modes:
> 
> 1. OLDI_SINGLE_LINK_SINGLE_MODE
> Single Output over OLDI 0.
> +------+        +---------+      +-------+
> |      |        |         |      |       |
> | CRTC +------->+ ENCODER +----->| PANEL |
> |      |        |         |      |       |
> +------+        +---------+      +-------+
> 
> 2. OLDI_SINGLE_LINK_CLONE_MODE
> Duplicate Output over OLDI 0 and 1.
> +------+        +---------+      +-------+
> |      |        |         |      |       |
> | CRTC +---+--->| ENCODER +----->| PANEL |
> |      |   |    |         |      |       |
> +------+   |    +---------+      +-------+
>             |
>             |    +---------+      +-------+
>             |    |         |      |       |
>             +--->| ENCODER +----->| PANEL |
>                  |         |      |       |
>                  +---------+      +-------+
> 
> 3. OLDI_DUAL_LINK_MODE
> Combined Output over OLDI 0 and 1.
> +------+        +---------+      +-------+
> |      |        |         +----->|       |
> | CRTC +------->+ ENCODER |      | PANEL |
> |      |        |         +----->|       |
> +------+        +---------+      +-------+
> 
> Following the above pathways for different modes, 2 encoder/panel-bridge
> pipes get created for clone mode, and 1 pipe in cases of single link and
> dual link mode.
> 
> Add support for confguring the OLDI modes using OF and LVDS DRM helper
> functions.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c   |  12 ++
>   drivers/gpu/drm/tidss/tidss_dispc.h   |   9 ++
>   drivers/gpu/drm/tidss/tidss_drv.h     |   3 +
>   drivers/gpu/drm/tidss/tidss_encoder.c |   4 +-
>   drivers/gpu/drm/tidss/tidss_encoder.h |   3 +-
>   drivers/gpu/drm/tidss/tidss_kms.c     | 188 +++++++++++++++++++++++---
>   6 files changed, 198 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index dbc6a5b617ca..472226a83251 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -365,6 +365,8 @@ struct dispc_device {
>   
>   	struct dss_vp_data vp_data[TIDSS_MAX_VPS];
>   
> +	enum dispc_oldi_modes oldi_mode;
> +
>   	u32 *fourccs;
>   	u32 num_fourccs;
>   
> @@ -1967,6 +1969,16 @@ const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len)
>   	return dispc->fourccs;
>   }
>   
> +int dispc_set_oldi_mode(struct dispc_device *dispc,
> +			enum dispc_oldi_modes oldi_mode)
> +{
> +	WARN_ON(!dispc);

This feels unnecessary. Is there even a theoretical case where we could 
get dispc == NULL?

> +
> +	dispc->oldi_mode = oldi_mode;
> +
> +	return 0;

This function could as well be void function.

> +}
> +
>   static s32 pixinc(int pixels, u8 ps)
>   {
>   	if (pixels == 1)
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 51db500590ee..e76a7599b544 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -64,6 +64,14 @@ enum dispc_dss_subrevision {
>   	DISPC_AM625,
>   };
>   
> +enum dispc_oldi_modes {
> +	OLDI_MODE_OFF,			/* OLDI turned off / tied off in IP. */
> +	OLDI_SINGLE_LINK_SINGLE_MODE,	/* Single Output over OLDI 0. */
> +	OLDI_SINGLE_LINK_CLONE_MODE,	/* Duplicate Output over OLDI 0 and 1. */
> +	OLDI_DUAL_LINK_MODE,		/* Combined Output over OLDI 0 and 1. */
> +	OLDI_MODE_UNSUPPORTED,		/* Unsupported OLDI Mode */
> +};

What is the difference with MODE_OFF and MODE_UNSUPPORTED? Is 
MODE_UNSUPPORTED for cases where, e.g., the DT setup is wrong and the 
driver should return an error? The code doesn't quite do that, it prints 
an error but then continues.

>   struct dispc_features {
>   	int min_pclk_khz;
>   	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
> @@ -133,6 +141,7 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
>   		      u32 hw_videoport);
>   int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
>   const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
> +int dispc_set_oldi_mode(struct dispc_device *dispc, enum dispc_oldi_modes oldi_mode);
>   
>   int dispc_init(struct tidss_device *tidss);
>   void dispc_remove(struct tidss_device *tidss);
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index 0ce7ee5ccd5b..58892f065c16 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -13,6 +13,9 @@
>   #define TIDSS_MAX_PLANES 4
>   #define TIDSS_MAX_OUTPUT_PORTS 4
>   
> +/* For AM625-DSS with 2 OLDI TXes */
> +#define TIDSS_MAX_BRIDGES_PER_PIPE	2
> +
>   typedef u32 dispc_irq_t;
>   
>   struct tidss_device {
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> index e278a9c89476..141383ec4045 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> @@ -70,7 +70,8 @@ static const struct drm_encoder_funcs encoder_funcs = {
>   };
>   
>   struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> -					 u32 encoder_type, u32 possible_crtcs)
> +					 u32 encoder_type, u32 possible_crtcs,
> +					 u32 possible_clones)
>   {
>   	struct drm_encoder *enc;
>   	int ret;
> @@ -80,6 +81,7 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
>   		return ERR_PTR(-ENOMEM);
>   
>   	enc->possible_crtcs = possible_crtcs;
> +	enc->possible_clones = possible_clones;
>   
>   	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
>   			       encoder_type, NULL);
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.h b/drivers/gpu/drm/tidss/tidss_encoder.h
> index ace877c0e0fd..01c62ba3ef16 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.h
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.h
> @@ -12,6 +12,7 @@
>   struct tidss_device;
>   
>   struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> -					 u32 encoder_type, u32 possible_crtcs);
> +					 u32 encoder_type, u32 possible_crtcs,
> +					 u32 possible_clones);
>   
>   #endif
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index fc9c4eefd31d..8ae321f02197 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -106,30 +106,115 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
>   	.atomic_commit = drm_atomic_helper_commit,
>   };
>   
> +static enum dispc_oldi_modes tidss_get_oldi_mode(struct device_node *oldi0_port,
> +						 struct device_node *oldi1_port)
> +{
> +	int pixel_order;
> +
> +	if (!(oldi0_port || oldi1_port)) {
> +		/* Keep OLDI TXes off if neither OLDI port is present. */
> +		return OLDI_MODE_OFF;
> +	} else if (oldi0_port && !oldi1_port) {
> +		/*
> +		 * OLDI0 port found, but not OLDI1 port. Setting single
> +		 * link, single mode output.
> +		 */
> +		return OLDI_SINGLE_LINK_SINGLE_MODE;
> +	} else if (!oldi0_port && oldi1_port) {
> +		/*
> +		 * The 2nd OLDI TX cannot be operated alone. This use case is
> +		 * not supported in the HW. Since the pins for OLDIs 0 and 1 are
> +		 * separate, one could theoretically set a clone mode over OLDIs
> +		 * 0 and 1 and just simply not use the OLDI 0. This is a hacky
> +		 * way to enable only OLDI TX 1 and hence is not officially
> +		 * supported.
> +		 */
> +		return OLDI_MODE_UNSUPPORTED;

If OLDI_MODE_UNSUPPORTED is supposed to result in an error, maybe you 
could print the error here (and possibly in the default case below), and 
then, in the caller, just return with an error code.

> +	}
> +
> +	/*
> +	 * OLDI Ports found for both the OLDI TXes. The DSS is to be configured
> +	 * in either Dual Link or Clone Mode.
> +	 */
> +	pixel_order = drm_of_lvds_get_dual_link_pixel_order(oldi0_port,
> +							    oldi1_port);
> +	switch (pixel_order) {
> +	case -EINVAL:
> +		/*
> +		 * The dual link properties were not found in at least one of
> +		 * the sink nodes. Since 2 OLDI ports are present in the DT, it
> +		 * can be safely assumed that the required configuration is
> +		 * Clone Mode.
> +		 */
> +		return OLDI_SINGLE_LINK_CLONE_MODE;
> +
> +	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
> +		/*
> +		 * Note that the OLDI TX 0 transmits the odd set of pixels while
> +		 * the OLDI TX 1 transmits the even set. This is a fixed
> +		 * configuration in the IP and an cannot be change vis SW. These
> +		 * properties have been used to merely identify if a Dual Link
> +		 * configuration is required. Swapping this property in the panel
> +		 * port DT nodes will not make any difference.
> +		 */
> +		pr_warn("EVEN-ODD config for dual-link sinks is not supported in HW. Switching to ODD-EVEN.\n");

Please use dev_warn() instead, so that it will be clear where the print 
comes from.

In any case, isn't this an error? Do you really want to accept the wrong 
pixel order?

> +		fallthrough;
> +
> +	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> +		return OLDI_DUAL_LINK_MODE;
> +
> +	default:
> +		return OLDI_MODE_OFF;

When do we get here? Shouldn't this be OLDI_MODE_UNSUPPORTED?

> +	}
> +}
> +
>   static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>   {
>   	struct device *dev = tidss->dev;
>   	unsigned int fourccs_len;
>   	const u32 *fourccs = dispc_plane_formats(tidss->dispc, &fourccs_len);
> -	unsigned int i;
> +	unsigned int i, j;
>   
>   	struct pipe {
>   		u32 hw_videoport;
> -		struct drm_bridge *bridge;
> +		struct drm_bridge *bridge[TIDSS_MAX_BRIDGES_PER_PIPE];
>   		u32 enc_type;
> +		u32 num_bridges;
>   	};
>   
>   	const struct dispc_features *feat = tidss->feat;
> -	u32 max_vps = feat->num_vps;
> +	u32 output_ports = feat->num_output_ports;
>   	u32 max_planes = feat->num_planes;
>   
> -	struct pipe pipes[TIDSS_MAX_VPS];
> +	struct pipe pipes[TIDSS_MAX_VPS] = {0};
> +
>   	u32 num_pipes = 0;
>   	u32 crtc_mask;
> +	u32 portnum_oldi0 = 0, portnum_oldi1 = 2;

These two are bit of hacks. First, they should be const, or maybe 
defines. If they're const, they can be inside the block below.

And they're very much tied to the HW in question, so just having 
hardcoded values here inside a function without any mention of the 
situation is not good.

Doing this in a generic and future proof manner is... challenging. So I 
think using the hardcoded port numbers is fine. But they are only ok for 
the two AM6xx SoCs we have now so the 'oldi_supported' is not very good 
fit. In fact, it might be good to drop 'oldi_supported' altogether, and 
just check for the SoC versions instead, as (with a quick glance), all 
the 'oldi_supported' checks are really SoC specific.

This also again brings up a thing that rubs me the wrong way: the new 
OLDI port is port 2. I really think that on AM62x, the two OLDI ports 
should be 0 and 1, and the DPI should be 2. Would we need a new 
dt-binding doc for that, or could it still be described in the same doc? 
Would that change cause changes elsewhere in the dss driver?

> +	enum dispc_oldi_modes oldi_mode = OLDI_MODE_OFF;
> +	u32 num_oldi = 0;
> +	u32 oldi_pipe_index = 0;
> +	u32 num_encoders = 0;
> +
> +	if (feat->oldi_supported) {
> +		struct device_node *oldi0_port, *oldi1_port;
> +
> +		oldi0_port = of_graph_get_port_by_id(dev->of_node,
> +						     portnum_oldi0);
> +		oldi1_port = of_graph_get_port_by_id(dev->of_node,
> +						     portnum_oldi1);
> +
> +		oldi_mode = tidss_get_oldi_mode(oldi0_port, oldi1_port);
> +
> +		of_node_put(oldi0_port);
> +		of_node_put(oldi1_port);
> +
> +		dispc_set_oldi_mode(tidss->dispc, oldi_mode);
> +	}
>   
>   	/* first find all the connected panels & bridges */
>   
> -	for (i = 0; i < max_vps; i++) {
> +	for (i = 0; i < output_ports; i++) {
>   		struct drm_panel *panel;
>   		struct drm_bridge *bridge;
>   		u32 enc_type = DRM_MODE_ENCODER_NONE;
> @@ -145,16 +230,24 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>   			return ret;
>   		}
>   
> +		if (feat->output_port_bus_type[i] == DISPC_VP_OLDI &&
> +		    oldi_mode == OLDI_MODE_UNSUPPORTED) {
> +			dev_err(dev,
> +				"Single Mode over OLDI 1 is not supported in HW. Keeping OLDI off.\n");
> +			continue;

Should we error out here?

> +		}
> +
>   		if (panel) {
>   			u32 conn_type;
>   
>   			dev_dbg(dev, "Setting up panel for port %d\n", i);
>   
> -			switch (feat->vp_bus_type[i]) {
> +			switch (feat->output_port_bus_type[i]) {
>   			case DISPC_VP_OLDI:
>   				enc_type = DRM_MODE_ENCODER_LVDS;
>   				conn_type = DRM_MODE_CONNECTOR_LVDS;
>   				break;
> +
>   			case DISPC_VP_DPI:
>   				enc_type = DRM_MODE_ENCODER_DPI;
>   				conn_type = DRM_MODE_CONNECTOR_DPI;
> @@ -172,6 +265,17 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>   				return -EINVAL;
>   			}
>   
> +			/*
> +			 * If the 2nd OLDI port is discovered connected to a panel
> +			 * which is not to be connected in the Clone Mode then a
> +			 * bridge is not required because the detected port is the
> +			 * 2nd port for the previously connected panel.
> +			 */
> +			if (feat->output_port_bus_type[i] == DISPC_VP_OLDI &&
> +			    oldi_mode != OLDI_SINGLE_LINK_CLONE_MODE &&

Hmm, shouldn't this be oldi_mode == OLDI_DUAL_LINK_MODE? Or rather, 
shouldn't we test here if this is the second oldi display, and if so 
which oldi-mode are we using. If dual-link, break. If clone, continue. 
Otherwise, error.

> +			    num_oldi)
> +				break;
> +
>   			bridge = devm_drm_panel_bridge_add(dev, panel);
>   			if (IS_ERR(bridge)) {
>   				dev_err(dev,
> @@ -181,10 +285,47 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>   			}
>   		}
>   
> -		pipes[num_pipes].hw_videoport = i;
> -		pipes[num_pipes].bridge = bridge;
> -		pipes[num_pipes].enc_type = enc_type;
> -		num_pipes++;
> +		if (feat->output_port_bus_type[i] == DISPC_VP_OLDI) {
> +			if (++num_oldi == 1) {
> +				/* Setting up pipe parameters when 1st OLDI port is detected */
> +
> +				pipes[num_pipes].hw_videoport = i;
> +				pipes[num_pipes].enc_type = enc_type;
> +
> +				/*
> +				 * Saving the pipe index in case its required for
> +				 * 2nd OLDI Port.
> +				 */
> +				oldi_pipe_index = num_pipes;
> +
> +				/*
> +				 * No additional pipe is required for the 2nd OLDI
> +				 * port, because the 2nd Encoder -> Bridge connection
> +				 * is the part of the first OLDI Port pipe.
> +				 *
> +				 * num_pipes will only be incremented when the first
> +				 * OLDI port is discovered.
> +				 */
> +				num_pipes++;
> +			}
> +
> +			/*
> +			 * Bridge is required to be added only if the detected
> +			 * port is the first OLDI port or a subsequent port in
> +			 * Clone Mode.
> +			 */
> +			if (oldi_mode == OLDI_SINGLE_LINK_CLONE_MODE ||
> +			    num_oldi == 1) {
> +				pipes[oldi_pipe_index].bridge[num_oldi - 1] = bridge;
> +				pipes[oldi_pipe_index].num_bridges++;
> +			}
> +		} else {
> +			pipes[num_pipes].hw_videoport = i;
> +			pipes[num_pipes].bridge[0] = bridge;
> +			pipes[num_pipes].num_bridges++;
> +			pipes[num_pipes].enc_type = enc_type;
> +			num_pipes++;
> +		}
>   	}
>   
>   	/* all planes can be on any crtc */
> @@ -196,6 +337,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>   		struct tidss_plane *tplane;
>   		struct tidss_crtc *tcrtc;
>   		struct drm_encoder *enc;
> +		u32 possible_clones = 0;
>   		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
>   		int ret;
>   
> @@ -218,16 +360,24 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>   
>   		tidss->crtcs[tidss->num_crtcs++] = &tcrtc->crtc;
>   
> -		enc = tidss_encoder_create(tidss, pipes[i].enc_type,
> -					   1 << tcrtc->crtc.index);
> -		if (IS_ERR(enc)) {
> -			dev_err(tidss->dev, "encoder create failed\n");
> -			return PTR_ERR(enc);
> -		}
> +		for (j = 0; j < pipes[i].num_bridges; j++) {
> +			if (pipes[i].num_bridges > 1)
> +				possible_clones = (((1 << pipes[i].num_bridges) - 1)
> +						  << num_encoders);

I think the above possible_clones assignment can be outside the for loop.

> +
> +			enc = tidss_encoder_create(tidss, pipes[i].enc_type,
> +						   1 << tcrtc->crtc.index,
> +						   possible_clones);
> +			if (IS_ERR(enc)) {
> +				dev_err(tidss->dev, "encoder create failed\n");
> +				return PTR_ERR(enc);
> +			}
>   
> -		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL, 0);
> -		if (ret)
> -			return ret;
> +			ret = drm_bridge_attach(enc, pipes[i].bridge[j], NULL, 0);
> +			if (ret)
> +				return ret;
> +		}
> +		num_encoders += pipes[i].num_bridges;
>   	}
>   
>   	/* create overlay planes of the leftover planes */

  Tomi

