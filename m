Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02CA249C63
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E006E291;
	Wed, 19 Aug 2020 11:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344676E22E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB89122DD6;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837583;
 bh=7rndZmELoUFEasl/FZcjYjupJlPzF+cMjmnp/jWiekk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VokgNnt06753ao89VkE5Ev7gGAoz9DZFs1rgWgdf3mcvlvidTuzMARk7LdR2SDIDK
 BhFweTsSmBRj+NEzhBdA5cODqxbpeVdn3//ohihljxkF2znbcELJL0k8cAEYvfl0J3
 nqCdmBtVItWI5NrZzOxKoVuAkv9sqB64Sv33CwmE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00EubN-Jw; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 33/49] staging: hikey9xx/gpu: re-work the mode validation code
Date: Wed, 19 Aug 2020 13:46:01 +0200
Message-Id: <4614415770b33e27a9f15c7dde20895fb750592f.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Wanchun Zheng <zhengwanchun@hisilicon.com>,
 linuxarm@huawei.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do some cleanups at the mode validation code. Right now, there
is a known issue with this driver which makes it to set up
some invalid modes, depending on the display.

We don't know yet what the issue is, so, instead, let's add
a table with the modes which are known to work.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/kirin9xx_drm_dss.c   | 274 +++++++++++-------
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        |  34 +++
 2 files changed, 211 insertions(+), 97 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index 26212c130b79..0844bf372ca8 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -103,8 +103,9 @@ u32 dss_get_format(u32 pixel_format)
 }
 
 /*******************************************************************************
-**
-*/
+ **
+ */
+
 int hdmi_ceil(uint64_t a, uint64_t b)
 {
 	if (b == 0)
@@ -117,99 +118,108 @@ int hdmi_ceil(uint64_t a, uint64_t b)
 	}
 }
 
-int hdmi_pxl_ppll7_init(struct dss_hw_ctx *ctx, uint64_t pixel_clock)
+int hdmi_pxl_ppll7_init(struct dss_hw_ctx *ctx, u64 pixel_clock)
 {
-	uint64_t refdiv, fbdiv, frac, postdiv1, postdiv2;
-	uint64_t vco_min_freq_output = KIRIN970_VCO_MIN_FREQ_OUPUT;
-	uint64_t sys_clock_fref = KIRIN970_SYS_19M2;
-	uint64_t ppll7_freq_divider;
-	uint64_t vco_freq_output;
-	uint64_t frac_range = 0x1000000;/*2^24*/
-	uint64_t pixel_clock_ori;
-	uint64_t pixel_clock_cur;
-	uint32_t ppll7ctrl0;
-	uint32_t ppll7ctrl1;
-	uint32_t ppll7ctrl0_val;
-	uint32_t ppll7ctrl1_val;
-	int i, ret;
+	u64 vco_min_freq_output = KIRIN970_VCO_MIN_FREQ_OUPUT;
+	u64 refdiv, fbdiv, frac, postdiv1 = 0, postdiv2 = 0;
+	u64 dss_pxl0_clk = 7 * 144000000UL;
+	u64 sys_clock_fref = KIRIN970_SYS_19M2;
+	u64 ppll7_freq_divider;
+	u64 vco_freq_output;
+	u64 frac_range = 0x1000000;/*2^24*/
+	u64 pixel_clock_ori;
+	u64 pixel_clock_cur;
+	u32 ppll7ctrl0;
+	u32 ppll7ctrl1;
+	u32 ppll7ctrl0_val;
+	u32 ppll7ctrl1_val;
 	int ceil_temp;
-	int freq_divider_list[22] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
-			12, 14, 15, 16, 20, 21, 24,
-			25, 30, 36, 42, 49};
-
-	int postdiv1_list[22] = {1, 2, 3, 4, 5, 6, 7, 4, 3, 5,
-		   4, 7, 5, 4, 5, 7, 6, 5, 6, 6,
-			7, 7};
-
-	int postdiv2_list[22] = {1, 1, 1, 1, 1, 1, 1, 2, 3, 2,
+	int i, ret;
+	const int freq_divider_list[22] = {
+		1,  2,  3,  4,  5,  6,  7,  8,
+		9, 10, 12, 14, 15, 16, 20, 21,
+		24, 25, 30, 36, 42, 49
+	};
+	const int postdiv1_list[22] = {
+		1, 2, 3, 4, 5, 6, 7, 4, 3, 5,
+		4, 7, 5, 4, 5, 7, 6, 5, 6, 6,
+		7, 7
+	};
+	const int postdiv2_list[22] = {
+		1, 1, 1, 1, 1, 1, 1, 2, 3, 2,
 		3, 2, 3, 4, 4, 3, 4, 5, 5, 6,
-			6, 7};
-	ret = 0;
-	postdiv1 = 0;
-	postdiv2 = 0;
-	if (pixel_clock == 0)
-		return -EINVAL;
+		6, 7
+	};
 
