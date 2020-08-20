Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D7224C48A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 19:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F30C6E98D;
	Thu, 20 Aug 2020 17:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2091A6E98D;
 Thu, 20 Aug 2020 17:29:33 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 40DC62001E;
 Thu, 20 Aug 2020 19:29:30 +0200 (CEST)
Date: Thu, 20 Aug 2020 19:29:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v6] drm/kmb: Add support for KeemBay Display
Message-ID: <20200820172928.GC194134@ravnborg.org>
References: <1597096418-28937-1-git-send-email-anitha.chrisanthus@intel.com>
 <1597096418-28937-2-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597096418-28937-2-git-send-email-anitha.chrisanthus@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=cz9QPSLc_2ERrwG0xJgA:9 a=1qB7dQoxvKhqk_Vz:21
 a=m1QiOsuidX_Vl2ZZ:21 a=wPNLvfGTeEIA:10
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha.

On Mon, Aug 10, 2020 at 02:53:38PM -0700, Anitha Chrisanthus wrote:
> This is a basic KMS atomic modesetting display driver for KeemBay family =
of
> SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bridge
> driver at the connector level.
> =

> Single CRTC with LCD controller->mipi DSI-> ADV bridge
> =

> Only 1080p resolution and single plane is supported at this time.
> =

> v2: moved extern to .h, removed license text
>     use drm_dev_init, upclassed dev_private, removed HAVE_IRQ.
> =

> v3: Squashed all 59 commits to one
> =

> v4: review changes from Sam Ravnborg
> 	renamed dev_p to kmb
> 	moved clocks under kmb_clock, consolidated clk initializations
> 	use drmm functions
> 	use DRM_GEM_CMA_DRIVER_OPS_VMAP
> =

> v5: corrected spellings
> v6: corrected checkpatch warnings

I have asked a few persons to review, but they lack time at the moment.
So I will continue this monolouge of review feedback.

I had hoped to provide all feedback in a few itearations, but I continue
to find more stuff.

First part of this round is some feedback on plane stuff

	Sam


> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_pl=
ane.c
> new file mode 100644
> index 0000000..31bcba0
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -0,0 +1,519 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright =A9 2018-2020 Intel Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_data/simplefb.h>
Not used I think.

> +#include <video/videomode.h>
Not used I hope.

> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_managed.h>
> +
> +#include "kmb_crtc.h"
> +#include "kmb_drv.h"
> +#include "kmb_plane.h"
> +#include "kmb_regs.h"
> +
> +struct layer_status plane_status[KMB_MAX_PLANES];
Embed plane_status in struct kmb_plane so you avoid an extra statically
allocated variable here. And it is then together with other relevant
data.

