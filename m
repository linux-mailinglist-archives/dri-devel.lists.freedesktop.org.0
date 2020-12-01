Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCE02CB6D4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25916EA46;
	Wed,  2 Dec 2020 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1F16E519
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:48:46 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ClhjP0vyDzhdBJ;
 Tue,  1 Dec 2020 20:48:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 20:48:34 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH] drm/v3d: fix reference leak when pm_runtime_get_sync fails
Date: Tue, 1 Dec 2020 20:56:32 +0800
Message-ID: <20201201125632.142636-1-miaoqinglang@huawei.com>
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
Cc: Qinglang Miao <miaoqinglang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PM reference count is not expected to be incremented on
return in functions v3d_get_param_ioctl and v3d_job_init.

However, pm_runtime_get_sync will increment the PM reference
count even failed. Forgetting to putting operation will result
in a reference leak here.

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
Fixes: 935f3d88434b ("drm/v3d: Make sure the GPU is on when measuring clocks.")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 4 ++--
 drivers/gpu/drm/v3d/v3d_gem.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index e76b24bb8..91ceed774 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -132,7 +132,7 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 	u32 ident0, ident1, ident2, ident3, cores;
 	int ret, core;
 
-	ret = pm_runtime_get_sync(v3d->drm.dev);
+	ret = pm_runtime_resume_and_get(v3d->drm.dev);
 	if (ret < 0)
 		return ret;
 
@@ -219,7 +219,7 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	int measure_ms = 1000;
 	int ret;
 
-	ret = pm_runtime_get_sync(v3d->drm.dev);
+	ret = pm_runtime_resume_and_get(v3d->drm.dev);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 182c58652..765683569 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -439,7 +439,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job->v3d = v3d;
 	job->free = free;
 
-	ret = pm_runtime_get_sync(v3d->drm.dev);
+	ret = pm_runtime_resume_and_get(v3d->drm.dev);
 	if (ret < 0)
 		return ret;
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
