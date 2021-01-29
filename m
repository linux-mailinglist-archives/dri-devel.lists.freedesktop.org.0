Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29383094D9
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AF46ECB8;
	Sat, 30 Jan 2021 11:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-ztdg10011901.me.com (pv50p00im-ztdg10011901.me.com
 [17.58.6.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426C96EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1611915644;
 bh=80xzXHD7Eidv/ZRr8G7ZSkiaLphdTCk8BqPMtuBIYrI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=AiPqM5ishKS9csb8uQr8VzTakRgURfZKvtS1AKEw0yVa+wXomNZB6WQQvhXNadrBf
 HQine89jr+4xmmv2nSDO8XRy+bIcsV3x0pZYjO3mZByjExXZA3A1AtpNzaFTGaGJiT
 N4Yj8pFtmXYagS6wA/xq04crHtdxbEpInMYKou3k4ghM832XeFYv+pPWJjMLKx3Npo
 7DsWQ3AXX6A+9qnzy+k3mCA7yuGBsLwmew/wYvgNsHc4rvmLxNBD7B14nbTj6R0tJM
 0mHr2qWTUT5jYBrkThb5Hpiq9+no9o8nozbXnZ2E4RtbyXjOm0z55OvdISjt65QX8Y
 Xu9VnzfTFlxtA==
Received: from localhost.localdomain (unknown [119.3.119.19])
 by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id 849618005E9;
 Fri, 29 Jan 2021 10:20:41 +0000 (UTC)
From: Abel Wu <abel.w@icloud.com>
To: gustavo@padovan.org, maarten.lankhorst@linux.intel.com, sean@poorly.run,
 airlied@linux.ie
Subject: [PATCH 1/2] vgaarb: Fix return value of notifier callback
Date: Fri, 29 Jan 2021 05:19:43 -0500
Message-Id: <20210129101944.2083-2-abel.w@icloud.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129101944.2083-1-abel.w@icloud.com>
References: <20210129101944.2083-1-abel.w@icloud.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-29_04:2021-01-28,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2101290052
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
Cc: hewenliang4@huawei.com, wuyun.wu@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abel Wu <abel.w@icloud.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If it's not a vga device, just don't care (NOTIFY_DONE). Otherwise
return NOTIFY_OK after processing done.

Signed-off-by: Abel Wu <abel.w@icloud.com>
---
 drivers/gpu/vga/vgaarb.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 5180c5687ee5..2879d4223bf1 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -644,6 +644,11 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 	}
 }
 
+static inline bool vga_class(struct pci_dev *pdev)
+{
+	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
+}
+
 /*
  * Currently, we assume that the "initial" setup of the system is
  * not sane, that is we come up with conflicting devices and let
@@ -658,10 +663,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 	struct pci_dev *bridge;
 	u16 cmd;
 
-	/* Only deal with VGA class devices */
-	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
-		return false;
-
 	/* Allocate structure */
 	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
 	if (vgadev == NULL) {
@@ -1420,6 +1421,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 
 	vgaarb_dbg(dev, "%s\n", __func__);
 
+	if (!vga_class(pdev))
+		return NOTIFY_DONE;
+
 	/* For now we're only intereted in devices added and removed. I didn't
 	 * test this thing here, so someone needs to double check for the
 	 * cases of hotplugable vga cards. */
@@ -1430,7 +1434,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 
 	if (notify)
 		vga_arbiter_notify_clients();
-	return 0;
+
+	return NOTIFY_OK;
 }
 
 static struct notifier_block pci_notifier = {
@@ -1533,7 +1538,7 @@ static void __init vga_arb_select_default_device(void)
 static int __init vga_arb_device_init(void)
 {
 	int rc;
-	struct pci_dev *pdev;
+	struct pci_dev *pdev = NULL;
 	struct vga_device *vgadev;
 
 	rc = misc_register(&vga_arb_device);
@@ -1544,11 +1549,15 @@ static int __init vga_arb_device_init(void)
 
 	/* We add all PCI devices satisfying VGA class in the arbiter by
 	 * default */
-	pdev = NULL;
-	while ((pdev =
-		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
-			       PCI_ANY_ID, pdev)) != NULL)
-		vga_arbiter_add_pci_device(pdev);
+	while (1) {
+		pdev = pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
+				      PCI_ANY_ID, pdev);
+		if (!pdev)
+			break;
+
+		if (vga_class(pdev))
+			vga_arbiter_add_pci_device(pdev);
+	}
 
 	list_for_each_entry(vgadev, &vga_list, list) {
 		struct device *dev = &vgadev->pdev->dev;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
