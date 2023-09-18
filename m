Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA627A4598
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8F810E22E;
	Mon, 18 Sep 2023 09:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24CD10E22D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8C349B80C02;
 Mon, 18 Sep 2023 09:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A35CC433C9;
 Mon, 18 Sep 2023 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028409;
 bh=9cdXrTw+/xKd2cIdxIiF2QqBtcopA1xELWmurmcutPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZAik4hO06gLlycr2aB+5sQ+GdcyuEFGNCy3wXx3ayf6iiH3AFxIJ4E8VmYUhRDnYf
 0mjjcdj3zD3H4MBiRjCpljUKKU5Q54qVFzIuMym5zWVFOkUtObaj/ZTNWeoKVn+3g5
 n1kapv04rq+IlPFOXjvTGdFNfH4SoeuK/cgX5mapQjJb7NZayXeHgssbgVQMw0uPDU
 xAHCX/YXSvVXZHfd5cO/j+OsmpFoPe0yE/sF5dcgCUMDLKRni/JpsAHFARWgjJtHuS
 ruULQNi+9uXJ+vpvMbFktyrKUWORlYH6kNQNsZJ8xuG552IH279YI9UYkzee5M73th
 3s6XfIlP3PWjg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/14] accel/habanalabs/gaudi2: include block id in ECC error
 reporting
Date: Mon, 18 Sep 2023 12:13:09 +0300
Message-Id: <20230918091321.855943-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918091321.855943-1-ogabbay@kernel.org>
References: <20230918091321.855943-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

During ECC event handling, Memory wrapper id was mistakenly
printed as block id. Fix the print and in addition fetch the actual
block-id from firmware.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 23 +++++++++++++++----
 .../habanalabs/include/common/cpucp_if.h      |  3 ++-
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index d60389b6700f..dca19be42d5f 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7834,16 +7834,29 @@ static void gaudi2_print_event(struct hl_device *hdev, u16 event_type,
 static bool gaudi2_handle_ecc_event(struct hl_device *hdev, u16 event_type,
 		struct hl_eq_ecc_data *ecc_data)
 {
-	u64 ecc_address = 0, ecc_syndrom = 0;
+	u64 ecc_address = 0, ecc_syndrome = 0;
 	u8 memory_wrapper_idx = 0;
+	bool has_block_id = false;
+	u16 block_id;
+
+	if (!hl_is_fw_sw_ver_below(hdev, 1, 12))
+		has_block_id = true;
 
 	ecc_address = le64_to_cpu(ecc_data->ecc_address);
-	ecc_syndrom = le64_to_cpu(ecc_data->ecc_syndrom);
+	ecc_syndrome = le64_to_cpu(ecc_data->ecc_syndrom);
 	memory_wrapper_idx = ecc_data->memory_wrapper_idx;
 
-	gaudi2_print_event(hdev, event_type, !ecc_data->is_critical,
-		"ECC error detected. address: %#llx. Syndrom: %#llx. block id %u. critical %u.",
-		ecc_address, ecc_syndrom, memory_wrapper_idx, ecc_data->is_critical);
+	if (has_block_id) {
+		block_id = le16_to_cpu(ecc_data->block_id);
+		gaudi2_print_event(hdev, event_type, !ecc_data->is_critical,
+			"ECC error detected. address: %#llx. Syndrome: %#llx. wrapper id %u. block id %#x. critical %u.",
+			ecc_address, ecc_syndrome, memory_wrapper_idx, block_id,
+			ecc_data->is_critical);
+	} else {
+		gaudi2_print_event(hdev, event_type, !ecc_data->is_critical,
+			"ECC error detected. address: %#llx. Syndrome: %#llx. wrapper id %u. critical %u.",
+			ecc_address, ecc_syndrome, memory_wrapper_idx, ecc_data->is_critical);
+	}
 
 	return !!ecc_data->is_critical;
 }
diff --git a/drivers/accel/habanalabs/include/common/cpucp_if.h b/drivers/accel/habanalabs/include/common/cpucp_if.h
index 33807b839c37..ef7d32224066 100644
--- a/drivers/accel/habanalabs/include/common/cpucp_if.h
+++ b/drivers/accel/habanalabs/include/common/cpucp_if.h
@@ -69,7 +69,8 @@ struct hl_eq_ecc_data {
 	__le64 ecc_syndrom;
 	__u8 memory_wrapper_idx;
 	__u8 is_critical;
-	__u8 pad[6];
+	__le16 block_id;
+	__u8 pad[4];
 };
 
 enum hl_sm_sei_cause {
-- 
2.34.1

