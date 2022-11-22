Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED3563347F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 05:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEFF10E0C6;
	Tue, 22 Nov 2022 04:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1886 seconds by postgrey-1.36 at gabe;
 Tue, 22 Nov 2022 04:37:28 UTC
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2A0310E0C6;
 Tue, 22 Nov 2022 04:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hyMHQ
 +IQ32aYWO8By/rlk0gemkXtyhJVeG299Uy/CdE=; b=Buu1gI/xzxN+FGpkpOVil
 Pr8/W/5UQMo3Wo+YbArVotj0x+IvygZ0kCSrRrPye5AM8p7v2W32sCIV3+tsvBaZ
 0v5uGbKbJOF49pxiS30+yk4wuQxqXqimPdlRn6Lmj5nHDz8eewDnCp80RGqTf1Dn
 0REiR0GuIsZ511P5uitK1o=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp9 (Coremail) with SMTP id NeRpCgAHVxOfSnxjPhmIGA--.14582S2;
 Tue, 22 Nov 2022 12:05:52 +0800 (CST)
From: Liang He <windhl@126.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 windhl@126.com
Subject: [PATCH] drm/amdgpu: Fix Double Free,
 Null Pointer Dereference and MemLeak
Date: Tue, 22 Nov 2022 12:05:50 +0800
Message-Id: <20221122040550.1096952-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgAHVxOfSnxjPhmIGA--.14582S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4xWw4rZF1DGF13Ar4kXrb_yoW8tFW3pF
 4fXr1UtrWDZF4xtw1Du3WrZasxtw12ga4Skr4UuwnI9wn8JF95Gw15JFWjqr1kJFZ2kr43
 tFZrX3yUZF1qvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi1xRxUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiHgDBF2IxpqDwSQAAsk
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

In amdgpu_get_xgmi_hive(), we should not call kfree() after
kobject_put() as the PUT will call kfree(). Besides, we should
not call kobject_get() again for the new *alloced* as its
refcount will be initialized to 1 for the returned *hive*.

In amdgpu_device_ip_init(), we need to check the returned *hive*
which can be NULL before we dereference it.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f1e9663b4051..00976e15b698 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2462,6 +2462,11 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 			if (!amdgpu_sriov_vf(adev)) {
 				struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
 
+				if (WARN_ON(!hive)) {
+					r = -ENOENT;
+					goto init_failed;
+				}
+
 				if (!hive->reset_domain ||
 				    !amdgpu_reset_get_reset_domain(hive->reset_domain)) {
 					r = -ENOENT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 47159e9a0884..26adc7293468 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -386,7 +386,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	if (ret) {
 		dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
 		kobject_put(&hive->kobj);
-		kfree(hive);
 		hive = NULL;
 		goto pro_end;
 	}
@@ -410,7 +409,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
 				ret = -ENOMEM;
 				kobject_put(&hive->kobj);
-				kfree(hive);
 				hive = NULL;
 				goto pro_end;
 			}
@@ -437,8 +435,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	list_add_tail(&hive->node, &xgmi_hive_list);
 
 pro_end:
-	if (hive)
-		kobject_get(&hive->kobj);
 	mutex_unlock(&xgmi_mutex);
 	return hive;
 }
-- 
2.25.1

