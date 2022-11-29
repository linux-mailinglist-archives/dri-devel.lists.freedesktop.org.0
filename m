Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BBC63C829
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C2F10E333;
	Tue, 29 Nov 2022 19:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3183910E327
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749650; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1RX/ZzdghYIWu8xoGXfoZAVlUhjaMzV0pc+gin64as=;
 b=3OHE2ic0oVpFuxqPpyT/Mdaw8vhcmHTmDgShalr2vdOMtgU5/1cDtGIHY/R3cgU4ilZQ05
 rXDgQkFqIejTG6ONSv2LH+xtVA0yM0dFxPgd18IEAU4J2zBcSUjXjRi0UoEvPITs32F0vv
 UKHgf7gGZwN2SbUobuvcqHtqQsSI3Ao=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 23/26] drm: vc4: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:19:39 +0000
Message-Id: <20221129191942.138244-10-paul@crapouillou.net>
In-Reply-To: <20221129191942.138244-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the RUNTIME_PM_OPS() and pm_ptr() macros to handle the
.runtime_suspend/.runtime_resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_PM is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 56abb0d6bc39..6000c7032b92 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -368,7 +368,6 @@ void vc4_v3d_bin_bo_put(struct vc4_dev *vc4)
 	mutex_unlock(&vc4->bin_bo_lock);
 }
 
-#ifdef CONFIG_PM
 static int vc4_v3d_runtime_suspend(struct device *dev)
 {
 	struct vc4_v3d *v3d = dev_get_drvdata(dev);
@@ -397,7 +396,6 @@ static int vc4_v3d_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 int vc4_v3d_debugfs_init(struct drm_minor *minor)
 {
@@ -525,7 +523,7 @@ static void vc4_v3d_unbind(struct device *dev, struct device *master,
 }
 
 static const struct dev_pm_ops vc4_v3d_pm_ops = {
-	SET_RUNTIME_PM_OPS(vc4_v3d_runtime_suspend, vc4_v3d_runtime_resume, NULL)
+	RUNTIME_PM_OPS(vc4_v3d_runtime_suspend, vc4_v3d_runtime_resume, NULL)
 };
 
 static const struct component_ops vc4_v3d_ops = {
@@ -557,6 +555,6 @@ struct platform_driver vc4_v3d_driver = {
 	.driver = {
 		.name = "vc4_v3d",
 		.of_match_table = vc4_v3d_dt_match,
-		.pm = &vc4_v3d_pm_ops,
+		.pm = pm_ptr(&vc4_v3d_pm_ops),
 	},
 };
-- 
2.35.1