-	if (ctx == NULL) {
-		DRM_ERROR("NULL Pointer\n");
+	if (!pixel_clock) {
+		DRM_ERROR("Pixel clock can't be zero!\n");
 		return -EINVAL;
 	}
 
 	pixel_clock_ori = pixel_clock;
+	pixel_clock_cur = pixel_clock_ori;
 
-	if (pixel_clock_ori <= 255000000)
-		pixel_clock_cur = pixel_clock * 7;
-	else if (pixel_clock_ori <= 415000000)
-		pixel_clock_cur = pixel_clock * 5;
-	else if (pixel_clock_ori <= 594000000)
-		pixel_clock_cur = pixel_clock * 3;
-	else {
-		DRM_ERROR("Clock don't support!!\n");
+	if (pixel_clock_ori <= 255000000) {
+		pixel_clock_cur *= 7;
+		dss_pxl0_clk /= 7;
+	} else if (pixel_clock_ori <= 415000000) {
+		pixel_clock_cur *= 5;
+		dss_pxl0_clk /= 5;
+	} else if (pixel_clock_ori <= 594000000) {
+		pixel_clock_cur *= 3;
+		dss_pxl0_clk /= 3;
+	} else {
+		DRM_ERROR("Clock not supported!\n");
 		return -EINVAL;
 	}
 
 	pixel_clock_cur = pixel_clock_cur / 1000;
 	ceil_temp = hdmi_ceil(vco_min_freq_output, pixel_clock_cur);
 
-	if (ceil_temp < 0)
+	if (ceil_temp < 0) {
+		DRM_ERROR("pixel_clock_cur can't be zero!\n");
 		return -EINVAL;
+	}
 
-	ppll7_freq_divider = (uint64_t)ceil_temp;
+	ppll7_freq_divider = (u64)ceil_temp;
 
-	for (i = 0; i < 22; i++) {
+	for (i = 0; i < ARRAY_SIZE(freq_divider_list); i++) {
 		if (freq_divider_list[i] >= ppll7_freq_divider) {
 			ppll7_freq_divider = freq_divider_list[i];
 			postdiv1 = postdiv1_list[i];
 			postdiv2 = postdiv2_list[i];
-			DRM_INFO("postdiv1=0x%llx, POSTDIV2=0x%llx\n", postdiv1, postdiv2);
 			break;
 		}
 	}
 
+	if (i == ARRAY_SIZE(freq_divider_list)) {
+		DRM_ERROR("Can't find a valid setting for PLL7!\n");
+		return -EINVAL;
+	}
+
 	vco_freq_output = ppll7_freq_divider * pixel_clock_cur;
-	if (vco_freq_output == 0)
+	if (!vco_freq_output) {
+		DRM_ERROR("Can't find a valid setting for VCO_FREQ!\n");
 		return -EINVAL;
+	}
 
 	ceil_temp = hdmi_ceil(400000, vco_freq_output);
-
-	if (ceil_temp < 0)
+	if (ceil_temp < 0) {
+		DRM_ERROR("Can't find a valid setting for PLL7!\n");
 		return -EINVAL;
+	}
 
 	refdiv = ((vco_freq_output * ceil_temp) >= 494000) ? 1 : 2;
-	DRM_DEBUG("refdiv=0x%llx\n", refdiv);
-
 	fbdiv = (vco_freq_output * ceil_temp) * refdiv / sys_clock_fref;
-	DRM_DEBUG("fbdiv=0x%llx\n", fbdiv);
 
-	frac = (uint64_t)(ceil_temp * vco_freq_output - sys_clock_fref / refdiv * fbdiv) * refdiv * frac_range;
-	frac = (uint64_t)frac / sys_clock_fref;
-	DRM_DEBUG("frac=0x%llx\n", frac);
+	frac = (u64)(ceil_temp * vco_freq_output - sys_clock_fref / refdiv * fbdiv) * refdiv * frac_range;
+	frac = (u64)frac / sys_clock_fref;
 
 	ppll7ctrl0 = inp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL0);
 	ppll7ctrl0 &= ~MIDIA_PPLL7_FREQ_DEVIDER_MASK;
 
 	ppll7ctrl0_val = 0x0;
-	ppll7ctrl0_val |= (uint32_t)(postdiv2 << 23 | postdiv1 << 20 | fbdiv << 8 | refdiv << 2);
+	ppll7ctrl0_val |= (u32)(postdiv2 << 23 | postdiv1 << 20 | fbdiv << 8 | refdiv << 2);
 	ppll7ctrl0_val &= MIDIA_PPLL7_FREQ_DEVIDER_MASK;
 	ppll7ctrl0 |= ppll7ctrl0_val;
 
@@ -219,47 +229,30 @@ int hdmi_pxl_ppll7_init(struct dss_hw_ctx *ctx, uint64_t pixel_clock)
 	ppll7ctrl1 &= ~MIDIA_PPLL7_FRAC_MODE_MASK;
 
 	ppll7ctrl1_val = 0x0;
-	ppll7ctrl1_val |= (uint32_t)(1 << 25 | 0 << 24 | frac);
+	ppll7ctrl1_val |= (u32)(1 << 25 | 0 << 24 | frac);
 	ppll7ctrl1_val &= MIDIA_PPLL7_FRAC_MODE_MASK;
 	ppll7ctrl1 |= ppll7ctrl1_val;
 
 	outp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL1, ppll7ctrl1);
 
-#if 1
-	ret = clk_set_rate(ctx->dss_pxl0_clk, 144000000UL);
-#else
-	/*comfirm ldi1 switch ppll7*/
-	if (pixel_clock_ori <= 255000000)
-		ret = clk_set_rate(ctx->dss_pxl0_clk, DEFAULT_MIDIA_PPLL7_CLOCK_FREQ/7);
-	else if (pixel_clock_ori <= 415000000)
-		ret = clk_set_rate(ctx->dss_pxl0_clk, DEFAULT_MIDIA_PPLL7_CLOCK_FREQ/5);
-	else if (pixel_clock_ori <= 594000000)
-		ret = clk_set_rate(ctx->dss_pxl0_clk, DEFAULT_MIDIA_PPLL7_CLOCK_FREQ/3);
-	else {
-		DRM_ERROR("Clock don't support!!\n");
-		return -EINVAL;
-	}
-#endif
+	DRM_INFO("PLL7 set to (0x%0x, 0x%0x)\n", ppll7ctrl0, ppll7ctrl1);
+
+	ret = clk_set_rate(ctx->dss_pxl0_clk, dss_pxl0_clk);
+	if (ret < 0)
+		DRM_ERROR("%s: clk_set_rate(dss_pxl0_clk, %llu) failed: %d!\n",
+			  __func__, dss_pxl0_clk, ret);
+	else
+		DRM_INFO("dss_pxl0_clk:[%llu]->[%lu].\n",
+			 dss_pxl0_clk, clk_get_rate(ctx->dss_pxl0_clk));
 
-	if (ret < 0) {
-		DRM_ERROR("dss_pxl0_clk clk_set_rate(%llu) failed, error=%d!\n",
-			pixel_clock_cur, ret);
-	}
 	return ret;
 }
 
