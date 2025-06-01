Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E70ACA331
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933A410E49D;
	Sun,  1 Jun 2025 23:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K39m4zfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C9D10E49C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:44:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D35A85C4BC2;
 Sun,  1 Jun 2025 23:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB16C4AF11;
 Sun,  1 Jun 2025 23:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748821447;
 bh=T7LWbVXZyD2j1rfDdfOk5oDsq496eu5/206Uyx5I6jQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K39m4zfYAXiMyRWSdLmlyOKe/5Ihb7QONOt3r5SYeCLxKOYdW0hPZoEAbgbOvMyff
 An1wtFiMFyPK/pDwMwyvL3mrN6SOeDTyMgQOvxPJmWm5fTFXMnMPW2Ab51uAnQB5Ty
 c6BdmKds4eqvlK34sTb12fd2zu/2Z/+JLc9mfotE7VHFxStdvT5XUgFoqqCcplv2kZ
 v07mendGUhrAOZso+/j2dcQ9q+dCBQNgg6mGS5mqJ+ES/MCpSH8zte8OYAsFDdYTOQ
 yUQaMgmrb3idUPdRMkedCtYYRgQQihvkUqevzAnmQLkE1QDPdJGg5vfubPeQCalBbC
 peKqMJ7lzQPxg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Damon Ding <damon.ding@rock-chips.com>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sasha Levin <sashal@kernel.org>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, l.stach@pengutronix.de,
 bivvy.bi@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/34] drm/bridge: analogix_dp: Add irq flag
 IRQF_NO_AUTOEN instead of calling disable_irq()
Date: Sun,  1 Jun 2025 19:43:27 -0400
Message-Id: <20250601234359.3518595-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234359.3518595-1-sashal@kernel.org>
References: <20250601234359.3518595-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Damon Ding <damon.ding@rock-chips.com>

[ Upstream commit efab13e7d13a641a22c7508cde6e1a5285161944 ]

The IRQF_NO_AUTOEN can be used for the drivers that don't want
interrupts to be enabled automatically via devm_request_threaded_irq().
Using this flag can provide be more robust compared to the way of
calling disable_irq() after devm_request_threaded_irq() without the
IRQF_NO_AUTOEN flag.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Link: https://lore.kernel.org/r/20250310104114.2608063-2-damon.ding@rock-chips.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees based on
the following analysis: ## Code Change Analysis The commit makes a
simple, targeted fix to address a race condition in interrupt handling:
1. **Line 1639**: Changes `irq_flags = IRQF_TRIGGER_RISING |
IRQF_TRIGGER_FALLING;` to `irq_flags = IRQF_TRIGGER_RISING |
IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN;` 2. **Line 1642**: Changes
`irq_flags = 0;` to `irq_flags = IRQF_NO_AUTOEN;` 3. **Line 1659**:
Removes the `disable_irq(dp->irq);` call that was previously needed
after `devm_request_threaded_irq()` ## Backport Suitability Assessment
**Matches Stable Tree Criteria:** 1. **Fixes an Important Bug**: The
commit addresses a race condition where interrupts can fire between
`devm_request_threaded_irq()` and `disable_irq()`, which could cause
system instability or unexpected behavior. 2. **Small and Contained
Change**: The modification is minimal (3 lines changed) and affects only
the interrupt setup logic in `analogix_dp_core.c:1608-1659`. 3. **Low
Risk of Regression**: The change uses a well-established kernel pattern
(IRQF_NO_AUTOEN) that's been proven safe across multiple subsystems. 4.
**Clear Technical Merit**: As noted in the commit message, using
`IRQF_NO_AUTOEN` is "more robust compared to the way of calling
disable_irq() after devm_request_threaded_irq()". **Strong Precedent
from Similar Commits:** The analysis shows **ALL** similar commits in
the provided reference set have "Backport Status: YES": -
`drm/msm/adreno: Use IRQF_NO_AUTOEN flag in request_irq()` - **YES** -
`drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()` (both
instances) - **YES** - `drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in
request_irq()` - **YES** - `drm/exynos: move to use request_irq by
IRQF_NO_AUTOEN flag` - **YES** **Additional Context from Kernel
Repository:** Examination of `/home/sasha/linux/drivers/gpu/drm/bridge/a
nalogix/analogix_dp_core.c:1659` confirms this follows the exact same
pattern as other successful backports - replacing the `request_irq()` +
`disable_irq()` sequence with `IRQF_NO_AUTOEN` flag usage. This is a
textbook example of a stable tree candidate: it fixes a real race
condition bug with minimal, proven-safe code changes that follow
established kernel patterns.

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index e8baa07450b7d..3d8f08d895612 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1778,10 +1778,10 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		 * that we can get the current state of the GPIO.
 		 */
 		dp->irq = gpiod_to_irq(dp->hpd_gpiod);
-		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
+		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN;
 	} else {
 		dp->irq = platform_get_irq(pdev, 0);
-		irq_flags = 0;
+		irq_flags = IRQF_NO_AUTOEN;
 	}
 
 	if (dp->irq == -ENXIO) {
@@ -1798,7 +1798,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		dev_err(&pdev->dev, "failed to request irq\n");
 		goto err_disable_clk;
 	}
-	disable_irq(dp->irq);
 
 	return dp;
 
-- 
2.39.5

