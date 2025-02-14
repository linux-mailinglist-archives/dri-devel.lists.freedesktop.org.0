Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA60A35B9F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714C10EC41;
	Fri, 14 Feb 2025 10:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KT14k09j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF67C10EC41
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739529355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgZ82o3KlN77YBZJajikCHugH4bJ+YBqlhDcnzKjWMQ=;
 b=KT14k09jeLhAc10AGsfEdHlsl9yv58ArkUxQZbnoln68BM2ouuZ4PnKaVl3PX6rAjE1bqe
 0YIdIVByLCWm40jtgWWaDCaXwivZrHOYYTzqF8TK/859TUZUrUuJPlbXHoibxYqTowrs4r
 CaMS4txG4LPYy+qMQhvgAnqE1idi+ZA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-vdSlZIpCNd21bSYJbZREYQ-1; Fri, 14 Feb 2025 05:35:54 -0500
X-MC-Unique: vdSlZIpCNd21bSYJbZREYQ-1
X-Mimecast-MFC-AGG-ID: vdSlZIpCNd21bSYJbZREYQ_1739529353
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4393535043bso11366495e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 02:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739529353; x=1740134153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jgZ82o3KlN77YBZJajikCHugH4bJ+YBqlhDcnzKjWMQ=;
 b=xRKncL7ENtRBrhvc0UilIqwo4OTIKwcFJNJNM0LzpQrBKdigqKQ3TwOZOQ40+IZK98
 syu6MKvDmfI/k/I13ykEsQq0WsdQGDw2hKk6Wxr0OWyhW9f59MCZfNT+dllE7Yh0Qj/i
 4WackJlH1iLI7fCdyEv+yCbXxYd4mHk764z0e/yZ+g+CSYuK5P+2OLkSBJGIuC2iKo+F
 PcgNpcVh8jJOEQcVDdfg4iBWc7V/P/sky2HBZxvr/wGbxNPkCyZGZUxazY5m1DSG0ltn
 oLC2Fh7zNpL7ckRuEKpua+up0kLd9W+9cOMACbK98lSVKVKFrfMaVXFm4djIp+PqzQRm
 Z04Q==
X-Gm-Message-State: AOJu0YxV32dFIIHSse8bJfov/Ajua9NMXSn1k+MdC9hnI0Av060k+O77
 /iO19HK9TDDPAnNsueI5YRbn3sciEAGbRIh+veoV5AkkoM7xzi62tYqNAtiNedDsR9NNiuxvGKY
 VY3z4kw0fgjMZcCmuhUr+S+wtuqVvM+urQN798yS3N5VmmCJU5IxAw//waVjuxMi/C1n3f3Xppg
 ==
X-Gm-Gg: ASbGncvU2uIUWKq2m4f6c8WX7Yexyv5JnCc4SPwxS3NOu9o7Fxjc3XrvRVjRh0HH21a
 KC84NFlSpzVXc+U2rA1DLP7QVv+y6+7PVlhflynVYJIrVuzkOe9XFkAw+nRGg4R+pg478uvuu3Q
 DercPZfM43+oECyZ2yaov2R5767Mm++fqqovks5/jxiNnwcTLqkmq+8PyuJZFBKtkCAbvL/hOkw
 BNT0VBf28lCBFnez5r/ASbmBIIAnHv+/YkshrNNi9V27uGykYj+/zKr2HobJkoX6cCs2txYy4aL
 kVQvcaY//oMxPAR9GIpPRhR16+ObuidKDiNtCYjTaej8
X-Received: by 2002:a05:600c:3543:b0:439:5fbd:19d2 with SMTP id
 5b1f17b1804b1-43960ea3397mr79565395e9.10.1739529352621; 
 Fri, 14 Feb 2025 02:35:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1YGLH6pMxusWkRdXxdIPBPQcCTJMDx5R2iNLc16kqT/0LH0nKDJ33D+7lDpbxJvVYrfXhoQ==
X-Received: by 2002:a05:600c:3543:b0:439:5fbd:19d2 with SMTP id
 5b1f17b1804b1-43960ea3397mr79564875e9.10.1739529351943; 
 Fri, 14 Feb 2025 02:35:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439617da91asm41505905e9.2.2025.02.14.02.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 02:35:51 -0800 (PST)
