Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 882826CFC95
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19ECD10E144;
	Thu, 30 Mar 2023 07:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3AB10E144
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:22:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA738B8261B;
 Thu, 30 Mar 2023 07:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4174C433EF;
 Thu, 30 Mar 2023 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680160938;
 bh=JYKuUCr6XQjYAc06iNyrLv0f2y+SVip8BqzYncvdp5E=;
 h=From:To:Cc:Subject:Date:From;
 b=q7th8ZBahf9iTPS486VhWoShLjjg+ytQJVhU0bu0K4bnPLn/0pCl8CMG58GWBcmgo
 2TNMr/gM+6iOQwU+Y7frCvCRgo2ci0csps/ODByiXzMKog+X+go6L9lcy+VLV9COAw
 +aGyiScd8A65OnFqz2HC0SwCsi9wDmQcX+QRyQiIYlgbUMJZIYTmGtPlZt5v56p8Ko
 OJbcJuUTGivSi5tDmlg3OYXDppZ38nTVLqiZ7UcOv3SkW8D31PQlu0PxgweA8OjOel
 4XPhsOcmgcX8mhn+GKVq1TBuhmSIEV0MCllxRlSfEdrUXPSEvZ3xO7QWFPkhAi/N+g
 RBNRROW+WSO2w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] accel/habanalabs: print raw binning masks in debug level
Date: Thu, 30 Mar 2023 10:22:07 +0300
Message-Id: <20230330072213.1596318-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
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

There are rare cases of failures when cards are initialized due to
wrong values in efuse mappings that are parsed by firmware.

To help debug those cases, print (in debug level) the raw binning masks
as fetched from the firmware during device initialization.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index ad491fb2c39d..ea9fdc616de4 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2888,6 +2888,10 @@ static int gaudi2_cpucp_info_get(struct hl_device *hdev)
 	hdev->tpc_binning = le64_to_cpu(prop->cpucp_info.tpc_binning_mask);
 	hdev->decoder_binning = lower_32_bits(le64_to_cpu(prop->cpucp_info.decoder_binning_mask));
 
+	dev_dbg(hdev->dev, "Read binning masks: tpc: 0x%llx, dram: 0x%llx, edma: 0x%x, dec: 0x%x\n",
+			hdev->tpc_binning, hdev->dram_binning, hdev->edma_binning,
+			hdev->decoder_binning);
+
 	/*
 	 * at this point the DRAM parameters need to be updated according to data obtained
 	 * from the FW
-- 
2.40.0

