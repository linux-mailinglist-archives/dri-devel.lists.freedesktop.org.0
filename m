Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FCDAC5D69
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 00:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1C10E52F;
	Tue, 27 May 2025 22:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="PxYQoF6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C665610E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 22:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=zYroR0JeTvEc5k+dhsSlbbRBRTuaHoKGLn9xLivB2FY=; b=PxYQoF6LWHnUgUJnGKULKZ3wU1
 3B8i0EvtM0aqnuJPZzfTx1F9v65Gro8NfNfVa2b2aYVKa9yjJ7Fea7KFbr+KdnXsT7avL47pFm1h5
 UC31fNC1YYD2pt8Tv/6sLwIgOCCs517tTgkviI7DKCPAKoGzu0r0cvwRVLO9K1Z1V45lG9ESMKDdx
 wt/wJJsdgo17GMnSPzLicjfA49h32GvHJ0uxJBoYDEmwne/kc1+PimtVAnD4ejz+fbVCdZlSc6rph
 rE+u0U1fNT5k5QwnEHgBvQxnyU54916Ef9RzIDPvI1ANnESt+rRobDb1/Bys/kA9EPwgUyOSi2YKG
 JDPu96rQ==;
Received: from i53875bdb.versanet.de ([83.135.91.219]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uK38r-0004UD-Ee; Wed, 28 May 2025 00:51:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dmitry.baryshkov@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] drm/bridge: analogix_dp: Fix clk-disable removal
Date: Wed, 28 May 2025 00:51:19 +0200
Message-ID: <20250527225120.3361663-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary
calls to clk_disable_unprepare() during probing") removed the mismatched
clock_disable calls from analogix_dp_probe.

But that patch was created and sent before
commit e5e9fa9f7aad ("drm/bridge: analogix_dp: Add support to get panel
from the DP AUX bus") was merged, so couldn't know about this change.

So in the original patch the last change is
    if (ret) {
	dev_err(&pdev->dev, "failed to request irq\n");
-		goto err_disable_clk;
+		return ERR_PTR(ret);
    }
    disable_irq(dp->irq);

    return dp;
-
-err_disable_clk:
-	clk_disable_unprepare(dp->clock);
-	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_probe);

the analogix_dp_core.c actually now has the runtime-pm handling between
disable_irq() and return do introducing another goto err_clk_disable there.

So remove that one too and return an error pointer, to not create build
breakage.

Fixes: 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
When I reviewed the original patch, I failed to see that difference :-(
But I do wonder how dim was able to apply the original patch.

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 01201fff59a6..505eec6b819b 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1586,7 +1586,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	pm_runtime_set_autosuspend_delay(dp->dev, 100);
 	ret = devm_pm_runtime_enable(dp->dev);
 	if (ret)
-		goto err_disable_clk;
+		return ERR_PTR(ret);
 
 	return dp;
 }
-- 
2.47.2

