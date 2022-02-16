Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707C4B8A9C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 14:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4766F10EFB2;
	Wed, 16 Feb 2022 13:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFD810E793
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 12:23:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 87D361F45081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645014216;
 bh=UjtikAc6rF+dQuX4rke6Y1em0f7/TgjgFrfzPkPxw2k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GCgYP6Czty7OhVbXIqOiFnb1gqHI3jZnl7TPeffpvzk8Tk6qFelGsNhwJlZfJ9Jkk
 W0YB3BTG+0y7lCstZxFqbzb6rd27xBiI8q+DOdPKdnw1wugr8tae3z4+AGn0DdwDj4
 +9drqYa83ZYhrZEEVpVeQmHWWH/Njy9uNHG+nUDAcTnQ6dPNuPs6ckyE1dffB1277y
 +rUhMtvbeMkEZMcEwqj2rUT4YwhB3JzRJNWQ2WLjwL/D3xribpCeg7r0ckmgYQ75NW
 ixUnv/s2uViG0UQoxN9Gs2EKKhyFvfYEtCOKwG79gl1k3yvHxazDP2EBhAUDTqnz+y
 /pTvxZwnKk+Qw==
Message-ID: <e560b6b3-c0e7-8e23-2490-154a2508c801@collabora.com>
Date: Wed, 16 Feb 2022 15:23:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 22/23] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-23-s.hauer@pengutronix.de>
 <5917d180-de29-79cb-4d4d-e7340d2d88cb@collabora.com>
 <20220216112250.GN18637@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220216112250.GN18637@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Feb 2022 13:47:09 +0000
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



