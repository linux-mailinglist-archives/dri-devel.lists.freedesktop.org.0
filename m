Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB06B7A4B0D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0A210E04D;
	Mon, 18 Sep 2023 14:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6583210E04D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:32:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 678B8B80E3D;
 Mon, 18 Sep 2023 14:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4CFC32788;
 Mon, 18 Sep 2023 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695047524;
 bh=KWXNEqRTOD4JwIUMnjqhect4NpZR1NVv+98WQbVwsYM=;
 h=From:To:Cc:Subject:Date:From;
 b=Be4/FI1GjUVv0ePGd9MD0fqS7DYnI7O4cOlqFGAy0jnWuJDdTOwI8UnTFu6vN1oSB
 CxSsF98S0A31rIVV4DevEUaWCvE3nxvIbmsm61QWps3p7ShJ0JOZcHc55NCmrQSipy
 mqrftwWk0xzG9rUAXGR7+JruTKph0VlD/xPRvwRc4OrbqvNPsCB6EOld+KkYM2REBW
 O1vEXg+SXn7Xw/CtZOwhV3BwmCTCoCYbMNV1EvzGwqNLo7wwgbMJRLIe9FdMbbQ1Gt
 Tfc1rbmQQ7qwA3kMAzEh+7ri68IjoOGnwFSK48Z+mmPxIcXVq2gq/sthS/j2AY7Nb8
 MVXeCGFPx90xw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] accel/habanalabs: fix bug in timestamp interrupt
 handling
Date: Mon, 18 Sep 2023 17:31:49 +0300
Message-Id: <20230918143158.903207-1-ogabbay@kernel.org>
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
Cc: farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: farah kassabri <fkassabri@habana.ai>

There is a potential race between user thread seeking to re-use
a timestamp record with new interrupt id, while this record is still
in the middle of interrupt handling and it is about to be freed.
Imagine the driver set the record in_use to 0 and only then fill the
free_node information. This might lead to unpleasant scenario where
the new registration thread detects the record as free to use, and
change the cq buff address. That will cause the free_node to get
the wrong buffer address to put refcount to.

Signed-off-by: farah kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/irq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index f6b6c54bc868..058f27040805 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -259,8 +259,6 @@ static int handle_registration_node(struct hl_device *hdev, struct hl_user_pendi
 	dev_dbg(hdev->dev, "Irq handle: Timestamp record (%p) ts cb address (%p), interrupt_id: %u\n",
 			pend, pend->ts_reg_info.timestamp_kernel_addr, interrupt_id);
 
-	/* Mark kernel CB node as free */
-	pend->ts_reg_info.in_use = false;
 	list_del(&pend->wait_list_node);
 
 	/* Putting the refcount for ts_buff and cq_cb objects will be handled
@@ -270,6 +268,9 @@ static int handle_registration_node(struct hl_device *hdev, struct hl_user_pendi
 	free_node->cq_cb = pend->ts_reg_info.cq_cb;
 	list_add(&free_node->free_objects_node, *free_list);
 
+	/* Mark TS record as free */
+	pend->ts_reg_info.in_use = false;
+
 	return 0;
 }
 
-- 
2.34.1

