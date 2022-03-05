Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F64CE4C5
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 13:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E1410E33F;
	Sat,  5 Mar 2022 12:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9819410E33F
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Mar 2022 12:32:06 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K9kb80KzXzdbH0;
 Sat,  5 Mar 2022 20:30:44 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Sat, 5 Mar
 2022 20:32:03 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <thierry.reding@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jonathanh@nvidia.com>, <mperttunen@nvidia.com>
Subject: [PATCH -next] drm/tegra: vic: Fix build warning When CONFIG_PM=n
Date: Sat, 5 Mar 2022 20:32:00 +0800
Message-ID: <20220305123200.16572-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500007.china.huawei.com (7.192.104.62)
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
Cc: linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/tegra/vic.c:326:12: error: ‘vic_runtime_suspend’ defined but not used [-Werror=unused-function]
 static int vic_runtime_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/tegra/vic.c:292:12: error: ‘vic_runtime_resume’ defined but not used [-Werror=unused-function]
 static int vic_runtime_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~

Mark it as __maybe_unused.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/tegra/vic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 1e342fa3d27b..b25a6c7127b3 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -289,7 +289,7 @@ static int vic_load_firmware(struct vic *vic)
 }
 
 
-static int vic_runtime_resume(struct device *dev)
+static int __maybe_unused vic_runtime_resume(struct device *dev)
 {
 	struct vic *vic = dev_get_drvdata(dev);
 	int err;
@@ -323,7 +323,7 @@ static int vic_runtime_resume(struct device *dev)
 	return err;
 }
 
-static int vic_runtime_suspend(struct device *dev)
+static int __maybe_unused vic_runtime_suspend(struct device *dev)
 {
 	struct vic *vic = dev_get_drvdata(dev);
 	int err;
-- 
2.17.1

