Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8E285C082
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B9F10E4D0;
	Tue, 20 Feb 2024 16:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C/U4xc0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8C410E4D3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7578C611D4;
 Tue, 20 Feb 2024 16:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A70AC433C7;
 Tue, 20 Feb 2024 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444906;
 bh=2chqzJLlGnaDjPT3os8qGNEAIFqkHbeg9jiI4JJjOYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C/U4xc0oWdp1jZ7HhF+yTrGSflZaG3L5aV03rhLyEHRbNAi34ym8Zgllx3N5QAq7N
 9g0NsjIfQLbc17Ddfe0C0rxC19Kc68lzie5JXsRya2Tft7DFBEH51b9E68LU64Vba7
 RMUwYZW7MV046BNH9wMCx14bXHuha8DzGm+N3XHG4uKPjkQkg1TADMCkFZOMVZAR+n
 pj9K2DGxNtq5oZeD/mYATxoyfLW2+ib0BAm07oA6UXRkxRxMNeTDdPU69M5V9t8v6t
 0/0E6MnrGg/FApVx3OmXSBcgczSlDK/tQsiCz187kWeny47nkrgqe6xgOostK7KyYl
 aUnbV9U4i3arg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Dani Liberman <dliberman@habana.ai>
Subject: [PATCH 08/13] accel/habanalabs: fix error print
Date: Tue, 20 Feb 2024 18:01:24 +0200
Message-Id: <20240220160129.909714-8-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220160129.909714-1-ogabbay@kernel.org>
References: <20240220160129.909714-1-ogabbay@kernel.org>
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

From: Dani Liberman <dliberman@habana.ai>

The unmasking is for event and it can be other event than RAZWI.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 364d292c76fa..a3df7cf162d8 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -526,7 +526,7 @@ int hl_fw_unmask_irq(struct hl_device *hdev, u16 event_type)
 						0, &result);
 
 	if (rc)
-		dev_err(hdev->dev, "failed to unmask RAZWI IRQ %d", event_type);
+		dev_err(hdev->dev, "failed to unmask event %d", event_type);
 
 	return rc;
 }
@@ -565,7 +565,7 @@ int hl_fw_unmask_irq_arr(struct hl_device *hdev, const u32 *irq_arr,
 						total_pkt_size, 0, &result);
 
 	if (rc)
-		dev_err(hdev->dev, "failed to unmask IRQ array\n");
+		dev_err(hdev->dev, "failed to unmask event array\n");
 
 	kfree(pkt);
 
-- 
2.34.1

