Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F249F7BB9DA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F9210E50E;
	Fri,  6 Oct 2023 13:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED6D10E4ED
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:57:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1098BCE2612;
 Fri,  6 Oct 2023 13:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5246C433C8;
 Fri,  6 Oct 2023 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1696600622;
 bh=idFvMmY1v+sDVWq37NottVN3J7CQKXQP9kUYUL8wMos=;
 h=From:To:Cc:Subject:Date:From;
 b=ADRO7YOJLk4pL+lR2Q8XerSDTEGbzB98vkl0QxOZsXjHXyWI0LSlJ+E3w1la71SgH
 kf+91v1a2jTV9WpLphFY2sw+VTDfn516Yeutp4mWhppi0sIFYKfnA6mSGRWMr5OkVq
 AN8YTb6D2Ge0oMNudjP9xrG0/BVRbWiXbMkQqyik=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/habanalabs: make hl_class constant
Date: Fri,  6 Oct 2023 15:56:55 +0200
Message-ID: <2023100654-pointless-stem-5ee1@gregkh>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Lines: 109
X-Developer-Signature: v=1; a=openpgp-sha256; l=4013;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=idFvMmY1v+sDVWq37NottVN3J7CQKXQP9kUYUL8wMos=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDKkKQupTl8/0sT7mGKj4PvFfbFzMWX+2F6eEOS8fLSuPe
 vDg7qHkjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIs6cM82tlf2hOtHBbsv53
 cDjTtUfT66pWeTEs6OVTf6g0fWpBWOG8E5/OvMuy2jc1DQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: Ohad Sharabi <osharabi@habana.ai>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Koby Elbaz <kelbaz@habana.ai>,
 linux-kernel@vger.kernel.org, Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Tomer Tayar <ttayar@habana.ai>, Dani Liberman <dliberman@habana.ai>,
 Tal Cohen <talcohen@habana.ai>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the driver core allows for struct class to be in read-only
memory, we should make all 'class' structures declared at build time
placing them into read-only memory, instead of having to be dynamically
allocated at runtime.

This requires some passing of const struct class * around in the common
habanalabs code as well as converting the structure itself.

Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Cc: Dani Liberman <dliberman@habana.ai>
Cc: Koby Elbaz <kelbaz@habana.ai>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: Ohad Sharabi <osharabi@habana.ai>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Tal Cohen <talcohen@habana.ai>
Cc: Tomer Tayar <ttayar@habana.ai>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/accel/habanalabs/common/device.c        |  2 +-
 drivers/accel/habanalabs/common/habanalabs.h    |  2 +-
 .../accel/habanalabs/common/habanalabs_drv.c    | 17 ++++++++++-------
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index b97339d1f7c6..4c28d8cfbb68 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -652,7 +652,7 @@ static void device_release_func(struct device *dev)
  *
  * Initialize a cdev and a Linux device for habanalabs's device.
  */
-static int device_init_cdev(struct hl_device *hdev, struct class *class,
+static int device_init_cdev(struct hl_device *hdev, const struct class *class,
 				int minor, const struct file_operations *fops,
 				char *name, struct cdev *cdev,
 				struct device **dev)
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 2f027d5a8206..f1c78555e611 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3308,7 +3308,7 @@ struct hl_device {
 	u64				pcie_bar_phys[HL_PCI_NUM_BARS];
 	void __iomem			*pcie_bar[HL_PCI_NUM_BARS];
 	void __iomem			*rmmio;
-	struct class			*hclass;
+	const struct class		*hclass;
 	struct cdev			cdev;
 	struct cdev			cdev_ctrl;
 	struct device			*dev;
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 7263e84c1a4d..4f1fdff3843d 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -27,7 +27,11 @@ MODULE_DESCRIPTION(HL_DRIVER_DESC);
 MODULE_LICENSE("GPL v2");
 
 static int hl_major;
-static struct class *hl_class;
+
+static const struct class hl_class = {
+	.name = HL_NAME,
+};
+
 static DEFINE_IDR(hl_devs_idr);
 static DEFINE_MUTEX(hl_devs_idr_lock);
 
@@ -317,7 +321,7 @@ static void copy_kernel_module_params_to_device(struct hl_device *hdev)
 	hdev->asic_prop.fw_security_enabled = is_asic_secured(hdev->asic_type);
 
 	hdev->major = hl_major;
-	hdev->hclass = hl_class;
+	hdev->hclass = &hl_class;
 	hdev->memory_scrub = memory_scrub;
 	hdev->reset_on_lockup = reset_on_lockup;
 	hdev->boot_error_status_mask = boot_error_status_mask;
@@ -691,10 +695,9 @@ static int __init hl_init(void)
 
 	hl_major = MAJOR(dev);
 
-	hl_class = class_create(HL_NAME);
-	if (IS_ERR(hl_class)) {
+	rc = class_register(&hl_class);
+	if (rc) {
 		pr_err("failed to allocate class\n");
-		rc = PTR_ERR(hl_class);
 		goto remove_major;
 	}
 
@@ -712,7 +715,7 @@ static int __init hl_init(void)
 
 remove_debugfs:
 	hl_debugfs_fini();
-	class_destroy(hl_class);
+	class_unregister(&hl_class);
 remove_major:
 	unregister_chrdev_region(MKDEV(hl_major, 0), HL_MAX_MINORS);
 	return rc;
@@ -732,7 +735,7 @@ static void __exit hl_exit(void)
 	 */
 	hl_debugfs_fini();
 
-	class_destroy(hl_class);
+	class_unregister(&hl_class);
 	unregister_chrdev_region(MKDEV(hl_major, 0), HL_MAX_MINORS);
 
 	idr_destroy(&hl_devs_idr);
-- 
2.42.0