16.02.2022 14:22, Sascha Hauer пишет:
> On Wed, Feb 16, 2022 at 01:39:33PM +0300, Dmitry Osipenko wrote:
>> 09.02.2022 12:53, Sascha Hauer пишет:
>>> +static void vop2_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
>>> +{
>>> +	struct drm_plane_state *pstate = plane->state;
>>> +	struct drm_crtc *crtc = pstate->crtc;
>>> +	struct vop2_win *win = to_vop2_win(plane);
>>> +	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>>> +	struct drm_display_mode *adjusted_mode = &crtc->state->adjusted_mode;
>>> +	struct vop2 *vop2 = win->vop2;
>>> +	struct drm_framebuffer *fb = pstate->fb;
>>> +	uint32_t bpp = fb->format->cpp[0] * 8;
>>> +	uint32_t actual_w, actual_h, dsp_w, dsp_h;
>>> +	uint32_t act_info, dsp_info;
>>> +	uint32_t format;
>>> +	uint32_t afbc_format;
>>> +	uint32_t rb_swap;
>>> +	uint32_t uv_swap;
>>> +	struct drm_rect *src = &pstate->src;
>>> +	struct drm_rect *dest = &pstate->dst;
>>> +	uint32_t afbc_tile_num;
>>> +	uint32_t transform_offset;
>>> +	bool dither_up;
>>> +	bool xmirror = pstate->rotation & DRM_MODE_REFLECT_X;
>>> +	bool ymirror = pstate->rotation & DRM_MODE_REFLECT_Y;
>>> +	bool rotate_270 = pstate->rotation & DRM_MODE_ROTATE_270;
>>> +	bool rotate_90 = pstate->rotation & DRM_MODE_ROTATE_90;
>>> +	struct rockchip_gem_object *rk_obj;
>>> +	unsigned long offset;
>>> +	bool afbc_en;
>>> +	dma_addr_t yrgb_mst;
>>> +	dma_addr_t uv_mst;
>>> +
>>> +	/*
>>> +	 * can't update plane when vop2 is disabled.
>>> +	 */
>>> +	if (WARN_ON(!crtc))
>>> +		return;
>>> +
>>> +	if (!pstate->visible) {
>>> +		vop2_plane_atomic_disable(plane, state);
>>> +		return;
>>> +	}
>>> +
>>> +	afbc_en = rockchip_afbc(plane, fb->modifier);
>>> +
>>> +	offset = (src->x1 >> 16) * fb->format->cpp[0];
>>> +
>>> +	/*
>>> +	 * AFBC HDR_PTR must set to the zero offset of the framebuffer.
>>> +	 */
>>> +	if (afbc_en)
>>> +		offset = 0;
>>> +	else if (pstate->rotation & DRM_MODE_REFLECT_Y)
>>> +		offset += ((src->y2 >> 16) - 1) * fb->pitches[0];
>>> +	else
>>> +		offset += (src->y1 >> 16) * fb->pitches[0];
>>> +
>>> +	rk_obj = to_rockchip_obj(fb->obj[0]);
>>> +
>>> +	yrgb_mst = rk_obj->dma_addr + offset + fb->offsets[0];
>>> +	if (fb->format->is_yuv) {
>>> +		int hsub = fb->format->hsub;
>>> +		int vsub = fb->format->vsub;
>>> +
>>> +		offset = (src->x1 >> 16) * fb->format->cpp[1] / hsub;
>>> +		offset += (src->y1 >> 16) * fb->pitches[1] / vsub;
>>> +
>>> +		if ((pstate->rotation & DRM_MODE_REFLECT_Y) && !afbc_en)
>>> +			offset += fb->pitches[1] * ((pstate->src_h >> 16) - 2)  / vsub;
>>> +
>>> +		rk_obj = to_rockchip_obj(fb->obj[0]);
>>> +		uv_mst = rk_obj->dma_addr + offset + fb->offsets[1];
>>> +	}
>>> +
>>> +	actual_w = drm_rect_width(src) >> 16;
>>> +	actual_h = drm_rect_height(src) >> 16;
>>> +	dsp_w = drm_rect_width(dest);
>>> +
>>> +	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
>>> +		drm_err(vop2->drm, "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
>>> +			  vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
>>> +		dsp_w = adjusted_mode->hdisplay - dest->x1;
>>> +		if (dsp_w < 4)
>>> +			dsp_w = 4;
>>> +		actual_w = dsp_w * actual_w / drm_rect_width(dest);
>>> +	}
>>> +
>>> +	dsp_h = drm_rect_height(dest);
>>> +
>>> +	if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
>>> +		drm_err(vop2->drm, "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
>>> +			  vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
>>> +		dsp_h = adjusted_mode->vdisplay - dest->y1;
>>> +		if (dsp_h < 4)
>>> +			dsp_h = 4;
>>> +		actual_h = dsp_h * actual_h / drm_rect_height(dest);
>>> +	}
>>> +
>>> +	/*
>>> +	 * This is workaround solution for IC design:
>>> +	 * esmart can't support scale down when actual_w % 16 == 1.
>>> +	 */
>>> +	if (!(win->data->feature & WIN_FEATURE_AFBDC)) {
>>> +		if (actual_w > dsp_w && (actual_w & 0xf) == 1) {
>>> +			drm_err(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n", vp->id, win->data->name, actual_w);
>>> +			actual_w -= 1;
>>> +		}
>>> +	}
>>> +
>>> +	if (afbc_en && actual_w % 4) {
>>> +		drm_err(vop2->drm, "vp%d %s actual_w[%d] should align as 4 pixel when enable afbc\n",
>>> +			  vp->id, win->data->name, actual_w);
>>> +		actual_w = ALIGN_DOWN(actual_w, 4);
>>> +	}
>>> +
>>> +	act_info = (actual_h - 1) << 16 | ((actual_w - 1) & 0xffff);
>>> +	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);
>>> +
>>> +	format = vop2_convert_format(fb->format->format);
>>> +
>>> +	drm_dbg(vop2->drm, "vp%d update %s[%dx%d->%dx%d@%dx%d] fmt[%p4cc_%s] addr[%pad]\n",
>>> +		      vp->id, win->data->name, actual_w, actual_h, dsp_w, dsp_h,
>>> +		      dest->x1, dest->y1,
>>> +		      &fb->format->format,
>>> +		      afbc_en ? "AFBC" : "", &yrgb_mst);
>>> +
>>> +	if (afbc_en) {
>>> +		uint32_t stride;
>>> +
>>> +		/* the afbc superblock is 16 x 16 */
>>> +		afbc_format = vop2_convert_afbc_format(fb->format->format);
>>> +
>>> +		/* Enable color transform for YTR */
>>> +		if (fb->modifier & AFBC_FORMAT_MOD_YTR)
>>> +			afbc_format |= (1 << 4);
>>> +
>>> +		afbc_tile_num = ALIGN(actual_w, 16) >> 4;
>>> +
>>> +		/*
>>> +		 * AFBC pic_vir_width is count by pixel, this is different
>>> +		 * with WIN_VIR_STRIDE.
>>> +		 */
>>> +		stride = (fb->pitches[0] << 3) / bpp;
>>> +		if ((stride & 0x3f) && (xmirror || rotate_90 || rotate_270))
>>> +			drm_err(vop2->drm, "vp%d %s stride[%d] must align as 64 pixel when enable xmirror/rotate_90/rotate_270[0x%x]\n",
>>> +				  vp->id, win->data->name, stride, pstate->rotation);
>>> +
>>> +		rb_swap = vop2_afbc_rb_swap(fb->format->format);
>>> +		uv_swap = vop2_afbc_uv_swap(fb->format->format);
>>> +		/*
>>> +		 * This is a workaround for crazy IC design, Cluster
>>> +		 * and Esmart/Smart use different format configuration map:
>>> +		 * YUV420_10BIT: 0x10 for Cluster, 0x14 for Esmart/Smart.
>>> +		 *
>>> +		 * This is one thing we can make the convert simple:
>>> +		 * AFBCD decode all the YUV data to YUV444. So we just
>>> +		 * set all the yuv 10 bit to YUV444_10.
>>> +		 */
>>> +		if (fb->format->is_yuv && (bpp == 10))
>>> +			format = VOP2_CLUSTER_YUV444_10;
>>> +
>>> +		if (vop2_cluster_window(win))
>>> +			vop2_win_write(win, VOP2_WIN_AFBC_ENABLE, 1);
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_FORMAT, afbc_format);
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_RB_SWAP, rb_swap);
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_UV_SWAP, uv_swap);
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 0);
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_BLOCK_SPLIT_EN, 0);
>>> +		if (pstate->rotation & (DRM_MODE_ROTATE_270 | DRM_MODE_ROTATE_90)) {
>>> +			vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN, 0);
>>> +			transform_offset = vop2_afbc_transform_offset(pstate, false);
>>> +		} else {
>>> +			vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN, 1);
>>> +			transform_offset = vop2_afbc_transform_offset(pstate, true);
>>> +		}
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_HDR_PTR, yrgb_mst);
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_PIC_SIZE, act_info);
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_TRANSFORM_OFFSET, transform_offset);
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_PIC_OFFSET, ((src->x1 >> 16) | src->y1));
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_DSP_OFFSET, (dest->x1 | (dest->y1 << 16)));
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_PIC_VIR_WIDTH, stride);
>>> +		vop2_win_write(win, VOP2_WIN_AFBC_TILE_NUM, afbc_tile_num);
>>> +		vop2_win_write(win, VOP2_WIN_XMIRROR, xmirror);
>>
>> The xmirror's variable type is specified as bool, but it's not
>> true/false because in the above code:
>>
>> bool xmirror = pstate->rotation & DRM_MODE_REFLECT_X;
>>
>> I don't see how vop2_win_write() could work properly. Or am I missing
>> something?
> 
> Everything != 0 is true, so 0x10 & 0x10 is still true.

Ah, my bad. I keep forgetting that kernel uses _Bool.

> But ok,
> 
> 	bool xmirror = pstate->rotation & DRM_MODE_REFLECT_X ? true : false;
> 
> looks cleaner. I'll change that.
> 
> Thanks for the review so far. Could you drop me a short note when you're
> done? I was about to send v6.

I don't have any more comments, please feel free to send v6.
