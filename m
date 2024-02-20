Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0493385C08C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C8710E4E7;
	Tue, 20 Feb 2024 16:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q5y9VUbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8582F10E4D0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EAB7A611C8;
 Tue, 20 Feb 2024 16:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1927C433C7;
 Tue, 20 Feb 2024 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444907;
 bh=dE659u+PsA/pnXbkHphHYL9rdcftJ4ufBepP1CdHia4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q5y9VUbm1WjFPmyTZ4HbSgazoNzYEia6GrXLgR72zC7W2Ng+TWYgdZyGdBSBqMv8k
 bntTj8b8C9hq+S1+iLxK65pmgj0Q3/2XBRt4Gaomd8ZbmLw5+eq3knGvOIw+895H9/
 t+xg2+paSMwn3KO0C7U5GHpTiTs9tRejaB47YgrP6my1eYVM4zn1X7MekXhjVAns7B
 m9NjcapMppuxzSQsoCXHQOEafzRcD5QWmtouEAkQXFI3cFIIT/e7y86JQjHINiNg/5
 S+zIuRIZGktzTFd0KOF15dfl0sqkFdm4iZSp+mLj/bUX3i8CoegkEzSkFPvkpRkXYT
 DWZXcYFbVCW2g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Ofir Bitton <obitton@habana.ai>
Subject: [PATCH 09/13] accel/habanalabs/gaudi2: drain event lacks rd/wr
 indication
Date: Tue, 20 Feb 2024 18:01:25 +0200
Message-Id: <20240220160129.909714-9-ogabbay@kernel.org>
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

From: Ofir Bitton <obitton@habana.ai>

Due to a H/W issue, AXI drain event does not include a read/write
indication, hence we remove this print.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 189d8da6a624..ba1518f2bf5c 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -9548,25 +9548,17 @@ static int gaudi2_handle_pcie_p2p_msix(struct hl_device *hdev, u16 event_type)
 static int gaudi2_handle_pcie_drain(struct hl_device *hdev,
 			struct hl_eq_pcie_drain_ind_data *drain_data)
 {
-	u64 lbw_rd, lbw_wr, hbw_rd, hbw_wr, cause, error_count = 0;
+	u64 cause, error_count = 0;
 
 	cause = le64_to_cpu(drain_data->intr_cause.intr_cause_data);
-	lbw_rd = le64_to_cpu(drain_data->drain_rd_addr_lbw);
-	lbw_wr = le64_to_cpu(drain_data->drain_wr_addr_lbw);
-	hbw_rd = le64_to_cpu(drain_data->drain_rd_addr_hbw);
-	hbw_wr = le64_to_cpu(drain_data->drain_wr_addr_hbw);
 
 	if (cause & BIT_ULL(0)) {
-		dev_err_ratelimited(hdev->dev,
-			"PCIE AXI drain LBW completed, read_err %u, write_err %u\n",
-			!!lbw_rd, !!lbw_wr);
+		dev_err_ratelimited(hdev->dev, "PCIE AXI drain LBW completed\n");
 		error_count++;
 	}
 
 	if (cause & BIT_ULL(1)) {
-		dev_err_ratelimited(hdev->dev,
-			"PCIE AXI drain HBW completed, raddr %#llx, waddr %#llx\n",
-			hbw_rd, hbw_wr);
+		dev_err_ratelimited(hdev->dev, "PCIE AXI drain HBW completed\n");
 		error_count++;
 	}
 
-- 
2.34.1

