Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53797828847
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 15:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D91F10E2CF;
	Tue,  9 Jan 2024 14:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B40410E2CF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 14:37:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3E322B81B67;
 Tue,  9 Jan 2024 14:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806ADC433C7;
 Tue,  9 Jan 2024 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704811021;
 bh=Q9+aVUqVDr+Q791RDmzkgndLwzfe16JaEUEnnyw/38M=;
 h=From:To:Cc:Subject:Date:From;
 b=Z40cdBGKjRdZl/tWmkplbOIb1taPpCpKZpgf7BeUzvcCJh99ebnqg7S/kVRWO//9w
 0p/I1K3q/GUSp0CUnDwjHBAYVej8F/LCMgbeeKpxMRjN0N0PkuBUT8GRMT6i4d6AjW
 5szgaKuf0ZUMSD0gqclPeHUx3Ox5ZJlwBdNubQ8oM3TxvsJwbuwC8xRJT8pUEZO1PH
 VVhW/35Dg0XQoES6NI7iyzP38G8cvA3RP4HRRjN7v9TJLNq41nEYj2735ORcemT9zh
 WFRvHfym5rWi0ph+GkPgxIllzLSst4goHM7CD1+8HHJXMYrrd5CG351W27QIvA0QrC
 J1HLC611vYHaw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] accel/habanalabs: remove call to deprecated function
Date: Tue,  9 Jan 2024 16:36:55 +0200
Message-Id: <20240109143656.768980-1-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

In newer kernel versions, irq_set_affinity_hint() is deprecated.
Instead, use the newer version which is irq_set_affinity_and_hint().

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index bc66ad227aa5..493b4a4294a3 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2839,6 +2839,6 @@ void hl_set_irq_affinity(struct hl_device *hdev, int irq)
 		return;
 	}
 
-	if (irq_set_affinity_hint(irq, &hdev->irq_affinity_mask))
+	if (irq_set_affinity_and_hint(irq, &hdev->irq_affinity_mask))
 		dev_err(hdev->dev, "Failed setting irq %d affinity\n", irq);
 }
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 5863c9049134..05e2170c815e 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -4395,7 +4395,7 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 			i < GAUDI2_IRQ_NUM_USER_FIRST + user_irq_init_cnt ; i++, j++) {
 
 		irq = pci_irq_vector(hdev->pdev, i);
-		irq_set_affinity_hint(irq, NULL);
+		irq_set_affinity_and_hint(irq, NULL);
 		free_irq(irq, &hdev->user_interrupt[j]);
 	}
 	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_UNEXPECTED_ERROR);
@@ -4476,7 +4476,7 @@ static void gaudi2_disable_msix(struct hl_device *hdev)
 			k < hdev->asic_prop.user_interrupt_count ; i++, j++, k++) {
 
 		irq = pci_irq_vector(hdev->pdev, i);
-		irq_set_affinity_hint(irq, NULL);
+		irq_set_affinity_and_hint(irq, NULL);
 		free_irq(irq, &hdev->user_interrupt[j]);
 	}
 
-- 
2.34.1

