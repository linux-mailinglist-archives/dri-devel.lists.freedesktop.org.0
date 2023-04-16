Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369A6E37BC
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 13:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051B310E080;
	Sun, 16 Apr 2023 11:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178E410E066
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 11:31:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9166760DD9;
 Sun, 16 Apr 2023 11:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14816C4339B;
 Sun, 16 Apr 2023 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681644661;
 bh=lbqT9OyQEVGyOzv9v3EvenM9r2FQaumTb2z/cst3XjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OrmcCsAx4wCrmmAwcAcw3M4WkFQk8bM8ybxqtkLnTMlgFxt/dO1h8lcSLEVRm4Cf3
 cBm6nfPWoQ76lrjm0TUtE0ADA2C9woVf3uTpTApjUwVSpPy2TADZXMFboWSp9UfcFh
 DRVfDUO83BFuJdvPo5KO86unpW5760viL6O2MujB+V8PL9j1cZqh/JoD8tD4G0s3a1
 nR+hi+ZNVXvI8K466ZkgCn8Mch7Ay7+t2ImTajDJkBSMF9LkJp3O0LFx+WOwuLIo7b
 2X5CsG3d76+LFZ2t0cE+ts7kdeHqrpj5H6nUbJOtPmNl9x6N3dv+drffyakMWMJ2MZ
 bnbZuuVFfJtag==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] accel/habanalabs: allow user to modify EDMA RL register
Date: Sun, 16 Apr 2023 14:30:48 +0300
Message-Id: <20230416113050.2815620-2-ogabbay@kernel.org>
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
Cc: Rakesh Ughreja <rughreja@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rakesh Ughreja <rughreja@habana.ai>

EDMA transpose workload requires to signal for every activation.
User FW sends all the dummy signals to RD_LBW_RATE_LIM_CFG, to save
lbw bandwidth. We need the user to be able to access that register to
configure it.

Signed-off-by: Rakesh Ughreja <rughreja@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
index 694735f9e6e6..acd33130e7f9 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
@@ -479,6 +479,7 @@ static const u32 gaudi2_pb_dcr0_edma0_unsecured_regs[] = {
 	mmDCORE0_EDMA0_CORE_CTX_TE_NUMROWS,
 	mmDCORE0_EDMA0_CORE_CTX_IDX,
 	mmDCORE0_EDMA0_CORE_CTX_IDX_INC,
+	mmDCORE0_EDMA0_CORE_RD_LBW_RATE_LIM_CFG,
 	mmDCORE0_EDMA0_QM_CQ_CFG0_0,
 	mmDCORE0_EDMA0_QM_CQ_CFG0_1,
 	mmDCORE0_EDMA0_QM_CQ_CFG0_2,
-- 
2.40.0

