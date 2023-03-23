Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A237F6C66B9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 12:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7E810EA77;
	Thu, 23 Mar 2023 11:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B88510EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 11:35:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C16062610;
 Thu, 23 Mar 2023 11:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4002C4339C;
 Thu, 23 Mar 2023 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679571339;
 bh=XxChU2DRmNqvM/7mb3Pwax4+tTIFzcoI2cT/7bhOkZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IAtFyzDP4kwbywafonEtfa8DdM3iqQhIUtaTrMrWRdkMS2qOMqX/pAzRqWjqRImCh
 fJrfcf8aDdzFsXKRcEESSem0bSwkXnND0Xp7wI7WaXA2ZCo4OIUJvmKGG5pnErA4us
 VFJXEXjpal105M5B3Qqnps5PFAgoE8DlOVPn4WMAQ6uNEEY/qH94K276/GfP4Jqg28
 7+vO0LpT8V4NXuWYYZ9bzWF2JE30JrZ4BObxG1hPyF6C6oiokrZW0LamSIzDW/zOxg
 vM3dbEQ8fvNSdTrE+8MMxK/bSUFAvauzxBIoX6xpHHSi+capPc/Ql+s6uVtorJyXXz
 kSpEBgplRX0Dg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] accel/habanalabs: send disable pci when compute ctx is
 active
Date: Thu, 23 Mar 2023 13:35:25 +0200
Message-Id: <20230323113525.959176-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323113525.959176-1-ogabbay@kernel.org>
References: <20230323113525.959176-1-ogabbay@kernel.org>
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
Cc: Tal Cohen <talcohen@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tal Cohen <talcohen@habana.ai>

Fix an issue in hard reset flow in which the driver didn't send a
disable pci message if there was an active compute context.
In hard reset, disable pci message should be sent no matter if
a compute context exists or not.

Signed-off-by: Tal Cohen <talcohen@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index c36de13d6729..3c1af9d43b65 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1386,7 +1386,7 @@ static void handle_reset_trigger(struct hl_device *hdev, u32 flags)
 
 	/* No consecutive mechanism when user context exists */
 	if (hdev->is_compute_ctx_active)
-		return;
+		goto disable_pci;
 
 	/*
 	 * 'reset cause' is being updated here, because getting here
@@ -1425,6 +1425,8 @@ static void handle_reset_trigger(struct hl_device *hdev, u32 flags)
 	 * If F/W is performing the reset, no need to send it a message to disable
 	 * PCI access
 	 */
+
+disable_pci:
 	if ((flags & HL_DRV_RESET_HARD) &&
 			!(flags & (HL_DRV_RESET_HEARTBEAT | HL_DRV_RESET_BYPASS_REQ_TO_FW))) {
 		/* Disable PCI access from device F/W so he won't send
-- 
2.40.0

