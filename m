Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508828CFFA6
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 14:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B9910ED94;
	Mon, 27 May 2024 12:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="hJPjxmUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA1510F4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 12:13:07 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716811993; bh=HA3Ew5tpL7ApKKFbeZ+k1CKifd7ompu4unxRVvUSSkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hJPjxmUciGCeDmYTn82I0pH8ClJhQRo8Ku/9DqJTCAyoxQzt/DBzC3TAzhh+aq1Ou
 I4eV1MaPXENiqYOJWp7wJpkbtalz5Sy02v0dXXOnvePNY7Sfp4jMVtwMHYT7dWxAOf
 1t/Z/tINg6YYTXNeZMIOX4dx87+VOnlCQl89Z1eusBxC7Qvn0jhivLGtzFPQo5uh0X
 b4uhNP9O2OSZadK8AVqoQs5Pm6cWRcMICojKTKM/ZE81NrO6DDMl+cA9m6X149aIxA
 Kc+L+uWd2rwrfwAL+BE7MqkB8p3Zz9EYF5BrT8XiTq2iPNhHGrupEvQuK0EcYKcKPB
 TINOv+umpz6nw==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RCCub01921351; Mon, 27 May 2024 15:12:57 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 8/8] accel/habanalabs: move hl_eq_heartbeat_event_handle() to
 common code
Date: Mon, 27 May 2024 15:12:54 +0300
Message-Id: <20240527121254.1921306-8-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527121254.1921306-1-obitton@habana.ai>
References: <20240527121254.1921306-1-obitton@habana.ai>
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

hl_eq_heartbeat_event_handle() doesn't have ASIC specific code, and
therefore can be moved from Gaudi2-only code to common code, and
possibly used for other ASICs.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c     | 6 ++++++
 drivers/accel/habanalabs/common/habanalabs.h | 1 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c     | 6 ------
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 35502e938b5d..f9b8601c4396 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2850,3 +2850,9 @@ void hl_set_irq_affinity(struct hl_device *hdev, int irq)
 	if (irq_set_affinity_and_hint(irq, &hdev->irq_affinity_mask))
 		dev_err(hdev->dev, "Failed setting irq %d affinity\n", irq);
 }
+
+void hl_eq_heartbeat_event_handle(struct hl_device *hdev)
+{
+	hdev->heartbeat_debug_info.heartbeat_event_counter++;
+	hdev->eq_heartbeat_received = true;
+}
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 8d0df685e627..057087dc8592 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -4059,6 +4059,7 @@ void hl_capture_engine_err(struct hl_device *hdev, u16 engine_id, u16 error_coun
 void hl_enable_err_info_capture(struct hl_error_info *captured_err_info);
 void hl_init_cpu_for_irq(struct hl_device *hdev);
 void hl_set_irq_affinity(struct hl_device *hdev, int irq);
+void hl_eq_heartbeat_event_handle(struct hl_device *hdev);
 
 #ifdef CONFIG_DEBUG_FS
 
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 4791582d157c..a38b88baadf2 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -9777,12 +9777,6 @@ static u16 event_id_to_engine_id(struct hl_device *hdev, u16 event_type)
 	return U16_MAX;
 }
 
-static void hl_eq_heartbeat_event_handle(struct hl_device *hdev)
-{
-	hdev->heartbeat_debug_info.heartbeat_event_counter++;
-	hdev->eq_heartbeat_received = true;
-}
-
 static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_entry)
 {
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
-- 
2.34.1

