Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1D70E033
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D8710E452;
	Tue, 23 May 2023 15:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36CA10E452;
 Tue, 23 May 2023 15:17:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06C85618E6;
 Tue, 23 May 2023 15:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6381BC433D2;
 Tue, 23 May 2023 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684855061;
 bh=D2TI28zRqMeP33qD4AGJWV2hUnE/pn90ek046LImn8g=;
 h=From:To:Cc:Subject:Date:From;
 b=aCoBt0h0f7NnX7GHkpKHx5gX/kOf9gAf60zsdhyzmiEFf+xCbWPbmRlqVY2L+G3uB
 qHsIFCdiq1Vo2YL79EGMRddXfA7JRKvA2aXHN0efIAUqdMgUpU70iS9t8yoNaPh4KZ
 DyrY+bUPUsYjBE6py0YTCxEurL/YMVOizJBEywAwYU5NHi4oUJaHRd+XeYfAgLuyZM
 0z0XPl9Zw2kcaFZWuqLwG09mIZVspbZef7/Yz3A5M7mw6llm7VBYZ3skX6OCps4Jpx
 zj9Lh+ZaiZVKPIBANRvV69ER6euCgEo++kYy6qqBNCFycbhItcIyZKJY30Y9NKIhgv
 Dsmk9u8YB0CZw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1q1Tlg-0007O5-3D; Tue, 23 May 2023 17:17:44 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] Revert "drm/msm/dp: set self refresh aware based on PSR
 support"
Date: Tue, 23 May 2023 17:16:46 +0200
Message-Id: <20230523151646.28366-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 1844e680d56bb0c4e0489138f2b7ba2dc1c988e3.

PSR support clearly is not ready for mainline and specifically breaks
virtual terminals which are no longer updated when PSR is enabled (e.g.
no keyboard input is echoed, no cursor blink).

Disable PSR support for now by reverting commit 1844e680d56b
("drm/msm/dp: set self refresh aware based on PSR support").

Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

Bjorn reported that PSR support broke virtual terminals two months ago, 
but this is still broken in 6.4-rc3:

	https://lore.kernel.org/lkml/20230326162723.3lo6pnsfdwzsvbhj@ripper/

despite the following series that claimed to address this:

	https://lore.kernel.org/lkml/1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com

Let's revert until this has been fixed properly.

Johan


 drivers/gpu/drm/msm/dp/dp_drm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 785d76639497..029e08c5bb06 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -117,8 +117,6 @@ static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 	if (WARN_ON(!conn_state))
 		return -ENODEV;
 
-	conn_state->self_refresh_aware = dp->psr_supported;
-
 	if (!conn_state->crtc || !crtc_state)
 		return 0;
 
-- 
2.39.3

