Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31A6A4058
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDE110E3C1;
	Mon, 27 Feb 2023 11:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645ED10E3B6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:13:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3C2560DC4;
 Mon, 27 Feb 2023 11:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B4AC4339B;
 Mon, 27 Feb 2023 11:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677496393;
 bh=LhJ3bnyhSMtSjwKe39NSUgUg82EqxlpgqvrnTl5X2Eg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=agqVdNEzEb2McN01BlbmXbX98PPI2hefoD7gc17/fLOB3NABpZnWWXMmQHcCNVg8f
 dRhcHO2xXZxSuqi4Pp80GhQbkk/YhSTLKO1nCUvXlA9smzG/Jmpzcf03amDcYessgm
 FJs33m5QWRYbhmMUeYwGnHkD0B9h9I/9PWrc2yReZRrVg6PCkHAZGtDFQfnBOIdxIQ
 eXdY+suYMC8rlSKRt2CAtBC61Kkow8SjHEAueELYZ65xMJJsaQQ8fDuQwA7mFXSWGe
 q7hd4Qh6MDyJQpp4NCred76BIyYF7m03TWOZjI3liVY9CAi5mWIagLoqJSof8lGhT+
 QXMgiEHpkaJCw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] habanalabs: add device id to all threads names
Date: Mon, 27 Feb 2023 13:13:02 +0200
Message-Id: <20230227111306.3985896-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227111306.3985896-1-ogabbay@kernel.org>
References: <20230227111306.3985896-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sagiv Ozeri <sozeri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sagiv Ozeri <sozeri@habana.ai>

Compute driver threads names will start with hlX-*, when X is the
device id.
This will help distinguish them from the NIC thread names.

Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index e544d00fe376..7ade32487138 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -840,7 +840,7 @@ static int device_early_init(struct hl_device *hdev)
 	}
 
 	for (i = 0 ; i < hdev->asic_prop.completion_queues_count ; i++) {
-		snprintf(workq_name, 32, "hl-free-jobs-%u", (u32) i);
+		snprintf(workq_name, 32, "hl%u-free-jobs-%u", hdev->cdev_idx, (u32) i);
 		hdev->cq_wq[i] = create_singlethread_workqueue(workq_name);
 		if (hdev->cq_wq[i] == NULL) {
 			dev_err(hdev->dev, "Failed to allocate CQ workqueue\n");
@@ -849,14 +849,16 @@ static int device_early_init(struct hl_device *hdev)
 		}
 	}
 
-	hdev->eq_wq = create_singlethread_workqueue("hl-events");
+	snprintf(workq_name, 32, "hl%u-events", hdev->cdev_idx);
+	hdev->eq_wq = create_singlethread_workqueue(workq_name);
 	if (hdev->eq_wq == NULL) {
 		dev_err(hdev->dev, "Failed to allocate EQ workqueue\n");
 		rc = -ENOMEM;
 		goto free_cq_wq;
 	}
 
-	hdev->cs_cmplt_wq = alloc_workqueue("hl-cs-completions", WQ_UNBOUND, 0);
+	snprintf(workq_name, 32, "hl%u-cs-completions", hdev->cdev_idx);
+	hdev->cs_cmplt_wq = alloc_workqueue(workq_name, WQ_UNBOUND, 0);
 	if (!hdev->cs_cmplt_wq) {
 		dev_err(hdev->dev,
 			"Failed to allocate CS completions workqueue\n");
@@ -864,7 +866,8 @@ static int device_early_init(struct hl_device *hdev)
 		goto free_eq_wq;
 	}
 
-	hdev->ts_free_obj_wq = alloc_workqueue("hl-ts-free-obj", WQ_UNBOUND, 0);
+	snprintf(workq_name, 32, "hl%u-ts-free-obj", hdev->cdev_idx);
+	hdev->ts_free_obj_wq = alloc_workqueue(workq_name, WQ_UNBOUND, 0);
 	if (!hdev->ts_free_obj_wq) {
 		dev_err(hdev->dev,
 			"Failed to allocate Timestamp registration free workqueue\n");
@@ -872,15 +875,15 @@ static int device_early_init(struct hl_device *hdev)
 		goto free_cs_cmplt_wq;
 	}
 
-	hdev->prefetch_wq = alloc_workqueue("hl-prefetch", WQ_UNBOUND, 0);
+	snprintf(workq_name, 32, "hl%u-prefetch", hdev->cdev_idx);
+	hdev->prefetch_wq = alloc_workqueue(workq_name, WQ_UNBOUND, 0);
 	if (!hdev->prefetch_wq) {
 		dev_err(hdev->dev, "Failed to allocate MMU prefetch workqueue\n");
 		rc = -ENOMEM;
 		goto free_ts_free_wq;
 	}
 
-	hdev->hl_chip_info = kzalloc(sizeof(struct hwmon_chip_info),
-					GFP_KERNEL);
+	hdev->hl_chip_info = kzalloc(sizeof(struct hwmon_chip_info), GFP_KERNEL);
 	if (!hdev->hl_chip_info) {
 		rc = -ENOMEM;
 		goto free_prefetch_wq;
@@ -892,7 +895,8 @@ static int device_early_init(struct hl_device *hdev)
 
 	hl_mem_mgr_init(hdev->dev, &hdev->kernel_mem_mgr);
 
-	hdev->reset_wq = create_singlethread_workqueue("hl_device_reset");
+	snprintf(workq_name, 32, "hl%u_device_reset", hdev->cdev_idx);
+	hdev->reset_wq = create_singlethread_workqueue(workq_name);
 	if (!hdev->reset_wq) {
 		rc = -ENOMEM;
 		dev_err(hdev->dev, "Failed to create device reset WQ\n");
-- 
2.39.2

