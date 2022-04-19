Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5B2507782
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 20:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AE210EF8E;
	Tue, 19 Apr 2022 18:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7774110EF8E;
 Tue, 19 Apr 2022 18:15:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AE4561447;
 Tue, 19 Apr 2022 18:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFD6C385AB;
 Tue, 19 Apr 2022 18:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650392117;
 bh=9WL+ylVR4jrcqB//eMMexkdixOMruuuOM18tCDAJx8U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jEEuhnh7Byf0UmFdV+GZhCDUumBHvxH+w+eEn/FZmf6uEZSpcz5K+pYvnDuPpr+F9
 TXCtCildA9j8s2UCyTRfbz5iSXNDiPtCPk0YoAJ5NcjDFu/ELI4Rgbr2PZm5sfJ9Tq
 jPtjzqYeajdw/tnb31Ntpppr5zNwojyAFVKJ9+hrv7maPHLQ4RL63jjjXuniogGQ4I
 0QcZ3wlZK+iMZrYmGLtQeLuDSAqQOrXdfmdz3qn5/oJ/rtWh33BRaNUPZCan3X7Nex
 FHyWMnWP/i3cDEE6w/qeHCc+CLpfsS+o3VpamqFz4woEQp0CQSBcc/IH+lMTRunLUP
 GNvB5qHuNEgPw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 11/14] drm/msm: Stop using iommu_present()
Date: Tue, 19 Apr 2022 14:14:40 -0400
Message-Id: <20220419181444.485959-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419181444.485959-1-sashal@kernel.org>
References: <20220419181444.485959-1-sashal@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 airlied@linux.ie, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robin Murphy <robin.murphy@arm.com>

[ Upstream commit e2a88eabb02410267519b838fb9b79f5206769be ]

Even if some IOMMU has registered itself on the platform "bus", that
doesn't necessarily mean it provides translation for the device we
care about. Replace iommu_present() with a more appropriate check.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
Patchwork: https://patchwork.freedesktop.org/patch/480707/
Link: https://lore.kernel.org/r/5ab4f4574d7f3e042261da702d493ee40d003356.1649168268.git.robin.murphy@arm.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 407b51cf6790..7322df9cf673 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -303,7 +303,7 @@ bool msm_use_mmu(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 
 	/* a2xx comes with its own MMU */
-	return priv->is_a2xx || iommu_present(&platform_bus_type);
+	return priv->is_a2xx || device_iommu_mapped(dev->dev);
 }
 
 static int msm_init_vram(struct drm_device *dev)
-- 
2.35.1

