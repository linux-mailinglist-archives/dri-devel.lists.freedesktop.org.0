Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BD970494E
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96ED10E33A;
	Tue, 16 May 2023 09:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F1510E332
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24A26626E2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32C6C433A0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229441;
 bh=JWFH/6paWRaECuKke9UDXgdisUT1UhcqypFlAo39EwI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UvP96CCRgxo4TMaPYm4TiIXIUHg0BKcAiwzSPdwKfGzFbCpcVZIeTzPKuocMVhCyW
 xmlTwxDZQgy/DOAvpHFPqT2QUldo1h7AJjtXCuYjNglKeqash0GEnJiQSXxOiX8iKJ
 OXnS8GxuPykwKy2CzsG6dpWDVO9vGL0RGhMNPBbnLiv7cTrUzHl1N/tTR5puyR9hwW
 8RsYX3WRt8SQtntNGfiD825lKowfRt9hbZpKgRMtjJW23NXZLnfFF/RCa4O9Cdo9cN
 ss3jUcezvvfERhAgzUmUy6IoW90cp9y/VprzzXdwv5EPeOwY7rgq7xRwfyR7PSNf+j
 t+4D0BScgAG1A==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] accel/habanalabs: print max timeout value on CS stuck
Date: Tue, 16 May 2023 12:30:23 +0300
Message-Id: <20230516093030.1220526-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516093030.1220526-1-ogabbay@kernel.org>
References: <20230516093030.1220526-1-ogabbay@kernel.org>
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

If a workload got stuck, we print an error to the kernel log about it.
Add to that print the configured max timeout value, as that value is
not fixed between ASICs and in addition it can be configured using
a kernel module parameter.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/command_submission.c    | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index ccf68f482948..4ec28af3ed78 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -804,12 +804,14 @@ static void cs_do_release(struct kref *ref)
 
 static void cs_timedout(struct work_struct *work)
 {
+	struct hl_cs *cs = container_of(work, struct hl_cs, work_tdr.work);
+	bool skip_reset_on_timeout, device_reset = false;
 	struct hl_device *hdev;
 	u64 event_mask = 0x0;
+	uint timeout_sec;
 	int rc;
-	struct hl_cs *cs = container_of(work, struct hl_cs,
-						 work_tdr.work);
-	bool skip_reset_on_timeout = cs->skip_reset_on_timeout, device_reset = false;
+
+	skip_reset_on_timeout = cs->skip_reset_on_timeout;
 
 	rc = cs_get_unless_zero(cs);
 	if (!rc)
@@ -840,29 +842,31 @@ static void cs_timedout(struct work_struct *work)
 		event_mask |= HL_NOTIFIER_EVENT_CS_TIMEOUT;
 	}
 
+	timeout_sec = jiffies_to_msecs(hdev->timeout_jiffies) / 1000;
+
 	switch (cs->type) {
 	case CS_TYPE_SIGNAL:
 		dev_err(hdev->dev,
-			"Signal command submission %llu has not finished in time!\n",
-			cs->sequence);
+			"Signal command submission %llu has not finished in %u seconds!\n",
+			cs->sequence, timeout_sec);
 		break;
 
 	case CS_TYPE_WAIT:
 		dev_err(hdev->dev,
-			"Wait command submission %llu has not finished in time!\n",
-			cs->sequence);
+			"Wait command submission %llu has not finished in %u seconds!\n",
+			cs->sequence, timeout_sec);
 		break;
 
 	case CS_TYPE_COLLECTIVE_WAIT:
 		dev_err(hdev->dev,
-			"Collective Wait command submission %llu has not finished in time!\n",
-			cs->sequence);
+			"Collective Wait command submission %llu has not finished in %u seconds!\n",
+			cs->sequence, timeout_sec);
 		break;
 
 	default:
 		dev_err(hdev->dev,
-			"Command submission %llu has not finished in time!\n",
-			cs->sequence);
+			"Command submission %llu has not finished in %u seconds!\n",
+			cs->sequence, timeout_sec);
 		break;
 	}
 
-- 
2.40.1

