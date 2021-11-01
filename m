Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C1E441ADD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 12:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92176E0BC;
	Mon,  1 Nov 2021 11:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48A96E0BC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=kuLy/8jiUbD+nZ5OSmtZpAkZEkowU/+2O9rn5AK/AIQ=; b=Pv
 wwrJWqEA66dBac0YPxQHvqCPR5NMWbuE+zWGv94t2awG4N7lfHMyQxxYYjxRg8mIX9U0tzZ7kfPz8
 qNfKf/nzg77GRRPgtMQO8LfvEVazaqSGYzbEDSi9JliOZ5CLFZyGyq/bq1jpavOKOGrLqlNX2mW9+
 fPSuHzQshH97AcuwUVBtIFgboXsaHNM5AVcyIXQ7bO6frNlT0Kva5tfJNFAVvIZMv2cTr2LBycwYt
 HQ3qnkzaW5ECx2w7+ueUKnRL6ax0GIWiE5FWOnd2tQ+yJ7VXD9MZF/3cbi7OIfdPEje3X09sFwxY1
 QbN57r3v1rfNZ4vn15+hOb2O94Rm5/RA==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mhVlk-0007Ay-01; Mon, 01 Nov 2021 11:46:28 +0000
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: pass 0 to drm_fbdev_generic_setup()
Date: Mon,  1 Nov 2021 11:46:22 +0000
Message-Id: <20211101114622.813536-1-john@metanate.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow drm_fbdev_generic_setup() to pick the default bpp value for the
framebuffer.

This has no functional impact because the default is 32, given that
mode_config.preferred_depth is not set for Rockchip.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: John Keeping <john@metanate.com>
---
This needs [1] to be applied first.

[1] https://lore.kernel.org/all/20211029115014.264084-1-john@metanate.com

 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 1481181445fd..e37e74998fa9 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -165,7 +165,7 @@ static int rockchip_drm_bind(struct device *dev)
 	if (ret)
 		goto err_kms_helper_poll_fini;
 
-	drm_fbdev_generic_setup(drm_dev, 32);
+	drm_fbdev_generic_setup(drm_dev, 0);
 
 	return 0;
 err_kms_helper_poll_fini:
-- 
2.33.1

