Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C94A8890
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 17:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CEA10E53F;
	Thu,  3 Feb 2022 16:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20B4510E4F7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 16:29:43 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:55460.166802100
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 4874910020E;
 Fri,  4 Feb 2022 00:29:39 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 5d9bde9577e844b4a52841e5a51828bb for maxime@cerno.tech; 
 Fri, 04 Feb 2022 00:29:41 CST
X-Transaction-ID: 5d9bde9577e844b4a52841e5a51828bb
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <f5381561-25da-61e3-5025-fa6dd61dd730@189.cn>
Date: Fri, 4 Feb 2022 00:29:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220203085851.yqstkfgt4dz7rcnw@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>> +static enum drm_mode_status
>> +lsdc_crtc_helper_mode_valid(struct drm_crtc *crtc,
>> +			    const struct drm_display_mode *mode)
>> +{
>> +	struct drm_device *ddev = crtc->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	const struct lsdc_chip_desc *desc = ldev->desc;
>> +
>> +	if (mode->hdisplay > desc->max_width)
>> +		return MODE_BAD_HVALUE;
>> +	if (mode->vdisplay > desc->max_height)
>> +		return MODE_BAD_VVALUE;
>> +
>> +	if (mode->clock > desc->max_pixel_clk) {
>> +		drm_dbg_kms(ddev, "mode %dx%d, pixel clock=%d is too high\n",
>> +				mode->hdisplay, mode->vdisplay, mode->clock);
>> +		return MODE_CLOCK_HIGH;
>> +	}
>> +
>> +	/* the crtc hardware dma take 256 bytes once a time
>> +	 * TODO: check RGB565 support
>> +	 */
>> +	if ((mode->hdisplay * 4) % desc->stride_alignment) {
>> +		drm_dbg_kms(ddev, "stride is not %u bytes aligned\n",
>> +				desc->stride_alignment);
>> +		return MODE_BAD;
>> +	}
>> +
>> +	return MODE_OK;
>> +}
> mode_valid will only prevent the mode from being advertised to the
> userspace, but you need atomic_check if you want to prevent those modes
> to be used by anybody.

Yes, I used to change mode with mate-display-properties tools,
what I though is the end user can't see it, they can't set it.
I will add atomic_check() support at next version, thanks.