> +const u32 layer_irqs[] =3D {
> +	LCD_INT_VL0,
> +	LCD_INT_VL1,
> +	LCD_INT_GL0,
> +	LCD_INT_GL1
> +};
> +
> +static unsigned int check_pixel_format(struct drm_plane *plane, u32 form=
at)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < plane->format_count; i++) {
> +		if (plane->format_types[i] =3D=3D format)
> +			return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int kmb_plane_atomic_check(struct drm_plane *plane,
> +				  struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb;
> +	int ret;
> +
> +	fb =3D state->fb;
> +	if (!fb || !state->crtc)
> +		return 0;
> +
Should drm_atomic_helper_check_plane_state() be called here?

> +	ret =3D check_pixel_format(plane, fb->format->format);
> +	if (ret)
> +		return ret;
> +
> +	if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h > KMB_MAX_HEIGHT)
> +		return -EINVAL;
> +	if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h < KMB_MIN_HEIGHT)
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +static void kmb_plane_atomic_disable(struct drm_plane *plane,
> +				     struct drm_plane_state *state)
> +{
> +	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> +	int plane_id =3D kmb_plane->id;
> +
> +	switch (plane_id) {
> +	case LAYER_0:
> +		plane_status[plane_id].ctrl =3D LCD_CTRL_VL1_ENABLE;
> +		break;
> +	case LAYER_1:
> +		plane_status[plane_id].ctrl =3D LCD_CTRL_VL2_ENABLE;
> +		break;
> +	case LAYER_2:
> +		plane_status[plane_id].ctrl =3D LCD_CTRL_GL1_ENABLE;
> +		break;
> +	case LAYER_3:
> +		plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
> +		break;
> +	}
> +
> +	plane_status[plane_id].disable =3D true;
> +}
> +
> +unsigned int set_pixel_format(u32 format)
> +{
> +	unsigned int val =3D 0;
> +
> +	switch (format) {
> +		/* planar formats */
> +	case DRM_FORMAT_YUV444:
> +		val =3D LCD_LAYER_FORMAT_YCBCR444PLAN | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_YVU444:
> +		val =3D LCD_LAYER_FORMAT_YCBCR444PLAN | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +	case DRM_FORMAT_YUV422:
> +		val =3D LCD_LAYER_FORMAT_YCBCR422PLAN | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_YVU422:
> +		val =3D LCD_LAYER_FORMAT_YCBCR422PLAN | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +	case DRM_FORMAT_YUV420:
> +		val =3D LCD_LAYER_FORMAT_YCBCR420PLAN | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_YVU420:
> +		val =3D LCD_LAYER_FORMAT_YCBCR420PLAN | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +	case DRM_FORMAT_NV12:
> +		val =3D LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_NV21:
> +		val =3D LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +		/* packed formats */
> +		/* looks hw requires B & G to be swapped when RGB */
> +	case DRM_FORMAT_RGB332:
> +		val =3D LCD_LAYER_FORMAT_RGB332 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_XBGR4444:
> +		val =3D LCD_LAYER_FORMAT_RGBX4444;
> +		break;
> +	case DRM_FORMAT_ARGB4444:
> +		val =3D LCD_LAYER_FORMAT_RGBA4444 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_ABGR4444:
> +		val =3D LCD_LAYER_FORMAT_RGBA4444;
> +		break;
> +	case DRM_FORMAT_XRGB1555:
> +		val =3D LCD_LAYER_FORMAT_XRGB1555 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_XBGR1555:
> +		val =3D LCD_LAYER_FORMAT_XRGB1555;
> +		break;
> +	case DRM_FORMAT_ARGB1555:
> +		val =3D LCD_LAYER_FORMAT_RGBA1555 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_ABGR1555:
> +		val =3D LCD_LAYER_FORMAT_RGBA1555;
> +		break;
> +	case DRM_FORMAT_RGB565:
> +		val =3D LCD_LAYER_FORMAT_RGB565 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_BGR565:
> +		val =3D LCD_LAYER_FORMAT_RGB565;
> +		break;
> +	case DRM_FORMAT_RGB888:
> +		val =3D LCD_LAYER_FORMAT_RGB888 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_BGR888:
> +		val =3D LCD_LAYER_FORMAT_RGB888;
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		val =3D LCD_LAYER_FORMAT_RGBX8888 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_XBGR8888:
> +		val =3D LCD_LAYER_FORMAT_RGBX8888;
> +		break;
> +	case DRM_FORMAT_ARGB8888:
> +		val =3D LCD_LAYER_FORMAT_RGBA8888 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_ABGR8888:
> +		val =3D LCD_LAYER_FORMAT_RGBA8888;
> +		break;
> +	}
> +	DRM_INFO_ONCE("%s : %d format=3D0x%x val=3D0x%x\n",
> +		      __func__, __LINE__, format, val);
> +	return val;
> +}
> +
> +unsigned int set_bits_per_pixel(const struct drm_format_info *format)
This is not a set function - nothing is set.
Maybe just rename it to get_*

