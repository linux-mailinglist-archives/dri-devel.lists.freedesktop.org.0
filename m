Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C87AE7A1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C3310E0D0;
	Tue, 26 Sep 2023 08:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4C510E369
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:14:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A6074CE1266
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B19C433CA;
 Tue, 26 Sep 2023 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695716039;
 bh=Zj1LbCF+4qNSxbYeKTNC7s+VtkpmrrJmwaIr6viPOS0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NKwBwIkX+PbX7WRGiC1ezRUi5L+rofVbX4/U24pNvcZ2r9nDoOx+LTRwfW780fY9e
 OoiLolkibQYzcRwLH1E59VLwEI6Y5pTX7D+mPvNI/Ja9Wd45i1jOzfJTdeWF/R3SnX
 +iqWMcWfhlTdcHMtCIt9pf7QXDJwhWDHVNZR07JB9RsOqfWYEFPF9SYs8e1nSOGO0R
 xzHznsW/zcHX0kOrOugdpEueLZT54pcauYOlE8lT6178YtxXeJaX1BTlgvMWTWWKRJ
 ZkkIAnImLR+CbArfkFJn0SDEMcvnfe+4dCa/YsB9+bqEZwYl/oKSdmluQCymArjjQ7
 wJNGz4pF0MM2w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] accel/habanalabs/gaudi: remove define used for simulator
Date: Tue, 26 Sep 2023 11:13:44 +0300
Message-Id: <20230926081345.240927-8-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926081345.240927-1-ogabbay@kernel.org>
References: <20230926081345.240927-1-ogabbay@kernel.org>
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

We don't support simulator in upstream.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 2 --
 drivers/accel/habanalabs/gaudi/gaudi.c       | 3 +--
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index b1b1c51aa5b1..a8ccc04e7f92 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -85,8 +85,6 @@ struct hl_fpriv;
 
 #define HL_PCI_ELBI_TIMEOUT_MSEC	10 /* 10ms */
 
-#define HL_SIM_MAX_TIMEOUT_US		100000000 /* 100s */
-
 #define HL_INVALID_QUEUE		UINT_MAX
 
 #define HL_COMMON_USER_CQ_INTERRUPT_ID	0xFFF
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 31e04af46876..53292d4c15c8 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -4623,8 +4623,7 @@ static int gaudi_scrub_device_dram(struct hl_device *hdev, u64 val)
 static int gaudi_scrub_device_mem(struct hl_device *hdev)
 {
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
-	u64 wait_to_idle_time = hdev->pdev ? HBM_SCRUBBING_TIMEOUT_US :
-			min_t(u64, HBM_SCRUBBING_TIMEOUT_US * 10, HL_SIM_MAX_TIMEOUT_US);
+	u64 wait_to_idle_time = HBM_SCRUBBING_TIMEOUT_US;
 	u64 addr, size, val = hdev->memory_scrub_val;
 	ktime_t timeout;
 	int rc = 0;
-- 
2.34.1

