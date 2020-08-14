Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00063245D1E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423B06E49B;
	Mon, 17 Aug 2020 07:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E180E6EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w25so8073474ljo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6WNf8TRMY4yV55W1uBcchmluoZ+qOEHy2Hn86HAVEdQ=;
 b=dKxD7U+CrnImKrBOH/IgUD8KIlkkjfL+MqxvWySY6zMh4NPyIftOM9OEiNQoWmPGdZ
 yly9RxtN5/mJiieout0P+XU2FyY+Ys5on8REoNtDT8k5Mzy/jhtS/MRz6ZRy5d36cl1v
 zF8zQAF7/E223AjQa32SOKnc5IRf2oo4qzt1RsZNfXvIp9joJXDJS/jDJr24woZBmpkz
 f1wG6xz4FlND++/W2S2NIny0BAm98cvUm283Q8eHmO89dgXqAPuKUwQXsCXtwIMx6bD9
 GED3hjKZNHgdrEE9z/SWtVhMIv4OEOx/ElrJzMIaWc3VCBAF4AsZE2VyW35cKL9IY/FI
 CINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6WNf8TRMY4yV55W1uBcchmluoZ+qOEHy2Hn86HAVEdQ=;
 b=P0zoAb71d63U5IUXr/r+kuNMFysF+pfx0+9rF8xROAp/JCWEopj7YHzgUuHN9Rtq6T
 Bpfo06BadX8r+VLhgqGo8HrQ7PIkJz97WlDygNstitD7S8HwonOlhf0jnhEr7EDRmcc8
 sYKH/HGGXfqPS6ERQMb1LMIdf8x2+HtrZ+qWHnhdEjoSyHqc6u/TL5Dn03JVInkHxGg0
 ihvUJtHFC3dTuUxojNEvjz5HQ8V7RCov52F385xVHB+yNv+cTJ9l/cw1+NGYRPAkFt7o
 rOwCtuEAdxgtUkmbF7WbaXYxmwdWUl+QZrzmfbX2NYoca9k76MyJYi686guFMGopHqFd
 lohA==
X-Gm-Message-State: AOAM533MUa303LS5kv+kDWT0Aw77I5wKJhTUtKKOnGG7Y6BMAeiK2Ylz
 dcvUmSuODJ/1mcQBQ6ENlMA=
X-Google-Smtp-Source: ABdhPJzIbZtaYynsZHlUF7D8CDbuGPEnj8UFBr3GD7P1iN9tJFD7HO6vnuzbJAFQ493WcOwsEKgiPg==
X-Received: by 2002:a2e:978c:: with SMTP id y12mr91161lji.327.1597363659168;
 Thu, 13 Aug 2020 17:07:39 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:38 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v5 34/36] drm/tegra: dc: Support memory bandwidth management
Date: Fri, 14 Aug 2020 03:06:19 +0300
Message-Id: <20200814000621.8415-35-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display controller (DC) performs isochronous memory transfers, and thus,
has a requirement for a minimum memory bandwidth that shall be fulfilled,
otherwise framebuffer data can't be fetched fast enough and this results
in a DC's data-FIFO underflow that follows by a visual corruption.

The Memory Controller drivers provide facility for memory bandwidth
management via interconnect API. This patch wires up the interconnect
API support to the DC driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/Kconfig |   1 +
 drivers/gpu/drm/tegra/dc.c    | 271 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/dc.h    |   8 +
 drivers/gpu/drm/tegra/drm.c   |  19 +++
 drivers/gpu/drm/tegra/plane.c |   1 +
 drivers/gpu/drm/tegra/plane.h |   4 +-
 6 files changed, 300 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 5043dcaf1cf9..1650a448eabd 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -9,6 +9,7 @@ config DRM_TEGRA
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select TEGRA_HOST1X
+	select INTERCONNECT
 	select IOMMU_IOVA
 	select CEC_CORE if CEC_NOTIFIER
 	help
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 9a0b3240bc58..850fbcebefc2 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -525,6 +525,136 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
 		tegra_plane_setup_blending(plane, window);
 }
 