> +{
> +	u32 bpp =3D 0;
> +	unsigned int val =3D 0;
> +
> +	if (format->num_planes > 1) {
> +		val =3D LCD_LAYER_8BPP;
> +		return val;
> +	}
> +
> +	bpp +=3D 8 * format->cpp[0];
> +
> +	switch (bpp) {
> +	case 8:
> +		val =3D LCD_LAYER_8BPP;
> +		break;
> +	case 16:
> +		val =3D LCD_LAYER_16BPP;
> +		break;
> +	case 24:
> +		val =3D LCD_LAYER_24BPP;
> +		break;
> +	case 32:
> +		val =3D LCD_LAYER_32BPP;
> +		break;
> +	}
> +
> +	DRM_DEBUG("bpp=3D%d val=3D0x%x\n", bpp, val);
> +	return val;
> +}
> +
> +static void config_csc(struct kmb_drm_private *kmb, int plane_id)
> +{
> +	/* YUV to RGB conversion using the fixed matrix csc_coef_lcd */
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF11(plane_id), csc_coef_lcd[0]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF12(plane_id), csc_coef_lcd[1]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF13(plane_id), csc_coef_lcd[2]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF21(plane_id), csc_coef_lcd[3]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF22(plane_id), csc_coef_lcd[4]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF23(plane_id), csc_coef_lcd[5]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF31(plane_id), csc_coef_lcd[6]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF32(plane_id), csc_coef_lcd[7]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF33(plane_id), csc_coef_lcd[8]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF1(plane_id), csc_coef_lcd[9]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF2(plane_id), csc_coef_lcd[10]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF3(plane_id), csc_coef_lcd[11]);
> +}
> +
> +static void kmb_plane_atomic_update(struct drm_plane *plane,
> +				    struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb;
> +	struct kmb_drm_private *kmb;
> +	unsigned int width;
> +	unsigned int height;
> +	unsigned int dma_len;
> +	struct kmb_plane *kmb_plane;
> +	unsigned int dma_cfg;
> +	unsigned int ctrl =3D 0, val =3D 0, out_format =3D 0;
> +	unsigned int src_w, src_h, crtc_x, crtc_y;
> +	unsigned char plane_id;
> +	int num_planes;
> +	static dma_addr_t addr[MAX_SUB_PLANES] =3D { 0, 0, 0 };
I *think* some compilers will choke on this. And the assignment seems
not to be needed, they are all assigned before use as far as I could
tell.

> +
> +	if (!plane || !plane->state || !state)
> +		return;
> +
> +	fb =3D plane->state->fb;
> +	if (!fb)
> +		return;
> +	num_planes =3D fb->format->num_planes;
> +	kmb_plane =3D to_kmb_plane(plane);
> +	plane_id =3D kmb_plane->id;
> +
> +	kmb =3D to_kmb(plane->dev);
> +
> +	if (kmb_under_flow || kmb_flush_done) {
> +		drm_dbg(&kmb->drm, "plane_update:underflow!!!! returning");
> +		return;
> +	}
> +
> +	src_w =3D (plane->state->src_w >> 16);
> +	src_h =3D plane->state->src_h >> 16;
> +	crtc_x =3D plane->state->crtc_x;
> +	crtc_y =3D plane->state->crtc_y;
> +
> +	drm_dbg(&kmb->drm,
> +		"src_w=3D%d src_h=3D%d, fb->format->format=3D0x%x fb->flags=3D0x%x\n",
> +		  src_w, src_h, fb->format->format, fb->flags);
> +
> +	width =3D fb->width;
> +	height =3D fb->height;
> +	dma_len =3D (width * height * fb->format->cpp[0]);
> +	drm_dbg(&kmb->drm, "dma_len=3D%d ", dma_len);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN_SHADOW(plane_id), dma_len);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
> +		      fb->pitches[0]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
> +		      (width * fb->format->cpp[0]));
> +
> +	addr[Y_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane->state, 0);
> +	kmb->fb_addr =3D addr[Y_PLANE];
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
> +		      addr[Y_PLANE] + fb->offsets[0]);
> +	val =3D set_pixel_format(fb->format->format);
> +	val |=3D set_bits_per_pixel(fb->format);
> +	/* Program Cb/Cr for planar formats */
> +	if (num_planes > 1) {
> +		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> +			      width * fb->format->cpp[0]);
> +		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
> +			      (width * fb->format->cpp[0]));
> +
> +		addr[U_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane->state,
> +							U_PLANE);
> +		/* check if Cb/Cr is swapped*/
> +		if (num_planes =3D=3D 3 && (val & LCD_LAYER_CRCB_ORDER))
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> +					addr[U_PLANE]);
> +		else
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> +					addr[U_PLANE]);
> +
> +		if (num_planes =3D=3D 3) {
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
> +				      ((width) * fb->format->cpp[0]));
> +
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
> +				      ((width) * fb->format->cpp[0]));
> +
> +			addr[V_PLANE] =3D drm_fb_cma_get_gem_addr(fb,
> +								plane->state,
> +								V_PLANE);
> +
> +			/* check if Cb/Cr is swapped*/
> +			if (val & LCD_LAYER_CRCB_ORDER)
> +				kmb_write_lcd(kmb,
> +					      LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> +					      addr[V_PLANE]);
> +			else
> +				kmb_write_lcd(kmb,
> +					      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> +					      addr[V_PLANE]);
> +		}
> +	}
> +
> +	kmb_write_lcd(kmb, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
> +	kmb_write_lcd(kmb, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
> +	kmb_write_lcd(kmb, LCD_LAYERn_COL_START(plane_id), crtc_x);
> +	kmb_write_lcd(kmb, LCD_LAYERn_ROW_START(plane_id), crtc_y);
> +
> +	val |=3D LCD_LAYER_FIFO_100;
> +
> +	if (val & LCD_LAYER_PLANAR_STORAGE) {
> +		val |=3D LCD_LAYER_CSC_EN;
> +
> +		/* Enable CSC if input is planar and output is RGB */
> +		config_csc(kmb, plane_id);
> +	}
> +
> +	kmb_write_lcd(kmb, LCD_LAYERn_CFG(plane_id), val);
> +
> +	switch (plane_id) {
> +	case LAYER_0:
> +		ctrl =3D LCD_CTRL_VL1_ENABLE;
> +		break;
> +	case LAYER_1:
> +		ctrl =3D LCD_CTRL_VL2_ENABLE;
> +		break;
> +	case LAYER_2:
> +		ctrl =3D LCD_CTRL_GL1_ENABLE;
> +		break;
> +	case LAYER_3:
> +		ctrl =3D LCD_CTRL_GL2_ENABLE;
> +		break;
> +	}
> +
> +	ctrl |=3D LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
> +	    | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
> +
> +	/* LCD is connected to MIPI on kmb
> +	 * Therefore this bit is required for DSI Tx
> +	 */
> +	ctrl |=3D LCD_CTRL_VHSYNC_IDLE_LVL;
> +
> +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
> +
> +	/* FIXME no doc on how to set output format,these values are
> +	 * taken from the Myriadx tests
> +	 */
> +	out_format |=3D LCD_OUTF_FORMAT_RGB888;
> +
> +	/* Leave RGB order,conversion mode and clip mode to default */
> +	/* do not interleave RGB channels for mipi Tx compatibility */
> +	out_format |=3D LCD_OUTF_MIPI_RGB_MODE;
> +	kmb_write_lcd(kmb, LCD_OUT_FORMAT_CFG, out_format);
> +
> +	dma_cfg =3D LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN |
> +	    LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_16;
> +
> +	/* Enable DMA */
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
> +	drm_dbg(&kmb->drm, "dma_cfg=3D0x%x LCD_DMA_CFG=3D0x%x\n", dma_cfg,
> +		kmb_read_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id)));
> +
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF |
> +			LCD_INT_DMA_ERR);
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, LCD_INT_EOF |
> +			LCD_INT_DMA_ERR);
> +}
> +
> +static const struct drm_plane_helper_funcs kmb_plane_helper_funcs =3D {
> +	.atomic_check =3D kmb_plane_atomic_check,
> +	.atomic_update =3D kmb_plane_atomic_update,
> +	.atomic_disable =3D kmb_plane_atomic_disable
> +};
> +
> +void kmb_plane_destroy(struct drm_plane *plane)
> +{
> +	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> +
> +	drm_plane_cleanup(plane);
> +	kfree(kmb_plane);
> +}
> +
> +static void kmb_destroy_plane_state(struct drm_plane *plane,
> +				    struct drm_plane_state *state)
> +{
> +	struct kmb_plane_state *kmb_state =3D to_kmb_plane_state(state);
> +
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(kmb_state);
> +}
> +
> +struct drm_plane_state *kmb_plane_duplicate_state(struct drm_plane *plan=
e)
> +{
Use __drm_atomic_helper_plane_duplicate_state() - which requires a few
updates.
See other users.

> +	struct drm_plane_state *state;
> +	struct kmb_plane_state *kmb_state;
> +
> +	kmb_state =3D kmemdup(plane->state, sizeof(*kmb_state), GFP_KERNEL);
> +	if (!kmb_state)
> +		return NULL;
> +
> +	state =3D &kmb_state->base_plane_state;
> +	__drm_atomic_helper_plane_duplicate_state(plane, state);
> +
> +	return state;
> +}
> +
> +static void kmb_plane_reset(struct drm_plane *plane)
> +{
> +	struct kmb_plane_state *kmb_state =3D to_kmb_plane_state(plane->state);
> +
> +	if (kmb_state)
> +		__drm_atomic_helper_plane_destroy_state
> +		    (&kmb_state->base_plane_state);
Join lines - this is not readable.

> +	kfree(kmb_state);
> +
> +	plane->state =3D NULL;
> +	kmb_state =3D kzalloc(sizeof(*kmb_state), GFP_KERNEL);
Use __drm_atomic_helper_plane_reset()
> +	if (kmb_state) {
> +		kmb_state->base_plane_state.plane =3D plane;
> +		kmb_state->base_plane_state.rotation =3D DRM_MODE_ROTATE_0;
> +		plane->state =3D &kmb_state->base_plane_state;
> +		kmb_state->no_planes =3D KMB_MAX_PLANES;
> +	}
> +}
> +
> +static const struct drm_plane_funcs kmb_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane =3D drm_atomic_helper_disable_plane,
> +	.destroy =3D kmb_plane_destroy,
> +	.reset =3D kmb_plane_reset,
> +	.atomic_duplicate_state =3D kmb_plane_duplicate_state,
> +	.atomic_destroy_state =3D kmb_destroy_plane_state,
> +};
> +
> +struct kmb_plane *kmb_plane_init(struct drm_device *drm)
> +{
> +	struct kmb_drm_private *lcd =3D to_kmb(drm);
Name it kmb? s/lcd/kmb/

> +	struct kmb_plane *plane =3D NULL;
> +	struct kmb_plane *primary =3D NULL;
> +	int i =3D 0;
> +	int ret =3D 0;
> +	enum drm_plane_type plane_type;
> +	const u32 *plane_formats;
> +	int num_plane_formats;
> +
> +	for (i =3D 0; i < lcd->n_layers; i++) {
> +		plane =3D drmm_kzalloc(drm, sizeof(*plane), GFP_KERNEL);
> +
> +		if (!plane) {
> +			drm_err(drm, "Failed to allocate plane\n");
> +			return ERR_PTR(-ENOMEM);
> +		}
> +
> +		plane_type =3D (i =3D=3D 0) ? DRM_PLANE_TYPE_PRIMARY :
> +		    DRM_PLANE_TYPE_OVERLAY;
> +		if (i < 2) {
> +			plane_formats =3D kmb_formats_v;
> +			num_plane_formats =3D ARRAY_SIZE(kmb_formats_v);
> +		} else {
> +			plane_formats =3D kmb_formats_g;
> +			num_plane_formats =3D ARRAY_SIZE(kmb_formats_g);
> +		}
> +
> +		ret =3D drm_universal_plane_init(drm, &plane->base_plane,
> +					       POSSIBLE_CRTCS, &kmb_plane_funcs,
> +					       plane_formats, num_plane_formats,
> +					       NULL, plane_type, "plane %d", i);
> +		if (ret < 0) {
> +			drm_err(drm, "drm_universal_plane_init failed (ret=3D%d)",
> +				ret);
> +			goto cleanup;
> +		}
> +		drm_dbg(drm, "%s : %d i=3D%d type=3D%d",
> +			__func__, __LINE__,
> +			  i, plane_type);
> +		drm_plane_helper_add(&plane->base_plane,
> +				     &kmb_plane_helper_funcs);
> +		if (plane_type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +			primary =3D plane;
> +			lcd->plane =3D plane;
> +		}
> +		drm_dbg(drm, "%s : %d primary=3D%p\n", __func__, __LINE__,
> +			&primary->base_plane);
> +		plane->id =3D i;
> +	}
> +
> +	return primary;
> +cleanup:
> +	kfree(plane);
> +	return ERR_PTR(ret);
> +}
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_pl=
ane.h
> new file mode 100644
> index 0000000..48f237f
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright =A9 2018-2020 Intel Corporation
> + */
> +
> +#ifndef __KMB_PLANE_H__
> +#define __KMB_PLANE_H__
> +
> +#include "kmb_drv.h"
> +
> +extern int kmb_under_flow;
> +extern int kmb_flush_done;
> +
> +#define LCD_INT_VL0_ERR ((LAYER0_DMA_FIFO_UNDERFLOW) | \
> +			(LAYER0_DMA_FIFO_OVERFLOW) | \
> +			(LAYER0_DMA_CB_FIFO_OVERFLOW) | \
> +			(LAYER0_DMA_CB_FIFO_UNDERFLOW) | \
> +			(LAYER0_DMA_CR_FIFO_OVERFLOW) | \
> +			(LAYER0_DMA_CR_FIFO_UNDERFLOW))
> +
> +#define LCD_INT_VL1_ERR ((LAYER1_DMA_FIFO_UNDERFLOW) | \
> +			(LAYER1_DMA_FIFO_OVERFLOW) | \
> +			(LAYER1_DMA_CB_FIFO_OVERFLOW) | \
> +			(LAYER1_DMA_CB_FIFO_UNDERFLOW) | \
> +			(LAYER1_DMA_CR_FIFO_OVERFLOW) | \
> +			(LAYER1_DMA_CR_FIFO_UNDERFLOW))
> +
> +#define LCD_INT_GL0_ERR (LAYER2_DMA_FIFO_OVERFLOW | LAYER2_DMA_FIFO_UNDE=
RFLOW)
> +#define LCD_INT_GL1_ERR (LAYER3_DMA_FIFO_OVERFLOW | LAYER3_DMA_FIFO_UNDE=
RFLOW)
> +#define LCD_INT_VL0 (LAYER0_DMA_DONE | LAYER0_DMA_IDLE | LCD_INT_VL0_ERR)
> +#define LCD_INT_VL1 (LAYER1_DMA_DONE | LAYER1_DMA_IDLE | LCD_INT_VL1_ERR)
> +#define LCD_INT_GL0 (LAYER2_DMA_DONE | LAYER2_DMA_IDLE | LCD_INT_GL0_ERR)
> +#define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE | LCD_INT_GL1_ERR)
> +#define LCD_INT_DMA_ERR (LCD_INT_VL0_ERR | LCD_INT_VL1_ERR \
> +		| LCD_INT_GL0_ERR | LCD_INT_GL1_ERR)
> +
> +#define POSSIBLE_CRTCS 1

