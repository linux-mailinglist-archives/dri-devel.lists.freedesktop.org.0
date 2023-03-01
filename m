Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F4A6A6C6A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 13:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556B510E22F;
	Wed,  1 Mar 2023 12:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF31810E22F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 12:35:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6879B81029;
 Wed,  1 Mar 2023 12:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C78FC433D2;
 Wed,  1 Mar 2023 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677674100;
 bh=3z2vuX9OeEtzEwQn4heGy9NK4W0pJgp70LJBu9Z5FoE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gRtXIbuY+s7SO0girCle+3Sec+SWVvJATqpI1mRwHqj+FwBR2EMA6vAxIYMdhpV22
 VR9D6AB+S/G4giU95ag8rK8/dbszTqARW4GtgTOL/eP81vEbYlWmEYSuroY4GY8Wte
 wS/LISlcLTTaQgtu7u+Hy65gcrML699yhPO9Yyjp5CEWxk+XYldFaFbAvPLslh6IB5
 a/Xqg3hqh2I4KABr1IQPZvLiBokV5vPHnCyMdi52xwSGcF9S/c4f9aO29pHq9Hzwe5
 IweTYpd8psjeowzPeVoCQ2AJ8kd3cEGj2oyWTqumfYv0F8b8fEQpCe96YGrDluhw9Z
 IlvcERpTGcvqA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] habanalabs: allow getting HL_INFO_DRAM_USAGE during
 soft-reset
Date: Wed,  1 Mar 2023 14:34:49 +0200
Message-Id: <20230301123450.4127848-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301123450.4127848-1-ogabbay@kernel.org>
References: <20230301123450.4127848-1-ogabbay@kernel.org>
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

We can allow userspace to query the dram usage during soft-reset.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 100282fc82fc..0997ede359d7 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -1002,6 +1002,8 @@ static int _hl_info_ioctl(struct hl_fpriv *hpriv, void *data,
 	case HL_INFO_FW_ERR_EVENT:
 		return fw_err_info(hpriv, args);
 
+	case HL_INFO_DRAM_USAGE:
+		return dram_usage_info(hpriv, args);
 	default:
 		break;
 	}
@@ -1014,10 +1016,6 @@ static int _hl_info_ioctl(struct hl_fpriv *hpriv, void *data,
 	}
 
 	switch (args->op) {
-	case HL_INFO_DRAM_USAGE:
-		rc = dram_usage_info(hpriv, args);
-		break;
-
 	case HL_INFO_HW_IDLE:
 		rc = hw_idle(hdev, args);
 		break;
-- 
2.39.2

