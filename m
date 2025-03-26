Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A05A71C33
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 17:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9497E10E733;
	Wed, 26 Mar 2025 16:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="NIR0IjoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182BF10E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 16:49:04 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QBt2Sf012691;
 Wed, 26 Mar 2025 16:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=M
 jukXhkGZ+ln7TFmwR6pnf+3yeKD33YKtmWrHMhGYQU=; b=NIR0IjoKbLnaAeJ/V
 zyzqAAH8/4K+8aEHXdpQiRrOyT5tkC3tsNeO1fiAtNpoqxO5waFd72NWCT5/0z9s
 pF86SRAmKw/NqCTkBIDnqmUqxUpYzQ7DzsDawNj/t4LRaPohgXGoWllG/8x0GU1c
 kuIPS+s4yD+zn82B+RBCmoRSaWZjz9oq3Gw/StrU/2vMhS3J4CIP+nTe88lmwUOj
 D7jyGNAh0JG6sIEikTuhNYVsiEQ5nC77cRh1beyTz3OW4PUO6Qe1JLryuoxKY03b
 VHPHU+WUqUPxuEV28rdrIluk9Qu6Cbw5sbh+gz5oHGZKV7JiqaiAls52109W7iN2
 F4iZA==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45kbmy9d6d-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 26 Mar 2025 16:48:56 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 16:48:45 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Wed, 26 Mar 2025 16:48:27 +0000
Subject: [PATCH v5 07/18] drm/imagination: Handle Rogue safety event IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250326-sets-bxs-4-64-patch-v1-v5-7-e4c46e8280a9@imgtec.com>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Michal
 Wilczynski" <m.wilczynski@samsung.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7775;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=pG0qVoejiVccet2hTyEQeAfSpyyXvtQb13gO+ZRLNr0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaQ/0X+S8PrS/FbrpDTT2y++eprERvBXzZn26u5yFzn97
 VOlcz1+d5SyMIhxMMiKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBEIhUYGZa9KRC42N704Utu
 IH8jU1y1YMrutCSnLXMqLFonSKuX8DAyHJ6/Nm1b9gPhOKl5vueKTROTVpR/3FG94EC41THBE9E
 BjAA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: eDw5TLzuBLn0Q-NjDLSXfrfQqY-W487U
X-Authority-Analysis: v=2.4 cv=L+sdQ/T8 c=1 sm=1 tr=0 ts=67e42ff8 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=EFqOhPBUpbQHUZJt0gEA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: eDw5TLzuBLn0Q-NjDLSXfrfQqY-W487U
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

From: Alessio Belle <alessio.belle@imgtec.com>

Extend interrupt handling logic to check for safety event IRQs, then clear
and handle them in the IRQ handler thread.

Safety events need to be checked and cleared with a different set of GPU
registers than those the IRQ handler has been using so far.

Only two safety events need to be handled on the host: FW fault (ECC error
correction or detection) and device watchdog timeout. Handling right now
simply consists of clearing any error and logging the event. If either of
these events results in an unrecoverable GPU or FW, the driver will
eventually attempt to recover from it e.g. via pvr_power_reset().

Note that Rogue GPUs may send interrupts to the host for all types of
safety events, not just the two above. For events not handled by the host,
clearing the associated interrupt is sufficient.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v5:
- None
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-7-d987cf4ca439@imgtec.com
Changes in v4:
- Only invoke pvr_device_safety_irq_clear() if has_safety_events is set
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-7-143b3dbef02f@imgtec.com
Changes in v3:
- Added
---
 drivers/gpu/drm/imagination/pvr_device.c | 113 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/imagination/pvr_device.h |   3 +
 drivers/gpu/drm/imagination/pvr_fw.c     |   3 +
 3 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index b6ce936f07c8bb26d240e50b72a1d991dbe4b045..a47dd1dd82432f1d66ff90aca26b7b264f4068df 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -146,9 +146,61 @@ static void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
 	mutex_unlock(&pvr_dev->queues.lock);
 }
 
