Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B278B804D5B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994EE10E184;
	Tue,  5 Dec 2023 09:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B57810E184
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:15:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1rARWu-0006sK-EZ; Tue, 05 Dec 2023 10:15:48 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1rARWo-00Di8X-2b; Tue, 05 Dec 2023 10:15:42 +0100
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1rARWn-005MNo-Vw; Tue, 05 Dec 2023 10:15:42 +0100
Date: Tue, 5 Dec 2023 10:15:41 +0100
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v3 12/14] drm/rockchip: vop2: Add debugfs support
Message-ID: <20231205091541.GV1057032@pengutronix.de>
References: <20231130122001.12474-1-andyshrk@163.com>
 <20231130122449.13432-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130122449.13432-1-andyshrk@163.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
From: Sascha Hauer <sha@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 08:24:49PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> /sys/kernel/debug/dri/vop2/summary:  dump vop display state
> /sys/kernel/debug/dri/vop2/regs: dump whole vop registers
> /sys/kernel/debug/dri/vop2/active_regs: only dump the registers of
> activated modules
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - put regs dump info in vop2_data
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 268 +++++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  11 +
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 191 +++++++++++++
>  3 files changed, 470 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 6f17cc56501e..56a165c0b130 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -27,6 +27,7 @@
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_flip_work.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -187,6 +188,7 @@ struct vop2 {
>  	 */
>  	u32 registered_num_wins;
>  
> +	struct resource *res;
>  	void __iomem *regs;
>  	struct regmap *map;
>  
> @@ -238,6 +240,37 @@ struct vop2 {
>  
>  #define vop2_output_if_is_dpi(x)	((x) == ROCKCHIP_VOP2_EP_RGB0)
>  
> +
> +/*
> + * bus-format types.
> + */
> +struct drm_bus_format_enum_list {
> +	int type;
> +	const char *name;
> +};
> +
> +static const struct drm_bus_format_enum_list drm_bus_format_enum_list[] = {
> +	{ DRM_MODE_CONNECTOR_Unknown, "Unknown" },
> +	{ MEDIA_BUS_FMT_RGB565_1X16, "RGB565_1X16" },
> +	{ MEDIA_BUS_FMT_RGB666_1X18, "RGB666_1X18" },
> +	{ MEDIA_BUS_FMT_RGB666_1X24_CPADHI, "RGB666_1X24_CPADHI" },
> +	{ MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, "RGB666_1X7X3_SPWG" },
> +	{ MEDIA_BUS_FMT_YUV8_1X24, "YUV8_1X24" },
> +	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24, "UYYVYY8_0_5X24" },
> +	{ MEDIA_BUS_FMT_YUV10_1X30, "YUV10_1X30" },
> +	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30, "UYYVYY10_0_5X30" },
> +	{ MEDIA_BUS_FMT_RGB888_3X8, "RGB888_3X8" },
> +	{ MEDIA_BUS_FMT_RGB888_1X24, "RGB888_1X24" },
> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, "RGB888_1X7X4_SPWG" },
> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, "RGB888_1X7X4_JEIDA" },
> +	{ MEDIA_BUS_FMT_UYVY8_2X8, "UYVY8_2X8" },
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, "YUYV8_1X16" },
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, "UYVY8_1X16" },
> +	{ MEDIA_BUS_FMT_RGB101010_1X30, "RGB101010_1X30" },
> +	{ MEDIA_BUS_FMT_YUYV10_1X20, "YUYV10_1X20" },
> +};
> +static DRM_ENUM_NAME_FN(drm_get_bus_format_name, drm_bus_format_enum_list)
> +
>  static const struct regmap_config vop2_regmap_config;
>  
>  static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
> @@ -2522,6 +2555,239 @@ static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
>  	.atomic_disable = vop2_crtc_atomic_disable,
>  };
>  
> +static void vop2_dump_connector_on_crtc(struct drm_crtc *crtc, struct seq_file *s)
> +{
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_connector *connector;
> +
> +	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		if (crtc->state->connector_mask & drm_connector_mask(connector))
> +			seq_printf(s, "    Connector: %s\n", connector->name);
> +
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +}
> +
> +static int vop2_plane_state_dump(struct seq_file *s, struct drm_plane *plane)
> +{
> +	struct vop2_win *win = to_vop2_win(plane);
> +	struct drm_plane_state *pstate = plane->state;
> +	struct drm_rect *src, *dst;
> +	struct drm_framebuffer *fb;
> +	struct drm_gem_object *obj;
> +	struct rockchip_gem_object *rk_obj;
> +	bool xmirror;
> +	bool ymirror;
> +	bool rotate_270;
> +	bool rotate_90;
> +	dma_addr_t fb_addr;
> +	int i;
> +
> +	seq_printf(s, "    %s: %s\n", win->data->name, pstate->crtc ? "ACTIVE" : "DISABLED");
> +	if (!pstate || !pstate->fb)
> +		return 0;

'pstate' is dereferenced before its checked being non NULL. Either the
check is unnecessary or should be before the seq_printf() call.

> +
> +	fb = pstate->fb;
> +	src = &pstate->src;
> +	dst = &pstate->dst;
> +	xmirror = pstate->rotation & DRM_MODE_REFLECT_X ? true : false;
> +	ymirror = pstate->rotation & DRM_MODE_REFLECT_Y ? true : false;
> +	rotate_270 = pstate->rotation & DRM_MODE_ROTATE_270;
> +	rotate_90 = pstate->rotation & DRM_MODE_ROTATE_90;
> +
> +	seq_printf(s, "\twin_id: %d\n", win->win_id);
> +
> +	seq_printf(s, "\tformat: %p4cc%s glb_alpha[0x%x]\n",
> +		   &fb->format->format,
> +		   drm_is_afbc(fb->modifier) ? "[AFBC]" : "",
> +		   pstate->alpha >> 8);
> +	seq_printf(s, "\trotate: xmirror: %d ymirror: %d rotate_90: %d rotate_270: %d\n",
> +		   xmirror, ymirror, rotate_90, rotate_270);
> +	seq_printf(s, "\tzpos: %d\n", pstate->normalized_zpos);
> +	seq_printf(s, "\tsrc: pos[%d, %d] rect[%d x %d]\n", src->x1 >> 16,
> +		   src->y1 >> 16, drm_rect_width(src) >> 16,
> +		   drm_rect_height(src) >> 16);
> +	seq_printf(s, "\tdst: pos[%d, %d] rect[%d x %d]\n", dst->x1, dst->y1,
> +		   drm_rect_width(dst), drm_rect_height(dst));
> +
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		obj = fb->obj[0];
> +		rk_obj = to_rockchip_obj(obj);
> +		fb_addr = rk_obj->dma_addr + fb->offsets[0];

Did you really intend to use array index [0] here or should this rather be [i]?
If you intended to use [0] then you could move the initialization out of
the loop.

> +
> +		seq_printf(s, "\tbuf[%d]: addr: %pad pitch: %d offset: %d\n",
> +			   i, &fb_addr, fb->pitches[i], fb->offsets[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int vop2_crtc_state_dump(struct drm_crtc *crtc, struct seq_file *s)
> +{
> +	struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +	struct drm_crtc_state *cstate = crtc->state;
> +	struct rockchip_crtc_state *vcstate;
> +	struct drm_display_mode *mode;
> +	struct drm_plane *plane;
> +	bool interlaced;
> +
> +	seq_printf(s, "Video Port%d: %s\n", vp->id, !cstate ?
> +		   "DISABLED" : cstate->active ? "ACTIVE" : "DISABLED");
> +
> +	if (!cstate || !cstate->active)
> +		return 0;
> +
> +	mode = &crtc->state->adjusted_mode;
> +	vcstate = to_rockchip_crtc_state(cstate);
> +	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
> +
> +	vop2_dump_connector_on_crtc(crtc, s);
> +	seq_printf(s, "\tbus_format[%x]: %s\n", vcstate->bus_format,
> +		    drm_get_bus_format_name(vcstate->bus_format));
> +	seq_printf(s, "\toutput_mode[%x]", vcstate->output_mode);
> +	seq_printf(s, " color_space[%d]\n", vcstate->color_space);
> +	seq_printf(s, "    Display mode: %dx%d%s%d\n",
> +		    mode->hdisplay, mode->vdisplay, interlaced ? "i" : "p",
> +		    drm_mode_vrefresh(mode));
> +	seq_printf(s, "\tclk[%d] real_clk[%d] type[%x] flag[%x]\n",
> +		    mode->clock, mode->crtc_clock, mode->type, mode->flags);
> +	seq_printf(s, "\tH: %d %d %d %d\n", mode->hdisplay, mode->hsync_start,
> +		    mode->hsync_end, mode->htotal);
> +	seq_printf(s, "\tV: %d %d %d %d\n", mode->vdisplay, mode->vsync_start,
> +		    mode->vsync_end, mode->vtotal);
> +
> +	drm_atomic_crtc_for_each_plane(plane, crtc) {
> +		vop2_plane_state_dump(s, plane);
> +	}
> +
> +	return 0;
> +}
> +
> +static int vop2_summary_show(struct seq_file *s, void *data)
> +{
> +	struct drm_info_node *node = s->private;
> +	struct drm_minor *minor = node->minor;
> +	struct drm_device *drm_dev = minor->dev;
> +	struct drm_crtc *crtc;
> +
> +	drm_modeset_lock_all(drm_dev);
> +	drm_for_each_crtc(crtc, drm_dev) {
> +		vop2_crtc_state_dump(crtc, s);
> +	}
> +	drm_modeset_unlock_all(drm_dev);
> +
> +	return 0;
> +}
> +
> +static void vop2_regs_print(struct vop2 *vop2, struct seq_file *s,
> +			    const struct vop2_regs_dump *dump, bool active_only)
> +{
> +	resource_size_t start;
> +	const int reg_num = 0x110 / 4;

You added the number of registers to struct vop2_regs_dump, no need to
hardcode this anymore.

> +	u32 val;
> +	int i;
> +
> +	if (dump->en_mask && active_only) {
> +		val = vop2_readl(vop2, dump->base + dump->en_reg);
> +		if ((val & dump->en_mask) != dump->en_val)
> +			return;
> +	}
> +	seq_printf(s, "\n%s:\n", dump->name);
> +
> +	start = vop2->res->start + dump->base;
> +	for (i = 0; i < reg_num;) {
> +		seq_printf(s, "%08x:  %08x %08x %08x %08x\n", (u32)start + i * 4,
> +			   vop2_readl(vop2, dump->base + (4 * i)),
> +			   vop2_readl(vop2, dump->base + (4 * (i + 1))),
> +			   vop2_readl(vop2, dump->base + (4 * (i + 2))),
> +			   vop2_readl(vop2, dump->base + (4 * (i + 3))));
> +		i += 4;
> +	}
> +}
> +
> +static int vop2_regs_show(struct seq_file *s, void *arg)
> +{
> +	struct drm_info_node *node = s->private;
> +	struct vop2 *vop2 = (struct vop2 *)node->info_ent->data;

node->info_ent->data is a void pointer, no need to cast explicitly.

> +	struct drm_minor *minor = node->minor;
> +	struct drm_device *drm_dev = minor->dev;
> +	const struct vop2_regs_dump *dump;
> +	unsigned int n = vop2->data->regs_dump_size;

'n' is used only once, it might be clearer just to use the value where
needed and drop the extra variable.

> +	unsigned int i;
> +
> +	drm_modeset_lock_all(drm_dev);
> +
> +	if (vop2->enable_count) {
> +		for (i = 0; i < n; i++) {
> +			dump = &vop2->data->regs_dump[i];
> +			vop2_regs_print(vop2, s, dump, false);
> +		}
> +	} else {
> +		seq_printf(s, "VOP disabled:\n");

There's nothing following after the ':', right? Then this should be
"VOP: disabled\n" or without the colon at all.

> +	}
> +	drm_modeset_unlock_all(drm_dev);

This code is repeated in vop2_active_regs_show() below. Maybe factor
this out to a common function?

> +
> +	return 0;
> +}
> +
> +static int vop2_active_regs_show(struct seq_file *s, void *data)
> +{
> +	struct drm_info_node *node = s->private;
> +	struct vop2 *vop2 = (struct vop2 *)node->info_ent->data;
> +	struct drm_minor *minor = node->minor;
> +	struct drm_device *drm_dev = minor->dev;
> +	const struct vop2_regs_dump *dump;
> +	unsigned int n = vop2->data->regs_dump_size;
> +	unsigned int i;
> +
> +	drm_modeset_lock_all(drm_dev);
> +	if (vop2->enable_count) {
> +		for (i = 0; i < n; i++) {
> +			dump = &vop2->data->regs_dump[i];
> +			vop2_regs_print(vop2, s, dump, true);
> +		}
> +	} else {
> +		seq_printf(s, "VOP disabled:\n");
> +	}
> +	drm_modeset_unlock_all(drm_dev);
> +
> +	return 0;
> +}
> +

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
