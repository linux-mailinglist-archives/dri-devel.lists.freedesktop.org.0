Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1560B3FA483
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 10:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE52A6EA19;
	Sat, 28 Aug 2021 08:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3341F6EA19;
 Sat, 28 Aug 2021 08:41:38 +0000 (UTC)
Received: from BJHW-Mail-Ex13.internal.baidu.com (unknown [10.127.64.36])
 by Forcepoint Email with ESMTPS id 81C3D886AAE64A4E4065;
 Sat, 28 Aug 2021 16:41:32 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:41:32 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.18) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:41:31 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Cai
 Huoqing" <caihuoqing@baidu.com>
Subject: [PATCH] drm/amdgpu: Make use of the helper macro SET_RUNTIME_PM_OPS()
Date: Sat, 28 Aug 2021 16:41:16 +0800
Message-ID: <20210828084116.1642-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.31.62.18]
X-ClientProxiedBy: BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex13_2021-08-28 16:41:32:627
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b6640291f980..9e5fb8d2e0e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1699,6 +1699,8 @@ long amdgpu_drm_ioctl(struct file *filp,
 }
 
 static const struct dev_pm_ops amdgpu_pm_ops = {
+	SET_RUNTIME_PM_OPS(amdgpu_pmops_runtime_suspend,
+			   amdgpu_pmops_runtime_resume, amdgpu_pmops_runtime_idle)
 	.prepare = amdgpu_pmops_prepare,
 	.complete = amdgpu_pmops_complete,
 	.suspend = amdgpu_pmops_suspend,
@@ -1707,9 +1709,6 @@ static const struct dev_pm_ops amdgpu_pm_ops = {
 	.thaw = amdgpu_pmops_thaw,
 	.poweroff = amdgpu_pmops_poweroff,
 	.restore = amdgpu_pmops_restore,
-	.runtime_suspend = amdgpu_pmops_runtime_suspend,
-	.runtime_resume = amdgpu_pmops_runtime_resume,
-	.runtime_idle = amdgpu_pmops_runtime_idle,
 };
 
 static int amdgpu_flush(struct file *f, fl_owner_t id)
-- 
2.25.1