+static unsigned long
+tegra_plane_memory_bandwidth(struct drm_plane_state *state,
+			     struct tegra_dc_window *window,
+			     unsigned int num,
+			     unsigned int denum)
+{
+	struct tegra_plane_state *tegra_state;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_format_info *fmt;
+	struct tegra_dc_window win;
+	unsigned long long bandwidth;
+	unsigned int bpp_plane;
+	unsigned int bpp;
+	unsigned int mul;
+	unsigned int i;
+
+	if (!state->fb || !state->visible)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
+	tegra_state = to_tegra_plane_state(state);
+
+	if (!window)
+		window = &win;
+
+	window->src.w = drm_rect_width(&state->src) >> 16;
+	window->src.h = drm_rect_height(&state->src) >> 16;
+	window->dst.w = drm_rect_width(&state->dst);
+	window->dst.h = drm_rect_height(&state->dst);
+	window->tiling = tegra_state->tiling;
+
+	fmt = state->fb->format;
+
+	/*
+	 * Note that real memory bandwidth vary depending on format and
+	 * memory layout, we are not taking that into account because small
+	 * estimation error isn't important since bandwidth is rounded up
+	 * anyway.
+	 */
+	for (i = 0, bpp = 0; i < fmt->num_planes; i++) {
+		bpp_plane = fmt->cpp[i] * 8;
+
+		/*
+		 * Sub-sampling is relevant for chroma planes only and vertical
+		 * readouts are not cached, hence only horizontal sub-sampling
+		 * matters.
+		 */
+		if (i > 0)
+			bpp_plane /= fmt->hsub;
+
+		bpp += bpp_plane;
+	}
+
+	/*
+	 * Horizontal downscale takes extra bandwidth which roughly depends
+	 * on the scaled width.
+	 */
+	if (window->src.w > window->dst.w)
+		mul = (window->src.w - window->dst.w) * bpp / 2048 + 1;
+	else
+		mul = 1;
+
+	/*
+	 * Ignore cursor window if its width is small enough such that
+	 * data-prefetch FIFO will easily help to overcome temporal memory
+	 * pressure.
+	 *
+	 * Window A has a 128bit x 128 deep read FIFO, while windows B/C
+	 * have a 128bit x 64 deep read FIFO.
+	 *
+	 * This allows us to not overestimate memory frequency requirement.
+	 * Even if it will happen that cursor gets a temporal underflow, this
+	 * won't be fatal.
+	 */
+	if (state->plane->type == DRM_PLANE_TYPE_CURSOR &&
+	    mul == 1 && window->src.w * bpp <= 128 * 16)
+		return 0;
+
+	/* mode.clock in kHz, bandwidth in kbit/s */
+	bandwidth = kbps_to_icc(crtc_state->mode.clock * bpp * mul);
+
+	/* the requested bandwidth should be higher than required */
+	bandwidth *= num;
+	do_div(bandwidth, denum);
+
+	return min_t(u64, bandwidth, ULONG_MAX);
+}
+
+static unsigned long
+tegra20_plane_memory_bandwidth(struct drm_plane_state *state)
+{
+	return tegra_plane_memory_bandwidth(state, NULL, 29, 10);
+}
+
+static unsigned long
+tegra30_plane_memory_bandwidth(struct drm_plane_state *state)
+{
+	struct tegra_dc_window window;
+	unsigned long bandwidth;
+
+	bandwidth = tegra_plane_memory_bandwidth(state, &window, 29, 10);
+
+	/* x2: memory overfetch for tiled framebuffer and DDR3 */
+	if (window.tiling.mode == TEGRA_BO_TILING_MODE_TILED)
+		bandwidth *= 2;
+
+	return bandwidth;
+}
+
+static unsigned long
+tegra114_plane_memory_bandwidth(struct drm_plane_state *state)
+{
+	struct tegra_dc_window window;
+	unsigned long bandwidth;
+
+	bandwidth = tegra_plane_memory_bandwidth(state, &window, 12, 10);
+
+	/* x2: memory overfetch for tiled framebuffer and DDR3 */
+	if (window.tiling.mode == TEGRA_BO_TILING_MODE_TILED)
+		bandwidth *= 2;
+
+	return bandwidth;
+}
+
+static unsigned long
+tegra124_plane_memory_bandwidth(struct drm_plane_state *state)
+{
+	return tegra_plane_memory_bandwidth(state, NULL, 12, 10);
+}
+
 static const u32 tegra20_primary_formats[] = {
 	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_ARGB1555,
@@ -617,8 +747,10 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	int err;
 
 	/* no need for further checks if the plane is being disabled */
-	if (!state->crtc)
+	if (!state->crtc) {
+		plane_state->memory_bandwidth = 0;
 		return 0;
+	}
 
 	err = tegra_plane_format(state->fb->format->format,
 				 &plane_state->format,
@@ -685,6 +817,8 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	if (err < 0)
 		return err;
 
+	plane_state->memory_bandwidth = dc->soc->plane_memory_bandwidth(state);
+
 	return 0;
 }
 
@@ -1214,6 +1348,7 @@ tegra_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 	copy->pclk = state->pclk;
 	copy->div = state->div;
 	copy->planes = state->planes;
+	copy->memory_bandwidth = state->memory_bandwidth;
 
 	return &copy->base;
 }
