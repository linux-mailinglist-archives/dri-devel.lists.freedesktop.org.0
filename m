Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6926939E3
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A18010E465;
	Sun, 12 Feb 2023 20:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF2510E047
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A58A60B35;
 Sun, 12 Feb 2023 20:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E71DC4339B;
 Sun, 12 Feb 2023 20:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234708;
 bh=qcgruyHgmeAGZ+Nu5xsXJW6PtlZWLKBNRcMePo8yFS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ayJWCoFOREp8riMRJLHpapoVteRxKovjl57E41Rp64cB4M1N4n+v6K6ee9wAs9y6m
 D8Q5ELVkMT/Tam2cRtEP2jk7Z8f+N6XMJzz+2q5bBoCh519Sz0j7rYPPHsdfiyaK6v
 hAB/1u+2rWcHdZjhQsHTTXY6oYIoPLhOc+bhkfHWbVJzdMQlxQGz0uL8wI82Gg3vQT
 kQxnx0iZ92zX7hj8K7JHLrASZP0I2WuF977vqcFyrhowwkpU9k28Ec53r7Is2J7KmU
 pxVKYeyEA5jgRWwQ79KmIZ97sc6egY2RNpJenujDiGgcpk7xOTKg7WpYnLDXDqopy+
 AT4QkDOyJDXNg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/27] habanalabs/gaudi: capture RAZWI info only if HW
 indication detected
Date: Sun, 12 Feb 2023 22:44:29 +0200
Message-Id: <20230212204454.2938561-2-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

RAZWI handling routine is called from most EQ events,
no matter if a RAZWI happens or not.
This fix is added to verify the handler is called only if
a real RAZWI indication in HW has been detected.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi/gaudi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 71debe862c86..7475f33734d7 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -7297,7 +7297,7 @@ static void gaudi_handle_qman_err(struct hl_device *hdev, u16 event_type, u64 *e
 }
 
 static void gaudi_print_irq_info(struct hl_device *hdev, u16 event_type,
-					bool razwi, u64 *event_mask)
+					bool check_razwi, u64 *event_mask)
 {
 	bool is_read = false, is_write = false;
 	u16 engine_id[2], num_of_razwi_eng = 0;
@@ -7316,7 +7316,7 @@ static void gaudi_print_irq_info(struct hl_device *hdev, u16 event_type,
 	dev_err_ratelimited(hdev->dev, "Received H/W interrupt %d [\"%s\"]\n",
 		event_type, desc);
 
-	if (razwi) {
+	if (check_razwi) {
 		gaudi_print_and_get_razwi_info(hdev, &engine_id[0], &engine_id[1], &is_read,
 						&is_write);
 		gaudi_print_and_get_mmu_error_info(hdev, &razwi_addr, event_mask);
@@ -7333,8 +7333,9 @@ static void gaudi_print_irq_info(struct hl_device *hdev, u16 event_type,
 				num_of_razwi_eng = 1;
 		}
 
-		hl_handle_razwi(hdev, razwi_addr, engine_id, num_of_razwi_eng, razwi_flags,
-				event_mask);
+		if (razwi_flags)
+			hl_handle_razwi(hdev, razwi_addr, engine_id, num_of_razwi_eng,
+					razwi_flags, event_mask);
 	}
 }
 
-- 
2.25.1

