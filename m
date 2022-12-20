Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32636652DE3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134F10E425;
	Wed, 21 Dec 2022 08:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1B810E37D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:52:45 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 252D6706;
 Tue, 20 Dec 2022 13:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671540763;
 bh=E5h1D6SPMg+7COHzzCe/4v8aUq1FicEAb4J9oRVC0Pk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sg12aPF/XZmJwEimFHJm4E+bTeFYfWd0rrFGTxSPNfK0twjHvG5+D3x9o48eSclFg
 vocAA/YS8Ws4yt7n6jv6pfx2nYCP1FycabzIfDSXBt2XoRFKyRUPx5AG8jJS5hUm59
 Z1n2WNB7j8cqnMFY/F+G82WMS+BvN4fHT9stN7w0=
Message-ID: <ec33c0fd-94b4-0ee0-0b96-5d50fee33c59@ideasonboard.com>
Date: Tue, 20 Dec 2022 14:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 2/5] drm/tidss: Add support for AM625 DSS
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221119173019.15643-1-a-bhatia1@ti.com>
 <20221119173019.15643-3-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221119173019.15643-3-a-bhatia1@ti.com>
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
> Add support for the DSS controller on TI's new AM625 SoC in the tidss
> driver.
> 
> The first video port (VP0) in am625-dss can output OLDI signals through
> 2 OLDI TXes. A 3rd output port has been added with "DISPC_VP_OLDI" bus
> type.
> 
> DSS controllers before AM625 had a 1 to 1 coupling between Videoports
> and Output Ports. Since this stands no longer to be true for AM625 DSS,
> this couppling has been separated with the introduction of output port
> based variables. This will help address the addition of the 2nd OLDI TX
> over VP0 as the 3rd output port.

This patch does three things:
- Renames "port" to "vp" where applicable
- Adds output ports
- Adds AM625

I think at least the AM625 parts should be a separate patch, but 
preferably all three would be separate patches.

> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 80 ++++++++++++++++++++++++++---
>   drivers/gpu/drm/tidss/tidss_dispc.h | 15 ++++--
>   drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
>   drivers/gpu/drm/tidss/tidss_drv.h   |  5 +-
>   drivers/gpu/drm/tidss/tidss_irq.h   |  2 +-
>   drivers/gpu/drm/tidss/tidss_kms.c   |  2 +-
>   6 files changed, 90 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index ad93acc9abd2..dbc6a5b617ca 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -93,10 +93,13 @@ const struct dispc_features dispc_k2g_feats = {
>   	.common_regs = tidss_k2g_common_regs,
>   
>   	.num_vps = 1,
> +	.num_output_ports = 1,
> +	.oldi_supported = false,

I'd prefer "has_oldi", the style is used in other places too.

>   	.vp_name = { "vp1" },
>   	.ovr_name = { "ovr1" },
>   	.vpclk_name =  { "vp1" },
>   	.vp_bus_type = { DISPC_VP_DPI },
> +	.output_port_bus_type = { DISPC_VP_DPI },

It would make sense to re-arrange these a bit, so that lines related to 
VPs are together, and lines related to output ports would be together.

>   	.vp_feat = { .color = {
>   			.has_ctm = true,
> @@ -168,10 +171,13 @@ const struct dispc_features dispc_am65x_feats = {
>   	.common_regs = tidss_am65x_common_regs,
>   
>   	.num_vps = 2,
> +	.num_output_ports = 2,
> +	.oldi_supported = true,
>   	.vp_name = { "vp1", "vp2" },
>   	.ovr_name = { "ovr1", "ovr2" },
>   	.vpclk_name =  { "vp1", "vp2" },
>   	.vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
> +	.output_port_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
>   
>   	.vp_feat = { .color = {
>   			.has_ctm = true,
> @@ -257,12 +263,16 @@ const struct dispc_features dispc_j721e_feats = {
>   	.common_regs = tidss_j721e_common_regs,
>   
>   	.num_vps = 4,
> +	.num_output_ports = 4,
> +	.oldi_supported = false,
>   	.vp_name = { "vp1", "vp2", "vp3", "vp4" },
>   	.ovr_name = { "ovr1", "ovr2", "ovr3", "ovr4" },
>   	.vpclk_name = { "vp1", "vp2", "vp3", "vp4" },
>   	/* Currently hard coded VP routing (see dispc_initial_config()) */
>   	.vp_bus_type =	{ DISPC_VP_INTERNAL, DISPC_VP_DPI,
>   			  DISPC_VP_INTERNAL, DISPC_VP_DPI, },
> +	.output_port_bus_type =	{ DISPC_VP_INTERNAL, DISPC_VP_DPI,
> +			  DISPC_VP_INTERNAL, DISPC_VP_DPI, },
>   	.vp_feat = { .color = {
>   			.has_ctm = true,
>   			.gamma_size = 1024,
> @@ -275,6 +285,59 @@ const struct dispc_features dispc_j721e_feats = {
>   	.vid_order = { 1, 3, 0, 2 },
>   };
>   
> +const struct dispc_features dispc_am625_feats = {
> +	.max_pclk_khz = {
> +		[DISPC_VP_DPI] = 165000,
> +		[DISPC_VP_OLDI] = 165000,
> +	},
> +
> +	.scaling = {
> +		.in_width_max_5tap_rgb = 1280,
> +		.in_width_max_3tap_rgb = 2560,
> +		.in_width_max_5tap_yuv = 2560,
> +		.in_width_max_3tap_yuv = 4096,
> +		.upscale_limit = 16,
> +		.downscale_limit_5tap = 4,
> +		.downscale_limit_3tap = 2,
> +		/*
> +		 * The max supported pixel inc value is 255. The value
> +		 * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
> +		 * The maximum bpp of all formats supported by the HW
> +		 * is 8. So the maximum supported xinc value is 32,
> +		 * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
> +		 */
> +		.xinc_max = 32,
> +	},
> +
> +	.subrev = DISPC_AM625,
> +
> +	.common = "common",
> +	.common_regs = tidss_am65x_common_regs,
> +
> +	.num_vps = 2,
> +	/* note: the 3rd port is not representative of a 3rd pipeline */
> +	.num_output_ports = 3,
> +	.oldi_supported = true,
> +	.vp_name = { "vp1", "vp2" },
> +	.ovr_name = { "ovr1", "ovr2" },
> +	.vpclk_name =  { "vp1", "vp2" },
> +	.vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
> +	.output_port_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI, DISPC_VP_OLDI },

This is a bit confusing: DISPC_VP_* defines are used for both 
vp_bus_type (which makes sense), but it's also used for 
output_port_bus_type.

The code uses both vp_bus_type and output_port_bus_type, but my initial 
reaction was that we should only have one of these. Perhaps the 
output_port_bus_type, as the VPs should be identical. The differences 
are after the VP.

However, I'm not sure if that's an easy change. But maybe instead of 
output_port_bus_type we could have output_port_source, which lists, for 
each output port, the VP it uses as a source. Here it would be { 0, 1, 0 
}. With that, the code can get the output's VP bus_type.

> +	.vp_feat = { .color = {
> +			.has_ctm = true,
> +			.gamma_size = 256,
> +			.gamma_type = TIDSS_GAMMA_8BIT,
> +		},
> +	},
> +
> +	.num_planes = 2,
> +	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
> +	.vid_name = { "vid", "vidl1" },
> +	.vid_lite = { false, true, },
> +	.vid_order = { 1, 0 },
> +};
> +
>   static const u16 *dispc_common_regmap;
>   
>   struct dss_vp_data {
> @@ -287,12 +350,12 @@ struct dispc_device {
>   
>   	void __iomem *base_common;
>   	void __iomem *base_vid[TIDSS_MAX_PLANES];
> -	void __iomem *base_ovr[TIDSS_MAX_PORTS];
> -	void __iomem *base_vp[TIDSS_MAX_PORTS];
> +	void __iomem *base_ovr[TIDSS_MAX_VPS];
> +	void __iomem *base_vp[TIDSS_MAX_VPS];
>   
>   	struct regmap *oldi_io_ctrl;
>   
> -	struct clk *vp_clk[TIDSS_MAX_PORTS];
> +	struct clk *vp_clk[TIDSS_MAX_VPS];
>   
>   	const struct dispc_features *feat;
>   
> @@ -300,7 +363,7 @@ struct dispc_device {
>   
>   	bool is_enabled;
>   
> -	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
> +	struct dss_vp_data vp_data[TIDSS_MAX_VPS];
>   
>   	u32 *fourccs;
>   	u32 num_fourccs;
> @@ -778,6 +841,7 @@ dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
>   		return dispc_k2g_read_and_clear_irqstatus(dispc);
>   	case DISPC_AM65X:
>   	case DISPC_J721E:
> +	case DISPC_AM625:

In switch cases like these, I think it makes sense to group the cases. 
Here the AM6 cases should be together, and I'd put the AM625 on top so 
that the cases are sorted.

>   		return dispc_k3_read_and_clear_irqstatus(dispc);
>   	default:
>   		WARN_ON(1);
> @@ -793,6 +857,7 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
>   		break;
>   	case DISPC_AM65X:
>   	case DISPC_J721E:
> +	case DISPC_AM625:
>   		dispc_k3_set_irqenable(dispc, mask);
>   		break;
>   	default:
> @@ -1116,7 +1181,7 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>   					 const struct drm_display_mode *mode)
>   {
>   	u32 hsw, hfp, hbp, vsw, vfp, vbp;
> -	enum dispc_vp_bus_type bus_type;
> +	enum dispc_bus_type bus_type;
>   	int max_pclk;
>   
>   	bus_type = dispc->feat->vp_bus_type[hw_videoport];
> @@ -1282,6 +1347,7 @@ void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
>   					x, y, layer);
>   		break;
>   	case DISPC_AM65X:
> +	case DISPC_AM625:
>   		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
>   					  x, y, layer);
>   		break;
> @@ -2205,6 +2271,7 @@ static void dispc_plane_init(struct dispc_device *dispc)
>   		break;
>   	case DISPC_AM65X:
>   	case DISPC_J721E:
> +	case DISPC_AM625:
>   		dispc_k3_plane_init(dispc);
>   		break;
>   	default:
> @@ -2310,6 +2377,7 @@ static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
>   		dispc_k2g_vp_write_gamma_table(dispc, hw_videoport);
>   		break;
>   	case DISPC_AM65X:
> +	case DISPC_AM625:
>   		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
>   		break;
>   	case DISPC_J721E:
> @@ -2583,7 +2651,7 @@ int dispc_runtime_resume(struct dispc_device *dispc)
>   		REG_GET(dispc, DSS_SYSSTATUS, 2, 2),
>   		REG_GET(dispc, DSS_SYSSTATUS, 3, 3));
>   
> -	if (dispc->feat->subrev == DISPC_AM65X)
> +	if (dispc->feat->oldi_supported)
>   		dev_dbg(dispc->dev, "OLDI RESETDONE %d,%d,%d\n",
>   			REG_GET(dispc, DSS_SYSSTATUS, 5, 5),
>   			REG_GET(dispc, DSS_SYSSTATUS, 6, 6),
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index e49432f0abf5..51db500590ee 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -50,7 +50,7 @@ struct dispc_errata {
>   	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
>   };
>   
> -enum dispc_vp_bus_type {
> +enum dispc_bus_type {
>   	DISPC_VP_DPI,		/* DPI output */
>   	DISPC_VP_OLDI,		/* OLDI (LVDS) output */
>   	DISPC_VP_INTERNAL,	/* SoC internal routing */

If you rename the enum to dispc_bus_type, the enum value name doesn't 
match anymore as it still contains VP. If you go with the suggestion of 
not having output_port_bus_type at all, then you can keep this as 
dispc_vp_bus_type.

But if we need types for both VPs and outputs, I think it would be 
better to have separate enums for them.

> @@ -61,6 +61,7 @@ enum dispc_dss_subrevision {
>   	DISPC_K2G,
>   	DISPC_AM65X,
>   	DISPC_J721E,
> +	DISPC_AM625,
>   };
>   
>   struct dispc_features {
> @@ -74,10 +75,13 @@ struct dispc_features {
>   	const char *common;
>   	const u16 *common_regs;
>   	u32 num_vps;
> -	const char *vp_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
> -	const char *ovr_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
> -	const char *vpclk_name[TIDSS_MAX_PORTS]; /* Should match dt clk names */
> -	const enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
> +	u32 num_output_ports;
> +	bool oldi_supported;
> +	const char *vp_name[TIDSS_MAX_VPS]; /* Should match dt reg names */
> +	const char *ovr_name[TIDSS_MAX_VPS]; /* Should match dt reg names */
> +	const char *vpclk_name[TIDSS_MAX_VPS]; /* Should match dt clk names */
> +	const enum dispc_bus_type vp_bus_type[TIDSS_MAX_VPS];
> +	const enum dispc_bus_type output_port_bus_type[TIDSS_MAX_OUTPUT_PORTS];
>   	struct tidss_vp_feat vp_feat;
>   	u32 num_planes;
>   	const char *vid_name[TIDSS_MAX_PLANES]; /* Should match dt reg names */
> @@ -88,6 +92,7 @@ struct dispc_features {
>   extern const struct dispc_features dispc_k2g_feats;
>   extern const struct dispc_features dispc_am65x_feats;
>   extern const struct dispc_features dispc_j721e_feats;
> +extern const struct dispc_features dispc_am625_feats;
>   
>   void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask);
>   dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc);
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 15cd9b91b7e2..c5e119828823 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -235,6 +235,7 @@ static const struct of_device_id tidss_of_table[] = {
>   	{ .compatible = "ti,k2g-dss", .data = &dispc_k2g_feats, },
>   	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
>   	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
> +	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
>   	{ }
>   };
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index d7f27b0b0315..0ce7ee5ccd5b 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -9,8 +9,9 @@
>   
>   #include <linux/spinlock.h>
>   
> -#define TIDSS_MAX_PORTS 4
> +#define TIDSS_MAX_VPS 4
>   #define TIDSS_MAX_PLANES 4
> +#define TIDSS_MAX_OUTPUT_PORTS 4
>   
>   typedef u32 dispc_irq_t;
>   
> @@ -22,7 +23,7 @@ struct tidss_device {
>   	struct dispc_device *dispc;
>   
>   	unsigned int num_crtcs;
> -	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
> +	struct drm_crtc *crtcs[TIDSS_MAX_VPS];
>   
>   	unsigned int num_planes;
>   	struct drm_plane *planes[TIDSS_MAX_PLANES];
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
> index b512614d5863..a753f5e3ce15 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.h
> +++ b/drivers/gpu/drm/tidss/tidss_irq.h
> @@ -35,7 +35,7 @@
>   
>   #define DSS_IRQ_VP_BIT_N(ch, bit)	(4 + 4 * (ch) + (bit))
>   #define DSS_IRQ_PLANE_BIT_N(plane, bit) \
> -	(DSS_IRQ_VP_BIT_N(TIDSS_MAX_PORTS, 0) + 1 * (plane) + (bit))
> +	(DSS_IRQ_VP_BIT_N(TIDSS_MAX_VPS, 0) + 1 * (plane) + (bit))
>   
>   #define DSS_IRQ_VP_BIT(ch, bit)	BIT(DSS_IRQ_VP_BIT_N((ch), (bit)))
>   #define DSS_IRQ_PLANE_BIT(plane, bit) \
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index afb2879980c6..fc9c4eefd31d 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -123,7 +123,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>   	u32 max_vps = feat->num_vps;
>   	u32 max_planes = feat->num_planes;
>   
> -	struct pipe pipes[TIDSS_MAX_PORTS];
> +	struct pipe pipes[TIDSS_MAX_VPS];
>   	u32 num_pipes = 0;
>   	u32 crtc_mask;
>   

  Tomi

