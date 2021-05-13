Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBF37F450
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 10:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D1F6E069;
	Thu, 13 May 2021 08:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 910 seconds by postgrey-1.36 at gabe;
 Thu, 13 May 2021 08:44:17 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B176E069
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 08:44:17 +0000 (UTC)
Received: from dggeml710-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fgl7z5w4nzWhCS;
 Thu, 13 May 2021 16:24:47 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggeml710-chm.china.huawei.com (10.3.17.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 16:29:04 +0800
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 16:29:03 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/aperture: Fix missing unlock on error in
 devm_aperture_acquire()
Date: Thu, 13 May 2021 16:46:04 +0800
Message-ID: <1620895564-52367-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
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
Cc: Zou Wei <zou_wei@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing unlock before return from function devm_aperture_acquire()
in the error handling case.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/gpu/drm/drm_aperture.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 33bf018..9335d9d 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -164,13 +164,17 @@ static int devm_aperture_acquire(struct drm_device *dev,
 
 	list_for_each(pos, &drm_apertures) {
 		ap = container_of(pos, struct drm_aperture, lh);
-		if (overlap(base, end, ap->base, ap->base + ap->size))
+		if (overlap(base, end, ap->base, ap->base + ap->size)) {
+			mutex_unlock(&drm_apertures_lock);
 			return -EBUSY;
+		}
 	}
 
 	ap = devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
-	if (!ap)
+	if (!ap) {
+		mutex_unlock(&drm_apertures_lock);
 		return -ENOMEM;
+	}
 
 	ap->dev = dev;
 	ap->base = base;
-- 
2.6.2

