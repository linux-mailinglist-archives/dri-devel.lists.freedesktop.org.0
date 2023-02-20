Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A68469C790
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 10:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7F410E62E;
	Mon, 20 Feb 2023 09:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0359110E62B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 09:19:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C46460C5D;
 Mon, 20 Feb 2023 09:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81C4C433D2;
 Mon, 20 Feb 2023 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676884786;
 bh=2O8sD9a7xBazoTiNZMZo6PZWVnfDoFv2nnNrqSB1OFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f5MreEAzaBwraZQrVsBQoOn/rEpf/Iv1kqqa1sNyS2XgVfG1TBkmr7uhXLdx7T9Bf
 0/L2e/BKY7udhnYN40IyxFiiFrfeqZ/vJVxUvBriWOAINDP50EDrPs0N5FgL+mXmAt
 YkFsutIrwcUCCeec6oLsjjBl/rMTb6OMsQQZs1i/vLcFzVopeN746fCC2QOgg0Hv3l
 p9XxtoeUl511dbYVKYFMk4nHisxaqAeZuBOvYDxpfokoYvG4KIgn7lWcUSYnG7yNIs
 FzLgzlKaA5q++1Q3Y4X84bv6DKs36jpOILY1ySeHJC+/Y1bAD47ucKEkZPIchMGQBj
 jySODWXqjkU/g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] habanalabs: improve readability of engines idle mask print
Date: Mon, 20 Feb 2023 11:19:37 +0200
Message-Id: <20230220091939.3467487-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220091939.3467487-1-ogabbay@kernel.org>
References: <20230220091939.3467487-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

Remove leading zeroes when printing the idle mask to make it clearer.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index a5f5ee102823..e544d00fe376 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -380,18 +380,17 @@ bool hl_ctrl_device_operational(struct hl_device *hdev,
 static void print_idle_status_mask(struct hl_device *hdev, const char *message,
 					u64 idle_mask[HL_BUSY_ENGINES_MASK_EXT_SIZE])
 {
-	u32 pad_width[HL_BUSY_ENGINES_MASK_EXT_SIZE] = {};
-
-	BUILD_BUG_ON(HL_BUSY_ENGINES_MASK_EXT_SIZE != 4);
-
-	pad_width[3] = idle_mask[3] ? 16 : 0;
-	pad_width[2] = idle_mask[2] || pad_width[3] ? 16 : 0;
-	pad_width[1] = idle_mask[1] || pad_width[2] ? 16 : 0;
-	pad_width[0] = idle_mask[0] || pad_width[1] ? 16 : 0;
-
-	dev_err(hdev->dev, "%s (mask %0*llx_%0*llx_%0*llx_%0*llx)\n",
-		message, pad_width[3], idle_mask[3], pad_width[2], idle_mask[2],
-		pad_width[1], idle_mask[1], pad_width[0], idle_mask[0]);
+	if (idle_mask[3])
+		dev_err(hdev->dev, "%s (mask %#llx_%016llx_%016llx_%016llx)\n",
+			message, idle_mask[3], idle_mask[2], idle_mask[1], idle_mask[0]);
+	else if (idle_mask[2])
+		dev_err(hdev->dev, "%s (mask %#llx_%016llx_%016llx)\n",
+			message, idle_mask[2], idle_mask[1], idle_mask[0]);
+	else if (idle_mask[1])
+		dev_err(hdev->dev, "%s (mask %#llx_%016llx)\n",
+			message, idle_mask[1], idle_mask[0]);
+	else
+		dev_err(hdev->dev, "%s (mask %#llx)\n", message, idle_mask[0]);
 }
 
 static void hpriv_release(struct kref *ref)
-- 
2.25.1