-/*******************************************************************************
- **
- */
-static void dss_ldi_set_mode(struct dss_crtc *acrtc)
+static u64 dss_calculate_clock(struct dss_crtc *acrtc,
+			       const struct drm_display_mode *mode)
 {
-	int ret;
-	uint64_t clk_Hz;
-	struct dss_hw_ctx *ctx = acrtc->ctx;
-	struct drm_display_mode *mode = &acrtc->base.state->mode;
-	struct drm_display_mode *adj_mode = &acrtc->base.state->adjusted_mode;
+	u64 clk_Hz;
 
-	DRM_INFO("mode->clock(org) = %u\n", mode->clock);
 	if (acrtc->ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
 		if (mode->clock == 148500)
 			clk_Hz = 144000 * 1000UL;
@@ -275,10 +268,6 @@ static void dss_ldi_set_mode(struct dss_crtc *acrtc)
 		/* Adjust pixel clock for compatibility with 10.1 inch special displays. */
 		if (mode->clock == 148500 && mode->width_mm == 532 && mode->height_mm == 299)
 			clk_Hz = 152000 * 1000UL;
-
-		DRM_INFO("HDMI real need clock = %llu \n", clk_Hz);
-		hdmi_pxl_ppll7_init(ctx, clk_Hz);
-		adj_mode->clock = clk_Hz / 1000;
 	} else {
 		if (mode->clock == 148500)
 			clk_Hz = 144000 * 1000UL;
@@ -290,19 +279,40 @@ static void dss_ldi_set_mode(struct dss_crtc *acrtc)
 			clk_Hz = 72000 * 1000UL;
 		else
 			clk_Hz = mode->clock * 1000UL;
+	}
 
-		/*
-		 * Success should be guaranteed in mode_valid call back,
-		 * so failure shouldn't happen here
-		 */
+	return clk_Hz;
+}
+
+static void dss_ldi_set_mode(struct dss_crtc *acrtc)
+{
+	struct drm_display_mode *adj_mode = &acrtc->base.state->adjusted_mode;
+	struct drm_display_mode *mode = &acrtc->base.state->mode;
+	struct dss_hw_ctx *ctx = acrtc->ctx;
+	u32 clock = mode->clock;
+	u64 clk_Hz;
+	int ret;
+
+	clk_Hz = dss_calculate_clock(acrtc, mode);
+
+	DRM_INFO("Requested clock %u kHz, setting to %llu kHz\n",
+		 clock, clk_Hz / 1000);
+
+	if (acrtc->ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		ret = hdmi_pxl_ppll7_init(ctx, clk_Hz);
+	} else {
 		ret = clk_set_rate(ctx->dss_pxl0_clk, clk_Hz);
-		if (ret) {
-			DRM_ERROR("failed to set pixel clk %llu Hz (%d)\n", clk_Hz, ret);
+		if (!ret) {
+			clk_Hz = clk_get_rate(ctx->dss_pxl0_clk);
+			DRM_INFO("dss_pxl0_clk:[%llu]->[%lu].\n",
+				 clk_Hz, clk_get_rate(ctx->dss_pxl0_clk));
 		}
-		adj_mode->clock = clk_get_rate(ctx->dss_pxl0_clk) / 1000;
 	}
 
-	DRM_INFO("dss_pxl0_clk [%llu]->[%lu] \n", clk_Hz, clk_get_rate(ctx->dss_pxl0_clk));
+	if (ret)
+		DRM_ERROR("failed to set pixel clock\n");
+	else
+		adj_mode->clock = clk_Hz / 1000;
 
 	dpe_init(acrtc);
 }
@@ -460,6 +470,75 @@ static irqreturn_t dss_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static bool dss_crtc_mode_fixup(struct drm_crtc *crtc,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adj_mode)
+{
+	struct dss_crtc *acrtc = to_dss_crtc(crtc);
+	struct dss_hw_ctx *ctx = acrtc->ctx;
+	u64 clk_Hz;
+
+	/* Check if clock is too high */
+	if (mode->clock > 594000)
+		return false;
+	/*
+	 * FIXME: the code should, instead, do some calculus instead of
+	 * hardcoding the modes. Clearly, there's something missing at
+	 * dss_calculate_clock()
+	 */
+
+#if 0
+	/*
+	 * HACK: reports at Hikey 970 mailing lists with the downstream
+	 * Official Linaro 4.9 driver seem to indicate that some monitor
+	 * modes aren't properly set. There, this hack was added.
+	 *
+	 * On my monitors, this wasn't needed, but better to keep this
+	 * code here, together with this notice, just in case.
+	 */
+	if ((mode->hdisplay    == 1920 && mode->vdisplay == 1080 && mode->clock == 148500)
+	    || (mode->hdisplay == 1920 && mode->vdisplay == 1080 && mode->clock == 148352)
+	    || (mode->hdisplay == 1920 && mode->vdisplay == 1080 && mode->clock ==  80192)
+	    || (mode->hdisplay == 1920 && mode->vdisplay == 1080 && mode->clock ==  74250)
+	    || (mode->hdisplay == 1920 && mode->vdisplay == 1080 && mode->clock ==  61855)
+	    || (mode->hdisplay == 1680 && mode->vdisplay == 1050 && mode->clock == 147116)
+	    || (mode->hdisplay == 1680 && mode->vdisplay == 1050 && mode->clock == 146250)
+	    || (mode->hdisplay == 1680 && mode->vdisplay == 1050 && mode->clock == 144589)
+	    || (mode->hdisplay == 1600 && mode->vdisplay == 1200 && mode->clock == 160961)
+	    || (mode->hdisplay == 1600 && mode->vdisplay == 900  && mode->clock == 118963)
+	    || (mode->hdisplay == 1440 && mode->vdisplay == 900  && mode->clock == 126991)
+	    || (mode->hdisplay == 1280 && mode->vdisplay == 1024 && mode->clock == 128946)
+	    || (mode->hdisplay == 1280 && mode->vdisplay == 1024 && mode->clock ==  98619)
+	    || (mode->hdisplay == 1280 && mode->vdisplay == 960  && mode->clock == 102081)
+	    || (mode->hdisplay == 1280 && mode->vdisplay == 800  && mode->clock ==  83496)
+	    || (mode->hdisplay == 1280 && mode->vdisplay == 720  && mode->clock ==  74440)
+	    || (mode->hdisplay == 1280 && mode->vdisplay == 720  && mode->clock ==  74250)
+	    || (mode->hdisplay == 1024 && mode->vdisplay == 768  && mode->clock ==  78800)
+	    || (mode->hdisplay == 1024 && mode->vdisplay == 768  && mode->clock ==  75000)
+	    || (mode->hdisplay == 1024 && mode->vdisplay == 768  && mode->clock ==  81833)
+	    || (mode->hdisplay == 800  && mode->vdisplay == 600  && mode->clock ==  48907)
+	    || (mode->hdisplay == 800  && mode->vdisplay == 600  && mode->clock ==  40000)
+	    || (mode->hdisplay == 800  && mode->vdisplay == 480  && mode->clock ==  32000)
+	   )
+#endif
+	{
+		clk_Hz = dss_calculate_clock(acrtc, mode);
+
+		/*
+		 * On Kirin970, PXL0 clock is set to a const value,
+		 * independently of the pixel clock.
+		 */
+		if (acrtc->ctx->g_dss_version_tag != FB_ACCEL_KIRIN970)
+			clk_Hz = clk_round_rate(ctx->dss_pxl0_clk, mode->clock * 1000);
+
+		adj_mode->clock = clk_Hz / 1000;
+
+		return true;
+	}
+
+	return false;
+}
+
 static void dss_crtc_enable(struct drm_crtc *crtc,
 			    struct drm_crtc_state *old_state)
 {
@@ -533,6 +612,7 @@ static void dss_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs dss_crtc_helper_funcs = {
+	.mode_fixup	= dss_crtc_mode_fixup,
 	.atomic_enable	= dss_crtc_enable,
 	.atomic_disable	= dss_crtc_disable,
 	.mode_set_nofb	= dss_crtc_mode_set_nofb,
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index 99be8dfe05e6..f7f0deca3f53 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -1457,6 +1457,39 @@ static void dsi_encoder_enable(struct drm_encoder *encoder)
 	dsi->enable = true;
 }
 
+static enum drm_mode_status dsi_encoder_mode_valid(struct drm_encoder *encoder,
+					const struct drm_display_mode *mode)
+
+{
+	const struct drm_crtc_helper_funcs *crtc_funcs;
+	struct drm_display_mode adj_mode;
+	int clock = mode->clock;
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, encoder->dev) {
+		drm_mode_copy(&adj_mode, mode);
+
+		crtc_funcs = crtc->helper_private;
+		if (crtc_funcs && crtc_funcs->mode_fixup) {
+			if (!crtc_funcs->mode_fixup(crtc, mode, &adj_mode)) {
+				DRM_INFO("Discarded mode: %ix%i@%i, clock: %i (adjusted to %i)",
+					 mode->hdisplay, mode->vdisplay,
+					 drm_mode_vrefresh(mode),
+					 mode->clock, clock);
+
+				return MODE_BAD;
+			}
+			clock = adj_mode.clock;
+		}
+	}
+
+	DRM_INFO("Valid mode: %ix%i@%i, clock %i (adjusted to %i)",
+		 mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
+		 mode->clock, clock);
+
+	return MODE_OK;
+}
+
 static void dsi_encoder_mode_set(struct drm_encoder *encoder,
 				 struct drm_display_mode *mode,
 				 struct drm_display_mode *adj_mode)
@@ -1476,6 +1509,7 @@ static int dsi_encoder_atomic_check(struct drm_encoder *encoder,
 
 static const struct drm_encoder_helper_funcs dw_encoder_helper_funcs = {
 	.atomic_check	= dsi_encoder_atomic_check,
+	.mode_valid	= dsi_encoder_mode_valid,
 	.mode_set	= dsi_encoder_mode_set,
 	.enable		= dsi_encoder_enable,
 	.disable	= dsi_encoder_disable
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