> +#define INITIALIZED 1
Not used I think.
> +#define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
> +
> +#define to_kmb_plane_state(x) \
> +		container_of(x, struct kmb_plane_state, base_plane_state)
> +
> +enum layer_id {
> +	LAYER_0,
> +	LAYER_1,
> +	LAYER_2,
> +	LAYER_3,
> +//	KMB_MAX_PLANES,
> +};
> +
> +#define KMB_MAX_PLANES 1
> +
> +enum sub_plane_id {
> +	Y_PLANE,
> +	U_PLANE,
> +	V_PLANE,
> +	MAX_SUB_PLANES,
> +};
> +
> +struct kmb_plane {
> +	struct drm_plane base_plane;

> +	struct kmb_drm_private kmb_dev;
This is wrong, embedding kmb_drm_private here is not correct.

> +	unsigned char id;
> +};
If possible embedding the planes in kmb_drm_private would be preferable.
This is how other drivers do it with success.

The id part seems pretty unique - but maybe other drivers has the same
but name it different.

> +
> +struct kmb_plane_state {
> +	struct drm_plane_state base_plane_state;
> +	unsigned char no_planes;
no_planes is not used - so the whole kmb_plane_state can be dropped.
And this should kill a few helper functions too.

I know part of this is prepared for multiple planes.
But keep it lean and clean now - maybe addding extra planes later needs
to be done different than what the code tries to prepare for.

> +};
> +
> +/* Graphics layer (layers 2 & 3) formats, only packed formats  are suppo=
rted */
> +static const u32 kmb_formats_g[] =3D {
> +	DRM_FORMAT_RGB332,
> +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> +};
> +
> +#define MAX_FORMAT_G	(ARRAY_SIZE(kmb_formats_g))
> +#define MAX_FORMAT_V	(ARRAY_SIZE(kmb_formats_v))
> +
> +/* Video layer ( 0 & 1) formats, packed and planar formats are supported=
 */
> +static const u32 kmb_formats_v[] =3D {
> +	/* packed formats */
> +	DRM_FORMAT_RGB332,
> +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> +	/*planar formats */
> +	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YUV422, DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YUV444, DRM_FORMAT_YVU444,
> +	DRM_FORMAT_NV12, DRM_FORMAT_NV21,
> +};
> +
> +/* Conversion (yuv->rgb) matrix from myriadx */
> +static const u32 csc_coef_lcd[] =3D {
> +	1024, 0, 1436,
> +	1024, -352, -731,
> +	1024, 1814, 0,
> +	-179, 125, -226
> +};
> +
> +struct layer_status {
> +	bool disable;
> +	u32 ctrl;
> +};
> +
> +extern struct layer_status plane_status[KMB_MAX_PLANES];
> +
> +struct kmb_plane *kmb_plane_init(struct drm_device *drm);
> +void kmb_plane_destroy(struct drm_plane *plane);
> +#endif /* __KMB_PLANE_H__ */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
