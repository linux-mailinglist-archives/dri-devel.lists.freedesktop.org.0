Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC53CC768ED
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 23:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1E410E7D4;
	Thu, 20 Nov 2025 22:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HaKHMwUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67A810E7D7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 22:55:55 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5943b62c47dso1451094e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763679354; x=1764284154; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ad/4om2M/AQ7PqpIcaRnNBk8hiQAbDj8O1LhlyygVkg=;
 b=HaKHMwUI8V2K8kFtLeQVLQAM8ApOtTmXxatVjmtrs29RSik94nCc0b/IqD9Y0rx7z8
 Gp0BR7GEak3kAmZCP9uzzMBYJV/6wUEtx9g2o1G6+NoeOuqEd7tdiBfaEcFflsbF2Bxc
 6BGEJGKBy518nj7JYHKFhkrifVKoER7xjMbEHgAfAeakE2zEHseKZOXtkGpJ7am+Ue9T
 D/sLIbXZQoaE53/e+JVw5U9bmx96KhtPwgmDh8nTdixSNAy1wXnWULljGh6hsS8j/0t9
 uBy3K8f0EfUXcpJEgDisOzsMFuiqbpYM/mMcmwIcTX9CcCxOgV885EK+A7V/PtlYqcOi
 FtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763679354; x=1764284154;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ad/4om2M/AQ7PqpIcaRnNBk8hiQAbDj8O1LhlyygVkg=;
 b=etLBR4zwzAkDZn0Q0qBUI7T4tXoE6iMUyRnCZkUGliCOYrmAVFM6WcQQ8RI/f1uWQU
 93PaLnUeZY3m3sYfzyRWg0VgpnH6bcZOFjg6laTYNhFBtNSvIZUWt+xpQr5yxXOukKp6
 ZI8xeDaAU6BDiUY1AkU75ZHjpSsMA6dKqIQfFCo0hzttB2oKVXeK/RX/f22FzM4/SxUU
 a1dwCJ5gk4b2G6BRxj7HherDT1O4P9XSXKUQYSltZIJJ7OKpP2+Ks+RX3jen1OJ/xlvP
 Q4fYPIiKCw9ln5ULUgJKZG+PFoBDN0DOrTvQO08ql1DxIHuowHYIcw3zay+51q2prFrE
 98JQ==
X-Gm-Message-State: AOJu0YxQi5/QktPYLeeP4L9mkARwM/QxYySPd89qBNM2NeRAp5tSOlWp
 kiBfc63dg6WaaZBkdhvobIFfo408mpdhk5oxD8OvGxLmMpejur/iCdaHqaS1JsI9vYM=
X-Gm-Gg: ASbGncsf4vvg72d4jymzBBifsiaOuPSDhBOlckCAcXDyBBOfnO3A4BTBavHya/KBeOF
 UrVFPCaM5Gzet1mj1Csb+CntVYwHlHQXaMpus8MSkMRXbptGjhB57BXaRKXrJrLz4asmyPtdLLx
 Yj14ECbi4HRWN9JrEAL7nrGQgebBjVhwnebxfaDmfYa9wYojy+pU28W3KwSQTrDvrnavcl6qyru
 Gl39vE1n/vmdXHehezixr1Mu9Q4Ekl9SvrPH/PAAjUclTxmc0m8xwySZ2e0iqflTz/rQvtiMgFu
 YtXk2pXPYIoHn186WtIf5V9dYEG/DInxBHJYTIKkXbm+dmyWqVv5FU2LN7qSJkTswd5F2wmnDK6
 Djj369ZZOVXMhfWPMwhn7ArOuGILGBW0IJu1eaoYwImJGu7YUNlWov9vgol5NGK419GcmWXwv/J
 A9Iy/ElBdUKSjYq1tn/i+G73ERObMWjSg5ilsl5uo1em636kva1+OtDj4=
X-Google-Smtp-Source: AGHT+IH6YCa9UIe3b2frKJ2OHFfqg0ooXQh6HmGeTHCO6BkYBH0AHOCL5vFPB7J9FgKpShI8V2AdcA==
X-Received: by 2002:a05:6512:2342:b0:594:2475:a160 with SMTP id
 2adb3069b0e04-596a2efd773mr246920e87.26.1763679354023; 
 Thu, 20 Nov 2025 14:55:54 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db75705sm1066877e87.15.2025.11.20.14.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 14:55:47 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Nov 2025 23:55:33 +0100
Subject: [PATCH v3 2/3] drm/mcde: Create custom commit tail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-mcde-drm-regression-thirdfix-v3-2-24b1e9886bbf@linaro.org>
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
In-Reply-To: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks when used with MCDE.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

However the MCDE driver definitely need the CRTC to be
enabled during .prepare()/.unprepare().

Solve this by implementing a custom commit tail function
in the MCDE driver that always enables the CRTC first
and disables it last, using the newly exported helpers.

Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..290082c86100 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -100,13 +100,48 @@ static const struct drm_mode_config_funcs mcde_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+/*
+ * This commit tail explicitly copies and changes the behaviour of
+ * the related core DRM atomic helper instead of trying to make
+ * the core helpers overly generic.
+ */
+static void mcde_atomic_commit_tail(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+
+	/* Variant of drm_atomic_helper_commit_modeset_disables() */
+	drm_encoder_bridge_disable(dev, state);
+	drm_encoder_bridge_post_disable(dev, state);
+	drm_crtc_disable(dev, state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
+	drm_crtc_set_mode(dev, state);
+
+	/* Variant of drm_atomic_helper_commit_modeset_enables() */
+	drm_crtc_enable(dev, state);
+	drm_encoder_bridge_pre_enable(dev, state);
+	drm_encoder_bridge_enable(dev, state);
+	drm_atomic_helper_commit_writebacks(dev, state);
+
+	drm_atomic_helper_commit_planes(dev, state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+
+	drm_atomic_helper_fake_vblank(state);
+
+	drm_atomic_helper_commit_hw_done(state);
+
+	drm_atomic_helper_wait_for_vblanks(dev, state);
+
+	drm_atomic_helper_cleanup_planes(dev, state);
+}
+
 static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	/*
 	 * Using this function is necessary to commit atomic updates
 	 * that need the CRTC to be enabled before a commit, as is
 	 * the case with e.g. DSI displays.
 	 */
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = mcde_atomic_commit_tail,
 };
 
 static irqreturn_t mcde_irq(int irq, void *data)

-- 
2.51.1

