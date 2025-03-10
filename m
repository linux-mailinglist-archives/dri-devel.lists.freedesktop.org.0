Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF28DA595B6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D1E10E44F;
	Mon, 10 Mar 2025 13:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="P6pjqPNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D1C10E454
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:11:07 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A7nW1i015329;
 Mon, 10 Mar 2025 13:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=S
 3i7OJD+gAZWCOfBCNXubuf50ayAY9BWmYjaek8A+IU=; b=P6pjqPNdnXDqitGfh
 +VmoYivNHbp+C+dCyiMNWWjUQNPN/7RSzlH4j7pfpYL9wEjHb/QQ/7fDJUE4Ab0E
 VZtKYvvUo7Nxp7NLq11yojr45jkQ3jESwD+TMRjgRDBJuxhNwpwY1jIYwMsjznlI
 Aa0DO8gDv6Y7g0dclIyCLiK5eDe8yeXGG+bbYxHyWpx7QDvr08KwnXoOby4lRYud
 /WkbpE+vakijdR4NmyePDVOyk6/BYLQTR9lhlfm9N19lhVDuTGKY2qD646nZLltH
 EPpddW6hvTOb3OmsKbzOQXm1spmNAyl5QWioNRtwyR+4lFjazVW9Q4NAFbNLLrto
 2Zs6Q==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 458d1wha4q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 Mar 2025 13:10:50 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.0.133) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 13:10:49 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 10 Mar 2025 13:10:32 +0000
Subject: [PATCH v3 08/18] drm/imagination: Remove firmware enable_reg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sets-bxs-4-64-patch-v1-v3-8-143b3dbef02f@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
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
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Alessio
 Belle" <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4232;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=jVGQK2eFMIZW4vnr+Qn9RQl179/bSc5dw01m1hkMfM0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaSfe3KBJ4Pjt/GxlnVLLGeXdv42tJja+eJHCNuFM/XKy
 npCPOFiHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRU58Z/tlP7xU1eHTU3bT2
 z5l9c/fe2ve86upOhVkV/l8CzDr+TMhj+Gcc6Txvtk1gzqFp/ww+RLZwiRVOXPhihqJptKr+r0r
 lMn4A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Acfx19T12uJYuLZpjONOoUGGg0JMIMZR
X-Proofpoint-GUID: Acfx19T12uJYuLZpjONOoUGGg0JMIMZR
X-Authority-Analysis: v=2.4 cv=U8+SDfru c=1 sm=1 tr=0 ts=67cee4da cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=f_O7cd1dQeFu8-5Qt7YA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

After a previous commit ("drm/imagination: Mask GPU IRQs in threaded
handler"), this register is now only used to enable firmware interrupts at
start-of-day. This is, however, unnecessary since they are enabled by
default.

In addition, the soon-to-be-added RISC-V firmware processors do not have
an equivalent register.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- Reference a different commit removing use of enable/disable ops.
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-10-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-10-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_device.c  |  1 -
 drivers/gpu/drm/imagination/pvr_fw.h      | 11 +----------
 drivers/gpu/drm/imagination/pvr_fw_meta.c |  1 -
 drivers/gpu/drm/imagination/pvr_fw_mips.c |  1 -
 4 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index b1594dd3ed5997bd9510b1444aef2c6f0d7cfd76..ef011e53e61527f5847c22d7ffd1721dded16516 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -311,7 +311,6 @@ pvr_device_irq_init(struct pvr_device *pvr_dev)
 
 	/* Clear any pending events before requesting the IRQ line. */
 	pvr_fw_irq_clear(pvr_dev);
-	pvr_fw_irq_enable(pvr_dev);
 	pvr_device_safety_irq_clear(pvr_dev);
 
 	/*
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index b7966bd574a924862b7877c175fa2b5d757d89db..29bae4bc244a243a6a95bcf838d924060cc043e2 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -188,9 +188,6 @@ struct pvr_fw_defs {
 	 * processor backend in pvr_fw_funcs::init().
 	 */
 	struct {
-		/** @enable_reg: FW interrupt enable register. */
-		u32 enable_reg;
-
 		/** @status_reg: FW interrupt status register. */
 		u32 status_reg;
 
@@ -202,7 +199,7 @@ struct pvr_fw_defs {
 		 */
 		u32 clear_reg;
 
-		/** @event_mask: Bitmask of events to listen for. */
+		/** @event_mask: Bitmask of events to listen for in the status_reg. */
 		u32 event_mask;
 
 		/** @clear_mask: Value to write to the clear_reg in order to clear FW IRQs. */
@@ -412,12 +409,6 @@ struct pvr_fw_device {
 #define pvr_fw_irq_clear(pvr_dev) \
 	pvr_fw_irq_write_reg(pvr_dev, clear, (pvr_dev)->fw_dev.defs->irq.clear_mask)
 
-#define pvr_fw_irq_enable(pvr_dev) \
-	pvr_fw_irq_write_reg(pvr_dev, enable, (pvr_dev)->fw_dev.defs->irq.event_mask)
-
-#define pvr_fw_irq_disable(pvr_dev) \
-	pvr_fw_irq_write_reg(pvr_dev, enable, 0)
-
 extern const struct pvr_fw_defs pvr_fw_defs_meta;
 extern const struct pvr_fw_defs pvr_fw_defs_mips;
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index c39beb70c3173ebdab13b4e810ce5d9a3419f0ba..76b24ad9aa221b6a384dc7b55ed2e78d2e761550 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -546,7 +546,6 @@ const struct pvr_fw_defs pvr_fw_defs_meta = {
 	.wrapper_init = pvr_meta_wrapper_init,
 	.has_fixed_data_addr = pvr_meta_has_fixed_data_addr,
 	.irq = {
-		.enable_reg = ROGUE_CR_META_SP_MSLVIRQENABLE,
 		.status_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
 		.clear_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
 		.event_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN,
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
index 0bed0257e2ab75f66d8b8966b2ceac6342396fb5..c810a67eeecf1016064e76baf534e31a44c859b5 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -243,7 +243,6 @@ const struct pvr_fw_defs pvr_fw_defs_mips = {
 	.wrapper_init = pvr_mips_wrapper_init,
 	.has_fixed_data_addr = pvr_mips_has_fixed_data_addr,
 	.irq = {
-		.enable_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_ENABLE,
 		.status_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS,
 		.clear_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
 		.event_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,

-- 
2.48.1

