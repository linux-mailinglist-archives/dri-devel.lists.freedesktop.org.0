Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 741666C0076
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 10:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D0210E167;
	Sun, 19 Mar 2023 09:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B7210E167
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:58:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6975960F25;
 Sun, 19 Mar 2023 09:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DF7C4339C;
 Sun, 19 Mar 2023 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679219938;
 bh=bpAd5qHTME4z148sv17BRNOybaFyzvWZ3KydlTZiMms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kLxHeFWDezlHGEeOT8yLjwPmQxZH+g70pDYQfKTCkHkjyas/AJ8k+77pGFOvhHvb5
 5WJD1tvrRmWTfy9DPIatamK+iSYrgWCw6LQ6UiKRqsghCQpaQs+Nyw/sRXh1AXapx2
 5SlSZ10mnGgWk7MF8RwWGpnvnHXXBZNN6KuFq0sHjwJUeNSsjZlMbf1ShLcA/ohmC/
 ApBlSRCbC9gFc9LwChws/V9q+Yw23rZOmtqq/KCN4OL3oGdG+KjoODl+y5A3wYbjko
 qlx8Hios6EeptByyyHDMLaMqfjgLQBXgWuUiJgR3jXFcvn254Xu7WlC2m5Soh5DTB7
 FcnaKoDj4Wnvw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] accel/habanalabs: change razwi handle after fw fix
Date: Sun, 19 Mar 2023 11:58:49 +0200
Message-Id: <20230319095850.692040-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230319095850.692040-1-ogabbay@kernel.org>
References: <20230319095850.692040-1-ogabbay@kernel.org>
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

FW had one data route for tpc0 and tpc1 when running in secured mode
and a different one when running without secured mode. After fw fixed
this issue, both mode have the same data path.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 4 ++++
 drivers/accel/habanalabs/gaudi2/gaudi2.c     | 6 ++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 1636f6a700b9..a6f5c2152b0a 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3547,6 +3547,10 @@ struct hl_ioctl_desc {
 	hl_ioctl_t *func;
 };
 
+static inline bool hl_is_fw_ver_below_1_9(struct hl_device *hdev)
+{
+	return (hdev->fw_major_version < 42);
+}
 
 /*
  * Kernel module functions that can be accessed by entire module
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index cff1d4588913..b13f998ae09d 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7973,10 +7973,8 @@ static void gaudi2_ack_module_razwi_event_handler(struct hl_device *hdev,
 	case RAZWI_TPC:
 		hbw_rtr_id = gaudi2_tpc_initiator_hbw_rtr_id[module_idx];
 
-		/* TODO : remove this check and depend only on tpc routers table
-		 * when SW-118828 is resolved
-		 */
-		if (!hdev->asic_prop.fw_security_enabled &&
+		if (hl_is_fw_ver_below_1_9(hdev) &&
+				!hdev->asic_prop.fw_security_enabled &&
 				((module_idx == 0) || (module_idx == 1)))
 			lbw_rtr_id = DCORE0_RTR0;
 		else
-- 
2.40.0

