Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20463349D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 06:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4A110E369;
	Tue, 22 Nov 2022 05:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1909 seconds by postgrey-1.36 at gabe;
 Tue, 22 Nov 2022 05:01:04 UTC
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F7DA10E14F;
 Tue, 22 Nov 2022 05:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=koqsT
 aHahdJV3/sqTaGV9Vo1ZB6Wj3j4JgWQBS8SK1I=; b=BpIOM0eXLlk9Oxr6Aunei
 497zmEwZ53YiiAXyeZmOUJ7W88coW1J68AHW1tN0EQSoh94PUlN5jm/f5shguJWi
 uJgv3kK2Ml4WzOVsrcK62U5qhapUACnIac1DrtGLxqlQ71D1RjnUBrBRXxlrFLK3
 YCLqoy5C5mVpZLFZmoeLGo=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp3 (Coremail) with SMTP id DcmowABHTbEBUHxjRgpAEg--.33943S2;
 Tue, 22 Nov 2022 12:28:50 +0800 (CST)
From: Liang He <windhl@126.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 windhl@126.com
Subject: [PATCH v2] drm/amdgpu: Fix potential double free and null pointer
 dereference
Date: Tue, 22 Nov 2022 12:28:49 +0800
Message-Id: <20221122042849.1097369-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowABHTbEBUHxjRgpAEg--.33943S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4xWw4rZr4fGr4DKF1UGFg_yoW8Zry7pF
 4fXF1UtrWDZF4xtry7Z3WrZasxt3W2ga4rKr48uwnI9wn8JF95Jw15JFWjqr1kuFZ2kr43
 tF9rJ3y8ZF1qvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIg4hUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiHgPBF2IxpqEIIgAAs1
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
kobject_put() as the PUT will call kfree().

In amdgpu_device_ip_init(), we need to check the returned *hive*
which can be NULL before we dereference it.

Signed-off-by: Liang He <windhl@126.com>
---
 v1->v2: we need the extra GET to keep *hive* alive, it is
 my fault to remove the GET in v1.


 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index 47159e9a0884..4b9e7b050ccd 100644
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
-- 
2.25.1

