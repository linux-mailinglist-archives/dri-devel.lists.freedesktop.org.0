Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C3B26092
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A85F10E82A;
	Thu, 14 Aug 2025 09:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ssEY77i1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BDA10E82B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:18:21 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45a1b097037so3841145e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755163100; x=1755767900; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Sw1jsJRwABde2QJUqyand4FN1Jn1+zxeyEdBFH61xAc=;
 b=ssEY77i1iCfFccyTVBMEd6dzVkE9HwhJKPqhb9DS8wxg2qQA5twcpW5Kj6T7YliZ8p
 w9h5LCIu2GzDK1KdS1MUxnBMlnudti+O9t/68yp6b3/SPK3uwfDdalrhEHkZo6teIIWA
 U57NNWhzBgGbrfxEfsIXKRhgM6/GL3aDUF9Evh13Xb81Zn/9Pk3VwffbngoCa0iZjsS+
 s0P81xFjJZVD1E4QZZ/+yxlLuNPzjUQ5ighcll+RTzlhuQ94SFINcFbsh9XAT6gLQHna
 Yj4Yvz00j9hCiOHFcECCdZkuL93U4dnY4krS3GX8uVOQOYntZpdLtsZCTT96xXnAmRtL
 UL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163100; x=1755767900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sw1jsJRwABde2QJUqyand4FN1Jn1+zxeyEdBFH61xAc=;
 b=OHVq4HSgifTT+D4HK7ZCXLrrQw26hbFLSWh2Bsc0HKjcwFsKq6J8eK4Y1c4dhW1d3c
 j9bzWcYIXCqe3Jr/q3Q6SO80rgb1JYfgxoAZ4rADclWP2qOu13x1CV9IoXs6srXkIfNV
 AZFk4jhD9irYwkGzLSK9wVktAIqu9ZUDHi9A95otgS+wRiS8CIK9jrnb8oYfvP0C/z+z
 zfU8CbKXqEKzTsf5U7Ue3/oxq7Mf84lRtyUA2fQ3+qO+2D/1DHCQqRgm8Bsg5BBSfSCv
 j1Jv168Vc37WtiuFHCRQVNiiftr9/Nx6P0zIOGP/1fP4uakLClscX/gttDH4k7bWY4wW
 HPAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5DEZSHjxiaJuLBjsEjqCfR5mlm+pnoWk8+sQFj3PE0IqGcT5hXvhGzroFvOLwVSFvTMtvw6+q3eA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRqMH1xBArWYL0Yy880l8FaftDiHoiuBr0Nhp8usb7y+3Ffw7R
 EY8KBW5L3SqHbLEIYZPfYOGX2qdnHx9ix64UA+2vWAv7/Qm6rbNgRtRWqlUpbXSR53Q=
X-Gm-Gg: ASbGncu9xVZosooh3OQ8Qdi8QXXgEQurBwltiZwN78qEynV+0mRpjcDeNwLGBhRFQxn
 tnYC0D+75/6Ea1okcUKvbRnWEDK+ifXLZ1wQUJmMdT6JgcS+kJm3V/TvLmNadW/Atbr527MEKYg
 /+aW8QkN/hASWEar39+7Ib8JGmIOiA8C034BtAcD8Wlj9hVx0VZrwLlcvQWHvyymIwk16JC7Z8U
 0o0Fb+iUHGbfnYuyaOU+H+E11AODaJJhkaOhXYnVniUdgM2KcXG+fq2II+3VoSPHILxxU/iXST8
 L1nYRh/XaY1Qh9/4utFwysXK4pJufYeh4+AI1KeawH4SbMD5TySKbFu2UClhNSrg7R+29VTAs1B
 hOK0FEYsUJKenB1onpXP4kndKCS0UzO8g3lLV
X-Google-Smtp-Source: AGHT+IHgCKHrKmlG0XE5ASsl3flO7xdPvj24GpGqa+EV9hH/V/JZ27mTKnghzyA1i5XsC1PyFXNpXg==
X-Received: by 2002:a05:600c:3151:b0:459:e3f8:92ec with SMTP id
 5b1f17b1804b1-45a1b60e2e8mr20488895e9.10.1755163100162; 
 Thu, 14 Aug 2025 02:18:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:ea13:2485:4711:708])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c74876csm13861925e9.14.2025.08.14.02.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:18:19 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 11:18:07 +0200
