Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3FE6E5D9D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C3410E723;
	Tue, 18 Apr 2023 09:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A5410E724
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:39:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B2C262F3A;
 Tue, 18 Apr 2023 09:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919F8C433AC;
 Tue, 18 Apr 2023 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681810768;
 bh=Kkm2B1ZfKpKomI0agT9Iz+r5j+6sxdjkGvmphFliIxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YnPnmj/tQRiPwbnFIBugef88OrT1XwR1Jehq4qlSLNJQ7qy5fSLoMcjawu5d6KMi/
 vOa2lbdmhJvXk0hnjkOMAC8Z4qOAJS12jVHNroz+mAzijmdgkvzWGWu5mG0PQ+L8M6
 NZ3IP7Q7hUIT4Q9bnC0exkZW/RbedwtVWQoE6UgBes+StzwiIhvtUMgBZJdNmqPcNg
 oV02cHmpoNRaAlv7xce3/RNtoQtFuwpXnlNoNmUKNEFBghed9Ng3aiiBp8sonFGtwI
 QL9mtNgdhj851lQn3Z3OqZA3jJHHu5HraYprgT9dzDlRk7QH+OFc0ljBHRT/2gEYZz
 2TFLTGoQFhR2w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/10] accel/habanalabs: unsecure TPC bias registers
Date: Tue, 18 Apr 2023 12:39:12 +0300
Message-Id: <20230418093916.2979728-6-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

User needs to be able to perform downcast / upcast of fp8_143 dtype.
Hence bias register needs to be accessed by the user.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
index 52a12c2bb58e..fadb870ff4c0 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
@@ -1542,6 +1542,7 @@ static const u32 gaudi2_pb_dcr0_tpc0_unsecured_regs[] = {
 	mmDCORE0_TPC0_CFG_LUT_FUNC128_BASE2_ADDR_HI,
 	mmDCORE0_TPC0_CFG_LUT_FUNC256_BASE2_ADDR_LO,
 	mmDCORE0_TPC0_CFG_LUT_FUNC256_BASE2_ADDR_HI,
+	mmDCORE0_TPC0_CFG_FP8_143_BIAS,
 	mmDCORE0_TPC0_CFG_ROUND_CSR,
 	mmDCORE0_TPC0_CFG_CONV_ROUND_CSR,
 	mmDCORE0_TPC0_CFG_SEMAPHORE,
-- 
2.40.0