>> +
>> +static void lsdc_update_pixclk(struct drm_crtc *crtc, unsigned int pixclk, bool verbose)
>> +{
>> +	struct lsdc_display_pipe *dispipe;
>> +	struct lsdc_pll *pixpll;
>> +	const struct lsdc_pixpll_funcs *clkfun;
>> +	struct lsdc_crtc_state *priv_crtc_state;
>> +
>> +	priv_crtc_state = to_lsdc_crtc_state(crtc->state);
>> +
>> +	dispipe = container_of(crtc, struct lsdc_display_pipe, crtc);
>> +	pixpll = &dispipe->pixpll;
>> +	clkfun = pixpll->funcs;
>> +
>> +	/* config the pixel pll */
>> +	clkfun->update(pixpll, &priv_crtc_state->pparams);
>> +
>> +	if (verbose)
>> +		clkfun->print(pixpll, pixclk);
>> +}
>> +
>> +
>> +static void lsdc_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
>> +{
>> +	struct drm_device *ddev = crtc->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>> +	unsigned int hr = mode->hdisplay;
>> +	unsigned int hss = mode->hsync_start;
>> +	unsigned int hse = mode->hsync_end;
>> +	unsigned int hfl = mode->htotal;
>> +	unsigned int vr = mode->vdisplay;
>> +	unsigned int vss = mode->vsync_start;
>> +	unsigned int vse = mode->vsync_end;
>> +	unsigned int vfl = mode->vtotal;
>> +	unsigned int pixclock = mode->clock;
>> +	unsigned int index = drm_crtc_index(crtc);
>> +
>> +
>> +	if (index == 0) {
>> +		/* CRTC 0 */
>> +		u32 hsync, vsync;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_FB_ORIGIN_REG, 0);
>> +
>> +		/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_HDISPLAY_REG,
>> +			(mode->crtc_htotal << 16) | mode->crtc_hdisplay);
>> +
>> +		/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_VDISPLAY_REG,
>> +			(mode->crtc_vtotal << 16) | mode->crtc_vdisplay);
>> +
>> +		/* 26:16 hsync end, 10:0 hsync start */
>> +		hsync = (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start;
>> +
>> +		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> +			hsync |= INV_HSYNC_BIT;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_HSYNC_REG, EN_HSYNC_BIT | hsync);
>> +
>> +		/* 26:16 vsync end, 10:0 vsync start */
>> +		vsync = (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start;
>> +
>> +		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> +			vsync |= INV_VSYNC_BIT;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_VSYNC_REG, EN_VSYNC_BIT | vsync);
>> +
>> +	} else if (index == 1) {
>> +		/* CRTC 1 */
>> +		u32 hsync, vsync;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_FB_ORIGIN_REG, 0);
>> +
>> +		/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_HDISPLAY_REG,
>> +			(mode->crtc_htotal << 16) | mode->crtc_hdisplay);
>> +
>> +		/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_VDISPLAY_REG,
>> +			(mode->crtc_vtotal << 16) | mode->crtc_vdisplay);
>> +
>> +		/* 26:16 hsync end, 10:0 hsync start */
>> +		hsync = (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start;
>> +
>> +		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> +			hsync |= INV_HSYNC_BIT;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_HSYNC_REG, EN_HSYNC_BIT | hsync);
>> +
>> +		/* 26:16 vsync end, 10:0 vsync start */
>> +		vsync = (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start;
>> +
>> +		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> +			vsync |= INV_VSYNC_BIT;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_VSYNC_REG, EN_VSYNC_BIT | vsync);
>> +	}
>> +
>> +	drm_dbg_kms(ddev, "hdisplay=%d, hsync_start=%d, hsync_end=%d, htotal=%d\n",
>> +			hr, hss, hse, hfl);
>> +
>> +	drm_dbg_kms(ddev, "vdisplay=%d, vsync_start=%d, vsync_end=%d, vtotal=%d\n",
>> +			vr, vss, vse, vfl);
>> +
>> +	drm_dbg_kms(ddev, "%s modeset: %ux%u\n", crtc->name, hr, vr);
>> +
>> +	lsdc_update_pixclk(crtc, pixclock, ldev->verbose);
>> +}
>> +
>> +
>> +static void lsdc_enable_display(struct lsdc_device *ldev, unsigned int index)
>> +{
>> +	u32 val;
>> +
>> +	if (index == 0) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
>> +		val |= CFG_OUTPUT_EN_BIT;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
>> +	} else if (index == 1) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
>> +		val |= CFG_OUTPUT_EN_BIT;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
>> +	}
>> +}
>> +
>> +
>> +static void lsdc_disable_display(struct lsdc_device *ldev, unsigned int index)
>> +{
>> +	u32 val;
>> +
>> +	if (index == 0) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
>> +		val &= ~CFG_OUTPUT_EN_BIT;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
>> +	} else if (index == 1) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
>> +		val &= ~CFG_OUTPUT_EN_BIT;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
>> +	}
>> +}
>> +
>> +
>> +static void lsdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					   struct drm_atomic_state *state)
>> +{
>> +	struct drm_device *ddev = crtc->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +
>> +	drm_crtc_vblank_on(crtc);
>> +
>> +	lsdc_enable_display(ldev, drm_crtc_index(crtc));
>> +
>> +	drm_dbg_kms(ddev, "%s: enabled\n", crtc->name);
>> +}
>> +
>> +
>> +static void lsdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					    struct drm_atomic_state *state)
>> +{
>> +	struct drm_device *ddev = crtc->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +
>> +	drm_crtc_vblank_off(crtc);
>> +
>> +	lsdc_disable_display(ldev, drm_crtc_index(crtc));
>> +
>> +	drm_dbg_kms(ddev, "%s: disabled\n", crtc->name);
>> +}
>> +
>> +
>> +static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
>> +				   struct drm_atomic_state *state)
>> +{
>> +	struct drm_pending_vblank_event *event = crtc->state->event;
>> +
>> +	if (event) {
>> +		crtc->state->event = NULL;
>> +
>> +		spin_lock_irq(&crtc->dev->event_lock);
>> +		if (drm_crtc_vblank_get(crtc) == 0)
>> +			drm_crtc_arm_vblank_event(crtc, event);
>> +		else
>> +			drm_crtc_send_vblank_event(crtc, event);
>> +		spin_unlock_irq(&crtc->dev->event_lock);
>> +	}
>> +}
>> +
>> +
>> +static const struct drm_crtc_helper_funcs lsdc_crtc_helper_funcs = {
>> +	.mode_valid = lsdc_crtc_helper_mode_valid,
>> +	.mode_set_nofb = lsdc_crtc_helper_mode_set_nofb,
>> +	.atomic_enable = lsdc_crtc_helper_atomic_enable,
>> +	.atomic_disable = lsdc_crtc_helper_atomic_disable,
>> +	.atomic_flush = lsdc_crtc_atomic_flush,
>> +};
>> +
>> +
>> +
>> +/**
>> + * lsdc_crtc_init
>> + *
>> + * @ddev: point to the drm_device structure
>> + * @index: hardware crtc index
>> + *
>> + * Init CRTC
>> + */
>> +int lsdc_crtc_init(struct drm_device *ddev,
>> +		   struct drm_crtc *crtc,
>> +		   unsigned int index,
>> +		   struct drm_plane *primary,
>> +		   struct drm_plane *cursor)
>> +{
>> +	int ret;
>> +
>> +	drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
>> +
>> +	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
>> +	if (ret)
>> +		drm_warn(ddev, "set the gamma table size failed\n");
>> +
>> +	return drm_crtc_init_with_planes(ddev,
>> +					 crtc,
>> +					 primary,
>> +					 cursor,
>> +					 &lsdc_crtc_funcs,
>> +					 "crtc%d",
>> +					 index);
>> +}
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.c b/drivers/gpu/drm/lsdc/lsdc_drv.c
>> new file mode 100644
>> index 000000000000..aac8901c3431
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.c
>> @@ -0,0 +1,846 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng <suijingfeng@loongson.cn>
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/string.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/of_reserved_mem.h>
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_aperture.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_plane.h>
>> +#include <drm/drm_vblank.h>
>> +#include <drm/drm_debugfs.h>
>> +#include <drm/drm_fb_helper.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_fb_cma_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_damage_helper.h>
>> +#include <drm/drm_probe_helper.h>
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_irq.h"
>> +#include "lsdc_regs.h"
>> +#include "lsdc_connector.h"
>> +#include "lsdc_pll.h"
>> +
>> +
>> +#define DRIVER_AUTHOR		"Sui Jingfeng <suijingfeng@loongson.cn>"
>> +#define DRIVER_NAME		"lsdc"
>> +#define DRIVER_DESC		"drm driver for loongson's display controller"
>> +#define DRIVER_DATE		"20200701"
>> +#define DRIVER_MAJOR		1
>> +#define DRIVER_MINOR		0
>> +#define DRIVER_PATCHLEVEL	0
>> +
>> +static int lsdc_modeset = 1;
>> +MODULE_PARM_DESC(modeset, "Enable/disable CMA-based KMS(1 = enabled(default), 0 = disabled)");
>> +module_param_named(modeset, lsdc_modeset, int, 0644);
>> +
>> +static int lsdc_cached_coherent = 1;
>> +MODULE_PARM_DESC(cached_coherent, "uss cached coherent mapping(1 = enabled(default), 0 = disabled)");
>> +module_param_named(cached_coherent, lsdc_cached_coherent, int, 0644);
>> +
>> +static int lsdc_dirty_update = -1;
>> +MODULE_PARM_DESC(dirty_update, "enable dirty update(1 = enabled, 0 = disabled(default))");
>> +module_param_named(dirty_update, lsdc_dirty_update, int, 0644);
>> +
>> +static int lsdc_use_vram_helper = -1;
>> +MODULE_PARM_DESC(use_vram_helper, "use vram helper based solution(1 = enabled, 0 = disabled(default))");
>> +module_param_named(use_vram_helper, lsdc_use_vram_helper, int, 0644);
>> +
>> +static int lsdc_verbose = -1;
>> +MODULE_PARM_DESC(verbose, "Enable/disable print some key information");
>> +module_param_named(verbose, lsdc_verbose, int, 0644);
> It's not really clear to me why you need any of those parameters. Why
> would a user want to use a non coherent mapping for example?
>
Because we are Mips architecture. Paul Cercueil already explained it
in his mmap GEM buffers cachedpatch  <https://lkml.kernel.org/lkml/20200822164233.71583-1-paul@crapouillou.net/T/>. I drag part of it to here for
convenient to reading:

