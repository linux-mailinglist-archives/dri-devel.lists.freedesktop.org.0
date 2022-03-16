Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 644294DB803
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 19:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3167210E930;
	Wed, 16 Mar 2022 18:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD2F10E930
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 18:37:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F0B6B81CA3;
 Wed, 16 Mar 2022 18:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF1AC340F7;
 Wed, 16 Mar 2022 18:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647455850;
 bh=SIbAZruduzRSnrWzOuWAI4SxaF18hsmgKxmS/1M5bhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M7pAnQaGxH5XguHxVvJXRImcQeTVI3Ghe06RgDHhhIeS2LKTdJ5665C2pJ5SdYO+7
 Di2cKTvLZSwnBz71+ZkTKj6c8kFx9zThPZCxgSspTu24wQJPs59+/IYh9gqBDNoM0p
 GzeFUdcI+WWA0Pioii1/wbYWRjGV03+Dc+DnuF5sBGLI1FT/wCbTjT3CowmUgylqP8
 /aOUAkBV7+slOzBawZSK0Q6+rP77MxjawrlvTZUAMclTdgyLVYKobaUFFyo01GQm5A
 D/Zy9AtQ+M4e4OGlPYqOEfLm8Toee2Tg8HVhC3AVBbtQ6wQ3v5TksI/TbTDXwO5gIZ
 WMJ7CvOwTgfiQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] drm/tegra: vic: fix unused-function warnings
Date: Wed, 16 Mar 2022 19:36:47 +0100
Message-Id: <20220316183708.1505846-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220316183708.1505846-1-arnd@kernel.org>
References: <20220316183708.1505846-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The use of the old-style SET_RUNTIME_PM_OPS() and
SET_SYSTEM_SLEEP_PM_OPS() macros requires function definitions
to be hidden to avoid

drivers/gpu/drm/tegra/vic.c:326:12: error: 'vic_runtime_suspend' defined but not used [-Werror=unused-function]
  326 | static int vic_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/tegra/vic.c:292:12: error: 'vic_runtime_resume' defined but not used [-Werror=unused-function]
  292 | static int vic_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~

Use the new-style SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS() instead.

Fixes: 1e15f5b911d6 ("drm/tegra: vic: Stop channel on suspend")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tegra/vic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

I see this warning on 5.17-rc8, but did not test it on linux-next,
which may already have a fix.

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 1e342fa3d27b..f56f5921a8c2 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -513,9 +513,8 @@ static int vic_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops vic_pm_ops = {
-	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.29.2

