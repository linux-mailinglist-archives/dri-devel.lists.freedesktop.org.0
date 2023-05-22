Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7663A70BBB8
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1EF10E2CE;
	Mon, 22 May 2023 11:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05DF10E2CB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:25:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 433DF61A28;
 Mon, 22 May 2023 11:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD79C433D2;
 Mon, 22 May 2023 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684754755;
 bh=pl4Xe7Jqhl9deX08RwlfGJ8D2nLhKvtPCQFZ73eFLkE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JP4SdmqJVwvMizJJ5p6kD134c14YZByk02jJoDLDUUPNokYK5x2LtrDrWSDQ7XMky
 ixlnZBzS5FqJaLPrf6RXev8tNd0vG0cMGYY0EOWFhDJRfjXs2B1hny7HFW71AGiaeJ
 AQn8EvMBMS10o1dWvXtPg5oVMhBdsqFmnkPgIaSH2aqYeJjxoG83Zyueh6C+RqQvWp
 Cj4Zfi0W1LQc9jNBDyRZNWk0qxYbB7iTPlom8+lA7blAUOX5rB/pSza8J8RCTPTWAU
 jdlMU/jbvfsrVYV4wwreKisQaooiFbjgWaUUCB7SDlFXZfrNw+ozxtCuR+8IPqlZhb
 DZJSL8y92cXKQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] accel/habanalabs: add description to several info ioctls
Date: Mon, 22 May 2023 14:25:46 +0300
Message-Id: <20230522112548.1577359-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522112548.1577359-1-ogabbay@kernel.org>
References: <20230522112548.1577359-1-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

Several info ioctls may return success although no data retrieved.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 include/uapi/drm/habanalabs_accel.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index d45454b9a62e..03464ed86c68 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -787,18 +787,28 @@ enum hl_server_type {
  *                            The address which accessing it caused the razwi.
  *                            Razwi initiator.
  *                            Razwi cause, was it a page fault or MMU access error.
+ *                            May return 0 even though no new data is available, in that case
+ *                            timestamp will be 0.
  * HL_INFO_DEV_MEM_ALLOC_PAGE_SIZES - Retrieve valid page sizes for device memory allocation
  * HL_INFO_SECURED_ATTESTATION - Retrieve attestation report of the boot.
  * HL_INFO_REGISTER_EVENTFD   - Register eventfd for event notifications.
  * HL_INFO_UNREGISTER_EVENTFD - Unregister eventfd
  * HL_INFO_GET_EVENTS         - Retrieve the last occurred events
  * HL_INFO_UNDEFINED_OPCODE_EVENT - Retrieve last undefined opcode error information.
+ *                                  May return 0 even though no new data is available, in that case
+ *                                  timestamp will be 0.
  * HL_INFO_ENGINE_STATUS - Retrieve the status of all the h/w engines in the asic.
  * HL_INFO_PAGE_FAULT_EVENT - Retrieve parameters of captured page fault.
+ *                            May return 0 even though no new data is available, in that case
+ *                            timestamp will be 0.
  * HL_INFO_USER_MAPPINGS - Retrieve user mappings, captured after page fault event.
  * HL_INFO_FW_GENERIC_REQ - Send generic request to FW.
  * HL_INFO_HW_ERR_EVENT   - Retrieve information on the reported HW error.
+ *                          May return 0 even though no new data is available, in that case
+ *                          timestamp will be 0.
  * HL_INFO_FW_ERR_EVENT   - Retrieve information on the reported FW error.
+ *                          May return 0 even though no new data is available, in that case
+ *                          timestamp will be 0.
  */
 #define HL_INFO_HW_IP_INFO			0
 #define HL_INFO_HW_EVENTS			1
-- 
2.40.1

