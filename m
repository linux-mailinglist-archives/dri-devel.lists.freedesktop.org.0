Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161D8558CD9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 03:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5567B10E2F0;
	Fri, 24 Jun 2022 01:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F4B10E69B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 01:33:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VHEl8m6_1656034321; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VHEl8m6_1656034321) by smtp.aliyun-inc.com;
 Fri, 24 Jun 2022 09:33:17 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: paul@crapouillou.net
Subject: [PATCH] drm/ingenic: Use resource_size function on resource object
Date: Fri, 24 Jun 2022 09:31:59 +0800
Message-Id: <20220624013159.88646-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was found by coccicheck:

./drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1149:35-38: WARNING: Suspicious code. resource_size is maybe missing with res.

Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 2c559885347a..5514b163999f 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1146,7 +1146,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	}
 
 	regmap_config = ingenic_drm_regmap_config;
-	regmap_config.max_register = res->end - res->start;
+	regmap_config.max_register = resource_size(res);
 	priv->map = devm_regmap_init_mmio(dev, base,
 					  &regmap_config);
 	if (IS_ERR(priv->map)) {
-- 
2.20.1.7.g153144c

