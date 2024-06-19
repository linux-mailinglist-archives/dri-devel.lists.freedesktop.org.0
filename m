Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDAC90E37E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6835A10E8FB;
	Wed, 19 Jun 2024 06:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Qy+ZX04N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26BD10E944
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:34:45 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718778894; bh=ATxvJBxOmbSyJka4PwJSH2f3ibAC8iw8M5GUBWILV1o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qy+ZX04NqisrCqBQeCK01KL8Cla26UuV2xXZtp4grEqCrymkAmQdTZd/8TKbze2Ft
 c4YsB8mUHEyNOgXUZgoTesVr1yMnqO6U/uS+hlf/iygCluSPHb6Xs0U0ixt7iY3+hR
 ZRxQ4T0+qQEgOG3WwLG0/S0atfGPmexNfptqMruXuyBlLsv5A+o78z7bm/z98o8fT/
 nOdJv4t//sMpcWivvPsMtpgolMuui+BKQBGO7dt9JIFmiuzx/5jYk3NO92XWxxUceZ
 3nvBZwFobByoAoQobOGeFucFDSIKDAifMq8Y1YsUoRkew2dHLszDYwzKgXqEaiD20u
 PMvoYHJLdL5Qg==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 45J6YQB51377354; Wed, 19 Jun 2024 09:34:33 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 5/9] accel/habanalabs: revise print on EQ heartbeat failure
Date: Wed, 19 Jun 2024 09:34:21 +0300
Message-Id: <20240619063425.1377327-5-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619063425.1377327-1-obitton@habana.ai>
References: <20240619063425.1377327-1-obitton@habana.ai>
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

Don't print the "previous EQ index" value in case of a EQ heartbeat
failure, because it is incremented along with the EQ CI and therefore
redundant.

In addition, as the CPU-CP PI is zeroed when it reaches a value that is
twice the queue size, add a value of the CI with a similar wrap around,
to make it easier to compare the values.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 2fa6bf4c97af..3efc26dd9497 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1064,23 +1064,24 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
 
 static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 {
+	struct eq_heartbeat_debug_info *heartbeat_debug_info = &hdev->heartbeat_debug_info;
+	u32 cpu_q_id = heartbeat_debug_info->cpu_queue_id, pq_pi_mask = (HL_QUEUE_LENGTH << 1) - 1;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
-	u32 cpu_q_id;
 
 	if (!prop->cpucp_info.eq_health_check_supported)
 		return true;
 
 	if (!hdev->eq_heartbeat_received) {
-		cpu_q_id = hdev->heartbeat_debug_info.cpu_queue_id;
-
 		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
 
-		dev_err(hdev->dev, "Heartbeat events counter: %u, Q_PI: %u, Q_CI: %u, EQ CI: %u, EQ prev: %u\n",
-				hdev->heartbeat_debug_info.heartbeat_event_counter,
-				hdev->kernel_queues[cpu_q_id].pi,
-				atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
-				hdev->event_queue.ci,
-				hdev->event_queue.prev_eqe_index);
+		dev_err(hdev->dev,
+			"Heartbeat events counter: %u, EQ CI: %u, PQ PI: %u, PQ CI: %u (%u)\n",
+			heartbeat_debug_info->heartbeat_event_counter,
+			hdev->event_queue.ci,
+			hdev->kernel_queues[cpu_q_id].pi,
+			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
+			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask);
+
 		return false;
 	}
 
-- 
2.34.1

