Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BB8229180
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4BB6E5BB;
	Wed, 22 Jul 2020 07:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54DC6E108
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 01:06:54 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 86ACFD3762CF24A44D79;
 Wed, 22 Jul 2020 09:06:49 +0800 (CST)
Received: from huawei.com (10.175.112.208) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Jul 2020
 09:06:42 +0800
From: Xu Qiang <xuqiang36@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] gpu: drm: Fix spinlock vblank_time_lock use error.
Date: Wed, 22 Jul 2020 01:05:27 +0000
Message-ID: <20200722010527.52293-1-xuqiang36@huawei.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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
Cc: rui.xiang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_handle_vblank function is in the interrupt context.
Therefore, the spin lock vblank_time_lock is obtained
from the interrupt context.

Cc: <stable@vger.kernel.org>
Signed-off-by: Xu Qiang <xuqiang36@huawei.com>
---
 drivers/gpu/drm/drm_vblank.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index f402c75b9d34..4ca63ff33a43 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -229,10 +229,11 @@ static void drm_reset_vblank_timestamp(struct drm_device *dev, unsigned int pipe
 {
 	u32 cur_vblank;
 	bool rc;
+	unsigned long irqflags;
 	ktime_t t_vblank;
 	int count = DRM_TIMESTAMP_MAXRETRIES;
 
-	spin_lock(&dev->vblank_time_lock);
+	spin_lock_irqsave(&dev->vblank_time_lock, irqflags);
 
 	/*
 	 * sample the current counter to avoid random jumps
@@ -257,7 +258,7 @@ static void drm_reset_vblank_timestamp(struct drm_device *dev, unsigned int pipe
 	 */
 	store_vblank(dev, pipe, 1, t_vblank, cur_vblank);
 
-	spin_unlock(&dev->vblank_time_lock);
+	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
 }
 
 /*
@@ -1106,11 +1107,12 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	unsigned long irqflags;
 	int ret = 0;
 
 	assert_spin_locked(&dev->vbl_lock);
 
-	spin_lock(&dev->vblank_time_lock);
+	spin_lock_irqsave(&dev->vblank_time_lock, irqflags);
 
 	if (!vblank->enabled) {
 		/*
@@ -1136,7 +1138,7 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 		}
 	}
 
-	spin_unlock(&dev->vblank_time_lock);
+	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
 
 	return ret;
 }
@@ -1917,6 +1919,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	unsigned long irqflags;
+	unsigned long irqflags_vblank;
 	bool disable_irq;
 
 	if (drm_WARN_ON_ONCE(dev, !drm_dev_has_vblank(dev)))
@@ -1931,18 +1934,18 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	 * vblank enable/disable, as this would cause inconsistent
 	 * or corrupted timestamps and vblank counts.
 	 */
-	spin_lock(&dev->vblank_time_lock);
+	spin_lock_irqsave(&dev->vblank_time_lock, irqflags_vblank);
 
 	/* Vblank irq handling disabled. Nothing to do. */
 	if (!vblank->enabled) {
-		spin_unlock(&dev->vblank_time_lock);
+		spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags_vblank);
 		spin_unlock_irqrestore(&dev->event_lock, irqflags);
 		return false;
 	}
 
 	drm_update_vblank_count(dev, pipe, true);
 
-	spin_unlock(&dev->vblank_time_lock);
+	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags_vblank);
 
 	wake_up(&vblank->queue);
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