+static bool pvr_device_safety_irq_pending(struct pvr_device *pvr_dev)
+{
+	u32 events;
+
+	WARN_ON_ONCE(!pvr_dev->has_safety_events);
+
+	events = pvr_cr_read32(pvr_dev, ROGUE_CR_EVENT_STATUS);
+
+	return (events & ROGUE_CR_EVENT_STATUS_SAFETY_EN) != 0;
+}
+
+static void pvr_device_safety_irq_clear(struct pvr_device *pvr_dev)
+{
+	WARN_ON_ONCE(!pvr_dev->has_safety_events);
+
+	pvr_cr_write32(pvr_dev, ROGUE_CR_EVENT_CLEAR,
+		       ROGUE_CR_EVENT_CLEAR_SAFETY_EN);
+}
+
+static void pvr_device_handle_safety_events(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u32 events;
+
+	WARN_ON_ONCE(!pvr_dev->has_safety_events);
+
+	events = pvr_cr_read32(pvr_dev, ROGUE_CR_SAFETY_EVENT_STATUS__ROGUEXE);
+
+	/* Handle only these events on the host and leave the rest to the FW. */
+	events &= ROGUE_CR_SAFETY_EVENT_STATUS__ROGUEXE__FAULT_FW_EN |
+		ROGUE_CR_SAFETY_EVENT_STATUS__ROGUEXE__WATCHDOG_TIMEOUT_EN;
+
+	pvr_cr_write32(pvr_dev, ROGUE_CR_SAFETY_EVENT_CLEAR__ROGUEXE, events);
+
+	if (events & ROGUE_CR_SAFETY_EVENT_STATUS__ROGUEXE__FAULT_FW_EN) {
+		u32 fault_fw = pvr_cr_read32(pvr_dev, ROGUE_CR_FAULT_FW_STATUS);
+
+		pvr_cr_write32(pvr_dev, ROGUE_CR_FAULT_FW_CLEAR, fault_fw);
+
+		drm_info(drm_dev, "Safety event: FW fault (mask=0x%08x)\n", fault_fw);
+	}
+
+	if (events & ROGUE_CR_SAFETY_EVENT_STATUS__ROGUEXE__WATCHDOG_TIMEOUT_EN) {
+		/*
+		 * The watchdog timer is disabled by the driver so this event
+		 * should never be fired.
+		 */
+		drm_info(drm_dev, "Safety event: Watchdog timeout\n");
+	}
+}
+
 static irqreturn_t pvr_device_irq_thread_handler(int irq, void *data)
 {
 	struct pvr_device *pvr_dev = data;
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 	irqreturn_t ret = IRQ_NONE;
 
 	/* We are in the threaded handler, we can keep dequeuing events until we
@@ -164,24 +216,76 @@ static irqreturn_t pvr_device_irq_thread_handler(int irq, void *data)
 			pvr_device_process_active_queues(pvr_dev);
 		}
 
-		pm_runtime_mark_last_busy(from_pvr_device(pvr_dev)->dev);
+		pm_runtime_mark_last_busy(drm_dev->dev);
 
 		ret = IRQ_HANDLED;
 	}
 
+	if (pvr_dev->has_safety_events) {
+		int err;
+
+		/*
+		 * Ensure the GPU is powered on since some safety events (such
+		 * as ECC faults) can happen outside of job submissions, which
+		 * are otherwise the only time a power reference is held.
+		 */
+		err = pvr_power_get(pvr_dev);
+		if (err) {
+			drm_err_ratelimited(drm_dev,
+					    "%s: could not take power reference (%d)\n",
+					    __func__, err);
+			return ret;
+		}
+
+		while (pvr_device_safety_irq_pending(pvr_dev)) {
+			pvr_device_safety_irq_clear(pvr_dev);
+			pvr_device_handle_safety_events(pvr_dev);
+
+			ret = IRQ_HANDLED;
+		}
+
+		pvr_power_put(pvr_dev);
+	}
+
 	return ret;
 }
 
 static irqreturn_t pvr_device_irq_handler(int irq, void *data)
 {
 	struct pvr_device *pvr_dev = data;
+	bool safety_irq_pending = false;
+
+	if (pvr_dev->has_safety_events)
+		safety_irq_pending = pvr_device_safety_irq_pending(pvr_dev);
 
-	if (!pvr_fw_irq_pending(pvr_dev))
+	if (!pvr_fw_irq_pending(pvr_dev) && !safety_irq_pending)
 		return IRQ_NONE; /* Spurious IRQ - ignore. */
 
 	return IRQ_WAKE_THREAD;
 }
 
+static void pvr_device_safety_irq_init(struct pvr_device *pvr_dev)
+{
+	u32 num_ecc_rams = 0;
+
+	/*
+	 * Safety events are an optional feature of the RogueXE platform. They
+	 * are only enabled if at least one of ECC memory or the watchdog timer
+	 * are present in HW. While safety events can be generated by other
+	 * systems, that will never happen if the above mentioned hardware is
+	 * not present.
+	 */
+	if (!PVR_HAS_FEATURE(pvr_dev, roguexe)) {
+		pvr_dev->has_safety_events = false;
+		return;
+	}
+
+	PVR_FEATURE_VALUE(pvr_dev, ecc_rams, &num_ecc_rams);
+
+	pvr_dev->has_safety_events =
+		num_ecc_rams > 0 || PVR_HAS_FEATURE(pvr_dev, watchdog_timer);
+}
+
 /**
  * pvr_device_irq_init() - Initialise IRQ required by a PowerVR device
  * @pvr_dev: Target PowerVR device.
@@ -199,6 +303,8 @@ pvr_device_irq_init(struct pvr_device *pvr_dev)
 
 	init_waitqueue_head(&pvr_dev->kccb.rtn_q);
 
+	pvr_device_safety_irq_init(pvr_dev);
+
 	pvr_dev->irq = platform_get_irq(plat_dev, 0);
 	if (pvr_dev->irq < 0)
 		return pvr_dev->irq;
@@ -207,6 +313,9 @@ pvr_device_irq_init(struct pvr_device *pvr_dev)
 	pvr_fw_irq_clear(pvr_dev);
 	pvr_fw_irq_enable(pvr_dev);
 
+	if (pvr_dev->has_safety_events)
+		pvr_device_safety_irq_clear(pvr_dev);
+
 	/*
 	 * The ONESHOT flag ensures IRQs are masked while the thread handler is
 	 * running.
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 2dd8a8885fe07078896d669d822525fb2b7bab51..6c01d96657de6dc3904ef5ca28365f06cfe0f40b 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -308,6 +308,9 @@ struct pvr_device {
 	 *  struct pvr_file.
 	 */
 	spinlock_t ctx_list_lock;
+
+	/** @has_safety_events: Whether this device can raise safety events. */
+	bool has_safety_events;
 };
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index d09c4c68411627714c14dee5ed4e61b07baca1ba..555b5ca4a27de78ac092bf94c601d284abe41ea6 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -441,6 +441,9 @@ fw_runtime_cfg_init(void *cpu_ptr, void *priv)
 	runtime_cfg->active_pm_latency_persistant = true;
 	WARN_ON(PVR_FEATURE_VALUE(pvr_dev, num_clusters,
 				  &runtime_cfg->default_dusts_num_init) != 0);
+
+	/* Keep watchdog timer disabled. */
+	runtime_cfg->wdg_period_us = 0;
 }
 
 static void

-- 
2.49.0

