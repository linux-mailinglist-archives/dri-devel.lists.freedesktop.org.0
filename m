Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BD739E1B8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 18:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FC66E903;
	Mon,  7 Jun 2021 16:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF636E903
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 16:14:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD6B56147D;
 Mon,  7 Jun 2021 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623082462;
 bh=EoTNmkIv+BtWajlT5rFMTZnF88Sm8j3UhB6yO/D6bOE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YJlJXHOuP/fOjQ43iqNC0vbEyOxPeMFISRSyo6dk09fWqkhvkJlVGHw3EcJxpekKH
 akAQZloS5sKdmLJRlt462m5z1hXa9EKgUN6i1h04KOMaGE3C0615qq5BspWkPpnjiz
 yrYi4TXm9Y1BC31JFfl7c+bWg49rfYavs9Ctnby73hL/4VSVxTjbgMCwNC/+mNjc9z
 IpUwE3gFdtV0ooKexoFcqrlGKmXrK2MPlWNt+6cldN/3O+bhq92EcM9vzOeh9Mx9Ex
 Imnr4d8stLkWW8Nla67tes/qCUgNOmCLpsOsKhLes4TiY0UGiXvI92/Gin/43Vt4sF
 UlFYXq2rUeiGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 09/29] drm/tegra: sor: Do not leak runtime PM
 reference
Date: Mon,  7 Jun 2021 12:13:50 -0400
Message-Id: <20210607161410.3584036-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607161410.3584036-1-sashal@kernel.org>
References: <20210607161410.3584036-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, "Pavel Machek \(CIP\)" <pavel@denx.de>,
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Pavel Machek (CIP)" <pavel@denx.de>

[ Upstream commit 73a395c46704304b96bc5e2ee19be31124025c0c ]

It's theoretically possible for the runtime PM reference to leak if the
code fails anywhere between the pm_runtime_resume_and_get() and
pm_runtime_put() calls, so make sure to release the runtime PM reference
in that case.

Practically this will never happen because none of the functions will
fail on Tegra, but it's better for the code to be pedantic in case these
assumptions will ever become wrong.

Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
[treding@nvidia.com: add commit message]
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/sor.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 6c3d22165239..0419b6105c8a 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2875,21 +2875,21 @@ static int tegra_sor_init(struct host1x_client *client)
 		if (err < 0) {
 			dev_err(sor->dev, "failed to acquire SOR reset: %d\n",
 				err);
-			return err;
+			goto rpm_put;
 		}
 
 		err = reset_control_assert(sor->rst);
 		if (err < 0) {
 			dev_err(sor->dev, "failed to assert SOR reset: %d\n",
 				err);
-			return err;
+			goto rpm_put;
 		}
 	}
 
 	err = clk_prepare_enable(sor->clk);
 	if (err < 0) {
 		dev_err(sor->dev, "failed to enable clock: %d\n", err);
-		return err;
+		goto rpm_put;
 	}
 
 	usleep_range(1000, 3000);
@@ -2900,7 +2900,7 @@ static int tegra_sor_init(struct host1x_client *client)
 			dev_err(sor->dev, "failed to deassert SOR reset: %d\n",
 				err);
 			clk_disable_unprepare(sor->clk);
-			return err;
+			goto rpm_put;
 		}
 
 		reset_control_release(sor->rst);
@@ -2929,6 +2929,12 @@ static int tegra_sor_init(struct host1x_client *client)
 	tegra_sor_writel(sor, value, SOR_INT_MASK);
 
 	return 0;
+
+rpm_put:
+	if (sor->rst)
+		pm_runtime_put(sor->dev);
+
+	return err;
 }
 
 static int tegra_sor_exit(struct host1x_client *client)
-- 
2.30.2

