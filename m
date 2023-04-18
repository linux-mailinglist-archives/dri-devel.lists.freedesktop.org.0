Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9ED6E5DA2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45DE10E731;
	Tue, 18 Apr 2023 09:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2C410E726
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:39:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 981A0623D5;
 Tue, 18 Apr 2023 09:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26875C433D2;
 Tue, 18 Apr 2023 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681810773;
 bh=p9rbv1GioQA0SSdKIoOwp5qdaKDPXYiHe0ch00pyzM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PFh7XdCU1ayRMYAxC04dcu0UMzAJqA8baFDxiAHe8eRnYtl+aOS2FOkKCMY82nrdb
 cj1gWDwMsB9Ic/M7XpkPIVDHAHKy8ntkLLD8xBJ5g5s7XJFi6mGY8VQp99R/ZUxBA0
 H1LUQvgjG5m9s4ztvG/uxpoQLZd3V1iGKvWJB0UOXXKqqH6IMLNbsb2FqZ4oXAu+Bh
 jPDEb64RpgcHrjUsSK6ZSkByrxtNuxZQmrl0/fnVJvEQF9yHzQzKYSXoQEwSQ05zgJ
 jjH6n6TLTpAWF9CcozGDN/H392gYdyLcMl64vXZOlkOn+or5tv9oPA2fOxKHkYp1bp
 SjFuVN7BBfsTg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] accel/habanalabs: minimize encapsulation signal mutex
 lock time
Date: Tue, 18 Apr 2023 12:39:15 +0300
Message-Id: <20230418093916.2979728-9-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418093916.2979728-1-ogabbay@kernel.org>
References: <20230418093916.2979728-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Sync Stream Encapsulated Signal Handlers can be managed from different
contexts, and as such they are protected via a spin_lock.
However, spin_lock was unnecessarily protecting a larger code section
than really needed, covering a sleepable code section as well.
Since spin_lock disables preemption, it could lead to sleeping in
atomic context.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/command_submission.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 977900866e8f..56bc115e1b83 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -2152,7 +2152,7 @@ static int cs_ioctl_unreserve_signals(struct hl_fpriv *hpriv, u32 handle_id)
 
 			hdev->asic_funcs->hw_queues_unlock(hdev);
 			rc = -EINVAL;
-			goto out;
+			goto out_unlock;
 		}
 
 		/*
@@ -2167,15 +2167,21 @@ static int cs_ioctl_unreserve_signals(struct hl_fpriv *hpriv, u32 handle_id)
 
 		/* Release the id and free allocated memory of the handle */
 		idr_remove(&mgr->handles, handle_id);
+
+		/* unlock before calling ctx_put, where we might sleep */
+		spin_unlock(&mgr->lock);
 		hl_ctx_put(encaps_sig_hdl->ctx);
 		kfree(encaps_sig_hdl);
+		goto out;
 	} else {
 		rc = -EINVAL;
 		dev_err(hdev->dev, "failed to unreserve signals, cannot find handler\n");
 	}
-out:
+
+out_unlock:
 	spin_unlock(&mgr->lock);
 
+out:
 	return rc;
 }
 
-- 
2.40.0

