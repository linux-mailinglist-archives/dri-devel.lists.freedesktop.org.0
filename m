Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E91C3D377D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79F56F8F5;
	Fri, 23 Jul 2021 09:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327706F8F5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:16:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A589860EC0;
 Fri, 23 Jul 2021 09:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627031808;
 bh=au86PxqA2mC/AGbvba2BAcsU2LvEED9SySjD6r/5nJU=;
 h=From:To:Cc:Subject:Date:From;
 b=NTuP/2oGEHlnpXXX2Sfr75Vdi8CfXzGaW3DQULzfVypPu7mZl9Vo0xkmG34ozA9UN
 0UROrUFybVrf5gBjGFLTcHA+WBQ98WsOGpuTZP5AKVaHJ6GR6hF27q8T5X7+zw9iyC
 Onht6Vn5+zS/Bvfhnz8pZpCJAk3PcKoczwQR5SJCVwSuAQJdKwbAsDvY12EoYEtIsO
 JRicpjEwIKl4N0V296sOE6UVdz9aD+lofQjbKc3WUuQXju+slkKX4l4LP1w/OUj1n0
 tCcESe20bHMtcO/GubgitJ0Jp3K8CzPis09mgjTFuSyF/EdN+ODF1sFYbdBrMlTDsg
 YjMdh3nL3JB3Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/hisilicon/hibmc: remove an unused variable
Date: Fri, 23 Jul 2021 11:16:34 +0200
Message-Id: <20210723091643.1768874-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Feng <puck.chen@hisilicon.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

A recent patch left an unused variable in place that needs to be
removed:

drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c: In function 'hibmc_unload':
drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:35: error: unused variable 'priv' [-Werror=unused-variable]
  252 |         struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);

Fixes: 39a364a19e03 ("drm/hisilicon/hibmc: Convert to Linux IRQ interfaces")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index f73a8e0ea12e..610fc8e135f9 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -249,7 +249,6 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
 
 static int hibmc_unload(struct drm_device *dev)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	drm_atomic_helper_shutdown(dev);
-- 
2.29.2