@@ -1796,6 +1931,8 @@ static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
 	err = host1x_client_suspend(&dc->client);
 	if (err < 0)
 		dev_err(dc->dev, "failed to suspend: %d\n", err);
+
+	icc_set_bw(dc->icc_bandwidth, 0, 0);
 }
 
 static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -1807,6 +1944,9 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 	u32 value;
 	int err;
 
+	icc_set_bw(dc->icc_bandwidth, state->memory_bandwidth,
+		   state->memory_bandwidth);
+
 	err = host1x_client_resume(&dc->client);
 	if (err < 0) {
 		dev_err(dc->dev, "failed to resume: %d\n", err);
@@ -1920,6 +2060,9 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 static void tegra_crtc_atomic_begin(struct drm_crtc *crtc,
 				    struct drm_crtc_state *old_crtc_state)
 {
+	struct tegra_dc_state *dc_old_state = to_dc_state(old_crtc_state);
+	struct tegra_dc_state *dc_state = to_dc_state(crtc->state);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
 	unsigned long flags;
 
 	if (crtc->state->event) {
@@ -1934,6 +2077,25 @@ static void tegra_crtc_atomic_begin(struct drm_crtc *crtc,
 
 		crtc->state->event = NULL;
 	}
+
+	if (old_crtc_state && old_crtc_state->active) {
+		/*
+		 * Raise memory bandwidth before changes take effect if it
+		 * goes from low to high.
+		 */
+		if (dc_old_state->memory_bandwidth < dc_state->memory_bandwidth)
+			icc_set_bw(dc->icc_bandwidth,
+				   dc_state->memory_bandwidth,
+				   dc_state->memory_bandwidth);
+	} else {
+		/*
+		 * Raise memory bandwidth before changes take effect if
+		 * CRTC is turning on.
+		 */
+		icc_set_bw(dc->icc_bandwidth,
+			   dc_state->memory_bandwidth,
+			   dc_state->memory_bandwidth);
+	}
 }
 
 static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -1952,7 +2114,80 @@ static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
 	value = tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
 }
 
+static bool
+tegra_plane_overlaps_other_plane(struct drm_crtc_state *state,
+				 const struct drm_plane_state *plane_state)
+{
+	const struct drm_plane_state *other_state;
+	struct drm_plane *plane;
+	struct drm_rect rect;
+
+	drm_atomic_crtc_state_for_each_plane_state(plane, other_state, state) {
+		rect = plane_state->dst;
+
+		if (other_state == plane_state)
+			continue;
+
+		if (!other_state->visible || !other_state->fb)
+			continue;
+
+		if (drm_rect_intersect(&rect, &other_state->dst))
+			return true;
+	}
+
+	return false;
+}
+
+static int tegra_crtc_atomic_check(struct drm_crtc *crtc,
+				   struct drm_crtc_state *state)
+{
+	struct tegra_dc_state *dc_state = to_dc_state(state);
+	const struct drm_plane_state *plane_state;
+	const struct tegra_plane_state *tegra;
+	unsigned long long bandwidth = 0;
+	struct drm_plane *plane;
+
+	/*
+	 * For overlapping planes pixel's data is fetched for each plane at
+	 * the same time, hence bandwidth is accumulated in this case.
+	 */
+	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state) {
+		tegra = to_tegra_plane_state(plane_state);
+
+		if (tegra_plane_overlaps_other_plane(state, plane_state))
+			bandwidth += tegra->memory_bandwidth;
+		else
+			bandwidth = max_t(u64, bandwidth,
+					  tegra->memory_bandwidth);
+	}
+
+	dc_state->memory_bandwidth = min_t(u64, bandwidth, U32_MAX);
+
+	return 0;
+}
+
+void tegra_crtc_atomic_post_commit(struct drm_crtc *crtc,
+				   struct drm_crtc_state *old_crtc_state)
+{
+	struct tegra_dc_state *dc_old_state = to_dc_state(old_crtc_state);
+	struct tegra_dc_state *dc_state = to_dc_state(crtc->state);
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+
+	if (!dc_old_state)
+		return;
+
+	/*
+	 * Drop memory bandwidth after changes take effect if it goes from
+	 * high to low.
+	 */
+	if (dc_old_state->memory_bandwidth > dc_state->memory_bandwidth)
+		icc_set_bw(dc->icc_bandwidth,
+			   dc_state->memory_bandwidth,
+			   dc_state->memory_bandwidth);
+}
+
 static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
