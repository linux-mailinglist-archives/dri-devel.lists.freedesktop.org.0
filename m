Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EA06939FA
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE54E10E479;
	Sun, 12 Feb 2023 20:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607D210E47D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 012E0B80D3A;
 Sun, 12 Feb 2023 20:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BF9C433A1;
 Sun, 12 Feb 2023 20:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234743;
 bh=0p0TBAnn9pJ1i+lrqn/TE0HpyZtrgwlYCdVH9eD/Iww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JiIi3pF8sR+v5LAyXVfIo5IkvU10jYqjN1+HR6DXviCI8bPdkG287uorMTQcqJHeg
 D7O7P8Fnal/8rTc+a1R/4febD2k5vMm4xfgDq2IXFEMUEBiUkdVRLnu+jrbKoD2zS6
 v5nlfspXkgX8JTD9WYladk6Q9QhSYmA27j5pYggWZJgsPotjrbBzbGzAECi7eddDVk
 IQ8ozuLQ2wbHuVEbmJVobommDn1vVc0WUOMF/bDvsw8sHEbKihRkjKNm15cEoNiaOK
 /HOS0laBWT8IFZlDBdz8OpcX/QjSHD6l7icWJRg8tij7PC29cLP4mUwXFLYl0IYVHr
 1AFl3pGePHLvw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 26/27] habanalabs: in hl_device_reset small refactor for
 readabilty
Date: Sun, 12 Feb 2023 22:44:53 +0200
Message-Id: <20230212204454.2938561-26-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

in the out_err flow, combine the two cases of soft-reset since
they have mostly common code. In addition unlock reset_info.lock
after touching reset count.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 47ed2fec68bc..8e71793c6ad1 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1852,17 +1852,16 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 			"%s Failed to reset! Device is NOT usable\n",
 			dev_name(&(hdev)->pdev->dev));
 		hdev->reset_info.hard_reset_cnt++;
-	} else if (reset_upon_device_release) {
-		spin_unlock(&hdev->reset_info.lock);
-		dev_err(hdev->dev, "Failed to reset device after user release\n");
-		flags |= HL_DRV_RESET_HARD;
-		flags &= ~HL_DRV_RESET_DEV_RELEASE;
-		hard_reset = true;
-		goto escalate_reset_flow;
 	} else {
+		if (reset_upon_device_release) {
+			dev_err(hdev->dev, "Failed to reset device after user release\n");
+			flags &= ~HL_DRV_RESET_DEV_RELEASE;
+		} else {
+			dev_err(hdev->dev, "Failed to do compute reset\n");
+			hdev->reset_info.compute_reset_cnt++;
+		}
+
 		spin_unlock(&hdev->reset_info.lock);
-		dev_err(hdev->dev, "Failed to do compute reset\n");
-		hdev->reset_info.compute_reset_cnt++;
 		flags |= HL_DRV_RESET_HARD;
 		hard_reset = true;
 		goto escalate_reset_flow;
-- 
2.25.1

