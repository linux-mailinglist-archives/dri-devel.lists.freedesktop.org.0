Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A00D1806BCB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 11:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330D210E0B6;
	Wed,  6 Dec 2023 10:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49220.qiye.163.com (mail-m49220.qiye.163.com
 [45.254.49.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6137D10E0B6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 10:21:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=GHBs36RmzsdWM7RSL7gWfBTsazGEYrC9Q80YmcAipjDkuooCQoxlLxLhMm48SHx+iIJABAymX1aO187PSbYbKfcvz10g+Dd3FONhDjjovf8nnkRl3Cw4YQjgmbZ8x6ku+dHW/PiVGK2d2TlJAfN7kurhx3A/VKAIlMGKoa8t43E=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=9xlM+ah3xEiWDG8+tX0nu4c8K6ADTJwqHeOuHcfSFA8=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 1937678022C;
 Wed,  6 Dec 2023 18:20:59 +0800 (CST)
Message-ID: <593f1092-3f5b-42ab-bc6e-dbd0fc8fb8ba@rock-chips.com>
Date: Wed, 6 Dec 2023 18:20:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] drm/rockchip: vop2: Add debugfs support
Content-Language: en-US
To: Sascha Hauer <sha@pengutronix.de>, Andy Yan <andyshrk@163.com>
References: <20231130122001.12474-1-andyshrk@163.com>
 <20231130122449.13432-1-andyshrk@163.com>
 <20231205091541.GV1057032@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20231205091541.GV1057032@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5NGVZJTh1IGEkdH0pMTB5VEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8c3ea52492b24fkuuu1937678022c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MAw6Dgw5Lzw#FlEtERcQAxY3
 KFEwC09VSlVKTEtKQ05DS01LS09KVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkhJSEw3Bg++
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
 krzysztof.kozlowski+dt@linaro.org, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha:

On 12/5/23 17:15, Sascha Hauer wrote:
> On Thu, Nov 30, 2023 at 08:24:49PM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> /sys/kernel/debug/dri/vop2/summary:  dump vop display state
>> /sys/kernel/debug/dri/vop2/regs: dump whole vop registers
>> /sys/kernel/debug/dri/vop2/active_regs: only dump the registers of
>> activated modules
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>
>> ---
>>
>> Changes in v3:
>> - put regs dump info in vop2_data
>>
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 268 +++++++++++++++++++
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  11 +
>>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 191 +++++++++++++
>>   3 files changed, 470 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 6f17cc56501e..56a165c0b130 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -27,6 +27,7 @@
>>   #include <drm/drm_debugfs.h>
>>   #include <drm/drm_flip_work.h>
>>   #include <drm/drm_framebuffer.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_probe_helper.h>
>>   #include <drm/drm_vblank.h>
>>   
>> @@ -187,6 +188,7 @@ struct vop2 {
>>   	 */
>>   	u32 registered_num_wins;
>>   
>> +	struct resource *res;
>>   	void __iomem *regs;
>>   	struct regmap *map;
>>   
>> @@ -238,6 +240,37 @@ struct vop2 {
>>   
>>   #define vop2_output_if_is_dpi(x)	((x) == ROCKCHIP_VOP2_EP_RGB0)
>>   
>> +
>> +/*
>> + * bus-format types.
>> + */
>> +struct drm_bus_format_enum_list {
>> +	int type;
>> +	const char *name;
>> +};
>> +
>> +static const struct drm_bus_format_enum_list drm_bus_format_enum_list[] = {
>> +	{ DRM_MODE_CONNECTOR_Unknown, "Unknown" },
>> +	{ MEDIA_BUS_FMT_RGB565_1X16, "RGB565_1X16" },
>> +	{ MEDIA_BUS_FMT_RGB666_1X18, "RGB666_1X18" },
>> +	{ MEDIA_BUS_FMT_RGB666_1X24_CPADHI, "RGB666_1X24_CPADHI" },
>> +	{ MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, "RGB666_1X7X3_SPWG" },
>> +	{ MEDIA_BUS_FMT_YUV8_1X24, "YUV8_1X24" },
>> +	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24, "UYYVYY8_0_5X24" },
>> +	{ MEDIA_BUS_FMT_YUV10_1X30, "YUV10_1X30" },
>> +	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30, "UYYVYY10_0_5X30" },
>> +	{ MEDIA_BUS_FMT_RGB888_3X8, "RGB888_3X8" },
>> +	{ MEDIA_BUS_FMT_RGB888_1X24, "RGB888_1X24" },
>> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, "RGB888_1X7X4_SPWG" },
>> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, "RGB888_1X7X4_JEIDA" },
>> +	{ MEDIA_BUS_FMT_UYVY8_2X8, "UYVY8_2X8" },
>> +	{ MEDIA_BUS_FMT_YUYV8_1X16, "YUYV8_1X16" },
>> +	{ MEDIA_BUS_FMT_UYVY8_1X16, "UYVY8_1X16" },
>> +	{ MEDIA_BUS_FMT_RGB101010_1X30, "RGB101010_1X30" },
>> +	{ MEDIA_BUS_FMT_YUYV10_1X20, "YUYV10_1X20" },
>> +};
>> +static DRM_ENUM_NAME_FN(drm_get_bus_format_name, drm_bus_format_enum_list)
>> +
>>   static const struct regmap_config vop2_regmap_config;
>>   
>>   static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
>> @@ -2522,6 +2555,239 @@ static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
>>   	.atomic_disable = vop2_crtc_atomic_disable,
>>   };
>>   
>> +static void vop2_dump_connector_on_crtc(struct drm_crtc *crtc, struct seq_file *s)
>> +{
>> +	struct drm_connector_list_iter conn_iter;
>> +	struct drm_connector *connector;
>> +
>> +	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
>> +	drm_for_each_connector_iter(connector, &conn_iter) {
>> +		if (crtc->state->connector_mask & drm_connector_mask(connector))
>> +			seq_printf(s, "    Connector: %s\n", connector->name);
>> +
>> +	}
>> +	drm_connector_list_iter_end(&conn_iter);
>> +}
>> +
>> +static int vop2_plane_state_dump(struct seq_file *s, struct drm_plane *plane)
>> +{
>> +	struct vop2_win *win = to_vop2_win(plane);
>> +	struct drm_plane_state *pstate = plane->state;
>> +	struct drm_rect *src, *dst;
>> +	struct drm_framebuffer *fb;
>> +	struct drm_gem_object *obj;
>> +	struct rockchip_gem_object *rk_obj;
>> +	bool xmirror;
>> +	bool ymirror;
>> +	bool rotate_270;
>> +	bool rotate_90;
>> +	dma_addr_t fb_addr;
>> +	int i;
>> +
>> +	seq_printf(s, "    %s: %s\n", win->data->name, pstate->crtc ? "ACTIVE" : "DISABLED");
>> +	if (!pstate || !pstate->fb)
>> +		return 0;
> 
> 'pstate' is dereferenced before its checked being non NULL. Either the
> check is unnecessary or should be before the seq_printf() call.

I will move it before seq_printf.

> 
>> +
>> +	fb = pstate->fb;
>> +	src = &pstate->src;
>> +	dst = &pstate->dst;
>> +	xmirror = pstate->rotation & DRM_MODE_REFLECT_X ? true : false;
>> +	ymirror = pstate->rotation & DRM_MODE_REFLECT_Y ? true : false;
>> +	rotate_270 = pstate->rotation & DRM_MODE_ROTATE_270;
>> +	rotate_90 = pstate->rotation & DRM_MODE_ROTATE_90;
>> +
>> +	seq_printf(s, "\twin_id: %d\n", win->win_id);
>> +
>> +	seq_printf(s, "\tformat: %p4cc%s glb_alpha[0x%x]\n",
>> +		   &fb->format->format,
>> +		   drm_is_afbc(fb->modifier) ? "[AFBC]" : "",
>> +		   pstate->alpha >> 8);
>> +	seq_printf(s, "\trotate: xmirror: %d ymirror: %d rotate_90: %d rotate_270: %d\n",
>> +		   xmirror, ymirror, rotate_90, rotate_270);
>> +	seq_printf(s, "\tzpos: %d\n", pstate->normalized_zpos);
>> +	seq_printf(s, "\tsrc: pos[%d, %d] rect[%d x %d]\n", src->x1 >> 16,
>> +		   src->y1 >> 16, drm_rect_width(src) >> 16,
>> +		   drm_rect_height(src) >> 16);
>> +	seq_printf(s, "\tdst: pos[%d, %d] rect[%d x %d]\n", dst->x1, dst->y1,
>> +		   drm_rect_width(dst), drm_rect_height(dst));
>> +
>> +	for (i = 0; i < fb->format->num_planes; i++) {
>> +		obj = fb->obj[0];
>> +		rk_obj = to_rockchip_obj(obj);
>> +		fb_addr = rk_obj->dma_addr + fb->offsets[0];
> 
> Did you really intend to use array index [0] here or should this rather be [i]?
> If you intended to use [0] then you could move the initialization out of
> the loop.

It's should use index[i]. thanks for catching this.

> 
>> +
>> +		seq_printf(s, "\tbuf[%d]: addr: %pad pitch: %d offset: %d\n",
>> +			   i, &fb_addr, fb->pitches[i], fb->offsets[i]);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vop2_crtc_state_dump(struct drm_crtc *crtc, struct seq_file *s)
>> +{
>> +	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>> +	struct drm_crtc_state *cstate = crtc->state;
>> +	struct rockchip_crtc_state *vcstate;
>> +	struct drm_display_mode *mode;
>> +	struct drm_plane *plane;
>> +	bool interlaced;
>> +
>> +	seq_printf(s, "Video Port%d: %s\n", vp->id, !cstate ?
>> +		   "DISABLED" : cstate->active ? "ACTIVE" : "DISABLED");
>> +
>> +	if (!cstate || !cstate->active)
>> +		return 0;
>> +
>> +	mode = &crtc->state->adjusted_mode;
>> +	vcstate = to_rockchip_crtc_state(cstate);
>> +	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>> +
>> +	vop2_dump_connector_on_crtc(crtc, s);
>> +	seq_printf(s, "\tbus_format[%x]: %s\n", vcstate->bus_format,
>> +		    drm_get_bus_format_name(vcstate->bus_format));
>> +	seq_printf(s, "\toutput_mode[%x]", vcstate->output_mode);
>> +	seq_printf(s, " color_space[%d]\n", vcstate->color_space);
>> +	seq_printf(s, "    Display mode: %dx%d%s%d\n",
>> +		    mode->hdisplay, mode->vdisplay, interlaced ? "i" : "p",
>> +		    drm_mode_vrefresh(mode));
>> +	seq_printf(s, "\tclk[%d] real_clk[%d] type[%x] flag[%x]\n",
>> +		    mode->clock, mode->crtc_clock, mode->type, mode->flags);
>> +	seq_printf(s, "\tH: %d %d %d %d\n", mode->hdisplay, mode->hsync_start,
>> +		    mode->hsync_end, mode->htotal);
>> +	seq_printf(s, "\tV: %d %d %d %d\n", mode->vdisplay, mode->vsync_start,
>> +		    mode->vsync_end, mode->vtotal);
>> +
>> +	drm_atomic_crtc_for_each_plane(plane, crtc) {
>> +		vop2_plane_state_dump(s, plane);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vop2_summary_show(struct seq_file *s, void *data)
>> +{
>> +	struct drm_info_node *node = s->private;
>> +	struct drm_minor *minor = node->minor;
>> +	struct drm_device *drm_dev = minor->dev;
>> +	struct drm_crtc *crtc;
>> +
>> +	drm_modeset_lock_all(drm_dev);
>> +	drm_for_each_crtc(crtc, drm_dev) {
>> +		vop2_crtc_state_dump(crtc, s);
>> +	}
>> +	drm_modeset_unlock_all(drm_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void vop2_regs_print(struct vop2 *vop2, struct seq_file *s,
>> +			    const struct vop2_regs_dump *dump, bool active_only)
>> +{
>> +	resource_size_t start;
>> +	const int reg_num = 0x110 / 4;
> 
> You added the number of registers to struct vop2_regs_dump, no need to
> hardcode this anymore.


Thanks for catching this ,will removed in next version.
> 
>> +	u32 val;
>> +	int i;
>> +
>> +	if (dump->en_mask && active_only) {
>> +		val = vop2_readl(vop2, dump->base + dump->en_reg);
>> +		if ((val & dump->en_mask) != dump->en_val)
>> +			return;
>> +	}
>> +	seq_printf(s, "\n%s:\n", dump->name);
>> +
>> +	start = vop2->res->start + dump->base;
>> +	for (i = 0; i < reg_num;) {
>> +		seq_printf(s, "%08x:  %08x %08x %08x %08x\n", (u32)start + i * 4,
>> +			   vop2_readl(vop2, dump->base + (4 * i)),
>> +			   vop2_readl(vop2, dump->base + (4 * (i + 1))),
>> +			   vop2_readl(vop2, dump->base + (4 * (i + 2))),
>> +			   vop2_readl(vop2, dump->base + (4 * (i + 3))));
>> +		i += 4;
>> +	}
>> +}
>> +
>> +static int vop2_regs_show(struct seq_file *s, void *arg)
>> +{
>> +	struct drm_info_node *node = s->private;
>> +	struct vop2 *vop2 = (struct vop2 *)node->info_ent->data;
> 
> node->info_ent->data is a void pointer, no need to cast explicitly.


Thanks for pointing out, will drop the cast in next version.

> 
>> +	struct drm_minor *minor = node->minor;
>> +	struct drm_device *drm_dev = minor->dev;
>> +	const struct vop2_regs_dump *dump;
>> +	unsigned int n = vop2->data->regs_dump_size;
> 
> 'n' is used only once, it might be clearer just to use the value where
> needed and drop the extra variable.

Okay, will do.
> 
>> +	unsigned int i;
>> +
>> +	drm_modeset_lock_all(drm_dev);
>> +
>> +	if (vop2->enable_count) {
>> +		for (i = 0; i < n; i++) {
>> +			dump = &vop2->data->regs_dump[i];
>> +			vop2_regs_print(vop2, s, dump, false);
>> +		}
>> +	} else {
>> +		seq_printf(s, "VOP disabled:\n");
> 
> There's nothing following after the ':', right? Then this should be
> "VOP: disabled\n" or without the colon at all.

the colon will be droped in next versin.

> 
>> +	}
>> +	drm_modeset_unlock_all(drm_dev);
> 
> This code is repeated in vop2_active_regs_show() below. Maybe factor
> this out to a common function?
> 


Do you mean all the code between drm_modeset_lock_all and drm_modeset_unlock_all ?
>> +
>> +	return 0;
>> +}
>> +
>> +static int vop2_active_regs_show(struct seq_file *s, void *data)
>> +{
>> +	struct drm_info_node *node = s->private;
>> +	struct vop2 *vop2 = (struct vop2 *)node->info_ent->data;
>> +	struct drm_minor *minor = node->minor;
>> +	struct drm_device *drm_dev = minor->dev;
>> +	const struct vop2_regs_dump *dump;
>> +	unsigned int n = vop2->data->regs_dump_size;
>> +	unsigned int i;
>> +
>> +	drm_modeset_lock_all(drm_dev);
>> +	if (vop2->enable_count) {
>> +		for (i = 0; i < n; i++) {
>> +			dump = &vop2->data->regs_dump[i];
>> +			vop2_regs_print(vop2, s, dump, true);
>> +		}
>> +	} else {
>> +		seq_printf(s, "VOP disabled:\n");
>> +	}
>> +	drm_modeset_unlock_all(drm_dev);
>> +
>> +	return 0;
>> +}
>> +
> 
> Sascha
> 
