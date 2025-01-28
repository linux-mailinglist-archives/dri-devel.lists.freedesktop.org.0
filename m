Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929E5A204B5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 07:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D15010E1C6;
	Tue, 28 Jan 2025 06:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="g/jzuMW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D68710E1C6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 06:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=eeLRa
 5x2KpEUggfoDIJOtFMbFXm1/Aza7Z1ZIM6TNgI=; b=g/jzuMW5cl3G4pv3lzIKJ
 EfDG6v2rhLzYdtLRRKYseNyibIb7ephWWogwE6UQUqkNdHO6oT5k/99uCADcIyIr
 4L1o9Y1SXPr9tm3X/no8qDIj4s1HYIBwc6ZxJVOfx7gbFx2Ye7ygC+RHMhjmlP51
 sp6fXWHQzIgCqtWFzTyuQg=
Received: from DESKTOP-DMSSUQ5.localdomain (unknown [113.247.116.130])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgA3YTOuf5hnTzY4MA--.33100S2;
 Tue, 28 Jan 2025 14:56:46 +0800 (CST)
From: oushixiong1025@163.com
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/bridge: analogix_dp: Use devm_platform_ioremap_resource()
Date: Tue, 28 Jan 2025 14:56:45 +0800
Message-ID: <20250128065645.27140-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgA3YTOuf5hnTzY4MA--.33100S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyUXw1UtF48KrW7tw13Arb_yoW8Gr4kpF
 97Ga1Uur48u3W8Kws5ZrWxAFZxXasFv3yrGr4ftwsa9w1UtF9rAFn8AFy0gas3tFykC3Wf
 XwnxJrykAa4DXFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQFxUUUUUU=
X-Originating-IP: [113.247.116.130]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRviD2eYYD6tVwABsx
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

From: Shixiong Ou <oushixiong@kylinos.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_ioremap_resource().

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bfa88409a7ff..f6e4bdc05ba0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1553,7 +1553,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct analogix_dp_device *dp;
-	struct resource *res;
 	unsigned int irq_flags;
 	int ret;
 
@@ -1605,9 +1604,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		return ERR_CAST(dp->clock);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	dp->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dp->reg_base)) {
 		ret = PTR_ERR(dp->reg_base);
 		goto err_disable_clk;
-- 
2.43.0

