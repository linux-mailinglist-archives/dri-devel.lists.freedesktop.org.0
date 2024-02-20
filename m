Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B19285C085
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042B810E4D8;
	Tue, 20 Feb 2024 16:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IMrd7a2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407A310E4D5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9AC8C611C5;
 Tue, 20 Feb 2024 16:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB45CC43390;
 Tue, 20 Feb 2024 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444911;
 bh=44dNPX1QRWIKEvrmT4TESwsMGo7YKSXCzR8a2nqFsrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IMrd7a2CYIAsatUv6FpiZelNhClQi9yHEABu8j1IDoPB+IEuu7P05oW07T2kCYx6R
 j4xPZVlaJLJ5VWQjQrpes+PuU3Mq5KlN0XQ9cflVoCNkiG3KCjdaJqU/bEc6nK1hnS
 NwcULjs6NF9TRt53ztqt7sPdFEHjDaja0H0iRuezk+8EmS0P5N8WjR6hcvpOMvbTIp
 Xw79n+wckSgThz9A2qFNjinGVaF2lNNGUKyYNOwfxNPYbdauoaKNKq+jGkeuRQ93vw
 CPLUJeOKDioFhRBnlrGxMLQisMe4of9VxOB8muC6CCtuVB5vacEeQeNkloGBr+Mx2V
 CyyNZYlZAopUQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 11/13] accel/habanalabs: handle reserved memory request when
 working with full FW
Date: Tue, 20 Feb 2024 18:01:27 +0200
Message-Id: <20240220160129.909714-11-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220160129.909714-1-ogabbay@kernel.org>
References: <20240220160129.909714-1-ogabbay@kernel.org>
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

From: Tomer Tayar <ttayar@habana.ai>

Currently the reserved memory request from FW is handled when running
with preboot only, but this request is relevant also when running with
full FW.
Modify to always handle this reservation request.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index a3df7cf162d8..4246162b6807 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -2743,18 +2743,20 @@ static int hl_fw_dynamic_init_cpu(struct hl_device *hdev,
 		hdev->reset_info.curr_reset_cause = HL_RESET_CAUSE_UNKNOWN;
 	}
 
+	rc = hl_fw_dynamic_request_descriptor(hdev, fw_loader, sizeof(struct lkd_msg_comms));
+	if (rc)
+		goto protocol_err;
+
+	if (hdev->asic_prop.support_dynamic_resereved_fw_size)
+		hdev->asic_prop.reserved_fw_mem_size =
+				le32_to_cpu(fw_loader->dynamic_loader.comm_desc.rsvd_mem_size_mb);
+
 	if (!(hdev->fw_components & FW_TYPE_BOOT_CPU)) {
 		struct lkd_fw_binning_info *binning_info;
 
-		rc = hl_fw_dynamic_request_descriptor(hdev, fw_loader,
-							sizeof(struct lkd_msg_comms));
-		if (rc)
-			goto protocol_err;
-
 		/* read preboot version */
 		rc = hl_fw_dynamic_read_device_fw_version(hdev, FW_COMP_PREBOOT,
 				fw_loader->dynamic_loader.comm_desc.cur_fw_ver);
-
 		if (rc)
 			return rc;
 
@@ -2781,11 +2783,6 @@ static int hl_fw_dynamic_init_cpu(struct hl_device *hdev,
 				hdev->decoder_binning, hdev->rotator_binning);
 		}
 
-		if (hdev->asic_prop.support_dynamic_resereved_fw_size) {
-			hdev->asic_prop.reserved_fw_mem_size =
-				le32_to_cpu(fw_loader->dynamic_loader.comm_desc.rsvd_mem_size_mb);
-		}
-
 		return 0;
 	}
 
-- 
2.34.1

