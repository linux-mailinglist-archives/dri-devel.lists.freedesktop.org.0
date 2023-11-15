Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE87EC8B7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 17:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F185410E0F0;
	Wed, 15 Nov 2023 16:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEB210E0E0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:39:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EFEECCE1D95;
 Wed, 15 Nov 2023 16:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED0CC433C8;
 Wed, 15 Nov 2023 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700066360;
 bh=diI9h96MMsr8an2MYVnN2Z42kQPggaGEHH/n5mgX6Q4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UXvWV165zKWxS9koxbLHt6+oJBIVlM3FymNxwckh4dFcNysCimVu71/Fx20C2PfSX
 fHOImhDq2KujxGRmu2e9gXy9KgARgcBzu8pwjjaO+LnuXHhGHbydN0AlEvVTR8kV3P
 ggi5OpbbNy3Qd9VrY4cA69gqOlcuakaOlPtBbVbqYo9kEVhjM4M9W+pcG0ouMYnssi
 z2MuCO2aJNtpVCA9mjUg6R+0q86XNx8NznJT1uNyjd8KeV4dyFVMciYxotvwlaoskk
 SxQfwzrx5H8il70GeeWjxzwHSif6FxzUT5Vc14se6CO5o2WhYwZE9UkS1iXs0SLov5
 75PkEOmzQ2fkA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] accel/habanalabs: add log when eq event is not received
Date: Wed, 15 Nov 2023 18:39:04 +0200
Message-Id: <20231115163912.1243175-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115163912.1243175-1-ogabbay@kernel.org>
References: <20231115163912.1243175-1-ogabbay@kernel.org>
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
Cc: Farah Kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Farah Kassabri <fkassabri@habana.ai>

Add error log when no eq event is received from FW,
to cover a scenario when FW is stuck for some reason.
In such case driver will not receive neither the eq error interrupt
or the eq heartbeat event, and will just initiate a reset without
indication in the dmesg about the reason.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 9711e8fc979d..d95a981b2906 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1049,10 +1049,12 @@ static void hl_device_eq_heartbeat(struct hl_device *hdev)
 	if (!prop->cpucp_info.eq_health_check_supported)
 		return;
 
-	if (hdev->eq_heartbeat_received)
+	if (hdev->eq_heartbeat_received) {
 		hdev->eq_heartbeat_received = false;
-	else
+	} else {
+		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
 		hl_device_cond_reset(hdev, HL_DRV_RESET_HARD, event_mask);
+	}
 }
 
 static void hl_device_heartbeat(struct work_struct *work)
-- 
2.34.1

