Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F84537E08
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3174E10EADD;
	Mon, 30 May 2022 13:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBA510EADD;
 Mon, 30 May 2022 13:48:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9394A61024;
 Mon, 30 May 2022 13:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDB9C341C0;
 Mon, 30 May 2022 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918493;
 bh=k9u9j8aY1zKKEsAw274pxYRcOYeWowMXMlTUdX+0YAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XxLZu0yoXJAdMSTUCiXePYMdpwLzF0RfZxC0AC6yD5PSTNU1231V5mUNN7OdalinZ
 p8NT62Idj422Vd9lFEz66+g3jiu1UAxP9+3NHJ/b5qaD/FkwK4LiGRNsZukvHOK5nZ
 VBVBb30/KFvqoj5c47aHbm+8F9T0yuhAADpaZSUnoU/AC0uWfyO1eyuBAMA1bHCrwV
 Evsfyw3k25Es1ndRaUkXQuEffIUlp/8o2Udw4vaad7auzGAv8sE+7eb+oCd6jAqBM4
 7cLOTUuMB50r/y7NSr7rsjHsa/L5KQVpDy3akfgXf6ek4/dw60LoS2vSlB2gY2/P77
 nhiYvaymIvkdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 26/55] drm: msm: fix error check return value of
 irq_of_parse_and_map()
Date: Mon, 30 May 2022 09:46:32 -0400
Message-Id: <20220530134701.1935933-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134701.1935933-1-sashal@kernel.org>
References: <20220530134701.1935933-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dianders@chromium.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, vulab@iscas.ac.cn,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

[ Upstream commit b9e4f1d2b505df8e2439b63e67afaa287c1c43e2 ]

The irq_of_parse_and_map() function returns 0 on failure, and does not
return an negative value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/483175/
Link: https://lore.kernel.org/r/20220424031959.3172406-1-lv.ruyi@zte.com.cn
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 77823ccdd0f8..39d0082eedcc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -698,9 +698,9 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	pdev = mdp5_kms->pdev;
 
 	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (irq < 0) {
-		ret = irq;
-		DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", ret);
+	if (!irq) {
+		ret = -EINVAL;
+		DRM_DEV_ERROR(&pdev->dev, "failed to get irq\n");
 		goto fail;
 	}
 
-- 
2.35.1

