Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B070BBB7
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244D810E2CA;
	Mon, 22 May 2023 11:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9454010E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:25:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9904F62112;
 Mon, 22 May 2023 11:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D50C433EF;
 Mon, 22 May 2023 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684754754;
 bh=xGkJ38b3C8O+dkPDiA3iPgPFwo6IFyNouanjm+MOViU=;
 h=From:To:Cc:Subject:Date:From;
 b=mUSZilGIzkzannc8GaIfCWqPaA8thpK6oHQAmg2W/q4fR5F5XXMekESED+Oin4ZQI
 9NFZrynT/todzDIS1itoSJF5UnCEvGglQoOGaPDvZvkaBV6bNkJbs581JFmmqzPsIQ
 I94iXjsBTTW62Zbouvm4Jo4wehUulFlxVqAsTvCs+M5mF3jyFGo9Q5WIbJsS35CC1f
 lY9uTUIIEIC7JhUW2gDndFJUvqmlV0GdpUJeTuGBaF/sn3pPHK5/8+I8tZPNz4OOCh
 mYZc5Ngi7Qsljz/pwPEqiticBpZnqotco3cOUUv1Dkrm/x8TamvVwduIOxqD7J8WI8
 i4mLHhsZMa18w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] accel/habanalabs: remove sim code
Date: Mon, 22 May 2023 14:25:45 +0300
Message-Id: <20230522112548.1577359-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: Moti Haimovski <mhaimovski@habana.ai>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There were a few places where simulator only code got into the upstream.
Remove those places that can confuse other developers.

Fixes: 2a0a839b6a28 ("habanalabs: extend fatal messages to contain PCI info")
Cc: Moti Haimovski <mhaimovski@habana.ai>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c     | 10 +++------
 drivers/accel/habanalabs/common/habanalabs.h | 23 ++++----------------
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index cab5a63db8c1..ca15c8d0d042 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2328,13 +2328,9 @@ int hl_device_init(struct hl_device *hdev)
 	hdev->disabled = true;
 	if (expose_interfaces_on_err)
 		cdev_sysfs_debugfs_add(hdev);
-	if (hdev->pdev)
-		dev_err(&hdev->pdev->dev,
-			"Failed to initialize hl%d. Device %s is NOT usable !\n",
-			hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
-	else
-		pr_err("Failed to initialize hl%d. Device %s is NOT usable !\n",
-			hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
+	dev_err(&hdev->pdev->dev,
+		"Failed to initialize hl%d. Device %s is NOT usable !\n",
+		hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
 
 	return rc;
 }
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index e2341a75a4b7..c5aa33eaa826 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -2558,12 +2558,7 @@ void hl_wreg(struct hl_device *hdev, u32 reg, u32 val);
 	ktime_t __timeout; \
 	u32 __elbi_read; \
 	int __rc = 0; \
-	if (hdev->pdev) \
-		__timeout = ktime_add_us(ktime_get(), timeout_us); \
-	else \
-		__timeout = ktime_add_us(ktime_get(),\
-				min((u64)(timeout_us * 10), \
-					(u64) HL_SIM_MAX_TIMEOUT_US)); \
+	__timeout = ktime_add_us(ktime_get(), timeout_us); \
 	might_sleep_if(sleep_us); \
 	for (;;) { \
 		if (elbi) { \
@@ -2615,13 +2610,7 @@ void hl_wreg(struct hl_device *hdev, u32 reg, u32 val);
 	u8 __arr_idx;	\
 	int __rc = 0; \
 	\
-	if (hdev->pdev) \
-		__timeout = ktime_add_us(ktime_get(), timeout_us); \
-	else \
-		__timeout = ktime_add_us(ktime_get(),\
-				min(((u64)timeout_us * 10), \
-					(u64) HL_SIM_MAX_TIMEOUT_US)); \
-	\
+	__timeout = ktime_add_us(ktime_get(), timeout_us); \
 	might_sleep_if(sleep_us); \
 	if (arr_size >= 64) \
 		__rc = -EINVAL; \
@@ -2679,12 +2668,8 @@ void hl_wreg(struct hl_device *hdev, u32 reg, u32 val);
 				mem_written_by_device) \
 ({ \
 	ktime_t __timeout; \
-	if (hdev->pdev) \
-		__timeout = ktime_add_us(ktime_get(), timeout_us); \
-	else \
-		__timeout = ktime_add_us(ktime_get(),\
-				min((u64)(timeout_us * 100), \
-					(u64) HL_SIM_MAX_TIMEOUT_US)); \
+	\
+	__timeout = ktime_add_us(ktime_get(), timeout_us); \
 	might_sleep_if(sleep_us); \
 	for (;;) { \
 		/* Verify we read updates done by other cores or by device */ \
-- 
2.40.1

