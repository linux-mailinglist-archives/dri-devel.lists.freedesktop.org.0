Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7521385C07F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167D110E4C9;
	Tue, 20 Feb 2024 16:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DLqveDLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EEE10E4CB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 43147611C8;
 Tue, 20 Feb 2024 16:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80A0C43399;
 Tue, 20 Feb 2024 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444898;
 bh=JL1jAzIirbuZqrIbR7J7LDpNto/ami0Xc9uTfqn5tH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DLqveDLE9Kj68zrK0Sz11X4FT9UJflcSOtfcKspd96eosYluZATRnB0xAetBI2fvz
 ZAxCp4rsSoDDRleRN7gZfzO1UZxMTRo2PtbBOTILS3IIaWHzGAHJV8MX2xInFuUTZE
 BL0pvgSj3JiJlVMBeYMjPzASqgA3F7/oHSISRcksQX00T1hIaoAfOxx3OuUljrYSwC
 k8ix80UqTpAqmOMNkPhk/EQggcgGRXOB6SA8uxAgb10lPGptIpFVQmuAsXjv8sfZNr
 x+AoM2plB1bEKCM6WlrGXbvocVg4/16EpRrwNBtU1mM2guOd/doAXZQ5d/agATn/6d
 THKRQoWF5QljQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 03/13] accel/habanalabs: modify print for skip loading linux
 FW to debug log
Date: Tue, 20 Feb 2024 18:01:19 +0200
Message-Id: <20240220160129.909714-3-ogabbay@kernel.org>
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

Skip loading a linux FW image into the device with the current supported
ASICs is done for test purposes only.
Moreover, for future supported ASICs it is possible that there won't be
a need to load such an image.
The print in such a case is therefore not needed in most cases, so
replace the used dev_info() with dev_dbg().

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index e7dcf2fe6552..364d292c76fa 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -2820,7 +2820,7 @@ static int hl_fw_dynamic_init_cpu(struct hl_device *hdev,
 	hdev->asic_funcs->init_cpu_scrambler_dram(hdev);
 
 	if (!(hdev->fw_components & FW_TYPE_LINUX)) {
-		dev_info(hdev->dev, "Skip loading Linux F/W\n");
+		dev_dbg(hdev->dev, "Skip loading Linux F/W\n");
 		return 0;
 	}
 
-- 
2.34.1

