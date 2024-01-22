Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED358366C5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6AD10F293;
	Mon, 22 Jan 2024 15:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AD210F293
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:07:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 91F37B80E68;
 Mon, 22 Jan 2024 15:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDECC433F1;
 Mon, 22 Jan 2024 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936049;
 bh=2VV2VH9chyhSWR5++ZCyQ2uQtdFcRXRDgdiOO4CK3O4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ImFQWmgCmcJMYmfOib9teqSixS9ayrDPqRsnva4ZRY4ozfcYKMY9oLcsgK3vWVQ3P
 anHQpzgFTlogt2zz/D+YhlPbRguQKropNkA4ODlqT4+dcubslFQ+iASBBuw4hIJh+S
 +u/odI3xdBE17NGnuirXCShas2+E9PzKcLchgorHTDANwjLLggCrnoVPKqDrHY+QNH
 xR44JBQmZ1IEIktxgIj4ouQFmDO9D5MB7zTUUTOINSpXZeDZuKhA92l0GpQSKfuDtV
 nJpr3h5p9lk5y4xLBXoTE9ePKkZhJQbdEBikbpIfUHx+NC1d7SDh9zlFrbzNzB71wl
 heYMiVvDns1XQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 55/73] accel/habanalabs: add support for Gaudi2C
 device
Date: Mon, 22 Jan 2024 10:02:09 -0500
Message-ID: <20240122150432.992458-55-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
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
Cc: Sasha Levin <sashal@kernel.org>, osharabi@habana.ai, dliberman@habana.ai,
 Oded Gabbay <ogabbay@kernel.org>, kelbaz@habana.ai,
 dri-devel@lists.freedesktop.org, dhirschfeld@habana.ai,
 stanislaw.gruszka@linux.intel.com, xupengfei@nfschina.com, ttayar@habana.ai,
 asuller@habana.ai, mhaimovski@habana.ai, obitton@habana.ai,
 fkassabri@habana.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oded Gabbay <ogabbay@kernel.org>

[ Upstream commit 42422993cf28d456778ee9168d73758ec037cd51 ]

Gaudi2 with PCI revision ID with the value of '3' represents Gaudi2C
device and should be detected and initialized as Gaudi2.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/habanalabs/common/device.c                 | 3 +++
 drivers/accel/habanalabs/common/habanalabs.h             | 2 ++
 drivers/accel/habanalabs/common/habanalabs_drv.c         | 3 +++
 drivers/accel/habanalabs/common/mmu/mmu.c                | 1 +
 drivers/accel/habanalabs/common/sysfs.c                  | 3 +++
 drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h | 1 +
 6 files changed, 13 insertions(+)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index b97339d1f7c6..ebef56478e18 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -808,6 +808,9 @@ static int device_early_init(struct hl_device *hdev)
 		gaudi2_set_asic_funcs(hdev);
 		strscpy(hdev->asic_name, "GAUDI2B", sizeof(hdev->asic_name));
 		break;
+	case ASIC_GAUDI2C:
+		gaudi2_set_asic_funcs(hdev);
+		strscpy(hdev->asic_name, "GAUDI2C", sizeof(hdev->asic_name));
 		break;
 	default:
 		dev_err(hdev->dev, "Unrecognized ASIC type %d\n",
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 2f027d5a8206..05febd5b14e9 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1220,6 +1220,7 @@ struct hl_dec {
  * @ASIC_GAUDI_SEC: Gaudi secured device (HL-2000).
  * @ASIC_GAUDI2: Gaudi2 device.
  * @ASIC_GAUDI2B: Gaudi2B device.
+ * @ASIC_GAUDI2C: Gaudi2C device.
  */
 enum hl_asic_type {
 	ASIC_INVALID,
@@ -1228,6 +1229,7 @@ enum hl_asic_type {
 	ASIC_GAUDI_SEC,
 	ASIC_GAUDI2,
 	ASIC_GAUDI2B,
+	ASIC_GAUDI2C,
 };
 
 struct hl_cs_parser;
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 7263e84c1a4d..010bf63fcca3 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -101,6 +101,9 @@ static enum hl_asic_type get_asic_type(struct hl_device *hdev)
 		case REV_ID_B:
 			asic_type = ASIC_GAUDI2B;
 			break;
+		case REV_ID_C:
+			asic_type = ASIC_GAUDI2C;
+			break;
 		default:
 			break;
 		}
diff --git a/drivers/accel/habanalabs/common/mmu/mmu.c b/drivers/accel/habanalabs/common/mmu/mmu.c
index b2145716c605..b654302a68fc 100644
--- a/drivers/accel/habanalabs/common/mmu/mmu.c
+++ b/drivers/accel/habanalabs/common/mmu/mmu.c
@@ -596,6 +596,7 @@ int hl_mmu_if_set_funcs(struct hl_device *hdev)
 		break;
 	case ASIC_GAUDI2:
 	case ASIC_GAUDI2B:
+	case ASIC_GAUDI2C:
 		/* MMUs in Gaudi2 are always host resident */
 		hl_mmu_v2_hr_set_funcs(hdev, &hdev->mmu_func[MMU_HR_PGT]);
 		break;
diff --git a/drivers/accel/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
index 01f89f029355..278606373055 100644
--- a/drivers/accel/habanalabs/common/sysfs.c
+++ b/drivers/accel/habanalabs/common/sysfs.c
@@ -251,6 +251,9 @@ static ssize_t device_type_show(struct device *dev,
 	case ASIC_GAUDI2B:
 		str = "GAUDI2B";
 		break;
+	case ASIC_GAUDI2C:
+		str = "GAUDI2C";
+		break;
 	default:
 		dev_err(hdev->dev, "Unrecognized ASIC type %d\n",
 				hdev->asic_type);
diff --git a/drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h b/drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h
index f5d497dc9bdc..4f951cada077 100644
--- a/drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h
+++ b/drivers/accel/habanalabs/include/hw_ip/pci/pci_general.h
@@ -25,6 +25,7 @@ enum hl_revision_id {
 	REV_ID_INVALID				= 0x00,
 	REV_ID_A				= 0x01,
 	REV_ID_B				= 0x02,
+	REV_ID_C				= 0x03
 };
 
 #endif /* INCLUDE_PCI_GENERAL_H_ */
-- 
2.43.0