+	.atomic_check = tegra_crtc_atomic_check,
 	.atomic_begin = tegra_crtc_atomic_begin,
 	.atomic_flush = tegra_crtc_atomic_flush,
 	.atomic_enable = tegra_crtc_atomic_enable,
@@ -2244,6 +2479,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.modifiers = tegra20_modifiers,
 	.has_win_a_without_filters = true,
 	.has_win_c_without_vert_filter = true,
+	.plane_memory_bandwidth = tegra20_plane_memory_bandwidth,
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
@@ -2263,6 +2499,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.modifiers = tegra20_modifiers,
 	.has_win_a_without_filters = false,
 	.has_win_c_without_vert_filter = false,
+	.plane_memory_bandwidth = tegra30_plane_memory_bandwidth,
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
@@ -2282,6 +2519,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.modifiers = tegra20_modifiers,
 	.has_win_a_without_filters = false,
 	.has_win_c_without_vert_filter = false,
+	.plane_memory_bandwidth = tegra114_plane_memory_bandwidth,
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
@@ -2301,6 +2539,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.modifiers = tegra124_modifiers,
 	.has_win_a_without_filters = false,
 	.has_win_c_without_vert_filter = false,
+	.plane_memory_bandwidth = tegra124_plane_memory_bandwidth,
 };
 
 static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
@@ -2320,6 +2559,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.modifiers = tegra124_modifiers,
 	.has_win_a_without_filters = false,
 	.has_win_c_without_vert_filter = false,
+	.plane_memory_bandwidth = tegra124_plane_memory_bandwidth,
 };
 
 static const struct tegra_windowgroup_soc tegra186_dc_wgrps[] = {
@@ -2368,6 +2608,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.has_nvdisplay = true,
 	.wgrps = tegra186_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra186_dc_wgrps),
+	.plane_memory_bandwidth = tegra124_plane_memory_bandwidth,
 };
 
 static const struct tegra_windowgroup_soc tegra194_dc_wgrps[] = {
@@ -2416,6 +2657,7 @@ static const struct tegra_dc_soc_info tegra194_dc_soc_info = {
 	.has_nvdisplay = true,
 	.wgrps = tegra194_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra194_dc_wgrps),
+	.plane_memory_bandwidth = tegra124_plane_memory_bandwidth,
 };
 
 static const struct of_device_id tegra_dc_of_match[] = {
@@ -2522,6 +2764,7 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
+	const char *level = KERN_ERR;
 	struct tegra_dc *dc;
 	int err;
 
@@ -2588,8 +2831,6 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
-		const char *level = KERN_ERR;
-
 		if (err == -EPROBE_DEFER)
 			level = KERN_DEBUG;
 
@@ -2598,6 +2839,25 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	/*
+	 * The display controller memory bandwidth management isn't trivial
+	 * because it requires the knowledge about the DC hardware state
+	 * in order to make a proper decisions. It's not easy to convey
+	 * that information to the ICC provider, so we will just use the
+	 * first interconnect path for the memory bandwidth management and
+	 * make all the decisions within the DC driver, for simplicity.
+	 */
+	dc->icc_bandwidth = of_icc_get(dc->dev, "wina");
+	err = PTR_ERR_OR_ZERO(dc->icc_bandwidth);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			level = KERN_DEBUG;
+
+		dev_printk(level, dc->dev,
+			   "failed to get wina interconnect: %d\n", err);
+		goto remove_rgb;
+	}
+
 	platform_set_drvdata(pdev, dc);
 	pm_runtime_enable(&pdev->dev);
 
