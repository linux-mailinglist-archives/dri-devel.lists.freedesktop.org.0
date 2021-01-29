Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA633094D5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78F06ECB2;
	Sat, 30 Jan 2021 11:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-ztdg10011901.me.com (pv50p00im-ztdg10011901.me.com
 [17.58.6.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482336EAC8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1611915650;
 bh=6WtmYVCcfrbTlTPhTQ2nx796HDdBPwVIbYsnvIoYpA8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=oIvkp4ExOwqAcpz3Ku5MNKF0chJb3ODB9nVIU7gpTyHVKgZ6I9dvy6zTQHB9t4UrV
 +P8RQPWts6hVtCuj57u4N9a/QNGGwd3yV7kBEm4xLw0P2p73Gg7iJ3BoQf9aouhB6d
 krr4ZWgwi8Rt3CXW/ZDQXyoaVF9N72v7beS0QpOPRBjOA7MDXt/kfyklybu8wAEcBx
 ZibVhpKlT0fhWpNbVs8v7NfXyyrtW2FRUiVxiFL/vdCXKzSqIfuQCHg0kM7+MzSYuh
 tgqm8KHEd8YXYII1TEUFFPbPpwmsfx6cl1G1/Egr+GP+YVmFNsJz980PgcfVT8mn5L
 52nBC0hB2JjPw==
Received: from localhost.localdomain (unknown [119.3.119.19])
 by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id EF14980079F;
 Fri, 29 Jan 2021 10:20:47 +0000 (UTC)
From: Abel Wu <abel.w@icloud.com>
To: gustavo@padovan.org, maarten.lankhorst@linux.intel.com, sean@poorly.run,
 airlied@linux.ie
Subject: [PATCH 2/2] vgaarb: Make initcall always return success
Date: Fri, 29 Jan 2021 05:19:44 -0500
Message-Id: <20210129101944.2083-3-abel.w@icloud.com>
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

Returning error usually implies failure, in which case anything
that has done should be properly reverted. Thus if failed in
registering /dev/vga_arbiter, it is better to just throw out a
warning than returning error without unregistering pci_notifier.

Signed-off-by: Abel Wu <abel.w@icloud.com>
---
 drivers/gpu/vga/vgaarb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 2879d4223bf1..eff6b78e3372 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -1537,13 +1537,11 @@ static void __init vga_arb_select_default_device(void)
 
 static int __init vga_arb_device_init(void)
 {
-	int rc;
 	struct pci_dev *pdev = NULL;
 	struct vga_device *vgadev;
 
-	rc = misc_register(&vga_arb_device);
-	if (rc < 0)
-		pr_err("error %d registering device\n", rc);
+	if (misc_register(&vga_arb_device))
+		pr_warn("failed registering /dev/vga_arbiter\n");
 
 	bus_register_notifier(&pci_bus_type, &pci_notifier);
 
@@ -1571,6 +1569,6 @@ static int __init vga_arb_device_init(void)
 	vga_arb_select_default_device();
 
 	pr_info("loaded\n");
-	return rc;
+	return 0;
 }
 subsys_initcall(vga_arb_device_init);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
