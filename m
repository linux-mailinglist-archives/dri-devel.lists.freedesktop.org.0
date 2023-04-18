Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4056E5D9B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6A610E716;
	Tue, 18 Apr 2023 09:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A270510E716
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:39:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33472625F0;
 Tue, 18 Apr 2023 09:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CE9C4339B;
 Tue, 18 Apr 2023 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681810765;
 bh=hwfh9cx73kb1mUh5/2zCXg2tIqhGQnxf5/EQ/bzd8sc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VG/Uyrdu9qcnK2WqYt2+zs4bVi00qDAunXTcokG1WGbZQZ5d5tuuDrWsOdJ/7Br/N
 E2Bjo9zFRUh8fnQzoUZpnCTGMdkAT5f6hue+D8HbuO0PLnshaKejZs4RpO9TBsgTe4
 /Z/8RvkPm+3Ymz5G18OgS53n8nI5Z4I2DmbfrLanKerRtEeuK5oCnuAO5Ap/m232IB
 hyDhvEQ81y8ScvgIO9v1ArQpXZBrYp0xi8xX4mpy067M/h/Ag7tIwBcMXQkGeCXhaq
 zvcmlp1P1bZhMVv31rKmQTWQwss1Tf46sCgErvvwB6vdl7ueiNmLc8VUSrQ+IhnNkx
 zNKyAyBWGtR4w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] accel/habanalabs: check fw version using sw version
Date: Tue, 18 Apr 2023 12:39:10 +0300
Message-Id: <20230418093916.2979728-4-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

The fw inner version is less trustable, instead use the fw general
sw release version.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 10 ++++++++--
 drivers/accel/habanalabs/gaudi2/gaudi2.c     |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index d6f454b1cde4..02620654ccdf 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3553,9 +3553,15 @@ struct hl_ioctl_desc {
 	hl_ioctl_t *func;
 };
 
-static inline bool hl_is_fw_ver_below_1_9(struct hl_device *hdev)
+static inline bool hl_is_fw_sw_ver_below(struct hl_device *hdev, u32 fw_sw_major, u32 fw_sw_minor)
 {
-	return (hdev->fw_inner_major_ver < 42);
+	if (hdev->fw_sw_major_ver < fw_sw_major)
+		return true;
+	if (hdev->fw_sw_major_ver > fw_sw_major)
+		return false;
+	if (hdev->fw_sw_minor_ver < fw_sw_minor)
+		return true;
+	return false;
 }
 
 /*
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index acc304ebca82..6e3aa89b19c2 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8043,7 +8043,7 @@ static void gaudi2_ack_module_razwi_event_handler(struct hl_device *hdev,
 	case RAZWI_TPC:
 		hbw_rtr_id = gaudi2_tpc_initiator_hbw_rtr_id[module_idx];
 
-		if (hl_is_fw_ver_below_1_9(hdev) &&
+		if (hl_is_fw_sw_ver_below(hdev, 1, 9) &&
 				!hdev->asic_prop.fw_security_enabled &&
 				((module_idx == 0) || (module_idx == 1)))
 			lbw_rtr_id = DCORE0_RTR0;
-- 
2.40.0

