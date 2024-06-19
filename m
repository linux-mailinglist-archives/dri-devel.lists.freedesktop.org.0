Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B2790E37C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38BA10E8B2;
	Wed, 19 Jun 2024 06:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Fxv1iIJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2300510E8B2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:34:37 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718778876; bh=7oYiZeDx+fTfe10HbMzhX8OPBVI3EpolpvrHlGHSnw4=;
 h=From:To:Subject:Date:From;
 b=Fxv1iIJ4pkR2dIjIynHvrT4ANRzILengTWF9k3ehg2v9UvVrBb4muC/5+wXa1mc+D
 6vmTnwH5PcQ7aGiya32rfuT0wRbm4dez38+ZF9q+Vt180ZEU2PAy0VT5IqSBtzwYOe
 w4n215l7cErbm+9v9hh3Zbx4DFIgh8QiYdnxoq9HLWiKbIbhHvRz1e4EpE6mtemP5N
 DgAv1F5V9/jiFKO2uby7KlsNAzwF/NJRXOXFZW0L7vM9woUbZ2K7TSEou3tjbIbgVN
 z9QUGK/kJQpNw5KHvuCxcnaXI2gCBjLhrFoQrPbexb79TwJi9asc9VsEJEzRL4duUJ
 SzAg+Xje7kr6A==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 45J6YQB11377354; Wed, 19 Jun 2024 09:34:26 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] accel/habanalbs/gaudi2: reduce interrupt count to 128
Date: Wed, 19 Jun 2024 09:34:17 +0300
Message-Id: <20240619063425.1377327-1-obitton@habana.ai>
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

Some systems allow a maximum number of 128 MSI-X interrupts.
Hence we reduce the interrupt count to 128 instead of 512.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/gaudi2/gaudi2P.h        | 8 ++++----
 drivers/accel/habanalabs/include/gaudi2/gaudi2.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index eee41387b269..05117272cac7 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -384,7 +384,7 @@ enum gaudi2_edma_id {
 /* User interrupt count is aligned with HW CQ count.
  * We have 64 CQ's per dcore, CQ0 in dcore 0 is reserved for legacy mode
  */
-#define GAUDI2_NUM_USER_INTERRUPTS 255
+#define GAUDI2_NUM_USER_INTERRUPTS 64
 #define GAUDI2_NUM_RESERVED_INTERRUPTS 1
 #define GAUDI2_TOTAL_USER_INTERRUPTS (GAUDI2_NUM_USER_INTERRUPTS + GAUDI2_NUM_RESERVED_INTERRUPTS)
 
@@ -416,11 +416,11 @@ enum gaudi2_irq_num {
 	GAUDI2_IRQ_NUM_NIC_PORT_LAST = (GAUDI2_IRQ_NUM_NIC_PORT_FIRST + NIC_NUMBER_OF_PORTS - 1),
 	GAUDI2_IRQ_NUM_TPC_ASSERT,
 	GAUDI2_IRQ_NUM_EQ_ERROR,
+	GAUDI2_IRQ_NUM_USER_FIRST,
+	GAUDI2_IRQ_NUM_USER_LAST = (GAUDI2_IRQ_NUM_USER_FIRST + GAUDI2_NUM_USER_INTERRUPTS - 1),
 	GAUDI2_IRQ_NUM_RESERVED_FIRST,
-	GAUDI2_IRQ_NUM_RESERVED_LAST = (GAUDI2_MSIX_ENTRIES - GAUDI2_TOTAL_USER_INTERRUPTS - 1),
+	GAUDI2_IRQ_NUM_RESERVED_LAST = (GAUDI2_MSIX_ENTRIES - GAUDI2_NUM_RESERVED_INTERRUPTS - 1),
 	GAUDI2_IRQ_NUM_UNEXPECTED_ERROR = RESERVED_MSIX_UNEXPECTED_USER_ERROR_INTERRUPT,
-	GAUDI2_IRQ_NUM_USER_FIRST = GAUDI2_IRQ_NUM_UNEXPECTED_ERROR + 1,
-	GAUDI2_IRQ_NUM_USER_LAST = (GAUDI2_IRQ_NUM_USER_FIRST + GAUDI2_NUM_USER_INTERRUPTS - 1),
 	GAUDI2_IRQ_NUM_LAST = (GAUDI2_MSIX_ENTRIES - 1)
 };
 
diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2.h
index 0231d6c55b4a..753d46a2836b 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2.h
@@ -63,9 +63,9 @@
 #define RESERVED_VA_RANGE_FOR_ARC_ON_HOST_HPAGE_START	0xFFF0F80000000000ull
 #define RESERVED_VA_RANGE_FOR_ARC_ON_HOST_HPAGE_END	0xFFF0FFFFFFFFFFFFull
 
-#define RESERVED_MSIX_UNEXPECTED_USER_ERROR_INTERRUPT	256
+#define RESERVED_MSIX_UNEXPECTED_USER_ERROR_INTERRUPT	127
 
-#define GAUDI2_MSIX_ENTRIES	512
+#define GAUDI2_MSIX_ENTRIES	128
 
 #define QMAN_PQ_ENTRY_SIZE	16			/* Bytes */
 
-- 
2.34.1

