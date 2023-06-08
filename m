Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D679E72818B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB7F10E5C7;
	Thu,  8 Jun 2023 13:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E332310E5C2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:39:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 650DD64DA2;
 Thu,  8 Jun 2023 13:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C5CC433D2;
 Thu,  8 Jun 2023 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231546;
 bh=IiOWk2xtuYJLqnX1FQC+Z12sSSxJkYiPc4dMNUBLizk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QWXtx0oEzsqO7K89qlP3KS4Kd6HFCvijBMRcG6jVOaMXfDCcbihHpGqwnN4QDUs0H
 UhTONYoksIEqIGbL/NyM7BzzlRjw3KK6GjvraEJ6BYQL0HMQpO0h/AFlBg3eEBg5pd
 H1VLH0WaJr5BNvt40kSKLjwbdy8RQ/oYETjhPP/+JBeMIAm/SvV9N8mRCVMwH29Eeu
 ZapaN2ikmVTefa61nf/RWCafTjWSCFKcwqCfneCMqETKFtEW145YVFDsOg+nGsRSoX
 mmJhQq8M5He7MyTdjO8uQUfAzYw5dxkcADwCxs7pCE5GYho35F6j7mJyM2hKF2KOLZ
 dqM6tSuzx9CZw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] accel/habanalabs: fix standalone preboot descriptor
 request
Date: Thu,  8 Jun 2023 16:38:46 +0300
Message-Id: <20230608133849.2739411-9-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608133849.2739411-1-ogabbay@kernel.org>
References: <20230608133849.2739411-1-ogabbay@kernel.org>
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
Cc: farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: farah kassabri <fkassabri@habana.ai>

The preboot used to statically allocate memory for the comms descriptor
on the device memory when driver requested the descriptor information.
Now preboot moved to dynamic memory allocation where it wants to check
the size the driver expects vs. what the f/w expects.
Note there are no backward compatibility issues as older f/w versions
simply ignore this value.

Signed-off-by: farah kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index acbc1a6b5cb1..370508e98854 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -2743,7 +2743,8 @@ static int hl_fw_dynamic_init_cpu(struct hl_device *hdev,
 	if (!(hdev->fw_components & FW_TYPE_BOOT_CPU)) {
 		struct lkd_fw_binning_info *binning_info;
 
-		rc = hl_fw_dynamic_request_descriptor(hdev, fw_loader, 0);
+		rc = hl_fw_dynamic_request_descriptor(hdev, fw_loader,
+							sizeof(struct lkd_msg_comms));
 		if (rc)
 			goto protocol_err;
 
-- 
2.40.1

