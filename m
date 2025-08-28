Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C856B3B41A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7713310EB5A;
	Fri, 29 Aug 2025 07:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Thu, 28 Aug 2025 13:00:28 UTC
Received: from mail-m19731111.qiye.163.com (mail-m19731111.qiye.163.com
 [220.197.31.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2BC10E999
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:00:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [218.94.118.90])
 by smtp.qiye.163.com (Hmail) with ESMTP id f5619b22;
 Thu, 28 Aug 2025 20:55:20 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: linux@armlinux.org.uk, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Zhen Ni <zhen.ni@easystack.cn>
Subject: [PATCH] drm/bridge: tda998x: use irq_get_trigger_type()
Date: Thu, 28 Aug 2025 20:55:10 +0800
Message-Id: <20250828125510.1576025-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98f0bf36c50229kunm3951bb7c4ce831
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTx5CVh4eT04dSBlLQ0sdTFYVFAkWGhdVGRETFh
 oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
 VKQktLWQY+
X-Mailman-Approved-At: Fri, 29 Aug 2025 07:17:00 +0000
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

Use irq_get_trigger_type() to replace getting the irq data then the
type in two steps.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index e636459d9185..4b56dfcfe239 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -1876,8 +1876,7 @@ static int tda998x_create(struct device *dev)
 		/* init read EDID waitqueue and HDP work */
 		init_waitqueue_head(&priv->wq_edid);
 
-		irq_flags =
-			irqd_get_trigger_type(irq_get_irq_data(client->irq));
+		irq_flags = irq_get_trigger_type(client->irq);
 
 		priv->cec_glue.irq_flags = irq_flags;
 
-- 
2.20.1

