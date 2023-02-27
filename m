Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756A66A405D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140E610E3C7;
	Mon, 27 Feb 2023 11:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3907F10E3B9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:13:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1B3360DD5;
 Mon, 27 Feb 2023 11:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C50C433D2;
 Mon, 27 Feb 2023 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677496399;
 bh=c4IRG41WkBHaqBWynAwU8Sjn0Ina7sC4Ycm9QQIDYWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jrAW//rcXsZaQ9NHfpQFtGOtgYUhTAKG6HqcRLLY19rdArhtBpYgYuPCA9VmTjx1o
 TBM4KMnDNf4B43IWScHM9nVo/iuMckPgRjLFgMQgXvyQ3xiwKQhMiafSbiE7BLx5Fb
 qMPoMVPtfAmpCU4ZBKtasvDw3WS7SKDWNnuBO4hD55siAeqKKEkQ2RJdeVFKgW8M/O
 65+ACrYV+BM/0RFC10f+COdIj1gxYrN/Ext/JTNU1/qxRp+GoRJc2oEINQxue5M9+U
 wBYLYe/+zcbjADm8bQgTx5YR+vJKKbINA+5JfWThfyGEIGIq9Kjpjs2K/wlpfMOcAx
 /SdD1ZyQK2lew==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] habanalabs/gaudi2: verify return code after scrubbing
 ARCs DCCMs
Date: Mon, 27 Feb 2023 13:13:06 +0200
Message-Id: <20230227111306.3985896-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227111306.3985896-1-ogabbay@kernel.org>
References: <20230227111306.3985896-1-ogabbay@kernel.org>
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

In case the KDMA fails scrubbing the DCCMs (following a soft-reset
upon device release), the driver will only print failure until reset
flow ends, rather than escalating it into a hard-reset.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 26 ++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index f01fa4bca381..2186f8bd547e 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -3024,16 +3024,21 @@ static int gaudi2_scrub_arc_dccm(struct hl_device *hdev, u32 cpu_id)
 	return 0;
 }
 
-static void gaudi2_scrub_arcs_dccm(struct hl_device *hdev)
+static int gaudi2_scrub_arcs_dccm(struct hl_device *hdev)
 {
 	u16 arc_id;
+	int rc;
 
 	for (arc_id = CPU_ID_SCHED_ARC0 ; arc_id < CPU_ID_MAX ; arc_id++) {
 		if (!gaudi2_is_arc_enabled(hdev, arc_id))
 			continue;
 
-		gaudi2_scrub_arc_dccm(hdev, arc_id);
+		rc = gaudi2_scrub_arc_dccm(hdev, arc_id);
+		if (rc)
+			return rc;
 	}
+
+	return 0;
 }
 
 static int gaudi2_late_init(struct hl_device *hdev)
@@ -3057,7 +3062,13 @@ static int gaudi2_late_init(struct hl_device *hdev)
 	}
 
 	gaudi2_init_arcs(hdev);
-	gaudi2_scrub_arcs_dccm(hdev);
+
+	rc = gaudi2_scrub_arcs_dccm(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to scrub arcs DCCM\n");
+		goto disable_pci_access;
+	}
+
 	gaudi2_init_security(hdev);
 
 	return 0;
@@ -6643,12 +6654,19 @@ static int gaudi2_compute_reset_late_init(struct hl_device *hdev)
 {
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
 	size_t irq_arr_size;
+	int rc;
 
 	/* TODO: missing gaudi2_nic_resume.
 	 * Until implemented nic_hw_cap_initialized will remain zeroed
 	 */
 	gaudi2_init_arcs(hdev);
-	gaudi2_scrub_arcs_dccm(hdev);
+
+	rc = gaudi2_scrub_arcs_dccm(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to scrub arcs DCCM\n");
+		return rc;
+	}
+
 	gaudi2_init_security(hdev);
 
 	/* Unmask all IRQs since some could have been received during the soft reset */
-- 
2.39.2

