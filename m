Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90FA6C66B7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 12:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6F810EA6E;
	Thu, 23 Mar 2023 11:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6ED10E46E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 11:35:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E13A062606;
 Thu, 23 Mar 2023 11:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6852FC4339B;
 Thu, 23 Mar 2023 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679571335;
 bh=WcoQqs1nDbhSzgIdgSJjl18bpwV96ePf17ORSFkoyLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NVlZLNNqqiymnGvf2krtB6MChFikZ3WjbK2XV6rSpzgqGysB901uoi3DbWkXZXnGJ
 rQqMqkC73ChTCHhFGv0yIlIpVIqfLnD9GavJ1J5di1hQ3DEa7EWdAVnh4cKK14G/mZ
 DPmW6jD+wbH9ESg3haCdydXQxluTkvxMcFqWRCcdqL18nx0o/Bbrh5ZGkk1JUyCg8u
 hSzGcCOutH2qA4W5prkGmaEa0sggkfhnIIrcl8z5BJgm8ep1gh5F5KCCyKL3GG+JZZ
 xJtbFLppRwH8uM7g1TxO1qJPYbR53pndIlPdVKUs8ONOw1DPJaDCGKaf3+g1COXdOP
 Mgc4UhBXV73VA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] accel/habanalabs: check return value of
 add_va_block_locked
Date: Thu, 23 Mar 2023 13:35:22 +0200
Message-Id: <20230323113525.959176-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323113525.959176-1-ogabbay@kernel.org>
References: <20230323113525.959176-1-ogabbay@kernel.org>
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

since the function might fail and we should propagate the failure.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 17b79d717896..a7b6a273ce21 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -605,6 +605,7 @@ static u64 get_va_block(struct hl_device *hdev,
 	bool is_align_pow_2  = is_power_of_2(va_range->page_size);
 	bool is_hint_dram_addr = hl_is_dram_va(hdev, hint_addr);
 	bool force_hint = flags & HL_MEM_FORCE_HINT;
+	int rc;
 
 	if (is_align_pow_2)
 		align_mask = ~((u64)va_block_align - 1);
@@ -722,9 +723,13 @@ static u64 get_va_block(struct hl_device *hdev,
 		kfree(new_va_block);
 	}
 
-	if (add_prev)
-		add_va_block_locked(hdev, &va_range->list, prev_start,
-				prev_end);
+	if (add_prev) {
+		rc = add_va_block_locked(hdev, &va_range->list, prev_start, prev_end);
+		if (rc) {
+			reserved_valid_start = 0;
+			goto out;
+		}
+	}
 
 	print_va_list_locked(hdev, &va_range->list);
 out:
-- 
2.40.0

