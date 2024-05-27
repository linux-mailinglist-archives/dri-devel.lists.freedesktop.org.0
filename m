Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD078CFFA9
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 14:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A075B10F4BD;
	Mon, 27 May 2024 12:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="oiOfkJPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3B410F4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 12:13:07 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716811982; bh=jEOjfncRnHrY/GOzNXLpivOmaWg+BBdNPnztm7r0mH8=;
 h=From:To:Cc:Subject:Date:From;
 b=oiOfkJPX8EvLromWEhc+OBGh0jTo6HhFUurBbH+ItJWBQgulfLoxrTNFWkPllmHzC
 4f5nPBaR4/YBIhEb++Z7iaQLecrROgCM2Q5zOsXJgEw1+kjP2EHyzmKz7w6se1/lq+
 SJw4kMmWLt/U1UObkRwM3Q4gyzCHXB7aOtkVhXr/7vnssqQySbrH1SCB/s2F3+51Vt
 xTeG4KJOX7rdjMbooNAWbMDc2mQthgkI8pACSov7e0l8pMymF1C5VMTS6ZmeYfzhS/
 B9N1U5T2Edvr9Km/Q8CNoUxdUA9oRTIjuYZCUJYvyC0bse39D5BGJUaEQgn9XlWzMA
 30wkqU2xwtH9w==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RCCuar1921351; Mon, 27 May 2024 15:12:57 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Igal Zeltser <izeltser@habana.ai>
Subject: [PATCH 1/8] accel/habanalabs: use msg_header instead of desc_header
Date: Mon, 27 May 2024 15:12:47 +0300
Message-Id: <20240527121254.1921306-1-obitton@habana.ai>
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

From: Igal Zeltser <izeltser@habana.ai>

Struct comms_desc_header is deprecated and replaced by struct
comms_msg_header. As a preparation for removing comms_desc_header
from FW, all it's usage in code is replaced by comms_msg_header.

Signed-off-by: Igal Zeltser <izeltser@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/firmware_if.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index d1a1d601bde9..886b3c07503d 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -2093,7 +2093,7 @@ static int hl_fw_dynamic_validate_descriptor(struct hl_device *hdev,
 	 * note that no alignment/stride address issues here as all structures
 	 * are 64 bit padded.
 	 */
-	data_ptr = (u8 *)fw_desc + sizeof(struct comms_desc_header);
+	data_ptr = (u8 *)fw_desc + sizeof(struct comms_msg_header);
 	data_size = le16_to_cpu(fw_desc->header.size);
 
 	data_crc32 = hl_fw_compat_crc32(data_ptr, data_size);
@@ -2247,11 +2247,11 @@ static int hl_fw_dynamic_read_and_validate_descriptor(struct hl_device *hdev,
 	memcpy_fromio(fw_desc, src, sizeof(struct lkd_fw_comms_desc));
 	fw_data_size = le16_to_cpu(fw_desc->header.size);
 
-	temp_fw_desc = vzalloc(sizeof(struct comms_desc_header) + fw_data_size);
+	temp_fw_desc = vzalloc(sizeof(struct comms_msg_header) + fw_data_size);
 	if (!temp_fw_desc)
 		return -ENOMEM;
 
-	memcpy_fromio(temp_fw_desc, src, sizeof(struct comms_desc_header) + fw_data_size);
+	memcpy_fromio(temp_fw_desc, src, sizeof(struct comms_msg_header) + fw_data_size);
 
 	rc = hl_fw_dynamic_validate_descriptor(hdev, fw_loader,
 					(struct lkd_fw_comms_desc *) temp_fw_desc);
-- 
2.34.1

