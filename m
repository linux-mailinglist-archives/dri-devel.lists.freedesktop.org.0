Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914406F2FF2
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 11:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90BE10E2F4;
	Mon,  1 May 2023 09:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF3310E223
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 09:48:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E9A5C60B9E;
 Mon,  1 May 2023 09:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C111C433EF;
 Mon,  1 May 2023 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682934480;
 bh=nQELu0P7nNiZdfkp3nnHF/gTwZ62dDbBTJqXinFtWRo=;
 h=From:To:Cc:Subject:Date:From;
 b=EmeZDxLo94dvDbrzwIvVEDRpqda3T8E1EhNI2YthbIJT4Tn8x08qljX14N2R7aWYe
 PWoCYhsxT4uoic1k2viEKcIkLAN984O6eEPlnbiadLWwmndPnI1o/IRcBC1CvQeVmc
 Mu9wz8xFGXuQi3D6cdEeNJ5I3Ia4ucl6HBFNF7dPLr+2SK92MhRMl3mDV1mKs+Fnbk
 wr/ZuRL7j1VgKCuojm9mw8PxklRC2RCErT/w+CcTDUqRc181CtKSH1oPK64Hv7QmF0
 WOun0OVJgAsuORCd2amPgnI2ZsSqb19ORa2UH8IESvoCjFeRhAgHQj2XrGwbSBRDPp
 l0dl8dxGtvzKg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] accel/habanalabs: add missing tpc interrupt info
Date: Mon,  1 May 2023 12:47:49 +0300
Message-Id: <20230501094754.100030-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
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

For some reason the last possible tpc interrupt cause in
gaudi2_tpc_interrupts_cause is missing from the code.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 5c80e7af5b78..058741698d71 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -63,7 +63,7 @@
 #define GAUDI2_NUM_OF_CPU_SEI_ERR_CAUSE		3
 #define GAUDI2_NUM_OF_QM_SEI_ERR_CAUSE		2
 #define GAUDI2_NUM_OF_ROT_ERR_CAUSE		22
-#define GAUDI2_NUM_OF_TPC_INTR_CAUSE		30
+#define GAUDI2_NUM_OF_TPC_INTR_CAUSE		31
 #define GAUDI2_NUM_OF_DEC_ERR_CAUSE		25
 #define GAUDI2_NUM_OF_MME_ERR_CAUSE		16
 #define GAUDI2_NUM_OF_MME_SBTE_ERR_CAUSE	5
@@ -891,6 +891,7 @@ static const char * const gaudi2_tpc_interrupts_cause[GAUDI2_NUM_OF_TPC_INTR_CAU
 	"invalid_lock_access",
 	"LD_L protection violation",
 	"ST_L protection violation",
+	"D$ L0CS mismatch",
 };
 
 static const char * const guadi2_mme_error_cause[GAUDI2_NUM_OF_MME_ERR_CAUSE] = {
-- 
2.40.1

