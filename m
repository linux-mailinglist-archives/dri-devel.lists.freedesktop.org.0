Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D2F8D0524
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6394810E932;
	Mon, 27 May 2024 15:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="wE+8G3F8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B9010E500
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:02:35 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716822162; bh=3jyCp5WLB1q5U7lpJgv1v9IMLy+ia/ewwngv2+8knpU=;
 h=From:To:Cc:Subject:Date:From;
 b=wE+8G3F8xZhEjg6kH22qMDN3MEFKr8Pk6Bj1OL35JC0o3D7iALI5f+08xCynp2mpH
 H2IDQPmlIbUQn+LZUEdEijMPYp1DxJ4uKwvSSEFJy1H8RGc7HX854Vgeiw6THliiB9
 HImm4tWADWZXJgu36e/3AabyvbJCzWMLM0VohGvW20HoBeZwLnVbQuzhxBfsIOQxlO
 KyQrNcWLuFQjczrxN4obEO6yL0AbV0eu+7zCqiAn0sAkKbqQYXRzO9Rb9Pug+/M2Ip
 uen92lMw0WK/cGF11MNyJheccJTqPkdmvz5BEw8p4cDwHF0Ab1XPehknIhKMLFKNZj
 T2YtUyfF17FZQ==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RF2PiS1954007; Mon, 27 May 2024 18:02:25 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Farah Kassabri <fkassabri@habana.ai>
Subject: [PATCH 1/8] accel/habanalabs/gaudi2: add GAUDI2D revision support
Date: Mon, 27 May 2024 18:02:17 +0300
Message-Id: <20240527150224.1953969-1-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
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

From: Farah Kassabri <fkassabri@habana.ai>

Gaudi2 with PCI revision ID with the value of '4' represents Gaudi2D
device and should be detected and initialized as Gaudi2.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c                 | 4 ++++
 drivers/accel/habanalabs/common/habanalabs.h             | 3 +++
 drivers/accel/habanalabs/common/habanalabs_drv.c         | 3 +++
 drivers/accel/habanalabs/common/mmu/mmu.c                | 1 +
 drivers/accel/habanalabs/common/sysfs.c                  | 3 +++
 drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h | 3 ++-
 6 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index f9b8601c4396..fd117489a05a 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -862,6 +862,10 @@ static int device_early_init(struct hl_device *hdev)
 		gaudi2_set_asic_funcs(hdev);
 		strscpy(hdev->asic_name, "GAUDI2C", sizeof(hdev->asic_name));
 		break;
+	case ASIC_GAUDI2D:
+		gaudi2_set_asic_funcs(hdev);
+		strscpy(hdev->asic_name, "GAUDI2D", sizeof(hdev->asic_name));
+		break;
 	default:
 		dev_err(hdev->dev, "Unrecognized ASIC type %d\n",
 			hdev->asic_type);
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 057087dc8592..0d16b5310add 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1273,15 +1273,18 @@ struct hl_dec {
  * @ASIC_GAUDI2: Gaudi2 device.
  * @ASIC_GAUDI2B: Gaudi2B device.
  * @ASIC_GAUDI2C: Gaudi2C device.
+ * @ASIC_GAUDI2D: Gaudi2D device.
  */
 enum hl_asic_type {
 	ASIC_INVALID,
+
 	ASIC_GOYA,
 	ASIC_GAUDI,
 	ASIC_GAUDI_SEC,
 	ASIC_GAUDI2,
 	ASIC_GAUDI2B,
 	ASIC_GAUDI2C,
+	ASIC_GAUDI2D,
 };
 
 struct hl_cs_parser;
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index e542fd40e16c..b1613a82c7f2 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -144,6 +144,9 @@ static enum hl_asic_type get_asic_type(struct hl_device *hdev)
 		case REV_ID_C:
 			asic_type = ASIC_GAUDI2C;
 			break;
+		case REV_ID_D:
+			asic_type = ASIC_GAUDI2D;
+			break;
 		default:
 			break;
 		}
diff --git a/drivers/accel/habanalabs/common/mmu/mmu.c b/drivers/accel/habanalabs/common/mmu/mmu.c
index a9813ffcde14..79823facce7f 100644
--- a/drivers/accel/habanalabs/common/mmu/mmu.c
+++ b/drivers/accel/habanalabs/common/mmu/mmu.c
@@ -600,6 +600,7 @@ int hl_mmu_if_set_funcs(struct hl_device *hdev)
 	case ASIC_GAUDI2:
 	case ASIC_GAUDI2B:
 	case ASIC_GAUDI2C:
+	case ASIC_GAUDI2D:
 		hl_mmu_v2_set_funcs(hdev, &hdev->mmu_func[MMU_DR_PGT]);
 		if (prop->pmmu.host_resident)
 			hl_mmu_v2_hr_set_funcs(hdev, &hdev->mmu_func[MMU_HR_PGT]);
diff --git a/drivers/accel/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
index 8a9f98832157..b6c63f8a0c1b 100644
--- a/drivers/accel/habanalabs/common/sysfs.c
+++ b/drivers/accel/habanalabs/common/sysfs.c
@@ -270,6 +270,9 @@ static ssize_t device_type_show(struct device *dev,
 	case ASIC_GAUDI2C:
 		str = "GAUDI2C";
 		break;
+	case ASIC_GAUDI2D:
+		str = "GAUDI2D";
+		break;
 	default:
 		dev_err(hdev->dev, "Unrecognized ASIC type %d\n",
 				hdev->asic_type);
diff --git a/drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h b/drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h
index 4f951cada077..a75faa00197f 100644
--- a/drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h
+++ b/drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h
@@ -25,7 +25,8 @@ enum hl_revision_id {
 	REV_ID_INVALID				= 0x00,
 	REV_ID_A				= 0x01,
 	REV_ID_B				= 0x02,
-	REV_ID_C				= 0x03
+	REV_ID_C				= 0x03,
+	REV_ID_D				= 0x04
 };
 
 #endif /* INCLUDE_PCI_GENERAL_H_ */
-- 
2.34.1

