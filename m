Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EF06E5A58
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FD410E69D;
	Tue, 18 Apr 2023 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Tue, 18 Apr 2023 01:25:03 UTC
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E01010E667
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:25:03 +0000 (UTC)
From: Patrick McLean <chutzpah@gentoo.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ata: libata-core: Apply ATI NCQ horkage to ASPEED as well
Date: Mon, 17 Apr 2023 18:17:20 -0700
Message-Id: <20230418011720.3900090-3-chutzpah@gentoo.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418011720.3900090-1-chutzpah@gentoo.org>
References: <20230418011720.3900090-1-chutzpah@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Apr 2023 07:24:20 +0000
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
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>,
 Patrick McLean <chutzpah@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have some machines with ASPEED SATA controllers, and are seeing the same NCQ
issues that ATI controllers (I am not sure if it's a rebranded ATI controller,
or they both have some faulty implementation). This NCQ breakage is consistent
across a few different types of drives.

Instead of maintaining a list of drives that are broken with ASPEED controllers
as well as ATI, let's just treat ASPEED controllers like ATI ones, and disable
NCQ on drives that have ATA_HORKAGE_NO_NCQ_ON_ATI set on them.

We have been running this patch on several machines for over a week now without
reproducing an issue that was happening almost daily before.

Signed-off-by: Patrick McLean <chutzpah@gentoo.org>
---
 drivers/ata/libata-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 14c17c3bda4e..051492e8e9f9 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2219,7 +2219,8 @@ static int ata_dev_config_ncq(struct ata_device *dev,
 	}
 
 	if (dev->horkage & ATA_HORKAGE_NO_NCQ_ON_ATI &&
-	    ata_dev_check_adapter(dev, PCI_VENDOR_ID_ATI)) {
+	    (ata_dev_check_adapter(dev, PCI_VENDOR_ID_ATI) ||
+		ata_dev_check_adapter(dev, PCI_VENDOR_ID_ASPEED))) {
 		snprintf(desc, desc_sz, "NCQ (not used)");
 		return 0;
 	}
-- 
2.40.0

