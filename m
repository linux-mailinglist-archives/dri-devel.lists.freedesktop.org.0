Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43AB8D0522
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E94D10E46D;
	Mon, 27 May 2024 15:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="JwYIrAxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFB410E774
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:02:36 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716822162; bh=A7hb/8XwlGIYcRbyAd3Z+DLTG2+4TxEgmPGbtk3dXII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JwYIrAxlp9i/xR2v+Ewocpm/r7XEA0pGJiklc7Agj0sIRbV5H4WC8pqlIFJqwufF3
 HlzTMa/1sKwROHZh5A9iUTFOHwkiESRtPDKVSoeSFjZK7x/uLdVvPI7bMyO5xL9gl6
 N8W5CF8S7aVpY3cwEYhnWOFBasdadKFtFaIGTyg7OJjliL+wowjrZCNKHpzXdY83Fd
 /APllACUdSvQqLfeTtfo2+bK2w7U+7q9sc1DsfQRR7jB4ij+tKq6/IOJXSGXrF4npb
 iu198Fxv93ODFf+gAlwF7I6c7jrag9RjSmD6j3xd027b7CjBgjrtn53YQ8UGXVJzur
 q2PgHLRhLFQZg==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RF2PiU1954007; Mon, 27 May 2024 18:02:26 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 3/8] accel/habanalabs: add a common handler for clock change
 events
Date: Mon, 27 May 2024 18:02:19 +0300
Message-Id: <20240527150224.1953969-3-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527150224.1953969-1-obitton@habana.ai>
References: <20240527150224.1953969-1-obitton@habana.ai>
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

As the new dynamic EQ includes clock change events which are common and
not ASIC-specific, add a common handler for these events.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c     | 46 ++++++++++++++++++++
 drivers/accel/habanalabs/common/habanalabs.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index fd117489a05a..31daa9184537 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2860,3 +2860,49 @@ void hl_eq_heartbeat_event_handle(struct hl_device *hdev)
 	hdev->heartbeat_debug_info.heartbeat_event_counter++;
 	hdev->eq_heartbeat_received = true;
 }
+
+void hl_handle_clk_change_event(struct hl_device *hdev, u16 event_type, u64 *event_mask)
+{
+	struct hl_clk_throttle *clk_throttle = &hdev->clk_throttling;
+	ktime_t zero_time = ktime_set(0, 0);
+
+	mutex_lock(&clk_throttle->lock);
+
+	switch (event_type) {
+	case EQ_EVENT_POWER_EVT_START:
+		clk_throttle->current_reason |= HL_CLK_THROTTLE_POWER;
+		clk_throttle->aggregated_reason |= HL_CLK_THROTTLE_POWER;
+		clk_throttle->timestamp[HL_CLK_THROTTLE_TYPE_POWER].start = ktime_get();
+		clk_throttle->timestamp[HL_CLK_THROTTLE_TYPE_POWER].end = zero_time;
+		dev_dbg_ratelimited(hdev->dev, "Clock throttling due to power consumption\n");
+		break;
+
+	case EQ_EVENT_POWER_EVT_END:
+		clk_throttle->current_reason &= ~HL_CLK_THROTTLE_POWER;
+		clk_throttle->timestamp[HL_CLK_THROTTLE_TYPE_POWER].end = ktime_get();
+		dev_dbg_ratelimited(hdev->dev, "Power envelop is safe, back to optimal clock\n");
+		break;
+
+	case EQ_EVENT_THERMAL_EVT_START:
+		clk_throttle->current_reason |= HL_CLK_THROTTLE_THERMAL;
+		clk_throttle->aggregated_reason |= HL_CLK_THROTTLE_THERMAL;
+		clk_throttle->timestamp[HL_CLK_THROTTLE_TYPE_THERMAL].start = ktime_get();
+		clk_throttle->timestamp[HL_CLK_THROTTLE_TYPE_THERMAL].end = zero_time;
+		*event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
+		dev_info_ratelimited(hdev->dev, "Clock throttling due to overheating\n");
+		break;
+
+	case EQ_EVENT_THERMAL_EVT_END:
+		clk_throttle->current_reason &= ~HL_CLK_THROTTLE_THERMAL;
+		clk_throttle->timestamp[HL_CLK_THROTTLE_TYPE_THERMAL].end = ktime_get();
+		*event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
+		dev_info_ratelimited(hdev->dev, "Thermal envelop is safe, back to optimal clock\n");
+		break;
+
+	default:
+		dev_err(hdev->dev, "Received invalid clock change event %d\n", event_type);
+		break;
+	}
+
+	mutex_unlock(&clk_throttle->lock);
+}
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 0d16b5310add..3ea1b131cd42 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -4063,6 +4063,7 @@ void hl_enable_err_info_capture(struct hl_error_info *captured_err_info);
 void hl_init_cpu_for_irq(struct hl_device *hdev);
 void hl_set_irq_affinity(struct hl_device *hdev, int irq);
 void hl_eq_heartbeat_event_handle(struct hl_device *hdev);
+void hl_handle_clk_change_event(struct hl_device *hdev, u16 event_type, u64 *event_mask);
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
2.34.1