Message-ID: <2081857c-ff9b-4bb8-9fa4-2484df016af8@redhat.com>
Date: Fri, 14 Feb 2025 11:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/ast: cursor: Move implementation to separate
 source file
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250213163845.118207-1-tzimmermann@suse.de>
 <20250213163845.118207-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250213163845.118207-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lPYoEcmuoTG4wc7nfqq-_ck1BURTWp93pnP_Hxd1_2w_1739529353
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2025 17:25, Thomas Zimmermann wrote:
> Move the cursor code into a separate source file for readability. No
> functional changes.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/Makefile     |   1 +
>   drivers/gpu/drm/ast/ast_cursor.c | 306 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.h    |  24 +--
>   drivers/gpu/drm/ast/ast_mode.c   | 275 +--------------------------
>   4 files changed, 327 insertions(+), 279 deletions(-)
>   create mode 100644 drivers/gpu/drm/ast/ast_cursor.c
> 
> diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
> index 3107ea9c7bf5..8d09ba5d5889 100644
> --- a/drivers/gpu/drm/ast/Makefile
> +++ b/drivers/gpu/drm/ast/Makefile
> @@ -4,6 +4,7 @@
>   # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>   
>   ast-y := \
> +	ast_cursor.o \
>   	ast_ddc.o \
>   	ast_dp501.o \
>   	ast_dp.o \
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> new file mode 100644
> index 000000000000..aeb1c86bd1ab
> --- /dev/null
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.
> + */
> +
> +#include <linux/sizes.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_print.h>
> +
> +#include "ast_drv.h"
> +
> +/*
> + * Hardware cursor
> + */
> +
> +/* define for signature structure */
> +#define AST_HWC_SIGNATURE_CHECKSUM	0x00
> +#define AST_HWC_SIGNATURE_SizeX		0x04
> +#define AST_HWC_SIGNATURE_SizeY		0x08
> +#define AST_HWC_SIGNATURE_X		0x0C
> +#define AST_HWC_SIGNATURE_Y		0x10
> +#define AST_HWC_SIGNATURE_HOTSPOTX	0x14
> +#define AST_HWC_SIGNATURE_HOTSPOTY	0x18
> +
> +static u32 ast_cursor_calculate_checksum(const u8 *src, unsigned int width, unsigned int height)
> +{
> +	u32 csum = 0;
> +	unsigned int i, j;
> +	unsigned int one_pixel_copy = width & BIT(0);
> +	unsigned int two_pixel_copy = width - one_pixel_copy;
> +	unsigned int trailing_bytes = (AST_MAX_HWC_WIDTH - width) * sizeof(u16);
> +
> +	for (j = 0; j < height; j++) {
> +		for (i = 0; i < two_pixel_copy; i += 2, src += SZ_4) {
> +			const u32 *src32 = (const u32 *)src;
> +
> +			csum += *src32;
> +		}
> +		for (i = 0; i < one_pixel_copy; i++, src += SZ_2) {
> +			const u16 *src16 = (const u16 *)src;
> +
> +			csum += *src16;
> +		}
> +		src += trailing_bytes;
> +	}
> +
> +	return csum;
> +}
> +
> +static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
> +				 unsigned int width, unsigned int height)
> +{
> +	u8 __iomem *dst = ast->cursor_plane.base.vaddr;
> +	u32 csum = 0;
> +
> +	csum = ast_cursor_calculate_checksum(src, width, height);
> +
> +	/* write pixel data */
> +	memcpy_toio(dst, src, AST_HWC_SIZE);
> +
> +	/* write checksum + signature */
> +	dst += AST_HWC_SIZE;
> +	writel(csum, dst);
> +	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
> +	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
> +	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
> +	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
> +}
> +
> +static void ast_set_cursor_base(struct ast_device *ast, u64 address)
> +{
> +	u8 addr0 = (address >> 3) & 0xff;
> +	u8 addr1 = (address >> 11) & 0xff;
> +	u8 addr2 = (address >> 19) & 0xff;
> +
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc8, addr0);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc9, addr1);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xca, addr2);
> +}
> +
> +static void ast_set_cursor_location(struct ast_device *ast, u16 x, u16 y,
> +				    u8 x_offset, u8 y_offset)
> +{
> +	u8 x0 = (x & 0x00ff);
> +	u8 x1 = (x & 0x0f00) >> 8;
> +	u8 y0 = (y & 0x00ff);
> +	u8 y1 = (y & 0x0700) >> 8;
> +
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc2, x_offset);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc3, y_offset);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc4, x0);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc5, x1);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc6, y0);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc7, y1);
> +}
> +
> +static void ast_set_cursor_enabled(struct ast_device *ast, bool enabled)
> +{
> +	static const u8 mask = (u8)~(AST_IO_VGACRCB_HWC_16BPP |
> +				     AST_IO_VGACRCB_HWC_ENABLED);
> +
> +	u8 vgacrcb = AST_IO_VGACRCB_HWC_16BPP;
> +
> +	if (enabled)
> +		vgacrcb |= AST_IO_VGACRCB_HWC_ENABLED;
> +
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xcb, mask, vgacrcb);
> +}
> +
> +/*
> + * Cursor plane
> + */
> +
> +static const uint32_t ast_cursor_plane_formats[] = {
> +	DRM_FORMAT_ARGB4444,
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
> +						struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +	int ret;
> +
> +	if (new_plane_state->crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  true, true);
> +	if (ret || !new_plane_state->visible)
> +		return ret;
> +
> +	if (new_fb->width > AST_MAX_HWC_WIDTH || new_fb->height > AST_MAX_HWC_HEIGHT)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
> +						  struct drm_atomic_state *state)
> +{
> +	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
> +	struct ast_plane *ast_plane = to_ast_plane(plane);
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct ast_device *ast = to_ast_device(plane->dev);
> +	struct drm_rect damage;
> +	u64 dst_off = ast_plane->offset;
> +	u8 __iomem *dst = ast_plane->vaddr; /* TODO: Use mapping abstraction properly */
> +	u8 __iomem *sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
> +	unsigned int offset_x, offset_y;
> +	u16 x, y;
> +	u8 x_offset, y_offset;
> +
> +	/*
> +	 * Do data transfer to hardware buffer and point the scanout
> +	 * engine to the offset.
> +	 */
> +
> +	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
> +		u8 *argb4444;
> +
> +		switch (fb->format->format) {
> +		case DRM_FORMAT_ARGB4444:
> +			argb4444 = shadow_plane_state->data[0].vaddr;
> +			break;
> +		default:
> +			argb4444 = ast_cursor_plane->argb4444;
> +			{
> +				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> +					IOSYS_MAP_INIT_VADDR(argb4444),
> +				};
> +				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +					AST_HWC_PITCH,
> +				};
> +
> +				drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> +							    shadow_plane_state->data, fb, &damage,
> +							    &shadow_plane_state->fmtcnv_state);
> +			}
> +			break;
> +		}
> +		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
> +		ast_set_cursor_base(ast, dst_off);
> +	}
> +
> +	/*
> +	 * Update location in HWC signature and registers.
> +	 */
> +
> +	writel(plane_state->crtc_x, sig + AST_HWC_SIGNATURE_X);
> +	writel(plane_state->crtc_y, sig + AST_HWC_SIGNATURE_Y);
> +
> +	offset_x = AST_MAX_HWC_WIDTH - fb->width;
> +	offset_y = AST_MAX_HWC_HEIGHT - fb->height;
> +
> +	if (plane_state->crtc_x < 0) {
> +		x_offset = (-plane_state->crtc_x) + offset_x;
> +		x = 0;
> +	} else {
> +		x_offset = offset_x;
> +		x = plane_state->crtc_x;
> +	}
> +	if (plane_state->crtc_y < 0) {
> +		y_offset = (-plane_state->crtc_y) + offset_y;
> +		y = 0;
> +	} else {
> +		y_offset = offset_y;
> +		y = plane_state->crtc_y;
> +	}
> +
> +	ast_set_cursor_location(ast, x, y, x_offset, y_offset);
> +
> +	/* Dummy write to enable HWC and make the HW pick-up the changes. */
> +	ast_set_cursor_enabled(ast, true);
> +}
> +
> +static void ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
> +						   struct drm_atomic_state *state)
> +{
> +	struct ast_device *ast = to_ast_device(plane->dev);
> +
> +	ast_set_cursor_enabled(ast, false);
> +}
> +
> +static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = ast_cursor_plane_helper_atomic_check,
> +	.atomic_update = ast_cursor_plane_helper_atomic_update,
> +	.atomic_disable = ast_cursor_plane_helper_atomic_disable,
> +};
> +
> +static const struct drm_plane_funcs ast_cursor_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> +};
> +
> +int ast_cursor_plane_init(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	struct ast_cursor_plane *ast_cursor_plane = &ast->cursor_plane;
> +	struct ast_plane *ast_plane = &ast_cursor_plane->base;
> +	struct drm_plane *cursor_plane = &ast_plane->base;
> +	size_t size;
> +	void __iomem *vaddr;
> +	u64 offset;
> +	int ret;
> +
> +	/*
> +	 * Allocate backing storage for cursors. The BOs are permanently
> +	 * pinned to the top end of the VRAM.
> +	 */
> +
> +	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
> +
> +	if (ast->vram_fb_available < size)
> +		return -ENOMEM;
> +
> +	vaddr = ast->vram + ast->vram_fb_available - size;
> +	offset = ast->vram_fb_available - size;
> +
> +	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
> +			     0x01, &ast_cursor_plane_funcs,
> +			     ast_cursor_plane_formats, ARRAY_SIZE(ast_cursor_plane_formats),
> +			     NULL, DRM_PLANE_TYPE_CURSOR);
> +	if (ret) {
> +		drm_err(dev, "ast_plane_init() failed: %d\n", ret);
> +		return ret;
> +	}
> +	drm_plane_helper_add(cursor_plane, &ast_cursor_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(cursor_plane);
> +
> +	ast->vram_fb_available -= size;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 973abd0cbd42..d2c2605d2728 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -118,15 +118,6 @@ enum ast_config_mode {
>   
>   #define AST_HWC_SIGNATURE_SIZE	32
>   
> -/* define for signature structure */
> -#define AST_HWC_SIGNATURE_CHECKSUM	0x00
> -#define AST_HWC_SIGNATURE_SizeX		0x04
> -#define AST_HWC_SIGNATURE_SizeY		0x08
> -#define AST_HWC_SIGNATURE_X		0x0C
> -#define AST_HWC_SIGNATURE_Y		0x10
> -#define AST_HWC_SIGNATURE_HOTSPOTX	0x14
> -#define AST_HWC_SIGNATURE_HOTSPOTY	0x18
> -
>   /*
>    * Planes
>    */
> @@ -383,8 +374,6 @@ struct ast_crtc_state {
>   
>   #define to_ast_crtc_state(state) container_of(state, struct ast_crtc_state, base)
>   
> -int ast_mode_config_init(struct ast_device *ast);
> -
>   #define AST_MM_ALIGN_SHIFT 4
>   #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
>   
> @@ -450,6 +439,9 @@ void ast_patch_ahb_2500(void __iomem *regs);
>   int ast_vga_output_init(struct ast_device *ast);
>   int ast_sil164_output_init(struct ast_device *ast);
>   
> +/* ast_cursor.c */
> +int ast_cursor_plane_init(struct ast_device *ast);
> +
>   /* ast dp501 */
>   bool ast_backup_fw(struct ast_device *ast, u8 *addr, u32 size);
>   void ast_init_3rdtx(struct ast_device *ast);
> @@ -459,4 +451,14 @@ int ast_dp501_output_init(struct ast_device *ast);
>   int ast_dp_launch(struct ast_device *ast);
>   int ast_astdp_output_init(struct ast_device *ast);
>   
> +/* ast_mode.c */
> +int ast_mode_config_init(struct ast_device *ast);
> +int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
> +		   void __iomem *vaddr, u64 offset, unsigned long size,
> +		   uint32_t possible_crtcs,
> +		   const struct drm_plane_funcs *funcs,
> +		   const uint32_t *formats, unsigned int format_count,
> +		   const uint64_t *format_modifiers,
> +		   enum drm_plane_type type);
> +
>   #endif
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 4beac9cdfe83..c3b950675485 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -438,13 +438,13 @@ static void ast_wait_for_vretrace(struct ast_device *ast)
>    * Planes
>    */
>   
> -static int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
> -			  void __iomem *vaddr, u64 offset, unsigned long size,
> -			  uint32_t possible_crtcs,
> -			  const struct drm_plane_funcs *funcs,
> -			  const uint32_t *formats, unsigned int format_count,
> -			  const uint64_t *format_modifiers,
> -			  enum drm_plane_type type)
> +int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
> +		   void __iomem *vaddr, u64 offset, unsigned long size,
> +		   uint32_t possible_crtcs,
> +		   const struct drm_plane_funcs *funcs,
> +		   const uint32_t *formats, unsigned int format_count,
> +		   const uint64_t *format_modifiers,
> +		   enum drm_plane_type type)
>   {
>   	struct drm_plane *plane = &ast_plane->base;
>   
> @@ -628,267 +628,6 @@ static int ast_primary_plane_init(struct ast_device *ast)
>   	return 0;
>   }
>   
> -/*
> - * Cursor plane
> - */
> -
> -static u32 ast_cursor_calculate_checksum(const u8 *src, unsigned int width, unsigned int height)
> -{
> -	u32 csum = 0;
> -	unsigned int i, j;
> -	unsigned int one_pixel_copy = width & BIT(0);
> -	unsigned int two_pixel_copy = width - one_pixel_copy;
> -	unsigned int trailing_bytes = (AST_MAX_HWC_WIDTH - width) * sizeof(u16);
> -
> -	for (j = 0; j < height; j++) {
> -		for (i = 0; i < two_pixel_copy; i += 2, src += SZ_4) {
> -			const u32 *src32 = (const u32 *)src;
> -
> -			csum += *src32;
> -		}
> -		for (i = 0; i < one_pixel_copy; i++, src += SZ_2) {
> -			const u16 *src16 = (const u16 *)src;
> -
> -			csum += *src16;
> -		}
> -		src += trailing_bytes;
> -	}
> -
> -	return csum;
> -}
> -
> -static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
> -				 unsigned int width, unsigned int height)
> -{
> -	u8 __iomem *dst = ast->cursor_plane.base.vaddr;
> -	u32 csum = 0;
> -
> -	csum = ast_cursor_calculate_checksum(src, width, height);
> -
> -	/* write pixel data */
> -	memcpy_toio(dst, src, AST_HWC_SIZE);
> -
> -	/* write checksum + signature */
> -	dst += AST_HWC_SIZE;
> -	writel(csum, dst);
> -	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
> -	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
> -	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
> -	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
> -}
> -
> -static void ast_set_cursor_base(struct ast_device *ast, u64 address)
> -{
> -	u8 addr0 = (address >> 3) & 0xff;
> -	u8 addr1 = (address >> 11) & 0xff;
> -	u8 addr2 = (address >> 19) & 0xff;
> -
> -	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc8, addr0);
> -	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc9, addr1);
> -	ast_set_index_reg(ast, AST_IO_VGACRI, 0xca, addr2);
> -}
> -
> -static void ast_set_cursor_location(struct ast_device *ast, u16 x, u16 y,
> -				    u8 x_offset, u8 y_offset)
> -{
> -	u8 x0 = (x & 0x00ff);
> -	u8 x1 = (x & 0x0f00) >> 8;
> -	u8 y0 = (y & 0x00ff);
> -	u8 y1 = (y & 0x0700) >> 8;
> -
> -	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc2, x_offset);
> -	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc3, y_offset);
> -	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc4, x0);
> -	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc5, x1);
> -	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc6, y0);
> -	ast_set_index_reg(ast, AST_IO_VGACRI, 0xc7, y1);
> -}
> -
> -static void ast_set_cursor_enabled(struct ast_device *ast, bool enabled)
> -{
> -	static const u8 mask = (u8)~(AST_IO_VGACRCB_HWC_16BPP |
> -				     AST_IO_VGACRCB_HWC_ENABLED);
> -
> -	u8 vgacrcb = AST_IO_VGACRCB_HWC_16BPP;
> -
> -	if (enabled)
> -		vgacrcb |= AST_IO_VGACRCB_HWC_ENABLED;
> -
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xcb, mask, vgacrcb);
> -}
> -
> -static const uint32_t ast_cursor_plane_formats[] = {
> -	DRM_FORMAT_ARGB4444,
> -	DRM_FORMAT_ARGB8888,
> -};
> -
> -static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
> -						struct drm_atomic_state *state)
> -{
> -	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> -	struct drm_framebuffer *new_fb = new_plane_state->fb;
> -	struct drm_crtc_state *new_crtc_state = NULL;
> -	int ret;
> -
> -	if (new_plane_state->crtc)
> -		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
> -
> -	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> -						  DRM_PLANE_NO_SCALING,
> -						  DRM_PLANE_NO_SCALING,
> -						  true, true);
> -	if (ret || !new_plane_state->visible)
> -		return ret;
> -
> -	if (new_fb->width > AST_MAX_HWC_WIDTH || new_fb->height > AST_MAX_HWC_HEIGHT)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> -static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
> -						  struct drm_atomic_state *state)
> -{
> -	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
> -	struct ast_plane *ast_plane = to_ast_plane(plane);
> -	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> -	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> -	struct drm_framebuffer *fb = plane_state->fb;
> -	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> -	struct ast_device *ast = to_ast_device(plane->dev);
> -	struct drm_rect damage;
> -	u64 dst_off = ast_plane->offset;
> -	u8 __iomem *dst = ast_plane->vaddr; /* TODO: Use mapping abstraction properly */
> -	u8 __iomem *sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
> -	unsigned int offset_x, offset_y;
> -	u16 x, y;
> -	u8 x_offset, y_offset;
> -
> -	/*
> -	 * Do data transfer to hardware buffer and point the scanout
> -	 * engine to the offset.
> -	 */
> -
> -	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
> -		u8 *argb4444;
> -
> -		switch (fb->format->format) {
> -		case DRM_FORMAT_ARGB4444:
> -			argb4444 = shadow_plane_state->data[0].vaddr;
> -			break;
> -		default:
> -			argb4444 = ast_cursor_plane->argb4444;
> -			{
> -				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> -					IOSYS_MAP_INIT_VADDR(argb4444),
> -				};
> -				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -					AST_HWC_PITCH,
> -				};
> -
> -				drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> -							    shadow_plane_state->data, fb, &damage,
> -							    &shadow_plane_state->fmtcnv_state);
> -			}
> -			break;
> -		}
> -		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
> -		ast_set_cursor_base(ast, dst_off);
> -	}
> -
> -	/*
> -	 * Update location in HWC signature and registers.
> -	 */
> -
> -	writel(plane_state->crtc_x, sig + AST_HWC_SIGNATURE_X);
> -	writel(plane_state->crtc_y, sig + AST_HWC_SIGNATURE_Y);
> -
> -	offset_x = AST_MAX_HWC_WIDTH - fb->width;
> -	offset_y = AST_MAX_HWC_HEIGHT - fb->height;
> -
> -	if (plane_state->crtc_x < 0) {
> -		x_offset = (-plane_state->crtc_x) + offset_x;
> -		x = 0;
> -	} else {
> -		x_offset = offset_x;
> -		x = plane_state->crtc_x;
> -	}
> -	if (plane_state->crtc_y < 0) {
> -		y_offset = (-plane_state->crtc_y) + offset_y;
> -		y = 0;
> -	} else {
> -		y_offset = offset_y;
> -		y = plane_state->crtc_y;
> -	}
> -
> -	ast_set_cursor_location(ast, x, y, x_offset, y_offset);
> -
> -	/* Dummy write to enable HWC and make the HW pick-up the changes. */
> -	ast_set_cursor_enabled(ast, true);
> -}
> -
> -static void ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
> -						   struct drm_atomic_state *state)
> -{
> -	struct ast_device *ast = to_ast_device(plane->dev);
> -
> -	ast_set_cursor_enabled(ast, false);
> -}
> -
> -static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
> -	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> -	.atomic_check = ast_cursor_plane_helper_atomic_check,
> -	.atomic_update = ast_cursor_plane_helper_atomic_update,
> -	.atomic_disable = ast_cursor_plane_helper_atomic_disable,
> -};
> -
> -static const struct drm_plane_funcs ast_cursor_plane_funcs = {
> -	.update_plane = drm_atomic_helper_update_plane,
> -	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = drm_plane_cleanup,
> -	DRM_GEM_SHADOW_PLANE_FUNCS,
> -};
> -
> -static int ast_cursor_plane_init(struct ast_device *ast)
> -{
> -	struct drm_device *dev = &ast->base;
> -	struct ast_cursor_plane *ast_cursor_plane = &ast->cursor_plane;
> -	struct ast_plane *ast_plane = &ast_cursor_plane->base;
> -	struct drm_plane *cursor_plane = &ast_plane->base;
> -	size_t size;
> -	void __iomem *vaddr;
> -	u64 offset;
> -	int ret;
> -
> -	/*
> -	 * Allocate backing storage for cursors. The BOs are permanently
> -	 * pinned to the top end of the VRAM.
> -	 */
> -
> -	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
> -
> -	if (ast->vram_fb_available < size)
> -		return -ENOMEM;
> -
> -	vaddr = ast->vram + ast->vram_fb_available - size;
> -	offset = ast->vram_fb_available - size;
> -
> -	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
> -			     0x01, &ast_cursor_plane_funcs,
> -			     ast_cursor_plane_formats, ARRAY_SIZE(ast_cursor_plane_formats),
> -			     NULL, DRM_PLANE_TYPE_CURSOR);
> -	if (ret) {
> -		drm_err(dev, "ast_plane_init() failed: %d\n", ret);
> -		return ret;
> -	}
> -	drm_plane_helper_add(cursor_plane, &ast_cursor_plane_helper_funcs);
> -	drm_plane_enable_fb_damage_clips(cursor_plane);
> -
> -	ast->vram_fb_available -= size;
> -
> -	return 0;
> -}
> -
>   /*
>    * CRTC
>    */