Subject: [PATCH 2/2] drm/msm: dp: Delay applying clock defaults until PHY
 is fully enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-platform-delay-clk-defaults-v1-2-4aae5b33512f@linaro.org>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
In-Reply-To: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
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

On some Qualcomm platforms, we cannot safely reparent clocks when the new
parent is not already powered up. This problem occurs for the DP and DSI
controller when we try to reparent the link clocks using the standard
"assigned-clock-parents" property to the clock source provided by the PHY.
We often bypass this problem, because the clocks are already assigned to
the correct parent by the boot firmware. Without that, there is an error
during boot in the kernel log and DP/DSI is not functional.

For example, the following error occurs on X1E if the &mdss_dp3 controller
was not initialized by the boot firmware:

  clk: failed to reparent disp_cc_mdss_dptx3_link_clk_src to aec5a00.phy::link_clk: -16
  disp_cc_mdss_dptx3_link_clk_src: rcg didn't update its configuration.
  WARNING: CPU: 0 PID: 77 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xe8
  pc : update_config+0xd4/0xe8
  Call trace:
   update_config+0xd4/0xe8 (P)
   clk_rcg2_set_parent+0x58/0x68
   __clk_set_parent+0x4c/0x214
   clk_core_set_parent_nolock+0xe8/0x1f4
   clk_set_parent+0xa4/0x13c
   of_clk_set_defaults+0x15c/0x4a8
   platform_probe+0x3c/0xc4
   ...
  clk: failed to reparent disp_cc_mdss_dptx3_pixel0_clk_src to aec5a00.phy::vco_div_clk: -16
  disp_cc_mdss_dptx3_pixel0_clk_src: rcg didn't update its configuration.
  WARNING: CPU: 0 PID: 77 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xe8
  ...

In the current implementation, it is tricky to solve this from any of the
involved drivers, because the call to clk_set_parent() happens from the
platform driver core (before the probe() function of the DP driver is
called). Similarly, the PHY/clock driver cannot solve this alone, because
it doesn't know which clock rate and configuration to use for the PHY.

For DSI on SM8750, we solved this by avoiding use of assigned-clock-parents
and calling clk_set_parent() separately from the DSI controller driver (see
commit 80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")). We could do
that for the DP controller as well, but this would require changing the
existing DT bindings for a number of platforms, just to workaround a
limitation in the Linux driver model. The DT does not specify when to apply
the assigned-clock-parents, so there is nothing wrong with the current
hardware description.

Instead, fix this by using the new "driver_managed_clk_defaults" option in
the platform_driver struct. Delay the call to of_clk_set_defaults() until
we have set up the PHY to avoid the error shown above.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 ++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c42fd2c17a328f6deae211c9cd57cc7416a9365a..21249d2b85b308ef2437f1c7a309c795103599f6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 #include <linux/clk.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
@@ -140,6 +141,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on;
+	bool clk_defaults_set;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -1789,6 +1791,14 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
 	phy_configure(phy, &ctrl->phy_opts);
 	phy_power_on(phy);
 
+	if (!ctrl->clk_defaults_set) {
+		ret = of_clk_set_defaults(ctrl->dev->of_node, false);
+		if (ret)
+			return ret;
+
+		ctrl->clk_defaults_set = true;
+	}
+
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
 	ret = msm_dp_ctrl_link_clk_enable(&ctrl->msm_dp_ctrl);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..b8a0e61b806e6e386980f9c6ad6f58b487a68c7e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1487,6 +1487,8 @@ static struct platform_driver msm_dp_display_driver = {
 		.suppress_bind_attrs = true,
 		.pm = &msm_dp_pm_ops,
 	},
+	/* Apply clock parents after PHY is fully initialized */
+	.driver_managed_clk_defaults = true,
 };
 
 int __init msm_dp_register(void)

-- 
2.50.1

