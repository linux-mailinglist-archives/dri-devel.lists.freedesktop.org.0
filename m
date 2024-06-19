Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A590E384
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4E410E952;
	Wed, 19 Jun 2024 06:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="gqXxriyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8E710E926
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:34:45 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718778885; bh=V0laHEgCDkAnpEzCKnp6J6owHCpEY1oftzaccgLL6p4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gqXxriyvEY3yVo5fLCIpwkVDnvuLSi1f14SHtj+qZIOtZEZPMPDOWz503GMzjWWyv
 a7CGiWLg+Dxeq0ulihN/SeljTtLjNLqJMkCw6eRVw7Ipi2uN6iIbCN4j9hY8N2SOct
 OqvB0oQGqEl8eVABdQ8TFYfaRL3H3yDUHhCKesSqjQgDf+Idp7jXrCsKycP/TQYeOk
 E+HCjIXFWRPg4vWeJir/+Kwb9hloZLgzn/DOD9Wibz95OMS6qLZ6EJywSy4dfgKgsI
 vK8f2+uK+JuX4TCsZbXuginKU5F+YrLVOnV88pnsvK862tJRfCkY4a6jWa54f9K4PT
 In3W7Tw9HzhNg==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 45J6YQB61377354; Wed, 19 Jun 2024 09:34:33 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 6/9] accel/habanalabs: dump the EQ entries headers on EQ
 heartbeat failure
Date: Wed, 19 Jun 2024 09:34:22 +0300
Message-Id: <20240619063425.1377327-6-obitton@habana.ai>
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

Add a dump of the EQ entries headers upon a EQ heartbeat failure.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c     |  2 ++
 drivers/accel/habanalabs/common/habanalabs.h |  1 +
 drivers/accel/habanalabs/common/irq.c        | 25 ++++++++++++++++++++
 include/linux/habanalabs/cpucp_if.h          |  3 +++
 4 files changed, 31 insertions(+)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 3efc26dd9497..7bd7c2eb5dd2 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1082,6 +1082,8 @@ static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
 			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask);
 
+		hl_eq_dump(hdev, &hdev->event_queue);
+
 		return false;
 	}
 
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index f4ac5e9b1974..ce78b331e244 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3754,6 +3754,7 @@ int hl_eq_init(struct hl_device *hdev, struct hl_eq *q);
 void hl_eq_fini(struct hl_device *hdev, struct hl_eq *q);
 void hl_cq_reset(struct hl_device *hdev, struct hl_cq *q);
 void hl_eq_reset(struct hl_device *hdev, struct hl_eq *q);
+void hl_eq_dump(struct hl_device *hdev, struct hl_eq *q);
 irqreturn_t hl_irq_handler_cq(int irq, void *arg);
 irqreturn_t hl_irq_handler_eq(int irq, void *arg);
 irqreturn_t hl_irq_handler_dec_abnrm(int irq, void *arg);
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 2caf2df4de08..7c9f2f6a2870 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -697,3 +697,28 @@ void hl_eq_reset(struct hl_device *hdev, struct hl_eq *q)
 
 	memset(q->kernel_address, 0, q->size);
 }
+
+void hl_eq_dump(struct hl_device *hdev, struct hl_eq *q)
+{
+	u32 eq_length, eqe_size, ctl, ready, mode, type, index;
+	struct hl_eq_header *hdr;
+	u8 *ptr;
+	int i;
+
+	eq_length = HL_EQ_LENGTH;
+	eqe_size = q->size / HL_EQ_LENGTH;
+
+	dev_info(hdev->dev, "Contents of EQ entries headers:\n");
+
+	for (i = 0, ptr = q->kernel_address ; i < eq_length ; ++i, ptr += eqe_size) {
+		hdr = (struct hl_eq_header *) ptr;
+		ctl = le32_to_cpu(hdr->ctl);
+		ready = FIELD_GET(EQ_CTL_READY_MASK, ctl);
+		mode = FIELD_GET(EQ_CTL_EVENT_MODE_MASK, ctl);
+		type = FIELD_GET(EQ_CTL_EVENT_TYPE_MASK, ctl);
+		index = FIELD_GET(EQ_CTL_INDEX_MASK, ctl);
+
+		dev_info(hdev->dev, "%02u: %#010x [ready: %u, mode %u, type %04u, index %05u]\n",
+				i, ctl, ready, mode, type, index);
+	}
+}
diff --git a/include/linux/habanalabs/cpucp_if.h b/include/linux/habanalabs/cpucp_if.h
index 1ed17887f1a8..7ed3fdd55dda 100644
--- a/include/linux/habanalabs/cpucp_if.h
+++ b/include/linux/habanalabs/cpucp_if.h
@@ -397,6 +397,9 @@ struct hl_eq_entry {
 #define EQ_CTL_READY_SHIFT		31
 #define EQ_CTL_READY_MASK		0x80000000
 
+#define EQ_CTL_EVENT_MODE_SHIFT		28
+#define EQ_CTL_EVENT_MODE_MASK		0x70000000
+
 #define EQ_CTL_EVENT_TYPE_SHIFT		16
 #define EQ_CTL_EVENT_TYPE_MASK		0x0FFF0000
 
-- 
2.34.1

