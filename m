Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0585C084
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375F610E4DC;
	Tue, 20 Feb 2024 16:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HaFLIczn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399E810E4D5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9AFC5611CE;
 Tue, 20 Feb 2024 16:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A5FC43601;
 Tue, 20 Feb 2024 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444914;
 bh=bjw5M0Bg5Q4a2AeJGBArD9cWV2Am4IdXIRrTLz0HAmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HaFLIcznFHO3DUJ7vomtekSwlbGjdVSWLcXLl7iz4ut7cwN/squHMDEVR2UDEi59n
 ndUpxr4F6NUoSTIjHgG8NQk+GpxF06raIrvd6jgbx1+z5HpNPxUUz4JBVvI3lWtlAW
 TLGIq1DC7gNsE/1C+YNw5397p1xanTt/s5hcCk8vo+NW9BDuBuwliD+WUJm+Moqt8k
 nGh6VvXLPtDx12piuoKbWXEaF/GMcuNTKrK4yXulKiLIE0rFX8qrrbX3WfrldbqIUq
 iZCVnCWF1/vyI5nr4CDBNV1HZwpR3tefBY9D7+ZHTUesask+bGTzXo903uHZDzIzOr
 oScpFMr60AUdA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Ofir Bitton <obitton@habana.ai>
Subject: [PATCH 13/13] accel/habanalabs: modify pci health check
Date: Tue, 20 Feb 2024 18:01:29 +0200
Message-Id: <20240220160129.909714-13-ogabbay@kernel.org>
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

From: Ofir Bitton <obitton@habana.ai>

Today we read PCI VENDOR-ID in order to make sure PCI link is
healthy. Apparently the VENDOR-ID might be stored on host and
hence, when we read it we might not access the PCI bus.
In order to make sure PCI health check is reliable, we will start
checking the DEVICE-ID instead.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 3b9e8a21d7df..8f92445c5a90 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1035,14 +1035,14 @@ static void device_early_fini(struct hl_device *hdev)
 
 static bool is_pci_link_healthy(struct hl_device *hdev)
 {
-	u16 vendor_id;
+	u16 device_id;
 
 	if (!hdev->pdev)
 		return false;
 
-	pci_read_config_word(hdev->pdev, PCI_VENDOR_ID, &vendor_id);
+	pci_read_config_word(hdev->pdev, PCI_DEVICE_ID, &device_id);
 
-	return (vendor_id == PCI_VENDOR_ID_HABANALABS);
+	return (device_id == hdev->pdev->device);
 }
 
 static int hl_device_eq_heartbeat_check(struct hl_device *hdev)
-- 
2.34.1

