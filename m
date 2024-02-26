Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B2866B7B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 08:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8489010EF19;
	Mon, 26 Feb 2024 07:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tzK8CBJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D70010E350
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:56:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A78E960CF7;
 Mon, 26 Feb 2024 07:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112CFC433F1;
 Mon, 26 Feb 2024 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708934197;
 bh=84cLmzGKsz74YXmtijIhaTWDvHtAQEPl3W7uQ8uYHpI=;
 h=From:To:Cc:Subject:Date:From;
 b=tzK8CBJxTk2J4R9IlN5TsZjaPrgKx1GeK2OimIfwbDYCed8dMt0HrpXPd/UPRpQnu
 6pYQSUO32VZKn4j0AUkpUUqIFrUkTEurrzNAPuVywTBwaHKbZUGG5AVvMamLp0X3fX
 Lt/MX4dDupkGt37PD1q/GU0yQUXr2gRcAOWtkfP2z6tCAer5s988OJGPyYWXCU/lLb
 VpLUULLP9DeYlv2Bm+iq4qs2G3hP8FE5xJwC0dJKlGVVbOsN8HnxlG5qp0V1XhVsqC
 F47lj+MJrWEO7KVmE6oWbi0Pup8hw3CnAZqtZBo9cDndZ1eoyA+EZrh6052LdNO0mk
 BIRHcdgGSKM4Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Carl Vanderlip <quic_carlv@quicinc.com>
Cc: Ohad Sharabi <osharabi@habana.ai>
Subject: [PATCH 1/3] accel/habanalabs/gaudi2: initialize field in correct
 function
Date: Mon, 26 Feb 2024 09:56:24 +0200
Message-Id: <20240226075626.1222534-1-ogabbay@kernel.org>
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

From: Ohad Sharabi <osharabi@habana.ai>

supports_advanced_cpucp_rc is an asic property which should be
initialized in the gaudi2_set_fixed_properties(), where all of the
asic properties are initialized.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index fa1c4feb9f89..5be3432d29b3 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2601,6 +2601,8 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 
 	prop->hbw_flush_reg = mmPCIE_WRAP_SPECIAL_GLBL_SPARE_0;
 
+	prop->supports_advanced_cpucp_rc = true;
+
 	return 0;
 
 free_qprops:
@@ -3308,8 +3310,6 @@ static int gaudi2_late_init(struct hl_device *hdev)
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
 	int rc;
 
-	hdev->asic_prop.supports_advanced_cpucp_rc = true;
-
 	rc = hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_ENABLE_PCI_ACCESS,
 					gaudi2->virt_msix_db_dma_addr);
 	if (rc) {
-- 
2.34.1

