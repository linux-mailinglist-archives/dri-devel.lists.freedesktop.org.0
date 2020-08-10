Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1DF240DE7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 21:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5E46E21C;
	Mon, 10 Aug 2020 19:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961E96E21C;
 Mon, 10 Aug 2020 19:12:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5571422CA1;
 Mon, 10 Aug 2020 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086743;
 bh=ZiaolnjIZq/xKnJoPIeccT6Nyg/HSL5K/OjpsfDFZts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OUDNCw1MCZRkAR4Btk4o+Lw/f6PKE9dtEXb5Y1vSXbquhHQ2g5sQfhuWGPeSoHhnc
 BJeKMEfJ6W7kfJiLs82pHOOj6vWftbKHKxChPUK/XCTQVFNdzkhGPwokVydhPR6WD0
 b5OjKMJoynwy78QXZ3+UgDxCgLIUYdHS/A+3OcW8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 21/45] drm: msm: a6xx: fix gpu failure after
 system resume
Date: Mon, 10 Aug 2020 15:11:29 -0400
Message-Id: <20200810191153.3794446-21-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810191153.3794446-1-sashal@kernel.org>
References: <20200810191153.3794446-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Matthias Kaehlcke <mka@chromium.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akhil P Oommen <akhilpo@codeaurora.org>

[ Upstream commit 57c0bd517c06b088106b0236ed604056c8e06da5 ]

On targets where GMU is available, GMU takes over the ownership of GX GDSC
during its initialization. So, move the refcount-get on GX PD before we
initialize the GMU. This ensures that nobody can collapse the GX GDSC
once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
during GPU wake up during a system resume.

Reported-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e62b286947a7f..9ea748667fab0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -713,10 +713,19 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Turn on the resources */
 	pm_runtime_get_sync(gmu->dev);
 
+	/*
+	 * "enable" the GX power domain which won't actually do anything but it
+	 * will make sure that the refcounting is correct in case we need to
+	 * bring down the GX after a GMU failure
+	 */
+	if (!IS_ERR_OR_NULL(gmu->gxpd))
+		pm_runtime_get_sync(gmu->gxpd);
+
 	/* Use a known rate to bring up the GMU */
 	clk_set_rate(gmu->core_clk, 200000000);
 	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
 	if (ret) {
+		pm_runtime_put(gmu->gxpd);
 		pm_runtime_put(gmu->dev);
 		return ret;
 	}
@@ -752,19 +761,12 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the GPU to the highest power frequency */
 	__a6xx_gmu_set_freq(gmu, gmu->nr_gpu_freqs - 1);
 
-	/*
-	 * "enable" the GX power domain which won't actually do anything but it
-	 * will make sure that the refcounting is correct in case we need to
-	 * bring down the GX after a GMU failure
-	 */
-	if (!IS_ERR_OR_NULL(gmu->gxpd))
-		pm_runtime_get(gmu->gxpd);
-
 out:
 	/* On failure, shut down the GMU to leave it in a good state */
 	if (ret) {
 		disable_irq(gmu->gmu_irq);
 		a6xx_rpmh_stop(gmu);
+		pm_runtime_put(gmu->gxpd);
 		pm_runtime_put(gmu->dev);
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