/Traditionally, GEM buffers are mapped write-combine. Writes to the 
buffer are accelerated, and reads are slow. Application doing lots////of alpha-blending paint inside shadow buffers, which is then memcpy'd////into the final GEM buffer.///
"non coherent mapping" is actually cached and it is for CMA helpers
base driver, not for VRAM helper based driver. For Loongson CPU/SoCs.
The cache coherency is maintained by hardware, therefore there no
need to worry about coherency problems. This is true at least for
ls3a3000, ls3a4000 and ls3a5000.

"non coherent" or "coherent" is not important here, the key point is
that the backing memory of the framebuffer is cached with non coherent
mapping, you don't need a shadow buffer layer when using X server's
modesetting driver.

Read and write to the framebuffer in system memory is much faster than
read and write to the framebuffer in the VRAM.

Why CMA helper based solution is faster than the VRAM based solution on Mips platform?

Partly because of the CPU have L1, L2 and L3 cache, especially L3 cache
is as large as 8MB, read and write from the cache is fast.

Another reason is as Paul Cercueil said, read from VRAM with write-combine
cache mode is slow. it is just uncache read.
Please note that we don't have a GPU here, we are just a display controller.

For the VRAM helper based driver case, the backing memory of the framebuffer
is located at VRAM, When using X server's modesetting driver, we have to enable
the ShadowFB option, Uncache acceleration support(at the kernel size) should
also be enabled. Otherwise the performance of graphic application is just slow.

Beside write-combine cache mode have bugs on our platform, a kernel side
developer have disabled it. Write-combine cache mode just boil down to uncached
now. See [1] and [2]

[1]https://lkml.org/lkml/2020/8/10/255
[2]https://lkml.kernel.org/lkml/1617701112-14007-1-git-send-email-yangtiezhu@loongson.cn/T/


This is the reason why we prefer CMA helper base solution with non coherent mapping,
simply because it is fast.

As far as I know, Loongson's CPU does not has the concept of write-combine,
it only support three caching mode:  uncached, cached and uncache acceleration.
write-combine is implemented with uncache acceleration on Mips.


