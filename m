Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A36E37BB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 13:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBE310E066;
	Sun, 16 Apr 2023 11:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5F710E080
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 11:31:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14C4160C75;
 Sun, 16 Apr 2023 11:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBE5C433D2;
 Sun, 16 Apr 2023 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681644662;
 bh=Lh94ImZa2Ssnh+mrqjmOa9ElurEzho+BxXGqs63rpQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=olH4eUS0EMYdfD4Cv8aXf8hfY6qVS1+0jMoMpcJHfZ8IWiwxpUSlGRRMHDYvChWFx
 D9BSQiUUW1Wd+/5Jz6xQ/kA4mwuh2hTlxLBrwsz4hmzS8ixsq/FwjyTga1sQjBKRdd
 ge4pnw0/BZakrftJ/1Dlb9RSnt9LzTqE1WB2ve3E7zDYbL1Wfr5W0A4xLa2iRIAcpL
 VDLoBMrLIadTqsWLy7i9iZ5heOjjqvb+Tio0wASuCa4CjYtqIari/yfEBxqSS/hqVk
 gJAP7lCYWL3XV95Qpu3sukD32gbjIlFLsTDAJMSKS/ED8eF4nxLUJGhU5CjR0lGLVG
 2VohZU7JZ5L0g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] accel/habanalabs: remove commented code that won't be used
Date: Sun, 16 Apr 2023 14:30:49 +0300
Message-Id: <20230416113050.2815620-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416113050.2815620-1-ogabbay@kernel.org>
References: <20230416113050.2815620-1-ogabbay@kernel.org>
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

Once it was decided that these security settings are to be done by FW
rather than by the driver, there's no reason to keep them in the code.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
index acd33130e7f9..52a12c2bb58e 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
@@ -3443,15 +3443,6 @@ static int gaudi2_init_protection_bits(struct hl_device *hdev)
 				ARRAY_SIZE(gaudi2_pb_thermal_sensor0), NULL, HL_PB_NA);
 	}
 
-	/* HBM */
-	/* Temporarily skip until SW-63348 is solved
-	 * instance_offset = mmHBM1_MC0_BASE - mmHBM0_MC0_BASE;
-	 * rc |= hl_init_pb_with_mask(hdev, HL_PB_SHARED, HL_PB_NA, GAUDI2_HBM_NUM,
-	 *		instance_offset, gaudi2_pb_hbm,
-	 *		ARRAY_SIZE(gaudi2_pb_hbm), NULL, HL_PB_NA,
-	 *		prop->dram_enabled_mask);
-	 */
-
 	/* Scheduler ARCs */
 	instance_offset = mmARC_FARM_ARC1_AUX_BASE - mmARC_FARM_ARC0_AUX_BASE;
 	rc |= hl_init_pb_ranges(hdev, HL_PB_SHARED, HL_PB_NA,
-- 
2.40.0

