Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206CC728185
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842D910E5BF;
	Thu,  8 Jun 2023 13:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0407810E5BE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:39:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F876615C6;
 Thu,  8 Jun 2023 13:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7B8C433EF;
 Thu,  8 Jun 2023 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231540;
 bh=uLSxa7ges5FDdOtA4rzheK23+sZW+cK1JCKXn98hFxg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QihLOvZggdsfgRXU+Czr3czPjUm9Wx5PokcH9VXuLkYB2pZqYTfqUl2egftx2h888
 jCCu33SjNUMhK7pbgyPWU4ztpj6JMo1AFU+eAb5Ru8Ny0qtMMsayZSmef0hp9u7xyx
 3+ajmJ5l9E56f9qa8+LWHJ94f0FiMKxqpAAyBa4S043JQuEb+ZGPcJ5jjFgbzjtkyL
 vi2xfQH8afGorjCd2Q6XjPaCmAyF3bYq/ywR9CgPdei36v1hI1cGHl2cK3ztg8nUcT
 uqAjpytTUNiWlYHsE1sGItEV1FAttkjVllbnRlT0RZpRBgeeN7jQ6FpLqi3fXJe+/X
 VMIoXASNeZAhg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] accel/habanalabs: print task name upon creation of a
 user context
Date: Thu,  8 Jun 2023 16:38:42 +0300
Message-Id: <20230608133849.2739411-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608133849.2739411-1-ogabbay@kernel.org>
References: <20230608133849.2739411-1-ogabbay@kernel.org>
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

It is useful for debug to know which user process have acquired the
device.
Add this info to the relevant debug print, in addition to the already
printed user context's ASID.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/context.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/context.c b/drivers/accel/habanalabs/common/context.c
index 9c8b1b37b510..0a53f7154739 100644
--- a/drivers/accel/habanalabs/common/context.c
+++ b/drivers/accel/habanalabs/common/context.c
@@ -102,7 +102,7 @@ static void hl_ctx_fini(struct hl_ctx *ctx)
 	kfree(ctx->cs_pending);
 
 	if (ctx->asid != HL_KERNEL_ASID_ID) {
-		dev_dbg(hdev->dev, "closing user context %d\n", ctx->asid);
+		dev_dbg(hdev->dev, "closing user context, asid=%u\n", ctx->asid);
 
 		/* The engines are stopped as there is no executing CS, but the
 		 * Coresight might be still working by accessing addresses
@@ -198,6 +198,7 @@ int hl_ctx_create(struct hl_device *hdev, struct hl_fpriv *hpriv)
 
 int hl_ctx_init(struct hl_device *hdev, struct hl_ctx *ctx, bool is_kernel_ctx)
 {
+	char task_comm[TASK_COMM_LEN];
 	int rc = 0, i;
 
 	ctx->hdev = hdev;
@@ -267,7 +268,8 @@ int hl_ctx_init(struct hl_device *hdev, struct hl_ctx *ctx, bool is_kernel_ctx)
 
 		hl_encaps_sig_mgr_init(&ctx->sig_mgr);
 
-		dev_dbg(hdev->dev, "create user context %d\n", ctx->asid);
+		dev_dbg(hdev->dev, "create user context, comm=\"%s\", asid=%u\n",
+			get_task_comm(task_comm, current), ctx->asid);
 	}
 
 	return 0;
-- 
2.40.1

