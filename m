Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD000CBA065
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 00:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F320710E981;
	Fri, 12 Dec 2025 23:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TuZYf3Ox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45B810E5B8;
 Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8EBCB44189;
 Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 672DCC16AAE;
 Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765580902;
 bh=P4YcGCk8qYvmUcD/gYkROZWf22LTLSC5QlmdG/yvtDM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=TuZYf3Oxebod+hoE9hm5BHHAPVP29El+WtO8uIrkbY14iw+hKFtvsCnH/pebvncC3
 337E2e8Rp0maBQiuksa9TVrUgZChXSTdR4vtsEtRgx7cDWZWDukfT5XiwhVm96RB1x
 pUsnUJA1xxh3+U8S52clz/F2qNMqOIrBuY2UaT5/2idEOUB+VrbyWkea2BQQi4n0gI
 0sepGaJS3dwdRyFqWgU0mw+3CgdYGwR3R1keknproJAj10pTAkjAS9RwdrbhG8EIXY
 XNAZmU5lvYBcDss9/bApzA7323zv3Cudvcns145sELSrSbw12RjgvPUQacyzUyqlS6
 WzGwDtH6TvHew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0F2D59F5B;
 Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 13 Dec 2025 00:08:17 +0100
Subject: [PATCH 2/2] clk: qcom: rcg2, msm/dsi: Fix hangs caused by register
 writes while clocks are off
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
In-Reply-To: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3WwuH3iPdckITDVjZS20u/lAh5Ab6avBlAX4H4KQQAc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPKBkj9yTavobap8/tJezp4SUEdEk/oBwh1Cov
 RLrk4Pd4CeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTygZAAKCRBgAj/E00kg
 cnVqD/4rWYHL9WIoDWye5vQFhBRdRw7fJ7l4Giq25T5Cw+lf79JsiHY3TsLlJDN2jenM3MYKyjV
 6mwzr/QnRJEr21FniGTvu1PNK+5Zbu8szUBWbq4IZWJXvhFjLBaScSlnU3H+NusFgNguruc1CVo
 EB7y3eUU4+JwAkxkDJoOKV/+gHthhorJVlmW2P0JFFanF0KLnic2KgNTbiUrAdroT7hpe7eVWa9
 uKXV1uci7Lq5zPEw5vYjmMzx+trXm6hYGAMfa3CmIfcjyCOU2Xo4VYVxfStnz9s3nI8R4NrbrsY
 PYA1gueBL7qfoNqKi2zsCtphlRQnLi4hU1av04XqGHhu3Ftnxwa4bDxIrQ2NeBvhN/MeyrBvur3
 bt8f4mcxRQLI2ZowkhHTsRTNKzVXI+nXjAdQsWHIMg5BPaep5gWw/GauulMoen40cANCwH/pln/
 b6NDjv4yzodo5ImSbfjWk9I2+SqgakVeKzaN4TQEJ3NE0S2HwVl09rwBGSoccNiJfYxwOh+cZ9/
 SXdU+dWNrH+WeM1tAuhbKx2cBQm18RzGZQmYB0HlGz/XoZ8Sekg2v3XbHrSf5qAADpJJbJ63odu
 JWNVCspHBAA6AbWaJo+AqhmwMVAKt87x+/Rn8We28yCRHEruimKOdepS8KLUt3mFkTfKkPEQ4Bs
 joLia2cIgFjt10w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Petr Hodina <petr.hodina@protonmail.com>

This patch fixes system hangs that occur when RCG2 and DSI code paths
perform register accesses while the associated clocks or power domains
are disabled.

For the Qualcomm RCG2 clock driver, updating M/N/D registers while the
clock is gated can cause the hardware to lock up. Avoid toggling the
update bit when the clock is disabled and instead write the configuration
directly.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/clk/qcom/clk-rcg2.c        | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e18cb8807d735..a18d2b9319670 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1182,6 +1182,24 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 		f.m = frac->num;
 		f.n = frac->den;
 
+		/*
+		 * If clock is disabled, update the M, N and D registers and
+		 * don't hit the update bit.
+		 */
+		if (!clk_hw_is_enabled(hw)) {
+			int ret;
+
+			ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
+			if (ret)
+				return ret;
+
+			ret = __clk_rcg2_configure(rcg, &f, &cfg);
+			if (ret)
+				return ret;
+
+			return regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
+		}
+
 		return clk_rcg2_configure(rcg, &f);
 	}
 	return -EINVAL;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e0de545d40775..374ed966e960b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -762,6 +762,12 @@ dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 
 static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
 {
+	/* Check if we're already powered off before writing registers */
+	if (!msm_host->power_on) {
+		pr_info("DSI CTRL: Skipping register write - host already powered off\n");
+		return;
+	}
+
 	dsi_write(msm_host, REG_DSI_CTRL, 0);
 }
 
@@ -2489,6 +2495,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
+	int ret;
+
 
 	mutex_lock(&msm_host->dev_mutex);
 	if (!msm_host->power_on) {
@@ -2496,6 +2504,11 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 		goto unlock_ret;
 	}
 
+	/* Ensure clocks are enabled before register access */
+	ret = pm_runtime_get_sync(&msm_host->pdev->dev);
+	if (ret < 0)
+		pm_runtime_put_noidle(&msm_host->pdev->dev);
+
 	dsi_ctrl_disable(msm_host);
 
 	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);

-- 
2.51.0


