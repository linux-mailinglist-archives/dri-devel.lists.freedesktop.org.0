Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A433FA487
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 10:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBCE6EA28;
	Sat, 28 Aug 2021 08:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83BCC6EA28;
 Sat, 28 Aug 2021 08:51:15 +0000 (UTC)
Received: from BC-Mail-Ex10.internal.baidu.com (unknown [172.31.51.50])
 by Forcepoint Email with ESMTPS id 6D6BC9FA5F98CDF9473D;
 Sat, 28 Aug 2021 16:51:08 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex10.internal.baidu.com (172.31.51.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sat, 28 Aug 2021 16:51:08 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.19) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:51:07 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Cai
 Huoqing" <caihuoqing@baidu.com>
Subject: [PATCH] drm/radeon: Make use of the helper macro SET_RUNTIME_PM_OPS()
Date: Sat, 28 Aug 2021 16:50:52 +0800
Message-ID: <20210828085052.756-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.31.62.19]
X-ClientProxiedBy: BC-Mail-Ex17.internal.baidu.com (172.31.51.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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
 drivers/gpu/drm/radeon/radeon_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index b74cebca1f89..c2eb725e87f6 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -529,15 +529,14 @@ static long radeon_kms_compat_ioctl(struct file *filp, unsigned int cmd, unsigne
 #endif
 
 static const struct dev_pm_ops radeon_pm_ops = {
+	SET_RUNTIME_PM_OPS(radeon_pmops_runtime_suspend,
+			   radeon_pmops_runtime_resume, radeon_pmops_runtime_idle)
 	.suspend = radeon_pmops_suspend,
 	.resume = radeon_pmops_resume,
 	.freeze = radeon_pmops_freeze,
 	.thaw = radeon_pmops_thaw,
 	.poweroff = radeon_pmops_freeze,
 	.restore = radeon_pmops_resume,
-	.runtime_suspend = radeon_pmops_runtime_suspend,
-	.runtime_resume = radeon_pmops_runtime_resume,
-	.runtime_idle = radeon_pmops_runtime_idle,
 };
 
 static const struct file_operations radeon_driver_kms_fops = {
-- 
2.25.1

