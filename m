Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66885C089
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFC110E4E3;
	Tue, 20 Feb 2024 16:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZBDBLFMJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5456410E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFCBF611CE;
 Tue, 20 Feb 2024 16:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C26C433F1;
 Tue, 20 Feb 2024 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444904;
 bh=b5/Z55R6exEVvxby5IEzYsTksFcDh5Hf4EvWs+jygLE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZBDBLFMJS2BrT4mZnHrA0+stJiohHRBo8uvCXXLWgZZpml4V1WpIb9mTyfFdsrZat
 h0EbCrgQEQx8Vdv0WzJnhGb3mEzEQhO0c0GU673ydgB0vL2B+YTda54pHQR6GNrzVk
 u+Qj/ex22frAV++VsRXP3wrZFRLfanliSpWaZlko64CI1XkU9G/HJGh5d444G2XZep
 4+rLCdx9XWggoaC72hMhvxH1KZvrppTZ26WKIRAmAO2IaNbCalvrpj7vyDspZyDE5g
 UzCSJkyCKL+51Egomc7/b16KNEmLR6QuXcyyqCL+6XVxECRylZNcRMfKyjnU3E0Fhm
 cyzfbR4Ymtvzg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Tal Risin <trisin@habana.ai>
Subject: [PATCH 07/13] accel/habanalabs: initialize maybe-uninitialized
 variables
Date: Tue, 20 Feb 2024 18:01:23 +0200
Message-Id: <20240220160129.909714-7-ogabbay@kernel.org>
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

From: Tal Risin <trisin@habana.ai>

Prevent static analysis warning.

Signed-off-by: Tal Risin <trisin@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/debugfs.c b/drivers/accel/habanalabs/common/debugfs.c
index ab0fe74b49d0..b1c88d1837d9 100644
--- a/drivers/accel/habanalabs/common/debugfs.c
+++ b/drivers/accel/habanalabs/common/debugfs.c
@@ -484,7 +484,7 @@ static ssize_t mmu_asid_va_write(struct file *file, const char __user *buf,
 	struct hl_debugfs_entry *entry = s->private;
 	struct hl_dbg_device_entry *dev_entry = entry->dev_entry;
 	struct hl_device *hdev = dev_entry->hdev;
-	char kbuf[MMU_KBUF_SIZE];
+	char kbuf[MMU_KBUF_SIZE] = {0};
 	char *c;
 	ssize_t rc;
 
@@ -546,7 +546,7 @@ static ssize_t mmu_ack_error_value_write(struct file *file,
 	struct hl_debugfs_entry *entry = s->private;
 	struct hl_dbg_device_entry *dev_entry = entry->dev_entry;
 	struct hl_device *hdev = dev_entry->hdev;
-	char kbuf[MMU_KBUF_SIZE];
+	char kbuf[MMU_KBUF_SIZE] = {0};
 	ssize_t rc;
 
 	if (count > sizeof(kbuf) - 1)
-- 
2.34.1

