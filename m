Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8457F4728
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EF710E62F;
	Wed, 22 Nov 2023 12:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 75CF210E62C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=GoNJ6
 fEzXYBfhetisk13GGBawyZOG8fIZk3GPelDqeU=; b=X2K95tvhzmHjSgAgui8Ed
 bP8S4volbrBbxLGZjltKaExazfAMo9p2Qza6di0W/4F6ylC0gUaL4Ww4vNJG4tM8
 z0Y2LIrZ3HAh9pk0Ps8p3cYM/NycZrTe6AzdeIs+mjIvficxzIUMfpBZvZ9gwo+/
 Bh5+BHcUGeY0P4xBnAls7U=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g1-3 (Coremail) with SMTP id _____wBXpgli+l1lcgqPAg--.63009S2;
 Wed, 22 Nov 2023 20:56:05 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v2 11/12] drm/rockchip: vop2: Add debugfs support
Date: Wed, 22 Nov 2023 20:56:01 +0800
Message-Id: <20231122125601.3455031-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122125316.3454268-1-andyshrk@163.com>
References: <20231122125316.3454268-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBXpgli+l1lcgqPAg--.63009S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfJw18WFy7GF1fXF4DGFyUZFb_yoW8GF4fKo
 Z2vF9Yvw40kr10qw4kCw18Zayfua10ya1Ikw1DKF4DZa15Gw1YkrW7Kw17AF1xXr45Ar4U
 Xwnaq3WfXr48Ja1rn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4kucDUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiFgowXl44X9n4TQAAsn
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

/sys/kernel/debug/dri/vop2/summary:  dump vop display state
/sys/kernel/debug/dri/vop2/regs: dump whole vop registers
/sys/kernel/debug/dri/vop2/active_regs: only dump the registers of
activated modules

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 399 +++++++++++++++++++
 1 file changed, 399 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 9eecbe1f71f9..4a2342209c15 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -27,6 +27,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_flip_work.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -187,6 +188,7 @@ struct vop2 {
 	 */
 	u32 registered_num_wins;
 
+	struct resource *res;
 	void __iomem *regs;
 	struct regmap *map;
 
@@ -228,6 +230,44 @@ struct vop2 {
 #define vop2_output_if_is_lvds(x)	(x == ROCKCHIP_VOP2_EP_LVDS0 || x == ROCKCHIP_VOP2_EP_LVDS1)
 #define vop2_output_if_is_dpi(x)	(x == ROCKCHIP_VOP2_EP_RGB0)
 
+struct vop2_regs_dump {
+	const char *name;
+	u32 base;
+	u32 en_reg;
+	u32 en_val;
+	u32 en_mask;
+};
+
+/*
+ * bus-format types.
+ */
+struct drm_bus_format_enum_list {
+	int type;
+	const char *name;
+};
+
+static const struct drm_bus_format_enum_list drm_bus_format_enum_list[] = {
+	{ DRM_MODE_CONNECTOR_Unknown, "Unknown" },
+	{ MEDIA_BUS_FMT_RGB565_1X16, "RGB565_1X16" },
+	{ MEDIA_BUS_FMT_RGB666_1X18, "RGB666_1X18" },
+	{ MEDIA_BUS_FMT_RGB666_1X24_CPADHI, "RGB666_1X24_CPADHI" },
+	{ MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, "RGB666_1X7X3_SPWG" },
+	{ MEDIA_BUS_FMT_YUV8_1X24, "YUV8_1X24" },
+	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24, "UYYVYY8_0_5X24" },
+	{ MEDIA_BUS_FMT_YUV10_1X30, "YUV10_1X30" },
+	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30, "UYYVYY10_0_5X30" },
+	{ MEDIA_BUS_FMT_RGB888_3X8, "RGB888_3X8" },
+	{ MEDIA_BUS_FMT_RGB888_1X24, "RGB888_1X24" },
+	{ MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, "RGB888_1X7X4_SPWG" },
+	{ MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, "RGB888_1X7X4_JEIDA" },
+	{ MEDIA_BUS_FMT_UYVY8_2X8, "UYVY8_2X8" },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, "YUYV8_1X16" },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, "UYVY8_1X16" },
+	{ MEDIA_BUS_FMT_RGB101010_1X30, "RGB101010_1X30" },
+	{ MEDIA_BUS_FMT_YUYV10_1X20, "YUYV10_1X20" },
+};
+static DRM_ENUM_NAME_FN(drm_get_bus_format_name, drm_bus_format_enum_list)
+
 static const struct regmap_config vop2_regmap_config;
 
 static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
@@ -2487,6 +2527,363 @@ static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
 	.atomic_disable = vop2_crtc_atomic_disable,
 };
 
