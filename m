Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B833FA485
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 10:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2206EA1F;
	Sat, 28 Aug 2021 08:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8AB566EA1F
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 08:46:14 +0000 (UTC)
Received: from BJHW-Mail-Ex15.internal.baidu.com (unknown [10.127.64.38])
 by Forcepoint Email with ESMTPS id AA750D0E582ED5DFDEEB;
 Sat, 28 Aug 2021 16:46:13 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:46:13 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.20) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:46:12 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>, "Cai
 Huoqing" <caihuoqing@baidu.com>
Subject: [PATCH] drm/nouveau: Make use of the helper macro SET_RUNTIME_PM_OPS()
Date: Sat, 28 Aug 2021 16:45:59 +0800
Message-ID: <20210828084559.1510-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.31.62.20]
X-ClientProxiedBy: BC-Mail-Ex17.internal.baidu.com (172.31.51.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex15_2021-08-28 16:46:13:656
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

Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
operators ".runtime_suspend/.runtime_resume/.runtime_idle", because
the SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
in to make code a little clearer, a little more concise.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1f828c9f691c..ba81645b4f2a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1258,15 +1258,14 @@ static void nouveau_display_options(void)
 }
 
 static const struct dev_pm_ops nouveau_pm_ops = {
+	SET_RUNTIME_PM_OPS(nouveau_pmops_runtime_suspend,
+			   nouveau_pmops_runtime_resume, nouveau_pmops_runtime_idle)
 	.suspend = nouveau_pmops_suspend,
 	.resume = nouveau_pmops_resume,
 	.freeze = nouveau_pmops_freeze,
 	.thaw = nouveau_pmops_thaw,
 	.poweroff = nouveau_pmops_freeze,
 	.restore = nouveau_pmops_resume,
-	.runtime_suspend = nouveau_pmops_runtime_suspend,
-	.runtime_resume = nouveau_pmops_runtime_resume,
-	.runtime_idle = nouveau_pmops_runtime_idle,
 };
 
 static struct pci_driver
-- 
2.25.1

