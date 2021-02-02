Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0730D4CF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4216E9EA;
	Wed,  3 Feb 2021 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398B56E917;
 Tue,  2 Feb 2021 09:06:27 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0UNfe6ce_1612256773; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UNfe6ce_1612256773) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 02 Feb 2021 17:06:24 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: convert sysfs sprintf/snprintf family to
 sysfs_emit
Date: Tue,  2 Feb 2021 17:06:12 +0800
Message-Id: <1612256772-70147-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, john.clements@amd.com, christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

./drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:220:8-16: WARNING: use
scnprintf or sprintf.

./drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:249:8-16: WARNING: use
scnprintf or sprintf.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 541ef6b..2913d57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -186,7 +186,7 @@ static ssize_t amdgpu_xgmi_show_attrs(struct kobject *kobj,
 		kobj, struct amdgpu_hive_info, kobj);
 
 	if (attr == &amdgpu_xgmi_hive_id)
-		return snprintf(buf, PAGE_SIZE, "%llu\n", hive->hive_id);
+		return sysfs_emit(buf, "%llu\n", hive->hive_id);
 
 	return 0;
 }
@@ -217,7 +217,7 @@ static ssize_t amdgpu_xgmi_show_device_id(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n", adev->gmc.xgmi.node_id);
+	return sysfs_emit(buf, "%llu\n", adev->gmc.xgmi.node_id);
 
 }
 
@@ -246,7 +246,7 @@ static ssize_t amdgpu_xgmi_show_error(struct device *dev,
 
 	adev->df.funcs->set_fica(adev, ficaa_pie_status_in, 0, 0);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", error_count);
+	return sysfs_emit(buf, "%u\n", error_count);
 }
 
 
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
