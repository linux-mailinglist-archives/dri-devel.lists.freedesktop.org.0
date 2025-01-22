Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6FCA18A56
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 04:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A2110E2E0;
	Wed, 22 Jan 2025 03:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="UyoLNlt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 259AD10E2E0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 03:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QRjh9
 FhrnaHu0S6KpqI8qiqynan6VGuEAgxuDFjUP/U=; b=UyoLNlt6vmCgZ+SJU1ru9
 gffJweKRjs98BGRmGx6BBDYGF2luHg3g+ZWa2blkEPGxtfdEivo1bO1Yqx3hVAy3
 6n2tUSlqih1Rf5dCiYmsAQXrCzsLSHtq4x8uzsRp1e8g6Wu4QnMN/+apgMPqWElQ
 HEMYAzsE4o3pnLVSmp1Il8=
Received: from localhost.localdomain (unknown [116.128.244.169])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgAn0lmmX5BnaACMLQ--.47927S2;
 Wed, 22 Jan 2025 11:02:00 +0800 (CST)
From: oushixiong1025@163.com
To: Joel Stanley <joel@jms.id.au>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v2] drm/aspeed: Use devm_platform_get_and_ioremap_resource()
Date: Wed, 22 Jan 2025 11:01:55 +0800
Message-Id: <20250122030155.57802-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgAn0lmmX5BnaACMLQ--.47927S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWfCryfWFWUJr13CryxAFb_yoWDWFcE9F
 48urs3XrW7AryDt3yjvanxCFyIkF9agrWrGF18KaySv3W7Z34DWryUur92qr1Y9wsayF95
 t3WUXr17A3s3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbqQ6tUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXAPcD2eQUvPxtQAAse
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

Convert platform_get_resource(), devm_ioremap_resource() to a single call to
devm_platform_get_and_ioremap_resource().

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
V1 -> V2: Add Missing commit message.

 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index a7a6b70220eb..33f81b53771d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -146,8 +146,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	struct resource *res;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(drm->dev, res);
+	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.25.1

