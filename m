Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 513674CB856
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8B610EE9A;
	Thu,  3 Mar 2022 08:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C110F10EE9A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 08:08:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R411e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0V66azns_1646294894; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0V66azns_1646294894) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 03 Mar 2022 16:08:18 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: paul@crapouillou.net
Subject: [PATCH] drm/ingenic: Use resource_size function on resource object
Date: Thu,  3 Mar 2022 16:08:12 +0800
Message-Id: <20220303080812.27342-1-jiapeng.chong@linux.alibaba.com>
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
 Abaci Robot <abaci@linux.alibaba.com>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up the following coccicheck warning:

./drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1110:35-38: WARNING:
Suspicious code. resource_size is maybe missing with res.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index ac52b49bf901..52ad5cab64bb 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1107,7 +1107,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	}
 
 	regmap_config = ingenic_drm_regmap_config;
-	regmap_config.max_register = res->end - res->start;
+	regmap_config.max_register = resource_size(res);
 	priv->map = devm_regmap_init_mmio(dev, base,
 					  &regmap_config);
 	if (IS_ERR(priv->map)) {
-- 
2.20.1.7.g153144c

