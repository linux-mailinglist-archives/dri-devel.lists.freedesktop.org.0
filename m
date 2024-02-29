Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036EB86D1C2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 19:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B72E10E58E;
	Thu, 29 Feb 2024 18:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IgwLOh3/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C2310E4A3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 18:14:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 58D1660DE7;
 Thu, 29 Feb 2024 18:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F53C433F1;
 Thu, 29 Feb 2024 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709230447;
 bh=puQJBrcPK5Z3RCYzqNZihfMO0Tg5uf4iB/iw30xgVpg=;
 h=From:To:Cc:Subject:Date:From;
 b=IgwLOh3/lmwXC0mbjV854Af52B9itc20DwBDBtiL+ZCpBmeB/rhY7uPTW9t45066c
 u760pkPWHfLKADi2HRS1Lm2VzYNXbbYQ5n2FK2cfgJpJMWgU4blPaYQWINfPCncMsg
 RtOAAGd5AaIT8CAw7W9z8AEon1NtdPyptUww6kaibhwSpX2SPWIUC+etomWPM0q3bV
 jyrdVowQI3n6qBOJAHnRM+HqyKMQ6vz9vBMOAlwFOseItcTwtMvcNgGksBvhOC4Azm
 tdOJlS+CdFLB9eWTe1xRX41UPYh8oRiYFuwU6dd/LqTng83HNykivVnnEvdR2Ld27e
 RaWr2REeoswMA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] drm/fsl-dcu: remove unnecessary NULL checks
Date: Thu, 29 Feb 2024 12:14:04 -0600
Message-Id: <20240229181404.352531-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

The power management callbacks are never called unless .probe() has already
returned success, which means it has set drvdata to a non-NULL pointer, so
"dev" can never be NULL in the other callbacks.

Remove the unnecessary checks.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index ab6c0c6cd0e2..ca23a2ca16bb 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -170,9 +170,6 @@ static int fsl_dcu_drm_pm_suspend(struct device *dev)
 	struct fsl_dcu_drm_device *fsl_dev = dev_get_drvdata(dev);
 	int ret;
 
-	if (!fsl_dev)
-		return 0;
-
 	disable_irq(fsl_dev->irq);
 
 	ret = drm_mode_config_helper_suspend(fsl_dev->drm);
@@ -191,9 +188,6 @@ static int fsl_dcu_drm_pm_resume(struct device *dev)
 	struct fsl_dcu_drm_device *fsl_dev = dev_get_drvdata(dev);
 	int ret;
 
-	if (!fsl_dev)
-		return 0;
-
 	ret = clk_prepare_enable(fsl_dev->clk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable dcu clk\n");
-- 
2.34.1

