Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CDA83F8E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9A810E904;
	Thu, 10 Apr 2025 09:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="aHXL0DMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2EF10E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:55:41 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A60F8R032471;
 Thu, 10 Apr 2025 10:55:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=0
 rhAxe4k6HuPe0vHMRM7bg6uaInn9RxU05h0oe+1Ijg=; b=aHXL0DMvQwXRSHxoH
 1G1Hxw6AyFDVGDvF4hQa8fStTS4W5ZbRQrJC4fCWDPfs94FxkrWYwCOPWIlvnKo/
 amechdfsNBfbrRUgbYIeOBTFlgjmowLVBEoYgajwiPPicZ2/yQNeZ361ujRZhprB
 0lTyt6ynkToL7ShePKF45MLjv+tAMXRXoF/UM6DwHakhjsVVt9dZtn4I0OA2g8zH
 XEzn6oBP1TUpQchk2kaWFO+BbHeCs3LPF//4OKU8G8e+NqzoS3wjavpQWzBjr8tv
 AkNTpMxGZg7v4YZv7FnXaVbrO9967E+1vi2OXQFx17H28n202lbEcmsfoAd1g+dz
 ofGuA==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45w86h1d34-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Apr 2025 10:55:23 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Apr 2025 10:55:22 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 10 Apr 2025 10:55:07 +0100
Subject: [PATCH v6 08/18] drm/imagination: Remove firmware enable_reg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-sets-bxs-4-64-patch-v1-v6-8-eda620c5865f@imgtec.com>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4701;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=BLggGQuY8zs90M7RiMrvmVQ/oJSF32qt7dqrbyI4C3k=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaR/n9poc/Tz3rhjP5Y0XFd6K/S2xeVhfKS9Vt4c7w2dS
 7bVrp/W31HKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQAT+aLOyPD0BJvJl+vi2sK5
 xbdj5hr6v2+VNPj4Z0Lqp0X3lc+yvZ/EyDBlW7dc2THunqL4kx1ux5cv1tsvbSewberXQ5XiXPH
 bDrMCAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=MLNgmNZl c=1 sm=1 tr=0 ts=67f7958b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=f_O7cd1dQeFu8-5Qt7YA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 95S-nB9GN6TBZNj_v6cW-Lcps9iw8mKM
X-Proofpoint-ORIG-GUID: 95S-nB9GN6TBZNj_v6cW-Lcps9iw8mKM
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
Reviewed-by: Frank Binns <frank.binns@imgtec.com>
---
Changes in v6:
- Add Frank's Rb
- Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1-v5-8-e4c46e8280a9@imgtec.com
Changes in v5:
- None
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-8-d987cf4ca439@imgtec.com
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-8-143b3dbef02f@imgtec.com
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
index a47dd1dd82432f1d66ff90aca26b7b264f4068df..1e488a30c7840466574c7fc3648ab93edfb46354 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -311,7 +311,6 @@ pvr_device_irq_init(struct pvr_device *pvr_dev)
 
 	/* Clear any pending events before requesting the IRQ line. */
 	pvr_fw_irq_clear(pvr_dev);
-	pvr_fw_irq_enable(pvr_dev);
 
 	if (pvr_dev->has_safety_events)
 		pvr_device_safety_irq_clear(pvr_dev);
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
index c7cfdd60116d5fd1e9fa93945653c938fafba07e..77596a2a6c4e9c9e2b3af6b9b2aea3ad49062550 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -547,7 +547,6 @@ const struct pvr_fw_defs pvr_fw_defs_meta = {
 	.wrapper_init = pvr_meta_wrapper_init,
 	.has_fixed_data_addr = pvr_meta_has_fixed_data_addr,
 	.irq = {
-		.enable_reg = ROGUE_CR_META_SP_MSLVIRQENABLE,
 		.status_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
 		.clear_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
 		.event_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN,
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
index ee0735b745a9ff5c99637c2cb312998679f47fd3..c73902bcf8e46ee58174a503cc7f235f2d45d180 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -241,7 +241,6 @@ const struct pvr_fw_defs pvr_fw_defs_mips = {
 	.wrapper_init = pvr_mips_wrapper_init,
 	.has_fixed_data_addr = pvr_mips_has_fixed_data_addr,
 	.irq = {
-		.enable_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_ENABLE,
 		.status_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS,
 		.clear_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
 		.event_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,

-- 
2.49.0

