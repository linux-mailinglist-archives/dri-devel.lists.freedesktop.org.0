Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB539E793D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B3E10E632;
	Fri,  6 Dec 2024 19:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="ds8IN9Yh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A9E10E3F7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 11:55:03 +0000 (UTC)
Received: from laptop.lan (unknown [125.33.216.38])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C12DC3FDCA; 
 Fri,  6 Dec 2024 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1733485542;
 bh=NqUN3W1QE8uKX1PduVefoAqn9x75Rt+nVAqamJ38O94=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=ds8IN9YhzmM6Rca8WcY5tZRE4XShCkTXv6lZchhaNO5x485K8vtvnl1j/yiU0eh7F
 Rp74dxfXC4Rq+ZVve9pMmKmt6bdqu69mzoLcYw2Mmt/XxyJnSF0xp1St5CFr0WQk2T
 ZyGIR2AakBu1kz/2JBYbl/wepAk+k6sr6+0K/k4MTP/tKK3sV6lNV4zOidg7Zf0E/g
 T4P5kQ5Z+e9eUvlovdJaEx64K97EmFCCCHeKpcT71htARonJH5wAHVN2hvbF5Sf1GN
 aEhWiJeQxFthq9df7hOQpl2PalP32ivZb0iSvt2Hvc5Hnv9yJ5fU0WNeu4HkAnEU3O
 nSDG9TzrJV0NA==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, simona@ffwll.ch, krzk@kernel.org,
 alim.akhtar@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: Remove unnecessary checking
Date: Fri,  6 Dec 2024 19:45:31 +0800
Message-Id: <20241206114531.1271123-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Dec 2024 19:45:35 +0000
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

It is not needed since drm_atomic_helper_shutdown checks it.

Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2a466d8179f4..461384705cf9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -357,8 +357,7 @@ static void exynos_drm_platform_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
-	if (drm)
-		drm_atomic_helper_shutdown(drm);
+	drm_atomic_helper_shutdown(drm);
 }
 
 static struct platform_driver exynos_drm_platform_driver = {
-- 
2.35.3

