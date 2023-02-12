Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8377C6939E2
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A85710E464;
	Sun, 12 Feb 2023 20:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5362F10E465
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D066F60DD8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915DFC433EF
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234709;
 bh=/SD70J+t/Q0gYySU2d0h2cS7srVqumsLHOgdFCa1O/Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E6ATN4U3TbxV016N4A8iXijwBPnhhiGdjUrJEyNaHxGAGdF6/edAkKLZ3OiAUSoBQ
 Lxeb/eTnEZZhN3mu6tPoyZVV9/KPKBbj3L6DMYfhuRiOr8L8af1FPaovig01xkjuzE
 yGxHpjXIzi9Kn8zcnHG9orMcSbtZyA21YfJ7HCRWhElmwQKPxXNdqwBiLdFhjs/zgF
 7u1atRaXHEGx6E7PIgf+TnvOiEyJ7I1jttZLC2MhrLRqpQN83VV8nyToB/9+hbKMjj
 mmtzggm79a0ZAzeOXQu8N7Ae0k6Li3VGh434zfx69zQ3C3KQ9wUeEYBnOuo2wblbxw
 w27jyHf4Gfsvg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/27] habanalabs: split cdev creation to separate function
Date: Sun, 12 Feb 2023 22:44:30 +0200
Message-Id: <20230212204454.2938561-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the cdev creation code from the main hdev init function to
a separate function. This will make the code more readable once we
add the accel registration code (instead/in addition to legacy
cdev).

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 49 ++++++++++++++++--------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 9933e5858a36..ed26b7d20d19 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1939,27 +1939,17 @@ void hl_notifier_event_send_all(struct hl_device *hdev, u64 event_mask)
 	mutex_unlock(&hdev->fpriv_ctrl_list_lock);
 }
 
-/*
- * hl_device_init - main initialization function for habanalabs device
- *
- * @hdev: pointer to habanalabs device structure
- *
- * Allocate an id for the device, do early initialization and then call the
- * ASIC specific initialization functions. Finally, create the cdev and the
- * Linux device to expose it to the user
- */
-int hl_device_init(struct hl_device *hdev, struct class *hclass)
+static int create_cdev(struct hl_device *hdev, struct class *hclass)
 {
-	int i, rc, cq_cnt, user_interrupt_cnt, cq_ready_cnt;
 	char *name;
-	bool add_cdev_sysfs_on_err = false;
+	int rc;
 
 	hdev->cdev_idx = hdev->id / 2;
 
 	name = kasprintf(GFP_KERNEL, "hl%d", hdev->cdev_idx);
 	if (!name) {
 		rc = -ENOMEM;
-		goto out_disabled;
+		goto out_err;
 	}
 
 	/* Initialize cdev and device structures */
@@ -1969,7 +1959,7 @@ int hl_device_init(struct hl_device *hdev, struct class *hclass)
 	kfree(name);
 
 	if (rc)
-		goto out_disabled;
+		goto out_err;
 
 	name = kasprintf(GFP_KERNEL, "hl_controlD%d", hdev->cdev_idx);
 	if (!name) {
@@ -1986,10 +1976,36 @@ int hl_device_init(struct hl_device *hdev, struct class *hclass)
 	if (rc)
 		goto free_dev;
 
+	return 0;
+
+free_dev:
+	put_device(hdev->dev);
+out_err:
+	return rc;
+}
+
+/*
+ * hl_device_init - main initialization function for habanalabs device
+ *
+ * @hdev: pointer to habanalabs device structure
+ *
+ * Allocate an id for the device, do early initialization and then call the
+ * ASIC specific initialization functions. Finally, create the cdev and the
+ * Linux device to expose it to the user
+ */
+int hl_device_init(struct hl_device *hdev, struct class *hclass)
+{
+	int i, rc, cq_cnt, user_interrupt_cnt, cq_ready_cnt;
+	bool add_cdev_sysfs_on_err = false;
+
+	rc = create_cdev(hdev, hclass);
+	if (rc)
+		goto out_disabled;
+
 	/* Initialize ASIC function pointers and perform early init */
 	rc = device_early_init(hdev);
 	if (rc)
-		goto free_dev_ctrl;
+		goto free_dev;
 
 	user_interrupt_cnt = hdev->asic_prop.user_dec_intr_count +
 				hdev->asic_prop.user_interrupt_count;
@@ -2241,9 +2257,8 @@ int hl_device_init(struct hl_device *hdev, struct class *hclass)
 	kfree(hdev->user_interrupt);
 early_fini:
 	device_early_fini(hdev);
-free_dev_ctrl:
-	put_device(hdev->dev_ctrl);
 free_dev:
+	put_device(hdev->dev_ctrl);
 	put_device(hdev->dev);
 out_disabled:
 	hdev->disabled = true;
-- 
2.25.1

