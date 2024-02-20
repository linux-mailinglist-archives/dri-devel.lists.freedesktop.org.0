Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CE185C08A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0040510E4E5;
	Tue, 20 Feb 2024 16:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s0/+twyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867F210E4D5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ECF6D611D4;
 Tue, 20 Feb 2024 16:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA02C433F1;
 Tue, 20 Feb 2024 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444912;
 bh=dHWXGoGBTObOk/WAuzAnyoCNfUYgNLUuXRrgDNQ7GTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s0/+twyzExWcJln7e8nqnj4Qwj7gKD8rlVn0iwdE5lterrxdcp3nWcd8nLhGv7atb
 7LhHxbKrJdENnx7QrUzslmqWwsOWsaXGzyNSBryZMpftNBY2EAkX5Kg2/bQ7J11alx
 Hx7Kut4NI1NrLuharIEXLh1GstMx1l2UIi6X2rXGnBr/uvn4r4gEiNrXmUw8m0pJBe
 iZFfg8KmJGiQVOfwiEA6SRUP4q/gTRfge4y1GCCk2T9LpSLY0qPRtoj4rfZ9BDZp1+
 cNL+GfiC63MrThFwIM7bzoIqafDCkQdEL3ukSaZM9vvw403Uj50CNeBjaWDCGAqSlB
 24Tagzffm1wzA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 12/13] accel/habanalabs: keep explicit size of reserved memory
 for FW
Date: Tue, 20 Feb 2024 18:01:28 +0200
Message-Id: <20240220160129.909714-12-ogabbay@kernel.org>
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

The reserved memory for FW is currently saved in an ASIC property in
units of MB, just like the value that comes from FW.
Except the fact that it is not clear from the property's name, it means
also that a calculation to actual size is required everywhere that it is
used.
Modify the property to hold the size in bytes.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 2 +-
 drivers/accel/habanalabs/common/habanalabs.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 4246162b6807..348418643709 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -2749,7 +2749,7 @@ static int hl_fw_dynamic_init_cpu(struct hl_device *hdev,
 
 	if (hdev->asic_prop.support_dynamic_resereved_fw_size)
 		hdev->asic_prop.reserved_fw_mem_size =
-				le32_to_cpu(fw_loader->dynamic_loader.comm_desc.rsvd_mem_size_mb);
+			le32_to_cpu(fw_loader->dynamic_loader.comm_desc.rsvd_mem_size_mb) * SZ_1M;
 
 	if (!(hdev->fw_components & FW_TYPE_BOOT_CPU)) {
 		struct lkd_fw_binning_info *binning_info;
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 40107a4eba93..55495861f432 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -650,7 +650,7 @@ struct hl_hints_range {
  * @glbl_err_max_cause_num: global err max cause number.
  * @hbw_flush_reg: register to read to generate HBW flush. value of 0 means HBW flush is
  *                 not supported.
- * @reserved_fw_mem_size: size in MB of dram memory reserved for FW.
+ * @reserved_fw_mem_size: size of dram memory reserved for FW.
  * @collective_first_sob: first sync object available for collective use
  * @collective_first_mon: first monitor available for collective use
  * @sync_stream_first_sob: first sync object available for sync stream use
-- 
2.34.1

