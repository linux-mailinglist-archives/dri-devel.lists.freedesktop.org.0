Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A89732DB6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 12:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B4D10E5E9;
	Fri, 16 Jun 2023 10:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6210E5E7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 10:27:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57E36635F3;
 Fri, 16 Jun 2023 10:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901D3C433C0;
 Fri, 16 Jun 2023 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686911231;
 bh=pIJzDSdZm6E+NnIwO57Xq2I4agMZenBysCO9cU1z8zM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eqwXIMYLGbVLIS1XqMe5LORdtgIOhyVC+O1J1pgH+MDkPDsAo6oPssMRlPXnzD1ZL
 pPOKp5+dyg7ei6S5y7mT2+fayW/M00mrb+xlcBsi0ifU5YSrxJ6si1xFffUbXjLBIc
 h49GPyQ/ylfjK4gs1ox88t8LjAUAPzV9PwYosDuxqi8aA1zmbhSFd4SGE/xEFkfz0Q
 FaNY7pqW3TByguTRbpHHCLxV6EM7Q7uG1Ev7IzzZOTTe1wo+0ffHLVWkt4GOk3Qgww
 hkXdLybWKSusYbql8mQYWlSpOQscNMayJsB5PW32BbmffwfIVK5wzypqmc36QQAMML
 qezrc9pzX+gpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 21/26] drm/exynos: fix race condition UAF in
 exynos_g2d_exec_ioctl
Date: Fri, 16 Jun 2023 06:26:18 -0400
Message-Id: <20230616102625.673454-21-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102625.673454-1-sashal@kernel.org>
References: <20230616102625.673454-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.34
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
Cc: Sasha Levin <sashal@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Min Li <lm0963hack@gmail.com>, sw0312.kim@samsung.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org,
 Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Min Li <lm0963hack@gmail.com>

[ Upstream commit 48bfd02569f5db49cc033f259e66d57aa6efc9a3 ]

If it is async, runqueue_node is freed in g2d_runqueue_worker on another
worker thread. So in extreme cases, if g2d_runqueue_worker runs first, and
then executes the following if statement, there will be use-after-free.

Signed-off-by: Min Li <lm0963hack@gmail.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 471fd6c8135f2..27613abeed961 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1335,7 +1335,7 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_dev, void *data,
 	/* Let the runqueue know that there is work to do. */
 	queue_work(g2d->g2d_workq, &g2d->runqueue_work);
 
-	if (runqueue_node->async)
+	if (req->async)
 		goto out;
 
 	wait_for_completion(&runqueue_node->complete);
-- 
2.39.2

