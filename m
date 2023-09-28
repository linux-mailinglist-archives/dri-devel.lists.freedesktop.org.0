Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176CA7B170B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42A210E0AA;
	Thu, 28 Sep 2023 09:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918A510E095
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 09:20:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C90C4B81B7E;
 Thu, 28 Sep 2023 09:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1222DC433C7;
 Thu, 28 Sep 2023 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695892805;
 bh=BMuxTiku+IlvNWwdHgMDtNzm/glYc+SS1e8AMX4mWDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DcQuR0gUyWlSbivUkssE/B80V9GssI/Sv70+YozuQ8mwVjvvCppHi6w79RQGWwM0A
 AXrNFtz6WHErXiRxjmbS+BQomkhMwtD2/nhCPai/v0RdA7qvXrmb7lSGSIJ+bnW7tV
 8pblNnvZfW6PVrPPTSmp2phezQQges2ydSBKEzuGMjMoiBm3JFojfdKj7a57M6ewy2
 PFm33xdcHFLvd1P/WVYknIwavX2OjMngsTN5Bb/Di45039mGZW0IPE275scvjABXVj
 IzQMnpIx2IvUpCbGPUgaTZPGbDsUDDoHdCnBFC8X8UuCE1UB/itxbXPGAQAmPFzzZO
 4Cyl1INTMbrHw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] accel/habanalabs/gaudi2: perform hard-reset upon PCIe AXI
 drain event
Date: Thu, 28 Sep 2023 12:19:56 +0300
Message-Id: <20230928091956.47762-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928091956.47762-1-ogabbay@kernel.org>
References: <20230928091956.47762-1-ogabbay@kernel.org>
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

Non-completed transactions from PCIe towards the device are handled by
the AXI drain mechanism. This handling is in the PCIe level, but the
transactions are still there in the device consuming some queues
entries, and therefore the device must be reset.
Modify to perform hard-reset upon PCIe AXI drain events.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
index 57e661771b6c..b2dbe1f64430 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
@@ -1293,7 +1293,7 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 		 .name = "" },
 	{ .fc_id = 631, .cpu_id = 128, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "PCIE_P2P_MSIX" },
-	{ .fc_id = 632, .cpu_id = 129, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
+	{ .fc_id = 632, .cpu_id = 129, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "PCIE_DRAIN_COMPLETE" },
 	{ .fc_id = 633, .cpu_id = 130, .valid = 1, .msg = 0, .reset = EVENT_RESET_TYPE_NONE,
 		 .name = "TPC0_BMON_SPMU" },
-- 
2.34.1

