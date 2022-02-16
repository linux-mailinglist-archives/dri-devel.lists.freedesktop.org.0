Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397924B8692
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 12:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C9010E930;
	Wed, 16 Feb 2022 11:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA0C10E91D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:22:57 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nKIOd-0006BT-Ih; Wed, 16 Feb 2022 12:22:55 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nKIOY-0007G1-Le; Wed, 16 Feb 2022 12:22:50 +0100
Date: Wed, 16 Feb 2022 12:22:50 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v5 22/23] drm: rockchip: Add VOP2 driver
Message-ID: <20220216112250.GN18637@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-23-s.hauer@pengutronix.de>
 <5917d180-de29-79cb-4d4d-e7340d2d88cb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5917d180-de29-79cb-4d4d-e7340d2d88cb@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:17:05 up 67 days, 20:02, 84 users,  load average: 0.09, 0.14, 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 01:39:33PM +0300, Dmitry Osipenko wrote:
> 09.02.2022 12:53, Sascha Hauer пишет:
> > +static void vop2_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
> > +{
> > +	struct drm_plane_state *pstate = plane->state;
> > +	struct drm_crtc *crtc = pstate->crtc;
> > +	struct vop2_win *win = to_vop2_win(plane);
> > +	struct vop2_video_port *vp = to_vop2_video_port(crtc);
> > +	struct drm_display_mode *adjusted_mode = &crtc->state->adjusted_mode;
> > +	struct vop2 *vop2 = win->vop2;
> > +	struct drm_framebuffer *fb = pstate->fb;
> > +	uint32_t bpp = fb->format->cpp[0] * 8;
> > +	uint32_t actual_w, actual_h, dsp_w, dsp_h;
> > +	uint32_t act_info, dsp_info;
> > +	uint32_t format;
> > +	uint32_t afbc_format;
> > +	uint32_t rb_swap;
> > +	uint32_t uv_swap;
> > +	struct drm_rect *src = &pstate->src;
> > +	struct drm_rect *dest = &pstate->dst;
> > +	uint32_t afbc_tile_num;
> > +	uint32_t transform_offset;
> > +	bool dither_up;
> > +	bool xmirror = pstate->rotation & DRM_MODE_REFLECT_X;
> > +	bool ymirror = pstate->rotation & DRM_MODE_REFLECT_Y;
> > +	bool rotate_270 = pstate->rotation & DRM_MODE_ROTATE_270;
> > +	bool rotate_90 = pstate->rotation & DRM_MODE_ROTATE_90;
> > +	struct rockchip_gem_object *rk_obj;
> > +	unsigned long offset;
> > +	bool afbc_en;
> > +	dma_addr_t yrgb_mst;
> > +	dma_addr_t uv_mst;
> > +
> > +	/*
> > +	 * can't update plane when vop2 is disabled.
> > +	 */
> > +	if (WARN_ON(!crtc))
> > +		return;
> > +
> > +	if (!pstate->visible) {
> > +		vop2_plane_atomic_disable(plane, state);
> > +		return;
> > +	}
> > +
> > +	afbc_en = rockchip_afbc(plane, fb->modifier);
> > +
> > +	offset = (src->x1 >> 16) * fb->format->cpp[0];
> > +
> > +	/*
> > +	 * AFBC HDR_PTR must set to the zero offset of the framebuffer.
> > +	 */
> > +	if (afbc_en)
> > +		offset = 0;
> > +	else if (pstate->rotation & DRM_MODE_REFLECT_Y)
> > +		offset += ((src->y2 >> 16) - 1) * fb->pitches[0];
> > +	else
> > +		offset += (src->y1 >> 16) * fb->pitches[0];
> > +
> > +	rk_obj = to_rockchip_obj(fb->obj[0]);
> > +
> > +	yrgb_mst = rk_obj->dma_addr + offset + fb->offsets[0];
> > +	if (fb->format->is_yuv) {
> > +		int hsub = fb->format->hsub;
> > +		int vsub = fb->format->vsub;
> > +
> > +		offset = (src->x1 >> 16) * fb->format->cpp[1] / hsub;
> > +		offset += (src->y1 >> 16) * fb->pitches[1] / vsub;
> > +
> > +		if ((pstate->rotation & DRM_MODE_REFLECT_Y) && !afbc_en)
> > +			offset += fb->pitches[1] * ((pstate->src_h >> 16) - 2)  / vsub;
> > +
> > +		rk_obj = to_rockchip_obj(fb->obj[0]);
> > +		uv_mst = rk_obj->dma_addr + offset + fb->offsets[1];
> > +	}
> > +
> > +	actual_w = drm_rect_width(src) >> 16;
> > +	actual_h = drm_rect_height(src) >> 16;
> > +	dsp_w = drm_rect_width(dest);
> > +
> > +	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
> > +		drm_err(vop2->drm, "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
> > +			  vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
> > +		dsp_w = adjusted_mode->hdisplay - dest->x1;
> > +		if (dsp_w < 4)
> > +			dsp_w = 4;
> > +		actual_w = dsp_w * actual_w / drm_rect_width(dest);
> > +	}
> > +
> > +	dsp_h = drm_rect_height(dest);
> > +
> > +	if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
> > +		drm_err(vop2->drm, "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
> > +			  vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
> > +		dsp_h = adjusted_mode->vdisplay - dest->y1;
> > +		if (dsp_h < 4)
> > +			dsp_h = 4;
> > +		actual_h = dsp_h * actual_h / drm_rect_height(dest);
> > +	}
> > +
> > +	/*
> > +	 * This is workaround solution for IC design:
> > +	 * esmart can't support scale down when actual_w % 16 == 1.
> > +	 */
> > +	if (!(win->data->feature & WIN_FEATURE_AFBDC)) {
> > +		if (actual_w > dsp_w && (actual_w & 0xf) == 1) {
> > +			drm_err(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n", vp->id, win->data->name, actual_w);
> > +			actual_w -= 1;
> > +		}
> > +	}
> > +
> > +	if (afbc_en && actual_w % 4) {
> > +		drm_err(vop2->drm, "vp%d %s actual_w[%d] should align as 4 pixel when enable afbc\n",
> > +			  vp->id, win->data->name, actual_w);
> > +		actual_w = ALIGN_DOWN(actual_w, 4);
> > +	}
> > +
> > +	act_info = (actual_h - 1) << 16 | ((actual_w - 1) & 0xffff);
> > +	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);
> > +
> > +	format = vop2_convert_format(fb->format->format);
> > +
> > +	drm_dbg(vop2->drm, "vp%d update %s[%dx%d->%dx%d@%dx%d] fmt[%p4cc_%s] addr[%pad]\n",
> > +		      vp->id, win->data->name, actual_w, actual_h, dsp_w, dsp_h,
> > +		      dest->x1, dest->y1,
> > +		      &fb->format->format,
> > +		      afbc_en ? "AFBC" : "", &yrgb_mst);
> > +
> > +	if (afbc_en) {
> > +		uint32_t stride;
> > +
> > +		/* the afbc superblock is 16 x 16 */
> > +		afbc_format = vop2_convert_afbc_format(fb->format->format);
> > +
> > +		/* Enable color transform for YTR */
> > +		if (fb->modifier & AFBC_FORMAT_MOD_YTR)
> > +			afbc_format |= (1 << 4);
> > +
> > +		afbc_tile_num = ALIGN(actual_w, 16) >> 4;
> > +
> > +		/*
> > +		 * AFBC pic_vir_width is count by pixel, this is different
> > +		 * with WIN_VIR_STRIDE.
> > +		 */
> > +		stride = (fb->pitches[0] << 3) / bpp;
> > +		if ((stride & 0x3f) && (xmirror || rotate_90 || rotate_270))
> > +			drm_err(vop2->drm, "vp%d %s stride[%d] must align as 64 pixel when enable xmirror/rotate_90/rotate_270[0x%x]\n",
> > +				  vp->id, win->data->name, stride, pstate->rotation);
> > +
> > +		rb_swap = vop2_afbc_rb_swap(fb->format->format);
> > +		uv_swap = vop2_afbc_uv_swap(fb->format->format);
> > +		/*
> > +		 * This is a workaround for crazy IC design, Cluster
> > +		 * and Esmart/Smart use different format configuration map:
> > +		 * YUV420_10BIT: 0x10 for Cluster, 0x14 for Esmart/Smart.
> > +		 *
> > +		 * This is one thing we can make the convert simple:
> > +		 * AFBCD decode all the YUV data to YUV444. So we just
> > +		 * set all the yuv 10 bit to YUV444_10.
> > +		 */
> > +		if (fb->format->is_yuv && (bpp == 10))
> > +			format = VOP2_CLUSTER_YUV444_10;
> > +
> > +		if (vop2_cluster_window(win))
> > +			vop2_win_write(win, VOP2_WIN_AFBC_ENABLE, 1);
> > +		vop2_win_write(win, VOP2_WIN_AFBC_FORMAT, afbc_format);
> > +		vop2_win_write(win, VOP2_WIN_AFBC_RB_SWAP, rb_swap);
> > +		vop2_win_write(win, VOP2_WIN_AFBC_UV_SWAP, uv_swap);
> > +		vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 0);
> > +		vop2_win_write(win, VOP2_WIN_AFBC_BLOCK_SPLIT_EN, 0);
> > +		if (pstate->rotation & (DRM_MODE_ROTATE_270 | DRM_MODE_ROTATE_90)) {
> > +			vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN, 0);
> > +			transform_offset = vop2_afbc_transform_offset(pstate, false);
> > +		} else {
> > +			vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN, 1);
> > +			transform_offset = vop2_afbc_transform_offset(pstate, true);
> > +		}
> > +		vop2_win_write(win, VOP2_WIN_AFBC_HDR_PTR, yrgb_mst);
> > +		vop2_win_write(win, VOP2_WIN_AFBC_PIC_SIZE, act_info);
> > +		vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFSET, transform_offset);
> > +		vop2_win_write(win, VOP2_WIN_AFBC_PIC_OFFSET, ((src->x1 >> 16) | src->y1));
> > +		vop2_win_write(win, VOP2_WIN_AFBC_DSP_OFFSET, (dest->x1 | (dest->y1 << 16)));
> > +		vop2_win_write(win, VOP2_WIN_AFBC_PIC_VIR_WIDTH, stride);
> > +		vop2_win_write(win, VOP2_WIN_AFBC_TILE_NUM, afbc_tile_num);
> > +		vop2_win_write(win, VOP2_WIN_XMIRROR, xmirror);
> 
> The xmirror's variable type is specified as bool, but it's not
> true/false because in the above code:
> 
> bool xmirror = pstate->rotation & DRM_MODE_REFLECT_X;
> 
> I don't see how vop2_win_write() could work properly. Or am I missing
> something?

Everything != 0 is true, so 0x10 & 0x10 is still true.

But ok,

	bool xmirror = pstate->rotation & DRM_MODE_REFLECT_X ? true : false;

looks cleaner. I'll change that.

Thanks for the review so far. Could you drop me a short note when you're
done? I was about to send v6.

Thanks
 Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