@@ -2616,6 +2876,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 disable_pm:
 	pm_runtime_disable(&pdev->dev);
+	icc_put(dc->icc_bandwidth);
+
+remove_rgb:
 	tegra_dc_rgb_remove(dc);
 
 	return err;
@@ -2633,6 +2896,8 @@ static int tegra_dc_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	icc_put(dc->icc_bandwidth);
+
 	err = tegra_dc_rgb_remove(dc);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to remove RGB output: %d\n", err);
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 051d03dcb9b0..b70eeeee2033 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -8,6 +8,7 @@
 #define TEGRA_DC_H 1
 
 #include <linux/host1x.h>
+#include <linux/interconnect.h>
 
 #include <drm/drm_crtc.h>
 
@@ -23,6 +24,8 @@ struct tegra_dc_state {
 	unsigned int div;
 
 	u32 planes;
+
+	unsigned long memory_bandwidth;
 };
 
 static inline struct tegra_dc_state *to_dc_state(struct drm_crtc_state *state)
@@ -66,6 +69,7 @@ struct tegra_dc_soc_info {
 	const u64 *modifiers;
 	bool has_win_a_without_filters;
 	bool has_win_c_without_vert_filter;
+	unsigned long (*plane_memory_bandwidth)(struct drm_plane_state *state);
 };
 
 struct tegra_dc {
@@ -90,6 +94,8 @@ struct tegra_dc {
 	struct drm_info_list *debugfs_files;
 
 	const struct tegra_dc_soc_info *soc;
+
+	struct icc_path *icc_bandwidth;
 };
 
 static inline struct tegra_dc *
@@ -151,6 +157,8 @@ int tegra_dc_state_setup_clock(struct tegra_dc *dc,
 			       struct drm_crtc_state *crtc_state,
 			       struct clk *clk, unsigned long pclk,
 			       unsigned int div);
+void tegra_crtc_atomic_post_commit(struct drm_crtc *crtc,
+				   struct drm_crtc_state *old_crtc_state);
 
 /* from rgb.c */
 int tegra_dc_rgb_probe(struct tegra_dc *dc);
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ba9d1c3e7cac..f648adb22731 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -20,6 +20,7 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
+#include "dc.h"
 #include "drm.h"
 #include "gem.h"
 
@@ -59,6 +60,22 @@ static const struct drm_mode_config_funcs tegra_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static void tegra_atomic_post_commit(struct drm_device *drm,
+				     struct drm_atomic_state *old_state)
+{
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state,
+				      new_crtc_state, i) {
+		if (!new_crtc_state->active)
+			continue;
+
+		tegra_crtc_atomic_post_commit(crtc, old_crtc_state);
+	}
+}
+
 static void tegra_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *drm = old_state->dev;
@@ -75,6 +92,8 @@ static void tegra_atomic_commit_tail(struct drm_atomic_state *old_state)
 	} else {
 		drm_atomic_helper_commit_tail_rpm(old_state);
 	}
+
+	tegra_atomic_post_commit(drm, old_state);
 }
 
 static const struct drm_mode_config_helper_funcs
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 4cd0461cc508..8f6ef5fb3977 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -64,6 +64,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *plane)
 	copy->reflect_x = state->reflect_x;
 	copy->reflect_y = state->reflect_y;
 	copy->opaque = state->opaque;
+	copy->memory_bandwidth = state->memory_bandwidth;
 
 	for (i = 0; i < 2; i++)
 		copy->blending[i] = state->blending[i];
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index c691dd79b27b..f9a031a69161 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -52,10 +52,12 @@ struct tegra_plane_state {
 	/* used for legacy blending support only */
 	struct tegra_plane_legacy_blending_state blending[2];
 	bool opaque;
+
+	unsigned long memory_bandwidth;
 };
 
 static inline struct tegra_plane_state *
-to_tegra_plane_state(struct drm_plane_state *state)
+to_tegra_plane_state(const struct drm_plane_state *state)
 {
 	if (state)
 		return container_of(state, struct tegra_plane_state, base);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
