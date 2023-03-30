Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6506CFC9A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CE310ECF5;
	Thu, 30 Mar 2023 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F5D10E17D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:22:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EF6F61F19;
 Thu, 30 Mar 2023 07:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3F5C4339B;
 Thu, 30 Mar 2023 07:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680160947;
 bh=EApxA2yC2L+KBAQTBUQlwEuL9GYxPh5rZiwrKQEq8ps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AbMpYRRtxR1tQwJqjeAKqXZpCpF8bKRBBNNgILJEN0enWSJ8DvYOXgpNMmyhU2YNg
 osSDuSqbFXf71+9SCbLYIe3k+U4o4l5L2mHMXD8sEA14Qp5fdup/cMrGTkMlvD9vHA
 x0smM+lRzmCSW/HLqs/2h1UF12MPG/9JK2jNVgqb93WjE1QBy00+62FnyakxAmSXza
 Bznb5c3MFN+F2JXYOzHiy6CHhQB88zDs/ee20d/YdXJW2dkJNNXQBWnkrgGs3DydQz
 hm4EsD12hrrHpjUw6nAw6JQQLMlWfvF6PXt8YWZg7OyOjL2d4xNEVVa7qhIvseJ6F/
 WlcrKGjH2WMzw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] accel/habanalabs: fixes for unexpected error interrupt
Date: Thu, 30 Mar 2023 10:22:13 +0300
Message-Id: <20230330072213.1596318-7-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330072213.1596318-1-ogabbay@kernel.org>
References: <20230330072213.1596318-1-ogabbay@kernel.org>
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

Removing redundant asic prop variable as we don't need to expose this
to common code. In addition, fix some typos.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 2 --
 drivers/accel/habanalabs/gaudi2/gaudi2.c     | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 8c3bcc50e560..eaae69a9f817 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -663,7 +663,6 @@ struct hl_hints_range {
  * @user_dec_intr_count: number of decoder interrupts exposed to user.
  * @tpc_interrupt_id: interrupt id for TPC to use in order to raise events towards the host.
  * @eq_interrupt_id: interrupt id for EQ, uses to synchronize EQ interrupts in hard-reset.
- * @unexpected_user_error_interrupt_id: interrupt id used to indicate an unexpected user error.
  * @cache_line_size: device cache line size.
  * @server_type: Server type that the ASIC is currently installed in.
  *               The value is according to enum hl_server_type in uapi file.
@@ -795,7 +794,6 @@ struct asic_fixed_properties {
 	u16				user_dec_intr_count;
 	u16				tpc_interrupt_id;
 	u16				eq_interrupt_id;
-	u16				unexpected_user_error_interrupt_id;
 	u16				cache_line_size;
 	u16				server_type;
 	u8				completion_queues_count;
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 554020026da8..da1b2e6dd683 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2440,7 +2440,6 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 	prop->first_available_user_interrupt = GAUDI2_IRQ_NUM_USER_FIRST;
 	prop->tpc_interrupt_id = GAUDI2_IRQ_NUM_TPC_ASSERT;
 	prop->eq_interrupt_id = GAUDI2_IRQ_NUM_EVENT_QUEUE;
-	prop->unexpected_user_error_interrupt_id = GAUDI2_IRQ_NUM_UNEXPECTED_ERROR;
 
 	prop->first_available_cq[0] = GAUDI2_RESERVED_CQ_NUMBER;
 
@@ -3351,7 +3350,7 @@ static void gaudi2_user_interrupt_setup(struct hl_device *hdev)
 	/* Initialize TPC interrupt */
 	HL_USR_INTR_STRUCT_INIT(hdev->tpc_interrupt, hdev, 0, HL_USR_INTERRUPT_TPC);
 
-	/* Initialize general purpose interrupt */
+	/* Initialize unexpected error interrupt */
 	HL_USR_INTR_STRUCT_INIT(hdev->unexpected_error_interrupt, hdev, 0,
 						HL_USR_INTERRUPT_UNEXPECTED);
 
@@ -4015,7 +4014,7 @@ static const char *gaudi2_irq_name(u16 irq_number)
 	case GAUDI2_IRQ_NUM_TPC_ASSERT:
 		return "gaudi2 tpc assert";
 	case GAUDI2_IRQ_NUM_UNEXPECTED_ERROR:
-		return "gaudi2 tpc assert";
+		return "gaudi2 unexpected error";
 	case GAUDI2_IRQ_NUM_USER_FIRST ... GAUDI2_IRQ_NUM_USER_LAST:
 		return "gaudi2 user completion";
 	default:
-- 
2.40.0

