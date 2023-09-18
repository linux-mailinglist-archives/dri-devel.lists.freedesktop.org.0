Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6F7A4599
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518C310E231;
	Mon, 18 Sep 2023 09:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40D410E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 76E76CE0A0B;
 Mon, 18 Sep 2023 09:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5475C433C8;
 Mon, 18 Sep 2023 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028407;
 bh=4/VVM9XorWdiX2PYPKT9KPOPQ6XGUkwmOlEV21QKXRE=;
 h=From:To:Cc:Subject:Date:From;
 b=HrhjxHXVAnfudU7iLw3Pb7N1bKFtSBxEH91cS8gs54t7qYGMGrEr/kbElzMHQcOsH
 K5pFoaBsxF2jJX7SedvmjUL+1i28zewOgbCnUAt0qlYsOcyvX3tiaAhlHqVPHwx3QD
 hLtDlZGd3oizheUpHl9NNYAkEWVyGvt8BYaXDZyrx43GjxqtHZcoy9ge9gThbeZkzn
 xbVvPL8Q+EcuixZnOd0ptUE4sYKFwM4NwZvjNB32SN1Tf9iBVzxl/TEUhnauFkfBID
 PCCASGzDZ2GdwtE3LsA27cjfUPjKD28Ig9kpPAefNCtrUrfviBjnWc5w7P8tG348Gy
 rDQs6T4mdmXXA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/14] accel/habanalabs: improve etf configuration
Date: Mon, 18 Sep 2023 12:13:08 +0300
Message-Id: <20230918091321.855943-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Benjamin Dotan <bdotan@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benjamin Dotan <bdotan@habana.ai>

coresight ETF blocks have different size. As a result, sync packets
need to be aligned based on fifo size.

Signed-off-by: Benjamin Dotan <bdotan@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
index 32e0f1a85b35..14a855cdc96b 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
@@ -2125,10 +2125,17 @@ static int gaudi2_config_etf(struct hl_device *hdev, struct hl_debug_params *par
 		if (!input)
 			return -EINVAL;
 
+		val = RREG32(base_reg + mmETF_RSZ_OFFSET) << 2;
+		if (val) {
+			val = ffs(val);
+			WREG32(base_reg + mmETF_PSCR_OFFSET, val);
+		} else {
+			WREG32(base_reg + mmETF_PSCR_OFFSET, 0x10);
+		}
+
 		WREG32(base_reg + mmETF_BUFWM_OFFSET, 0x3FFC);
 		WREG32(base_reg + mmETF_MODE_OFFSET, input->sink_mode);
 		WREG32(base_reg + mmETF_FFCR_OFFSET, 0x4001);
-		WREG32(base_reg + mmETF_PSCR_OFFSET, 0x10);
 		WREG32(base_reg + mmETF_CTL_OFFSET, 1);
 	} else {
 		WREG32(base_reg + mmETF_BUFWM_OFFSET, 0);
-- 
2.34.1

