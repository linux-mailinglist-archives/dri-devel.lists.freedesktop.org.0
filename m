Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9CDA36224
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6051810ECF7;
	Fri, 14 Feb 2025 15:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="J68A/g/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125D310ECF9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:46:44 +0000 (UTC)
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
 by mail.ispras.ru (Postfix) with ESMTPSA id CE13E4226E0A;
 Fri, 14 Feb 2025 15:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru CE13E4226E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1739548002;
 bh=azVYvGz+zR2oKDiD/DHCe0Eo9mX8jFNm8KX4oYrPrRo=;
 h=From:To:Cc:Subject:Date:From;
 b=J68A/g/HyyWGs0HPXgkWck26xQCEVyt1oVxs37MgcYDLbpM3o9mTv7RdOlT8fyY3i
 hxCNCq/NPT171or0snH649bTlP20UIYSdZBzuUfSsAZXUWjV+8YELxjDzYcd1+R1qX
 yduYt6JJ2C+BhBWpVwNi4UziVZTc+0fcq4dC2tIg=
From: Vitalii Mordan <mordan@ispras.ru>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Vitalii Mordan <mordan@ispras.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Aleksandr Mishin <amishin@t-argos.ru>, Al Viro <viro@zeniv.linux.org.uk>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
Subject: [PATCH v3] gpu: cdns-mhdp8546: fix call balance of mhdp->clk handling
 routines
Date: Fri, 14 Feb 2025 18:46:32 +0300
Message-Id: <20250214154632.1907425-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
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

If the clock mhdp->clk was not enabled in cdns_mhdp_probe(), it should not
be disabled in any path.

The return value of clk_prepare_enable() is not checked. If mhdp->clk was
not enabled, it may be disabled in the error path of cdns_mhdp_probe()
(e.g., if cdns_mhdp_load_firmware() fails) or in cdns_mhdp_remove() after
a successful cdns_mhdp_probe() call.

Use the devm_clk_get_enabled() helper function to ensure proper call
balance for mhdp->clk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
v2: Use devm_clk_get_enabled() helper function, as per Dmitry Baryshkov's
request.
v3: Describe the paths that lead to unbalanced clock handling routines,
as requested by Dmitry Baryshkov

 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d081850e3c03..d4e4f484cbe5 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2463,9 +2463,9 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	if (!mhdp)
 		return -ENOMEM;
 
-	clk = devm_clk_get(dev, NULL);
+	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk)) {
-		dev_err(dev, "couldn't get clk: %ld\n", PTR_ERR(clk));
+		dev_err(dev, "couldn't get and enable clk: %ld\n", PTR_ERR(clk));
 		return PTR_ERR(clk);
 	}
 
@@ -2504,14 +2504,12 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	mhdp->info = of_device_get_match_data(dev);
 
-	clk_prepare_enable(clk);
-
 	pm_runtime_enable(dev);
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "pm_runtime_resume_and_get failed\n");
 		pm_runtime_disable(dev);
-		goto clk_disable;
+		return ret;
 	}
 
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->init) {
@@ -2590,8 +2588,6 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 runtime_put:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
-clk_disable:
-	clk_disable_unprepare(mhdp->clk);
 
 	return ret;
 }
@@ -2632,8 +2628,6 @@ static void cdns_mhdp_remove(struct platform_device *pdev)
 	cancel_work_sync(&mhdp->modeset_retry_work);
 	flush_work(&mhdp->hpd_work);
 	/* Ignoring mhdp->hdcp.check_work and mhdp->hdcp.prop_work here. */
-
-	clk_disable_unprepare(mhdp->clk);
 }
 
 static const struct of_device_id mhdp_ids[] = {
-- 
2.25.1

