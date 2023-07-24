Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D475F7DF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 15:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDC310E31B;
	Mon, 24 Jul 2023 13:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450DC10E2E4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 13:10:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C02D261136;
 Mon, 24 Jul 2023 13:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C749C433C9;
 Mon, 24 Jul 2023 13:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690204207;
 bh=7OOfFypWGI7C/cskpmuDB/vGZrq8aTFbLJRh/I5ZkGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dHP3IwVyftta44uQm3O7pwbWUd027NLWXdt2wSM+CR9xKcXbDhmqP3vZuPGqu4v+w
 te6F7evEWtG2+bQhwthRlVjnRLzdp4O+oGoykQICGJnFLMPeblDMLYPMpxDVPqR+RC
 UQVjTUbbrbYRcZeCzLofC9vuOIlSDXA4O3AFQjmNHiP1O05Us6caPVq9ATbSwkUPQR
 w6KAg26gmmupQDNM/NCJcPNCURKi3TbdR7XMCBpz/XIrp1jDMnnmnPYimHxEZbL+B+
 41WGe2IcVQLBfl3ovXLNQFlNLY9DReWfHj+pOFzL/iJKsuOgZfWaMcFFq17y6+fycO
 m1giOJnSLnjMQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] accel/habanalabs: fix ETR/ETF flush logic
Date: Mon, 24 Jul 2023 16:10:00 +0300
Message-Id: <20230724131000.859507-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724131000.859507-1-ogabbay@kernel.org>
References: <20230724131000.859507-1-ogabbay@kernel.org>
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

When config_etr or config_etf are called we need to validate the
parameters that are passed into them to make sure the requested
operation is valid.

Signed-off-by: Benjamin Dotan <bdotan@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi/gaudi_coresight.c   | 12 ++++++++++++
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c | 10 ++++++++++
 drivers/accel/habanalabs/goya/goya_coresight.c     | 10 ++++++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/accel/habanalabs/gaudi/gaudi_coresight.c b/drivers/accel/habanalabs/gaudi/gaudi_coresight.c
index 3455b14554c6..1168fefa33f4 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi_coresight.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi_coresight.c
@@ -482,6 +482,11 @@ static int gaudi_config_etf(struct hl_device *hdev,
 
 	WREG32(base_reg + 0xFB0, CORESIGHT_UNLOCK);
 
+	val = RREG32(base_reg + 0x20);
+
+	if ((!params->enable && val == 0x0) || (params->enable && val != 0x0))
+		return 0;
+
 	val = RREG32(base_reg + 0x304);
 	val |= 0x1000;
 	WREG32(base_reg + 0x304, val);
@@ -580,6 +585,13 @@ static int gaudi_config_etr(struct hl_device *hdev,
 
 	WREG32(mmPSOC_ETR_LAR, CORESIGHT_UNLOCK);
 
+	val = RREG32(mmPSOC_ETR_CTL);
+
+	if ((!params->enable && val == 0x0) || (params->enable && val != 0x0))
+		return 0;
+
+
+
 	val = RREG32(mmPSOC_ETR_FFCR);
 	val |= 0x1000;
 	WREG32(mmPSOC_ETR_FFCR, val);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
index 3e90bc969264..32e0f1a85b35 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
@@ -2092,6 +2092,11 @@ static int gaudi2_config_etf(struct hl_device *hdev, struct hl_debug_params *par
 	if (rc)
 		return -EIO;
 
+	val = RREG32(base_reg + mmETF_CTL_OFFSET);
+
+	if ((!params->enable && val == 0x0) || (params->enable && val != 0x0))
+		return 0;
+
 	val = RREG32(base_reg + mmETF_FFCR_OFFSET);
 	val |= 0x1000;
 	WREG32(base_reg + mmETF_FFCR_OFFSET, val);
@@ -2189,6 +2194,11 @@ static int gaudi2_config_etr(struct hl_device *hdev, struct hl_ctx *ctx,
 	if (rc)
 		return -EIO;
 
+	val = RREG32(mmPSOC_ETR_CTL);
+
+	if ((!params->enable && val == 0x0) || (params->enable && val != 0x0))
+		return 0;
+
 	val = RREG32(mmPSOC_ETR_FFCR);
 	val |= 0x1000;
 	WREG32(mmPSOC_ETR_FFCR, val);
diff --git a/drivers/accel/habanalabs/goya/goya_coresight.c b/drivers/accel/habanalabs/goya/goya_coresight.c
index a6d6cc38bcd8..41cae5fd843b 100644
--- a/drivers/accel/habanalabs/goya/goya_coresight.c
+++ b/drivers/accel/habanalabs/goya/goya_coresight.c
@@ -315,6 +315,11 @@ static int goya_config_etf(struct hl_device *hdev,
 
 	WREG32(base_reg + 0xFB0, CORESIGHT_UNLOCK);
 
+	val = RREG32(base_reg + 0x20);
+
+	if ((!params->enable && val == 0x0) || (params->enable && val != 0x0))
+		return 0;
+
 	val = RREG32(base_reg + 0x304);
 	val |= 0x1000;
 	WREG32(base_reg + 0x304, val);
@@ -386,6 +391,11 @@ static int goya_config_etr(struct hl_device *hdev,
 
 	WREG32(mmPSOC_ETR_LAR, CORESIGHT_UNLOCK);
 
+	val = RREG32(mmPSOC_ETR_CTL);
+
+	if ((!params->enable && val == 0x0) || (params->enable && val != 0x0))
+		return 0;
+
 	val = RREG32(mmPSOC_ETR_FFCR);
 	val |= 0x1000;
 	WREG32(mmPSOC_ETR_FFCR, val);
-- 
2.34.1

