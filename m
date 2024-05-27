Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA59C8CFF3D
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 13:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115C510E2E8;
	Mon, 27 May 2024 11:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="AVTOolle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567CA10E638
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 11:48:06 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716810481; bh=x6tqM8fBidIiiw78QtTBz20JiOc/vpqs+EK1lmsNOKc=;
 h=From:To:Cc:Subject:Date:From;
 b=AVTOollesVWN0FmcbNvyWhHx3idcaLiBLndGrGy29oMLV0zD9Hh1W5RfHvjuZjezA
 OatrqsaEv+J9DiGVdgi3SCJW2gH5BBa0APEBjz1FZzVtyyLOpPSsubXLYt1wqlx3ii
 2UyvvWkUWRXBe2vrFufQhEyKohFoP3+ec/jHXfpPxuS5hzSqZDVtZjYqNKZqrKJfEP
 CkWg3ev1rJFL/MIWnmX56w0Dhzvml8Foz7hC0qwjWvRgO+92UK0zTKnwlqhOd5Lluq
 hjIkMEeyR5gZo8ajRrILUd+KJz2cM9kQbsZg+B9IxbKyBLPtA++Nq5iqYzFeDfjbnN
 Geu8CkqVyOfgQ==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RBltNf1919357; Mon, 27 May 2024 14:47:55 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dani Liberman <dliberman@habana.ai>
Subject: [PATCH 1/9] accel/habanalabs: add device name to error print
Date: Mon, 27 May 2024 14:47:38 +0300
Message-Id: <20240527114746.1919292-1-obitton@habana.ai>
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

From: Dani Liberman <dliberman@habana.ai>

The extra info will help in better traceability and debug.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 8f92445c5a90..a381ece25592 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -439,16 +439,19 @@ static void print_idle_status_mask(struct hl_device *hdev, const char *message,
 					u64 idle_mask[HL_BUSY_ENGINES_MASK_EXT_SIZE])
 {
 	if (idle_mask[3])
-		dev_err(hdev->dev, "%s (mask %#llx_%016llx_%016llx_%016llx)\n",
-			message, idle_mask[3], idle_mask[2], idle_mask[1], idle_mask[0]);
+		dev_err(hdev->dev, "%s %s (mask %#llx_%016llx_%016llx_%016llx)\n",
+			dev_name(&hdev->pdev->dev), message,
+			idle_mask[3], idle_mask[2], idle_mask[1], idle_mask[0]);
 	else if (idle_mask[2])
-		dev_err(hdev->dev, "%s (mask %#llx_%016llx_%016llx)\n",
-			message, idle_mask[2], idle_mask[1], idle_mask[0]);
+		dev_err(hdev->dev, "%s %s (mask %#llx_%016llx_%016llx)\n",
+			dev_name(&hdev->pdev->dev), message,
+			idle_mask[2], idle_mask[1], idle_mask[0]);
 	else if (idle_mask[1])
-		dev_err(hdev->dev, "%s (mask %#llx_%016llx)\n",
-			message, idle_mask[1], idle_mask[0]);
+		dev_err(hdev->dev, "%s %s (mask %#llx_%016llx)\n",
+			dev_name(&hdev->pdev->dev), message, idle_mask[1], idle_mask[0]);
 	else
-		dev_err(hdev->dev, "%s (mask %#llx)\n", message, idle_mask[0]);
+		dev_err(hdev->dev, "%s %s (mask %#llx)\n", dev_name(&hdev->pdev->dev), message,
+			idle_mask[0]);
 }
 
 static void hpriv_release(struct kref *ref)
-- 
2.34.1