+static void vop2_dump_connector_on_crtc(struct drm_crtc *crtc, struct seq_file *s)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+
+	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (crtc->state->connector_mask & drm_connector_mask(connector))
+			seq_printf(s, "    Connector: %s\n", connector->name);
+
+	}
+	drm_connector_list_iter_end(&conn_iter);
+}
+
+static int vop2_plane_state_dump(struct seq_file *s, struct drm_plane *plane)
+{
+	struct vop2_win *win = to_vop2_win(plane);
+	struct drm_plane_state *pstate = plane->state;
+	struct drm_rect *src, *dst;
+	struct drm_framebuffer *fb;
+	struct drm_gem_object *obj;
+	struct rockchip_gem_object *rk_obj;
+	bool xmirror;
+	bool ymirror;
+	bool rotate_270;
+	bool rotate_90;
+	dma_addr_t fb_addr;
+	int i;
+
+	seq_printf(s, "    %s: %s\n", win->data->name, pstate->crtc ? "ACTIVE" : "DISABLED");
+	if (!pstate || !pstate->fb)
+		return 0;
+
+	fb = pstate->fb;
+	src = &pstate->src;
+	dst = &pstate->dst;
+	xmirror = pstate->rotation & DRM_MODE_REFLECT_X ? true : false;
+	ymirror = pstate->rotation & DRM_MODE_REFLECT_Y ? true : false;
+	rotate_270 = pstate->rotation & DRM_MODE_ROTATE_270;
+	rotate_90 = pstate->rotation & DRM_MODE_ROTATE_90;
+
+	seq_printf(s, "\twin_id: %d\n", win->win_id);
+
+	seq_printf(s, "\tformat: %p4cc%s glb_alpha[0x%x]\n",
+		   &fb->format->format,
+		   drm_is_afbc(fb->modifier) ? "[AFBC]" : "",
+		   pstate->alpha >> 8);
+	seq_printf(s, "\trotate: xmirror: %d ymirror: %d rotate_90: %d rotate_270: %d\n",
+		   xmirror, ymirror, rotate_90, rotate_270);
+	seq_printf(s, "\tzpos: %d\n", pstate->normalized_zpos);
+	seq_printf(s, "\tsrc: pos[%d, %d] rect[%d x %d]\n", src->x1 >> 16,
+		   src->y1 >> 16, drm_rect_width(src) >> 16,
+		   drm_rect_height(src) >> 16);
+	seq_printf(s, "\tdst: pos[%d, %d] rect[%d x %d]\n", dst->x1, dst->y1,
+		   drm_rect_width(dst), drm_rect_height(dst));
+
+	for (i = 0; i < fb->format->num_planes; i++) {
+		obj = fb->obj[0];
+		rk_obj = to_rockchip_obj(obj);
+		fb_addr = rk_obj->dma_addr + fb->offsets[0];
+
+		seq_printf(s, "\tbuf[%d]: addr: %pad pitch: %d offset: %d\n",
+			   i, &fb_addr, fb->pitches[i], fb->offsets[i]);
+	}
+
+	return 0;
+}
+
+static int vop2_crtc_state_dump(struct drm_crtc *crtc, struct seq_file *s)
+{
+	struct vop2_video_port *vp = to_vop2_video_port(crtc);
+	struct drm_crtc_state *cstate = crtc->state;
+	struct rockchip_crtc_state *vcstate;
+	struct drm_display_mode *mode;
+	struct drm_plane *plane;
+	bool interlaced;
+
+	seq_printf(s, "Video Port%d: %s\n", vp->id, !cstate ?
+		   "DISABLED" : cstate->active ? "ACTIVE" : "DISABLED");
+
+	if (!cstate || !cstate->active)
+		return 0;
+
+	mode = &crtc->state->adjusted_mode;
+	vcstate = to_rockchip_crtc_state(cstate);
+	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+
+	vop2_dump_connector_on_crtc(crtc, s);
+	seq_printf(s, "\tbus_format[%x]: %s\n", vcstate->bus_format,
+		    drm_get_bus_format_name(vcstate->bus_format));
+	seq_printf(s, "\toutput_mode[%x]", vcstate->output_mode);
+	seq_printf(s, " color_space[%d]\n", vcstate->color_space);
+	seq_printf(s, "    Display mode: %dx%d%s%d\n",
+		    mode->hdisplay, mode->vdisplay, interlaced ? "i" : "p",
+		    drm_mode_vrefresh(mode));
+	seq_printf(s, "\tclk[%d] real_clk[%d] type[%x] flag[%x]\n",
+		    mode->clock, mode->crtc_clock, mode->type, mode->flags);
+	seq_printf(s, "\tH: %d %d %d %d\n", mode->hdisplay, mode->hsync_start,
+		    mode->hsync_end, mode->htotal);
+	seq_printf(s, "\tV: %d %d %d %d\n", mode->vdisplay, mode->vsync_start,
+		    mode->vsync_end, mode->vtotal);
+
+	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		vop2_plane_state_dump(s, plane);
+	}
+
+	return 0;
+}
+
+static int vop2_summary_show(struct seq_file *s, void *data)
+{
+	struct drm_info_node *node = s->private;
+	struct drm_minor *minor = node->minor;
+	struct drm_device *drm_dev = minor->dev;
+	struct drm_crtc *crtc;
+
+	drm_modeset_lock_all(drm_dev);
+	drm_for_each_crtc(crtc, drm_dev) {
+		vop2_crtc_state_dump(crtc, s);
+	}
+	drm_modeset_unlock_all(drm_dev);
+
+	return 0;
+}
+
+static void vop2_regs_print(struct vop2 *vop2, struct seq_file *s, struct vop2_regs_dump *dump)
+{
+	resource_size_t start;
+	const int reg_num = 0x110 / 4;
+	u32 val;
+	int i;
+
+	if (dump->en_mask) {
+		val = vop2_readl(vop2, dump->base + dump->en_reg);
+		if ((val & dump->en_mask) != dump->en_val)
+			return;
+	}
+	seq_printf(s, "\n%s:\n", dump->name);
+
+	start = vop2->res->start + dump->base;
+	for (i = 0; i < reg_num;) {
+		seq_printf(s, "%08x:  %08x %08x %08x %08x\n", (u32)start + i * 4,
+			   vop2_readl(vop2, dump->base + (4 * i)),
+			   vop2_readl(vop2, dump->base + (4 * (i + 1))),
+			   vop2_readl(vop2, dump->base + (4 * (i + 2))),
+			   vop2_readl(vop2, dump->base + (4 * (i + 3))));
+		i += 4;
+	}
+
+}
+
+static int vop2_regs_show(struct seq_file *s, void *arg)
+{
+	struct drm_info_node *node = s->private;
+	struct vop2 *vop2 = (struct vop2 *)node->info_ent->data;
+	struct drm_minor *minor = node->minor;
+	struct drm_device *drm_dev = minor->dev;
+
+	struct vop2_regs_dump dump;
+
+	drm_modeset_lock_all(drm_dev);
+
+	if (vop2->enable_count) {
+		dump.en_mask = 0;
+
+		dump.name = "SYS";
+		dump.base = RK3568_REG_CFG_DONE;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "OVL";
+		dump.base = RK3568_OVL_CTRL;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "VP0";
+		dump.base = 0x0c00;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "VP1";
+		dump.base = 0x0c00 + 0x100;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "VP2";
+		dump.base = 0x0c00 + 0x200;
+		vop2_regs_print(vop2, s, &dump);
+		if (vop2->data->soc_id == 3588) {
+			dump.name = "VP3";
+			dump.base = 0x0c00 + 0x300;
+			vop2_regs_print(vop2, s, &dump);
+		}
+		dump.name = "Cluster0";
+		dump.base = 0x1000;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "Cluster1";
+		dump.base = 0x1000 + 0x200;
+		vop2_regs_print(vop2, s, &dump);
+		if (vop2->data->soc_id == 3588) {
+			dump.name = "Cluster2";
+			dump.base = 0x1000 + 0x400;
+			vop2_regs_print(vop2, s, &dump);
+
+			dump.name = "Cluster3";
+			dump.base = 0x1000 + 0x600;
+			vop2_regs_print(vop2, s, &dump);
+		}
+		dump.name = "Esmart0";
+		dump.base = 0x1000 + 0x800;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "Esmart1";
+		dump.base = 0x1000 + 0xa00;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "Esmart2";
+		if (vop2->data->soc_id == 3566 || vop2->data->soc_id == 3568)
+			dump.name = "Smart0";
+		dump.base = 0x1000 + 0xc00;
+		vop2_regs_print(vop2, s,  &dump);
+
+		dump.name = "Esmart3";
+		if (vop2->data->soc_id == 3566 || vop2->data->soc_id == 3568)
+			dump.name = "Smart1";
+		dump.base = 0x1000 + 0xe00;
+		vop2_regs_print(vop2, s,  &dump);
+	} else {
+		seq_printf(s, "VOP disabled:\n");
+	}
+	drm_modeset_unlock_all(drm_dev);
+
+	return 0;
+}
+
+static int vop2_active_regs_show(struct seq_file *s, void *data)
+{
+	struct drm_info_node *node = s->private;
+	struct vop2 *vop2 = (struct vop2 *)node->info_ent->data;
+	struct drm_minor *minor = node->minor;
+	struct drm_device *drm_dev = minor->dev;
+
+	struct vop2_regs_dump dump;
+
+	drm_modeset_lock_all(drm_dev);
+	if (vop2->enable_count) {
+		dump.en_mask = 0;
+
+		dump.name = "SYS";
+		dump.base = RK3568_REG_CFG_DONE;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "OVL";
+		dump.base = RK3568_OVL_CTRL;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "VP0";
+		dump.base = 0x0c00;
+		dump.en_mask = RK3568_VP_DSP_CTRL__STANDBY;
+		dump.en_reg = RK3568_VP_DSP_CTRL;
+		dump.en_val = 0;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "VP1";
+		dump.base = 0x0c00 + 0x100;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "VP2";
+		dump.base = 0x0c00 + 0x200;
+		vop2_regs_print(vop2, s, &dump);
+		if (vop2->data->soc_id == 3588) {
+			dump.name = "VP3";
+			dump.base = 0x0c00 + 0x300;
+			vop2_regs_print(vop2, s, &dump);
+		}
+
+		dump.en_mask = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN;
+		dump.en_reg = RK3568_CLUSTER_WIN_CTRL0;
+		dump.en_val = 1;
+
+		dump.name = "Cluster0";
+		dump.base = 0x1000;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "Cluster1";
+		dump.base = 0x1000 + 0x200;
+		vop2_regs_print(vop2, s, &dump);
+		if (vop2->data->soc_id == 3588) {
+			dump.name = "Cluster2";
+			dump.base = 0x1000 + 0x400;
+			vop2_regs_print(vop2, s, &dump);
+
+			dump.name = "Cluster3";
+			dump.base = 0x1000 + 0x600;
+			vop2_regs_print(vop2, s, &dump);
+		}
+
+		dump.name = "Esmart0";
+		dump.base = 0x1000 + 0x800;
+		dump.en_mask = RK3568_SMART_REGION0_CTRL__WIN0_EN;
+		dump.en_reg = RK3568_SMART_REGION0_CTRL;
+		dump.en_val = 1;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "Esmart1";
+		dump.base = 0x1000 + 0xa00;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "Esmart2";
+		if (vop2->data->soc_id == 3566 || vop2->data->soc_id == 3568)
+			dump.name = "Smart0";
+		dump.base = 0x1000 + 0xc00;
+		vop2_regs_print(vop2, s, &dump);
+
+		dump.name = "Esmart3";
+		if (vop2->data->soc_id == 3566 || vop2->data->soc_id == 3568)
+			dump.name = "Smart1";
+		dump.base = 0x1000 + 0xe00;
+		vop2_regs_print(vop2, s, &dump);
+	} else {
+		seq_printf(s, "VOP disabled:\n");
+	}
+	drm_modeset_unlock_all(drm_dev);
+
+	return 0;
+}
+
+static struct drm_info_list vop2_debugfs_list[] = {
+	{ "summary", vop2_summary_show, 0, NULL },
+	{ "active_regs", vop2_active_regs_show,   0, NULL },
+	{ "regs", vop2_regs_show,   0, NULL },
+};
+
+static void vop2_debugfs_init(struct vop2 *vop2, struct drm_minor *minor)
+{
+	struct dentry *root;
+	unsigned int i;
+
+	root = debugfs_create_dir("vop2", minor->debugfs_root);
+	if (!IS_ERR(root)) {
+		for (i = 0; i < ARRAY_SIZE(vop2_debugfs_list); i++)
+			vop2_debugfs_list[i].data = vop2;
+
+		drm_debugfs_create_files(vop2_debugfs_list,
+					 ARRAY_SIZE(vop2_debugfs_list),
+					 root, minor);
+	}
+}
+
+static int vop2_crtc_late_register(struct drm_crtc *crtc)
+{
+	struct vop2_video_port *vp = to_vop2_video_port(crtc);
+	struct vop2 *vop2 = vp->vop2;
+
+	if (drm_crtc_index(crtc) == 0)
+		vop2_debugfs_init(vop2, crtc->dev->primary);
+
+	return 0;
+}
+
 static struct drm_crtc_state *vop2_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct rockchip_crtc_state *vcstate;
@@ -2536,6 +2933,7 @@ static const struct drm_crtc_funcs vop2_crtc_funcs = {
 	.atomic_destroy_state = vop2_crtc_destroy_state,
 	.enable_vblank = vop2_crtc_enable_vblank,
 	.disable_vblank = vop2_crtc_disable_vblank,
+	.late_register = vop2_crtc_late_register,
 };
 
 static irqreturn_t vop2_isr(int irq, void *data)
@@ -3080,6 +3478,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return -EINVAL;
 	}
 
+	vop2->res = res;
 	vop2->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(vop2->regs))
 		return PTR_ERR(vop2->regs);
-- 
2.34.1

