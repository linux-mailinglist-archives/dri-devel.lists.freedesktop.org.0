Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C207A72C3AB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 14:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502D610E206;
	Mon, 12 Jun 2023 12:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A4310E010
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:07:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D118661693
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944C4C433EF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686571659;
 bh=7m0aXQ68iQWYEEliktpGifEVzQhcpTkJxmBDRCfQfKM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=J34yxTyHJpILIB7tW6SymKxRHYpxpversq9qGGF532YxnV5NMm3McXyZsn2hP8MBN
 w/ZaLhEbK6BmP/iyl4nzEmHCuHTvON/6F39F7tnDg9REz1RzsJfP+s0cTZQrohbPT0
 73Ipogsa0xBfpLM7yIi/BoGrHA1jzdtvM/ByXj+eh0HQQG5uPG01PJ7At7iTqXu3lR
 8TPjmXBUuM07g5XnzMLicrOqjZXW1b+gVYwOYE+ebgMO2QAYVV4oDPoXqzwTIaZLGU
 zleyr6f9YzTef36HAe5lEP0+5MGWMaS8/DjhxRLPsSF92Cso7zYZ3V4zalX2D30rsj
 hCJuogv8oCHVQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] accel/habanalabs: reset device if scrubbing failed
Date: Mon, 12 Jun 2023 15:07:32 +0300
Message-Id: <20230612120733.3079507-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612120733.3079507-1-ogabbay@kernel.org>
References: <20230612120733.3079507-1-ogabbay@kernel.org>
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

If scrubbing memory after user released device has failed it means
the device is in a bad state and should be reset.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 5e61761b8c11..d7d9198b2103 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -454,8 +454,10 @@ static void hpriv_release(struct kref *ref)
 		/* Scrubbing is handled within hl_device_reset(), so here need to do it directly */
 		int rc = hdev->asic_funcs->scrub_device_mem(hdev);
 
-		if (rc)
+		if (rc) {
 			dev_err(hdev->dev, "failed to scrub memory from hpriv release (%d)\n", rc);
+			hl_device_reset(hdev, HL_DRV_RESET_HARD);
+		}
 	}
 
 	/* Now we can mark the compute_ctx as not active. Even if a reset is running in a different
-- 
2.40.1

