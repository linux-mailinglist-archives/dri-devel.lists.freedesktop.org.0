Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF795048F9
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 20:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084A310E108;
	Sun, 17 Apr 2022 18:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 908 seconds by postgrey-1.36 at gabe;
 Sun, 17 Apr 2022 13:44:51 UTC
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id E22BC10E161
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8xdy1
 otSXW1cwfTIsLN61K8o+NtLtYS2/7RspgGPkFc=; b=WaktQzaNvApyYYQ3HqeLE
 oJrH0VHDXzUSk9eqn4Sweu6M+/U73QAridWyhEm6N/T0iXbkI+sUQ8QSllnR4GQg
 E/Jeajtx7eTWfW2a870TFPqO9WUEvL11ILiolkVp6FO2c3OotRVKDIyffplOIUZg
 YGuspDxGJxTDLZyj84pgak=
Received: from carlis (unknown [120.229.91.35])
 by smtp9 (Coremail) with SMTP id DcCowABHu14vFlxikyJyBw--.4076S2;
 Sun, 17 Apr 2022 21:29:20 +0800 (CST)
From: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
To: liviu.dudau@arm.com, brian.starkey@arm.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/malidp: convert sysfs snprintf to sysfs_emit
Date: Sun, 17 Apr 2022 13:29:18 +0000
Message-Id: <20220417132918.135795-1-zhangxuezhi1@coolpad.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowABHu14vFlxikyJyBw--.4076S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWfXF1UWrWfGr1xZw1kZrb_yoWfWFb_CF
 10qrsrZrs2yF97uw1xCF4fZryIkayF9FZ5XrW8ta4fZrsFvrsrZ3s29ryvqryUJF47AF9r
 Aa1kuF15J3ZrCjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnpWlPUUUUU==
X-Originating-IP: [120.229.91.35]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/1tbiQwjlhVc7Yte1mgABsc
X-Mailman-Approved-At: Sun, 17 Apr 2022 18:40:14 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
drivers/gpu/drm/arm/malidp_drv.c:658:8-16:
WARNING: use scnprintf or sprintf

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index d5aef21426cf..b1ffd5ba27d9 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -655,7 +655,7 @@ static ssize_t core_id_show(struct device *dev, struct device_attribute *attr,
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct malidp_drm *malidp = drm->dev_private;
 
-	return snprintf(buf, PAGE_SIZE, "%08x\n", malidp->core_id);
+	return sysfs_emit(buf, "%08x\n", malidp->core_id);
 }
 
 static DEVICE_ATTR_RO(core_id);
-- 
2.25.1

