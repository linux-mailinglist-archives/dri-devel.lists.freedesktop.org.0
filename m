Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C585238C299
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364F06E85F;
	Fri, 21 May 2021 09:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C8A6E85F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:06:13 +0000 (UTC)
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fmgby2ykFzQqdm;
 Fri, 21 May 2021 17:02:38 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 17:06:10 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 21 May 2021 17:06:10 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <inki.dae@samsung.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v2] drm/exynos: Use pm_runtime_resume_and_get() to replace
 open coding
Date: Fri, 21 May 2021 17:06:06 +0800
Message-ID: <1621587966-62687-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
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
Cc: Tian Tao <tiantao6@hisilicon.com>, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---

v2: drop unnecessary change about if condition.
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 3821ea7..32672bf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
 	if (mic->enabled)
 		goto unlock;
 
-	ret = pm_runtime_get_sync(mic->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(mic->dev);
+	ret = pm_runtime_resume_and_get(mic->dev);
+	if (ret < 0)
 		goto unlock;
-	}
 
 	mic_set_path(mic, 1);
 
-- 
2.7.4

