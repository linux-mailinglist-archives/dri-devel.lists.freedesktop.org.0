Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F85E2CB6D0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1028A6EA43;
	Wed,  2 Dec 2020 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC886E519
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:48:45 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ClhjL4PPyzhXlG;
 Tue,  1 Dec 2020 20:48:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 20:48:33 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter
 <jonathanh@nvidia.com>
Subject: [PATCH] drm/tegra: fix reference leak when pm_runtime_get_sync fails
Date: Tue, 1 Dec 2020 20:56:31 +0800
Message-ID: <20201201125631.142590-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: linux-tegra@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PM reference count is not expected to be incremented on
return in these tegra functions.

However, pm_runtime_get_sync will increment the PM reference
count even failed. Forgetting to putting operation will result
in a reference leak here.

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/tegra/dc.c   | 2 +-
 drivers/gpu/drm/tegra/dsi.c  | 2 +-
 drivers/gpu/drm/tegra/hdmi.c | 2 +-
 drivers/gpu/drm/tegra/hub.c  | 2 +-
 drivers/gpu/drm/tegra/sor.c  | 2 +-
 drivers/gpu/drm/tegra/vic.c  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 424ad60b4..b2c8c68b7 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2184,7 +2184,7 @@ static int tegra_dc_runtime_resume(struct host1x_client *client)
 	struct device *dev = client->dev;
 	int err;
 
-	err = pm_runtime_get_sync(dev);
+	err = pm_runtime_resume_and_get(dev);
 	if (err < 0) {
 		dev_err(dev, "failed to get runtime PM: %d\n", err);
 		return err;
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 5691ef1b0..f46d377f0 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1111,7 +1111,7 @@ static int tegra_dsi_runtime_resume(struct host1x_client *client)
 	struct device *dev = client->dev;
 	int err;
 
-	err = pm_runtime_get_sync(dev);
+	err = pm_runtime_resume_and_get(dev);
 	if (err < 0) {
 		dev_err(dev, "failed to get runtime PM: %d\n", err);
 		return err;
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index d09a24931..e5d2a4026 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1510,7 +1510,7 @@ static int tegra_hdmi_runtime_resume(struct host1x_client *client)
 	struct device *dev = client->dev;
 	int err;
 
-	err = pm_runtime_get_sync(dev);
+	err = pm_runtime_resume_and_get(dev);
 	if (err < 0) {
 		dev_err(dev, "failed to get runtime PM: %d\n", err);
 		return err;
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 22a03f7ff..5ce771cba 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -789,7 +789,7 @@ static int tegra_display_hub_runtime_resume(struct host1x_client *client)
 	unsigned int i;
 	int err;
 
-	err = pm_runtime_get_sync(dev);
+	err = pm_runtime_resume_and_get(dev);
 	if (err < 0) {
 		dev_err(dev, "failed to get runtime PM: %d\n", err);
 		return err;
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e88a17c29..fa1272155 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3214,7 +3214,7 @@ static int tegra_sor_runtime_resume(struct host1x_client *client)
 	struct device *dev = client->dev;
 	int err;
 
-	err = pm_runtime_get_sync(dev);
+	err = pm_runtime_resume_and_get(dev);
 	if (err < 0) {
 		dev_err(dev, "failed to get runtime PM: %d\n", err);
 		return err;
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index ade56b860..b77f72630 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -314,7 +314,7 @@ static int vic_open_channel(struct tegra_drm_client *client,
 	struct vic *vic = to_vic(client);
 	int err;
 
-	err = pm_runtime_get_sync(vic->dev);
+	err = pm_runtime_resume_and_get(vic->dev);
 	if (err < 0)
 		return err;
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
