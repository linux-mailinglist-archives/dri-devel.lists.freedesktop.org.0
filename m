Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CEC3FA484
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 10:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFC06EA1B;
	Sat, 28 Aug 2021 08:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id A98AB6EA1B
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 08:43:50 +0000 (UTC)
Received: from BJHW-Mail-Ex14.internal.baidu.com (unknown [10.127.64.37])
 by Forcepoint Email with ESMTPS id 7376D988BEC362931DEF;
 Sat, 28 Aug 2021 16:43:49 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex14.internal.baidu.com (10.127.64.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:43:49 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.13) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:43:47 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <patrik.r.jakobsson@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] drm/gma500: Make use of the helper macro SET_RUNTIME_PM_OPS()
Date: Sat, 28 Aug 2021 16:43:34 +0800
Message-ID: <20210828084334.239-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.31.62.13]
X-ClientProxiedBy: BC-Mail-Ex14.internal.baidu.com (172.31.51.54) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex14_2021-08-28 16:43:49:410
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
 drivers/gpu/drm/gma500/psb_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 58bce1a60a4d..d5bfa1d5c074 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -489,14 +489,12 @@ static void psb_pci_remove(struct pci_dev *pdev)
 }
 
 static const struct dev_pm_ops psb_pm_ops = {
+	SET_RUNTIME_PM_OPS(psb_runtime_suspend, psb_runtime_resume, psb_runtime_idle)
 	.resume = gma_power_resume,
 	.suspend = gma_power_suspend,
 	.thaw = gma_power_thaw,
 	.freeze = gma_power_freeze,
 	.restore = gma_power_restore,
-	.runtime_suspend = psb_runtime_suspend,
-	.runtime_resume = psb_runtime_resume,
-	.runtime_idle = psb_runtime_idle,
 };
 
 static const struct file_operations psb_gem_fops = {
-- 
2.25.1

